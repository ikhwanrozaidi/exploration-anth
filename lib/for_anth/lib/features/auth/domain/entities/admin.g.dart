// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Admin _$AdminFromJson(Map<String, dynamic> json) => Admin(
  id: (json['id'] as num).toInt(),
  uid: json['uid'] as String,
  phone: json['phone'] as String,
  firstName: json['firstName'] as String?,
  lastName: json['lastName'] as String?,
  email: json['email'] as String?,
  updatedAt: DateTime.parse(json['updatedAt'] as String),
  createdAt: DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$AdminToJson(Admin instance) => <String, dynamic>{
  'id': instance.id,
  'uid': instance.uid,
  'phone': instance.phone,
  'firstName': instance.firstName,
  'lastName': instance.lastName,
  'email': instance.email,
  'updatedAt': instance.updatedAt.toIso8601String(),
  'createdAt': instance.createdAt.toIso8601String(),
};
