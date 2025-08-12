import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/usecases/send_otp_usecase.dart';
import 'auth_event.dart';
import 'auth_state.dart';

@lazySingleton
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SendOtpUseCase _sendOtpUseCase;

  AuthBloc(this._sendOtpUseCase) : super(const AuthInitial()) {
    on<SendOtpRequested>(_onSendOtpRequested);
    on<CheckAuthStatus>(_onCheckAuthStatus);
  }

  Future<void> _onSendOtpRequested(
    SendOtpRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoading());

    final result = await _sendOtpUseCase(SendOtpParams(event.phone));

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
    // emit(
    //   const AuthState.authenticated(
    //     AuthResult(accessToken: '123', refreshToken: '456'),
    //   ),
    // );
    emit(const AuthState.unauthenticated());
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
