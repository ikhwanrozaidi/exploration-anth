import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:rclink_app/core/errors/failures.dart';
import 'package:rclink_app/features/auth/domain/entities/tokens.dart';
import 'package:rclink_app/features/auth/domain/usecases/request_otp_usecase.dart';
import '../../../admin/domain/usecases/get_current_admin_usecase.dart';
import 'auth_event.dart';
import 'auth_state.dart';

@lazySingleton
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final RequestOtpUseCase _requestOtpUseCase;
  final GetCurrentAdminUseCase _getCurrentAdminUseCase;

  AuthBloc(
    this._requestOtpUseCase,
    this._getCurrentAdminUseCase,
  ) : super(const AuthInitial()) {
    on<RequestOtpRequested>(_onRequestOtpRequested);
    on<CheckAuthStatus>(_onCheckAuthStatus);
    on<LoadCurrentAdmin>(_onLoadCurrentAdmin);
  }

  Future<void> _onRequestOtpRequested(
    RequestOtpRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoading());

    final result = await _requestOtpUseCase(RequestOtpParams(event.phone));

    result.fold(
      (failure) => emit(AuthFailure(_mapFailureToMessage(failure))),
      (otpResponse) => emit(AuthOtpSent(otpResponse)),
    );
  }

  Future<void> _onCheckAuthStatus(
    CheckAuthStatus event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loading());

    // TODO: Implement auth status check
    // final result = await _getStoredAdminUseCase();

    // result.fold(
    //   (failure) => emit(const AuthState.unauthenticated()),
    //   (admin) {
    //     if (admin != null) {
    //       emit(AuthState.authenticated(admin: admin));
    //       // Load locations after successful auth check
    //       add(LoadLocations(adminExternalID: admin.externalID));
    //     } else {
    //       emit(const AuthState.unauthenticated());
    //     }
    //   },
    // );
    //
    // emit(
    //   AuthState.authenticated(
    //     Tokens(
    //       accessToken: '123',
    //       refreshToken: '456',
    //       accessTokenExpiresAt: DateTime.now().add(const Duration(hours: 1)),
    //       refreshTokenExpiresAt: DateTime.now().add(const Duration(days: 30)),
    //     ),
    //   ),
    // );
    //
    //
    emit(const AuthState.unauthenticated());
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
        AuthState.authenticated(
          currentState.tokens,
          currentAdmin: admin,
        ),
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
