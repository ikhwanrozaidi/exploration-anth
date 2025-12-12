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
  final GetStoredUserUseCase _getStoredUserUseCase;
  final RefreshTokenUseCase _refreshTokenUseCase;
  final ForgotPasswordUseCase _forgotPasswordUseCase;
  final VerifyOtpForgotUseCase _verifyOtpForgotUseCase;
  final ChangePasswordUseCase _changePasswordUseCase;
  // Comment out these for now since they're not in DI yet
  final StoreLoginCredentialsUseCase _storeCredentialsUseCase;
  final GetStoredCredentialsUseCase _getStoredCredentialsUseCase;

  String? _currentEmail; // Store email for OTP verification

  LoginBloc(
    this._loginUseCase,
    this._verifyOtpUseCase,
    this._logoutUseCase,
    this._getStoredUserUseCase,
    this._refreshTokenUseCase,
    this._forgotPasswordUseCase,
    this._verifyOtpForgotUseCase,
    this._changePasswordUseCase,
    this._storeCredentialsUseCase,
    this._getStoredCredentialsUseCase,
  ) : super(const LoginInitial()) {
    on<LoginSubmitted>(_onLoginSubmitted);
    on<LoginOtpSubmitted>(_onOtpSubmitted);
    on<LoginCheckAuthStatus>(_onCheckAuthStatus);
    on<LoginLogoutRequested>(_onLogoutRequested);
    on<LoginForgotPasswordRequested>(_onForgotPasswordRequested);
    on<LoginForgotOtpSubmitted>(_onForgotOtpSubmitted);
    on<LoginChangePasswordRequested>(_onChangePasswordRequested);
    on<LoginLoadSavedCredentials>(_onLoadSavedCredentials);
    on<LoginStoreCredentials>(_onStoreCredentials);
  }

  Future<void> _onLoginSubmitted(
    LoginSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    emit(const LoginLoading());

    final result = await _loginUseCase(
      LoginParams(event.email, event.password),
    );

    result.fold(
      (failure) => emit(LoginFailure(_mapFailureToMessage(failure))),
      (message) {
        _currentEmail = event.email; // Store email for OTP verification

        // Store credentials if rememberMe is true
        if (event.rememberMe) {
          add(LoginStoreCredentials(event.email, event.password));
        }

        emit(LoginOtpRequired(event.email, message));
      },
    );
  }

  Future<void> _onLoadSavedCredentials(
    LoginLoadSavedCredentials event,
    Emitter<LoginState> emit,
  ) async {
    // Temporarily use repository directly until use cases are set up
    try {
      // For now, we'll skip this functionality until DI is set up
      // You can uncomment this once you add the use cases to DI

      final result = await _getStoredCredentialsUseCase();

      result.fold(
        (failure) => {}, // Ignore errors, just don't load credentials
        (credentials) {
          if (credentials != null) {
            emit(
              LoginCredentialsLoaded(
                credentials['email']!,
                credentials['password']!,
              ),
            );
          }
        },
      );
    } catch (e) {
      // Ignore errors for now
    }
  }

  Future<void> _onStoreCredentials(
    LoginStoreCredentials event,
    Emitter<LoginState> emit,
  ) async {
    // Temporarily disabled until use cases are set up
    try {
      // For now, we'll skip this functionality until DI is set up

      await _storeCredentialsUseCase(
        StoreCredentialsParams(event.email, event.password),
      );
    } catch (e) {
      // Ignore errors for now
    }
  }

  Future<void> _onOtpSubmitted(
    LoginOtpSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    emit(const LoginLoading());

    final result = await _verifyOtpUseCase(
      VerifyOtpParams(event.email, event.otp),
    );

    result.fold(
      (failure) => emit(LoginFailure(_mapFailureToMessage(failure))),
      (data) {
        final (authResult, user) = data;

        emit(LoginSuccess(user));
      },
    );
  }

  Future<void> _onCheckAuthStatus(
    LoginCheckAuthStatus event,
    Emitter<LoginState> emit,
  ) async {
    emit(const LoginLoading());

    try {
      final result = await _getStoredUserUseCase();

      result.fold(
        (failure) {
          emit(const LoginUnauthenticated());
        },
        (user) {
          if (user != null) {
            emit(LoginSuccess(user));
          } else {
            emit(const LoginUnauthenticated());
          }
        },
      );
    } catch (e) {
      print('Error in CheckAuthStatus: $e');
      emit(const LoginUnauthenticated());
    }
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
        emit(const LoginLoggedOut());
      },
    );
  }

  Future<void> _onForgotPasswordRequested(
    LoginForgotPasswordRequested event,
    Emitter<LoginState> emit,
  ) async {
    emit(const LoginLoading());

    final result = await _forgotPasswordUseCase(
      ForgotPasswordParams(event.email),
    );

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
