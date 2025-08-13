import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../admin/domain/entities/admin.dart';
import '../../../auth/domain/entities/auth_result.dart';

part 'login_state.freezed.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState.initial() = LoginInitial;
  const factory LoginState.loading() = LoginLoading;
  const factory LoginState.otpRequired(String email, String message) = LoginOtpRequired;
  const factory LoginState.authenticated(AuthResult authResult, Admin admin) = LoginAuthenticated;
  const factory LoginState.success(Admin admin) = LoginSuccess;
  const factory LoginState.unauthenticated() = LoginUnauthenticated;
  const factory LoginState.loggedOut() = LoginLoggedOut;
  const factory LoginState.failure(String message) = LoginFailure;
  
  // Forgot password states
  const factory LoginState.forgotPasswordOtpRequired(String email, String message) = LoginForgotPasswordOtpRequired;
  const factory LoginState.changePasswordRequired(String email, String message) = LoginChangePasswordRequired;
  const factory LoginState.passwordChanged(String message) = LoginPasswordChanged;
  
  // Remember me state
  const factory LoginState.credentialsLoaded(String email, String password) = LoginCredentialsLoaded;
}