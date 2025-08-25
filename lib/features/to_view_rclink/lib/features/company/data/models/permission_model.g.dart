// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'permission_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PermissionModel _$PermissionModelFromJson(Map<String, dynamic> json) =>
    _PermissionModel(
      id: (json['id'] as num).toInt(),
      uid: json['uid'] as String,
      code: json['code'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      category: json['category'] as String,
      scope: json['scope'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$PermissionModelToJson(_PermissionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'uid': instance.uid,
      'code': instance.code,
      'name': instance.name,
      'description': instance.description,
      'category': instance.category,
      'scope': instance.scope,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
