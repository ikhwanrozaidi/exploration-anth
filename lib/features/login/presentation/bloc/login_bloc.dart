import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/usecases/get_access_token_usecase.dart';
import '../../domain/usecases/get_refresh_token_usecase.dart';
import '../../domain/usecases/get_stored_user_usecase.dart';
import '../../domain/usecases/login_usecase.dart';
import '../../domain/usecases/logout_usecase.dart';
import '../../domain/usecases/refresh_token_usecase.dart';
import '../../domain/usecases/verify_otp_usecase.dart';
import 'login_event.dart';
import 'login_state.dart';

@lazySingleton
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase _loginUseCase;
  final VerifyOtpUseCase _verifyOtpUseCase;
  final LogoutUseCase _logoutUseCase;
  final GetStoredUserUseCase _getStoredUserUseCase;

  final GetAccessTokenUseCase _getAccessTokenUseCase;
  final GetRefreshTokenUseCase _getRefreshTokenUseCase;

  final StoreLoginCredentialsUseCase _storeCredentialsUseCase;
  final GetStoredCredentialsUseCase _getStoredCredentialsUseCase;

  String? _currentEmail;

  LoginBloc(
    this._loginUseCase,
    this._verifyOtpUseCase,
    this._logoutUseCase,
    this._getStoredUserUseCase,
    this._getAccessTokenUseCase,
    this._getRefreshTokenUseCase,
    this._storeCredentialsUseCase,
    this._getStoredCredentialsUseCase,
  ) : super(const LoginInitial()) {
    on<LoginSubmitted>(_onLoginSubmitted);
    on<LoginOtpSubmitted>(_onOtpSubmitted);

    on<LoginCheckAuthStatus>(_onCheckAuthStatus);
    on<LoginLogoutRequested>(_onLogoutRequested);

    // FORGOT PASSWORD
    //
    // on<LoginForgotPasswordRequested>(_onForgotPasswordRequested);
    // on<LoginForgotOtpSubmitted>(_onForgotOtpSubmitted);
    // on<LoginChangePasswordRequested>(_onChangePasswordRequested);

    on<LoginLoadSavedCredentials>(_onLoadSavedCredentials);
    on<LoginStoreCredentials>(_onStoreCredentials);

    on<LoginCheckAuthStatus>(_onCheckAuthStatus);
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
        _currentEmail = event.email;

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
    print('🔵 OTP Submitted: ${event.otp}');
    emit(const LoginLoading());

    final result = await _verifyOtpUseCase(
      VerifyOtpParams(event.email, event.otp),
    );

    result.fold(
      (failure) {
        print('🔴 OTP Verification FAILED: ${_mapFailureToMessage(failure)}');
        emit(LoginFailure(_mapFailureToMessage(failure)));
      },
      (data) {
        final (authResult, user) = data;
        print('🟢 OTP Verification SUCCESS!');
        print('🟢 User: ${user.email}');
        print('🟢 Emitting LoginSuccess...');

        emit(LoginSuccess(user));

        print('🟢 LoginSuccess emitted!');
      },
    );
  }

  Future<void> _onCheckAuthStatus(
    LoginCheckAuthStatus event,
    Emitter<LoginState> emit,
  ) async {
    print('🔍 CheckAuthStatus: Starting...');
    emit(const LoginLoading());

    // Check tokens first
    final accessTokenResult = await _getAccessTokenUseCase();
    final refreshTokenResult = await _getRefreshTokenUseCase();

    final accessToken = accessTokenResult.fold(
      (failure) {
        print('🔴 Access Token Error: ${failure.message}');
        return null;
      },
      (token) {
        print('🟢 Access Token exists: ${token != null && token.isNotEmpty}');
        return token;
      },
    );

    final refreshToken = refreshTokenResult.fold(
      (failure) {
        print('🔴 Refresh Token Error: ${failure.message}');
        return null;
      },
      (token) {
        print('🟢 Refresh Token exists: ${token != null && token.isNotEmpty}');
        return token;
      },
    );

    // If no tokens, user is not authenticated
    if (accessToken == null ||
        accessToken.isEmpty ||
        refreshToken == null ||
        refreshToken.isEmpty) {
      print('🔴 CheckAuthStatus: No valid tokens found');
      emit(const LoginUnauthenticated());
      return;
    }

    // Check if user exists in database
    final userResult = await _getStoredUserUseCase();

    await userResult.fold(
      (failure) async {
        print('🔴 CheckAuthStatus: No stored user - ${failure.message}');
        emit(const LoginUnauthenticated());
      },
      (user) async {
        if (user == null) {
          print('🔴 CheckAuthStatus: User is null');
          emit(const LoginUnauthenticated());
          return;
        }

        print('🟢 CheckAuthStatus: User authenticated! Email: ${user.email}');
        emit(LoginSuccess(user));
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
        emit(const LoginLoggedOut());
      },
    );
  }

  // Future<void> _onForgotPasswordRequested(
  //   LoginForgotPasswordRequested event,
  //   Emitter<LoginState> emit,
  // ) async {
  //   emit(const LoginLoading());

  //   final result = await _forgotPasswordUseCase(
  //     ForgotPasswordParams(event.email),
  //   );

  //   result.fold(
  //     (failure) => emit(LoginFailure(_mapFailureToMessage(failure))),
  //     (message) {
  //       _currentEmail = event.email;
  //       emit(LoginForgotPasswordOtpRequired(event.email, message));
  //     },
  //   );
  // }

  // Future<void> _onForgotOtpSubmitted(
  //   LoginForgotOtpSubmitted event,
  //   Emitter<LoginState> emit,
  // ) async {
  //   emit(const LoginLoading());

  //   final result = await _verifyOtpForgotUseCase(
  //     VerifyOtpForgotParams(event.email, event.otpForgot),
  //   );

  //   result.fold(
  //     (failure) => emit(LoginFailure(_mapFailureToMessage(failure))),
  //     (message) {
  //       emit(LoginChangePasswordRequired(event.email, message));
  //     },
  //   );
  // }

  // Future<void> _onChangePasswordRequested(
  //   LoginChangePasswordRequested event,
  //   Emitter<LoginState> emit,
  // ) async {
  //   emit(const LoginLoading());

  //   final result = await _changePasswordUseCase(
  //     ChangePasswordParams(event.email, event.newPassword),
  //   );

  //   result.fold(
  //     (failure) => emit(LoginFailure(_mapFailureToMessage(failure))),
  //     (message) {
  //       emit(LoginPasswordChanged(message));
  //     },
  //   );
  // }

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
