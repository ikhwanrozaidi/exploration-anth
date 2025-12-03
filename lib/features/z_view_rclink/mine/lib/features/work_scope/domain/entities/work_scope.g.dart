// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_scope.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkScope _$WorkScopeFromJson(Map<String, dynamic> json) => WorkScope(
  id: (json['id'] as num).toInt(),
  uid: json['uid'] as String,
  name: json['name'] as String,
  code: json['code'] as String,
  description: json['description'] as String,
  allowMultipleQuantities: json['allowMultipleQuantities'] as bool,
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
  deletedAt: json['deletedAt'] == null
      ? null
      : DateTime.parse(json['deletedAt'] as String),
  companyID: (json['companyID'] as num).toInt(),
  workQuantityTypes: (json['workQuantityTypes'] as List<dynamic>)
      .map((e) => WorkQuantityType.fromJson(e as Map<String, dynamic>))
      .toList(),
  workEquipments: (json['workEquipments'] as List<dynamic>)
      .map((e) => WorkEquipment.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$WorkScopeToJson(WorkScope instance) => <String, dynamic>{
  'id': instance.id,
  'uid': instance.uid,
  'name': instance.name,
  'code': instance.code,
  'description': instance.description,
  'allowMultipleQuantities': instance.allowMultipleQuantities,
  'createdAt': instance.createdAt.toIso8601String(),
  'updatedAt': instance.updatedAt.toIso8601String(),
  'deletedAt': instance.deletedAt?.toIso8601String(),
  'companyID': instance.companyID,
  'workQuantityTypes': instance.workQuantityTypes,
  'workEquipments': instance.workEquipments,
};
