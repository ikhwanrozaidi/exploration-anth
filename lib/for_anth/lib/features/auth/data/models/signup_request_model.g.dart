// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SignUpRequestModel _$SignUpRequestModelFromJson(Map<String, dynamic> json) =>
    _SignUpRequestModel(
      email: json['email'] as String,
      password: json['password'] as String,
      additionalData: json['additionalData'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$SignUpRequestModelToJson(_SignUpRequestModel instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'additionalData': instance.additionalData,
    };
