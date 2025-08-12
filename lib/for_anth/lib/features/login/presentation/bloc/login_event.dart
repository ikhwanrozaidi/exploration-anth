import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object?> get props => [];
}

class LoginSubmitted extends LoginEvent {
  final String email;
  final String password;

  const LoginSubmitted(this.email, this.password);

  @override
  List<Object> get props => [email, password];
}

class LoginOtpSubmitted extends LoginEvent {
  final String email;
  final String otp;

  const LoginOtpSubmitted(this.email, this.otp);

  @override
  List<Object> get props => [email, otp];
}

class LoginCheckAuthStatus extends LoginEvent {
  const LoginCheckAuthStatus();
}

class LoginLogoutRequested extends LoginEvent {
  const LoginLogoutRequested();
}

class LoginForgotPasswordRequested extends LoginEvent {
  final String email;

  const LoginForgotPasswordRequested(this.email);

  @override
  List<Object> get props => [email];
}

class LoginForgotOtpSubmitted extends LoginEvent {
  final String email;
  final String otpForgot;

  const LoginForgotOtpSubmitted(this.email, this.otpForgot);

  @override
  List<Object> get props => [email, otpForgot];
}

class LoginChangePasswordRequested extends LoginEvent {
  final String email;
  final String newPassword;

  const LoginChangePasswordRequested(this.email, this.newPassword);

  @override
  List<Object> get props => [email, newPassword];
}