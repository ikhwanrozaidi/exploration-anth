// lib/features/auth/data/models/login_request_model.dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_request_model.freezed.dart';
part 'login_request_model.g.dart';

@freezed
abstract class LoginRequestModel with _$LoginRequestModel {
  const factory LoginRequestModel({
    required String email,
    required String password,
  }) = _LoginRequestModel;

  factory LoginRequestModel.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestModelFromJson(json);
}

// lib/features/auth/data/models/verify_otp_request_model.dart
@freezed
abstract class VerifyOtpRequestModel with _$VerifyOtpRequestModel {
  const factory VerifyOtpRequestModel({
    required String email,
    required String otp,
  }) = _VerifyOtpRequestModel;

  factory VerifyOtpRequestModel.fromJson(Map<String, dynamic> json) =>
      _$VerifyOtpRequestModelFromJson(json);
}

// lib/features/auth/data/models/login_response_model.dart
@freezed
abstract class LoginResponseModel with _$LoginResponseModel {
  const factory LoginResponseModel({
    required String message,
  }) = _LoginResponseModel;

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseModelFromJson(json);
}

// lib/features/auth/data/models/verify_otp_response_model.dart
@freezed
abstract class VerifyOtpResponseModel with _$VerifyOtpResponseModel {
  const factory VerifyOtpResponseModel({
    required String id,
    required String accesstoken,
    required String refreshToken,
  }) = _VerifyOtpResponseModel;

  factory VerifyOtpResponseModel.fromJson(Map<String, dynamic> json) =>
      _$VerifyOtpResponseModelFromJson(json);
}

// lib/features/auth/data/models/forgot_password_request_model.dart
@freezed
abstract class ForgotPasswordRequestModel with _$ForgotPasswordRequestModel {
  const factory ForgotPasswordRequestModel({
    required String email,
  }) = _ForgotPasswordRequestModel;

  factory ForgotPasswordRequestModel.fromJson(Map<String, dynamic> json) =>
      _$ForgotPasswordRequestModelFromJson(json);
}

// lib/features/auth/data/models/verify_otp_forgot_request_model.dart
@freezed
abstract class VerifyOtpForgotRequestModel with _$VerifyOtpForgotRequestModel {
  const factory VerifyOtpForgotRequestModel({
    required String email,
    required String otpForgot,
  }) = _VerifyOtpForgotRequestModel;

  factory VerifyOtpForgotRequestModel.fromJson(Map<String, dynamic> json) =>
      _$VerifyOtpForgotRequestModelFromJson(json);
}

// lib/features/auth/data/models/change_password_request_model.dart
@freezed
abstract class ChangePasswordRequestModel with _$ChangePasswordRequestModel {
  const factory ChangePasswordRequestModel({
    required String email,
    required String newPassword,
  }) = _ChangePasswordRequestModel;

  factory ChangePasswordRequestModel.fromJson(Map<String, dynamic> json) =>
      _$ChangePasswordRequestModelFromJson(json);
}