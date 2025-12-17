// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'otp_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OtpResponseModel _$OtpResponseModelFromJson(Map<String, dynamic> json) =>
    _OtpResponseModel(
      message: json['message'] as String,
      sentTo: json['sentTo'] as String,
      email: json['email'] as String,
    );

Map<String, dynamic> _$OtpResponseModelToJson(_OtpResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'sentTo': instance.sentTo,
      'email': instance.email,
    };
