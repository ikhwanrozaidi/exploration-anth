import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

class CheckAuthStatus extends AuthEvent {}

class SendOtpRequested extends AuthEvent {
  final String phone;

  const SendOtpRequested(this.phone);

  @override
  List<Object> get props => [phone];
}
