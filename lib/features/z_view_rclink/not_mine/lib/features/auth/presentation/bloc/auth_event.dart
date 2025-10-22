import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

class CheckAuthStatus extends AuthEvent {}

class RequestOtpRequested extends AuthEvent {
  final String phone;

  const RequestOtpRequested(this.phone);

  @override
  List<Object> get props => [phone];
}

class LoadCurrentAdmin extends AuthEvent {
  final bool forceRefresh;
  final Duration? cacheTimeout;

  const LoadCurrentAdmin({this.forceRefresh = false, this.cacheTimeout});

  @override
  List<Object?> get props => [forceRefresh, cacheTimeout];
}

class VerifyOtpRequested extends AuthEvent {
  final String phone;
  final String otp;

  const VerifyOtpRequested({required this.phone, required this.otp});

  @override
  List<Object> get props => [phone, otp];
}

class CompanySelected extends AuthEvent {
  final String companyId;
  final String? roleUID;

  const CompanySelected(this.companyId, {this.roleUID});

  @override
  List<Object?> get props => [companyId, roleUID];
}

class LogoutRequested extends AuthEvent {
  const LogoutRequested();

  @override
  List<Object> get props => [];
}
