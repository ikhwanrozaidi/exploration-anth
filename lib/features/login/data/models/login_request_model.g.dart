// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LoginRequestModel _$LoginRequestModelFromJson(Map<String, dynamic> json) =>
    _LoginRequestModel(
      email: json['email'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$LoginRequestModelToJson(_LoginRequestModel instance) =>
    <String, dynamic>{'email': instance.email, 'password': instance.password};

_VerifyOtpRequestModel _$VerifyOtpRequestModelFromJson(
  Map<String, dynamic> json,
) => _VerifyOtpRequestModel(
  email: json['email'] as String,
  otp: json['otp'] as String,
);

Map<String, dynamic> _$VerifyOtpRequestModelToJson(
  _VerifyOtpRequestModel instance,
) => <String, dynamic>{'email': instance.email, 'otp': instance.otp};

_LoginResponseModel _$LoginResponseModelFromJson(Map<String, dynamic> json) =>
    _LoginResponseModel(message: json['message'] as String);

Map<String, dynamic> _$LoginResponseModelToJson(_LoginResponseModel instance) =>
    <String, dynamic>{'message': instance.message};

_VerifyOtpResponseModel _$VerifyOtpResponseModelFromJson(
  Map<String, dynamic> json,
) => _VerifyOtpResponseModel(
  id: json['id'] as String,
  accesstoken: json['accesstoken'] as String,
  refreshToken: json['refreshToken'] as String,
);

Map<String, dynamic> _$VerifyOtpResponseModelToJson(
  _VerifyOtpResponseModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'accesstoken': instance.accesstoken,
  'refreshToken': instance.refreshToken,
};

_ForgotPasswordRequestModel _$ForgotPasswordRequestModelFromJson(
  Map<String, dynamic> json,
) => _ForgotPasswordRequestModel(email: json['email'] as String);

Map<String, dynamic> _$ForgotPasswordRequestModelToJson(
  _ForgotPasswordRequestModel instance,
) => <String, dynamic>{'email': instance.email};

_VerifyOtpForgotRequestModel _$VerifyOtpForgotRequestModelFromJson(
  Map<String, dynamic> json,
) => _VerifyOtpForgotRequestModel(
  email: json['email'] as String,
  otpForgot: json['otpForgot'] as String,
);

Map<String, dynamic> _$VerifyOtpForgotRequestModelToJson(
  _VerifyOtpForgotRequestModel instance,
) => <String, dynamic>{
  'email': instance.email,
  'otpForgot': instance.otpForgot,
};

_ChangePasswordRequestModel _$ChangePasswordRequestModelFromJson(
  Map<String, dynamic> json,
) => _ChangePasswordRequestModel(
  email: json['email'] as String,
  newPassword: json['newPassword'] as String,
);

Map<String, dynamic> _$ChangePasswordRequestModelToJson(
  _ChangePasswordRequestModel instance,
) => <String, dynamic>{
  'email': instance.email,
  'newPassword': instance.newPassword,
};
