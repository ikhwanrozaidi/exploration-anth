import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/usecases/login_usecase.dart';
import 'login_event.dart';
import 'login_state.dart';

@lazySingleton
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase _loginUseCase;
  final VerifyOtpUseCase _verifyOtpUseCase;
  final LogoutUseCase _logoutUseCase;
  final GetStoredAdminUseCase _getStoredAdminUseCase;
  final RefreshTokenUseCase _refreshTokenUseCase;
  final ForgotPasswordUseCase _forgotPasswordUseCase;
  final VerifyOtpForgotUseCase _verifyOtpForgotUseCase;
  final ChangePasswordUseCase _changePasswordUseCase;

  String? _currentEmail; // Store email for OTP verification

  LoginBloc(
    this._loginUseCase,
    this._verifyOtpUseCase,
    this._logoutUseCase,
    this._getStoredAdminUseCase,
    this._refreshTokenUseCase,
    this._forgotPasswordUseCase,
    this._verifyOtpForgotUseCase,
    this._changePasswordUseCase,
  ) : super(const LoginInitial()) {
    on<LoginSubmitted>(_onLoginSubmitted);
    on<LoginOtpSubmitted>(_onOtpSubmitted);
    on<LoginCheckAuthStatus>(_onCheckAuthStatus);
    on<LoginLogoutRequested>(_onLogoutRequested);
    on<LoginForgotPasswordRequested>(_onForgotPasswordRequested);
    on<LoginForgotOtpSubmitted>(_onForgotOtpSubmitted);
    on<LoginChangePasswordRequested>(_onChangePasswordRequested);
  }

  Future<void> _onLoginSubmitted(
    LoginSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    emit(const LoginLoading());

    final result = await _loginUseCase(LoginParams(event.email, event.password));

    result.fold(
      (failure) => emit(LoginFailure(_mapFailureToMessage(failure))),
      (message) {
        _currentEmail = event.email; // Store email for OTP verification
        emit(LoginOtpRequired(event.email, message));
      },
    );
  }

  Future<void> _onOtpSubmitted(
    LoginOtpSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    emit(const LoginLoading());

    final result = await _verifyOtpUseCase(VerifyOtpParams(event.email, event.otp));

    result.fold(
      (failure) => emit(LoginFailure(_mapFailureToMessage(failure))),
      (authData) {
        final (authResult, admin) = authData;
        emit(LoginAuthenticated(authResult, admin));
      },
    );
  }

  Future<void> _onCheckAuthStatus(
    LoginCheckAuthStatus event,
    Emitter<LoginState> emit,
  ) async {
    emit(const LoginLoading());

    final result = await _getStoredAdminUseCase();

    result.fold(
      (failure) => emit(const LoginUnauthenticated()),
      (admin) {
        if (admin != null) {
          // User is already authenticated
          // You might want to validate the token here
          emit(LoginSuccess(admin));
        } else {
          emit(const LoginUnauthenticated());
        }
      },
    );
  }

  Future<void> _onLogoutRequested(
    LoginLogoutRequested event,
    Emitter<LoginState> emit,
  ) async {
    emit(const LoginLoading());

    final result = await _logoutUseCase();

    result.fold(
      (failure) => emit(LoginFailure(_mapFailureToMessage(failure))),
      (_) {
        _currentEmail = null;
        emit(const LoginLoggedOut());
      },
    );
  }

  Future<void> _onForgotPasswordRequested(
    LoginForgotPasswordRequested event,
    Emitter<LoginState> emit,
  ) async {
    emit(const LoginLoading());

    final result = await _forgotPasswordUseCase(ForgotPasswordParams(event.email));

    result.fold(
      (failure) => emit(LoginFailure(_mapFailureToMessage(failure))),
      (message) {
        _currentEmail = event.email;
        emit(LoginForgotPasswordOtpRequired(event.email, message));
      },
    );
  }

  Future<void> _onForgotOtpSubmitted(
    LoginForgotOtpSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    emit(const LoginLoading());

    final result = await _verifyOtpForgotUseCase(
      VerifyOtpForgotParams(event.email, event.otpForgot),
    );

    result.fold(
      (failure) => emit(LoginFailure(_mapFailureToMessage(failure))),
      (message) {
        emit(LoginChangePasswordRequired(event.email, message));
      },
    );
  }

  Future<void> _onChangePasswordRequested(
    LoginChangePasswordRequested event,
    Emitter<LoginState> emit,
  ) async {
    emit(const LoginLoading());

    final result = await _changePasswordUseCase(
      ChangePasswordParams(event.email, event.newPassword),
    );

    result.fold(
      (failure) => emit(LoginFailure(_mapFailureToMessage(failure))),
      (message) {
        emit(LoginPasswordChanged(message));
      },
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
      case UnauthorizedFailure:
        return 'Invalid credentials. Please try again.';
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