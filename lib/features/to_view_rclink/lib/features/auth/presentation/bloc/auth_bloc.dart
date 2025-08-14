import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:rclink_app/core/errors/failures.dart';
import 'package:rclink_app/features/auth/domain/entities/tokens.dart';
import 'package:rclink_app/features/auth/domain/usecases/request_otp_usecase.dart';
import '../../../admin/domain/usecases/get_current_admin_usecase.dart';
import '../../domain/usecases/verify_otp_usecase.dart';
import '../../data/datasources/auth_local_data_source.dart';
import 'auth_event.dart';
import 'auth_state.dart';

@lazySingleton
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final RequestOtpUseCase _requestOtpUseCase;
  final VerifyOtpUseCase _verifyOtpUseCase;
  final GetCurrentAdminUseCase _getCurrentAdminUseCase;
  final AuthLocalDataSource _authLocalDataSource;

  AuthBloc(
    this._requestOtpUseCase,
    this._verifyOtpUseCase,
    this._getCurrentAdminUseCase,
    this._authLocalDataSource,
  ) : super(const AuthInitial()) {
    on<RequestOtpRequested>(_onRequestOtpRequested);
    on<VerifyOtpRequested>(_onVerifyOtpRequested);
    on<CheckAuthStatus>(_onCheckAuthStatus);
    on<LoadCurrentAdmin>(_onLoadCurrentAdmin);
  }

  Future<void> _onRequestOtpRequested(
    RequestOtpRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoading());

    final result = await _requestOtpUseCase(RequestOtpParams(event.phone));
    print('auth_bloc:: $result');

    result.fold(
      (failure) => emit(AuthFailure(_mapFailureToMessage(failure))),
      (otpResponse) => emit(AuthOtpSent(otpResponse)),
    );
  }

  Future<void> _onVerifyOtpRequested(
    VerifyOtpRequested event,
    Emitter<AuthState> emit,
  ) async {
    print(
      '🚀 AuthBloc: VerifyOtpRequested - phone: ${event.phone}, otp: ${event.otp}',
    );

    emit(const AuthLoading());

    final result = await _verifyOtpUseCase(
      VerifyOtpParams(phone: event.phone, otp: event.otp),
    );

    print('auth_bloc verify:: $result');

    await result.fold(
      (failure) async {
        print(
          '❌ AuthBloc: Verify OTP failed: ${_mapFailureToMessage(failure)}',
        );
        emit(AuthFailure(_mapFailureToMessage(failure)));
      },
      (tokens) async {
        print(
          '✅ AuthBloc: Verify OTP success, storing tokens and emitting authenticated state',
        );
        final storeResult = await _authLocalDataSource.storeTokens(tokens);

        storeResult.fold(
          (failure) {
            print('❌ AuthBloc: Failed to store tokens: ${failure.message}');
            emit(AuthFailure('Failed to save authentication data'));
          },
          (_) {
            print('✅ AuthBloc: Tokens stored successfully');
            emit(AuthState.authenticated(tokens));
          },
        );
      },
    );
  }

  Future<void> _onCheckAuthStatus(
    CheckAuthStatus event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoading());

    final tokensResult = await _authLocalDataSource.getTokens();

    tokensResult.fold(
      (failure) {
        print('❌ AuthBloc: Failed to get stored tokens: ${failure.message}');
        emit(const Unauthenticated());
      },
      (tokens) async {
        if (tokens == null) {
          print('📝 AuthBloc: No stored tokens found');
          emit(const Unauthenticated());
        } else {
          final now = DateTime.now();

          if (tokens.accessTokenExpiresAt.isAfter(now)) {
            print('✅ AuthBloc: Valid tokens found, user is authenticated');
            emit(AuthState.authenticated(tokens));
          } else if (tokens.refreshTokenExpiresAt.isAfter(now)) {
            print('🔄 AuthBloc: Access token expired but refresh token valid');
            emit(AuthState.authenticated(tokens));
          } else {
            print('❌ AuthBloc: All tokens expired');
            await _authLocalDataSource.clearCache();
            emit(const Unauthenticated());
          }
        }
      },
    );
  }

  Future<void> _onLoadCurrentAdmin(
    LoadCurrentAdmin event,
    Emitter<AuthState> emit,
  ) async {
    final currentState = state;
    if (currentState is! Authenticated) {
      return;
    }

    final result = await _getCurrentAdminUseCase(
      GetCurrentAdminParams(
        forceRefresh: event.forceRefresh,
        cacheTimeout: event.cacheTimeout,
      ),
    );

    result.fold(
      (failure) => emit(AuthFailure(_mapFailureToMessage(failure))),
      (admin) => emit(
        AuthState.authenticated(currentState.tokens, currentAdmin: admin),
      ),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ConnectionFailure:
        return 'No internet connection. Please check your network.';
      case TimeoutFailure:
        return 'Request timeout. Please try again.';
      case ValidationFailure:
        return failure.message;
      case NetworkFailure:
      case ServerFailure:
        return failure.message;
      default:
        return failure.message.isEmpty
            ? 'An unexpected error occurred. Please try again.'
            : failure.message;
    }
  }
}
