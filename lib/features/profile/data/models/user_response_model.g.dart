// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserResponseModel _$UserResponseModelFromJson(Map<String, dynamic> json) =>
    _UserResponseModel(
      id: (json['id'] as num).toInt(),
      email: json['email'] as String,
      role: json['role'] as String,
      phone: json['phone'] as String,
      status: json['status'] as String,
      balance: json['balance'] as String,
      merchantId: (json['merchantId'] as num?)?.toInt(),
      country: json['country'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$UserResponseModelToJson(_UserResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'role': instance.role,
      'phone': instance.phone,
      'status': instance.status,
      'balance': instance.balance,
      'merchantId': instance.merchantId,
      'country': instance.country,
      'createdAt': instance.createdAt.toIso8601String(),
    };
