// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
  id: (json['id'] as num).toInt(),
  email: json['email'] as String,
  role: json['role'] as String,
  phone: json['phone'] as String,
  status: json['status'] as String,
  balance: json['balance'] as String,
  merchantId: json['merchantId'] as String?,
  country: json['country'] as String?,
  createdAt: DateTime.parse(json['createdAt'] as String),
  userDetail: json['userDetail'] == null
      ? null
      : UserDetail.fromJson(json['userDetail'] as Map<String, dynamic>),
  userSettings: json['userSettings'] == null
      ? null
      : UserSettings.fromJson(json['userSettings'] as Map<String, dynamic>),
);

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
  'id': instance.id,
  'email': instance.email,
  'role': instance.role,
  'phone': instance.phone,
  'status': instance.status,
  'balance': instance.balance,
  'merchantId': instance.merchantId,
  'country': instance.country,
  'createdAt': instance.createdAt.toIso8601String(),
  'userDetail': instance.userDetail,
  'userSettings': instance.userSettings,
};
