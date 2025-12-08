// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'role.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Role _$RoleFromJson(Map<String, dynamic> json) => Role(
  id: (json['id'] as num).toInt(),
  uid: json['uid'] as String,
  name: json['name'] as String,
  description: json['description'] as String?,
  companyID: (json['companyID'] as num).toInt(),
  isSystemRole: json['isSystemRole'] as bool,
  isActive: json['isActive'] as bool,
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
  deletedAt: json['deletedAt'] == null
      ? null
      : DateTime.parse(json['deletedAt'] as String),
  permissions: (json['permissions'] as List<dynamic>)
      .map((e) => Permission.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$RoleToJson(Role instance) => <String, dynamic>{
  'id': instance.id,
  'uid': instance.uid,
  'name': instance.name,
  'description': instance.description,
  'companyID': instance.companyID,
  'isSystemRole': instance.isSystemRole,
  'isActive': instance.isActive,
  'createdAt': instance.createdAt.toIso8601String(),
  'updatedAt': instance.updatedAt.toIso8601String(),
  'deletedAt': instance.deletedAt?.toIso8601String(),
  'permissions': instance.permissions,
};
