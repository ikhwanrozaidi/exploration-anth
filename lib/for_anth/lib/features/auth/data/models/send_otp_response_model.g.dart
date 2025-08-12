// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_otp_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SendOtpResponseModel _$SendOtpResponseModelFromJson(
  Map<String, dynamic> json,
) => _SendOtpResponseModel(
  message: json['message'] as String,
  success: json['success'] as bool,
);

Map<String, dynamic> _$SendOtpResponseModelToJson(
  _SendOtpResponseModel instance,
) => <String, dynamic>{
  'message': instance.message,
  'success': instance.success,
};
