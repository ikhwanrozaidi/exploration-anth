// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'permission.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Permission _$PermissionFromJson(Map<String, dynamic> json) => Permission(
  id: (json['id'] as num).toInt(),
  uid: json['uid'] as String,
  code: json['code'] as String,
  name: json['name'] as String,
  description: json['description'] as String?,
  category: json['category'] as String,
  scope: json['scope'] as String,
);

Map<String, dynamic> _$PermissionToJson(Permission instance) =>
    <String, dynamic>{
      'id': instance.id,
      'uid': instance.uid,
      'code': instance.code,
      'name': instance.name,
      'description': instance.description,
      'category': instance.category,
      'scope': instance.scope,
    };
