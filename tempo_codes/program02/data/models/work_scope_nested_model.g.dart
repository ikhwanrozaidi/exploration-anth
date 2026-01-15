// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_scope_nested_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WorkScopeNestedModel _$WorkScopeNestedModelFromJson(
  Map<String, dynamic> json,
) => _WorkScopeNestedModel(
  id: (json['id'] as num?)?.toInt(),
  uid: json['uid'] as String?,
  name: json['name'] as String?,
  code: json['code'] as String?,
  description: json['description'] as String?,
  allowMultipleQuantities: json['allowMultipleQuantities'] as bool?,
  companyID: (json['companyID'] as num?)?.toInt(),
  createdAt: json['createdAt'] as String?,
  updatedAt: json['updatedAt'] as String?,
  deletedAt: json['deletedAt'] as String?,
);

Map<String, dynamic> _$WorkScopeNestedModelToJson(
  _WorkScopeNestedModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'uid': instance.uid,
  'name': instance.name,
  'code': instance.code,
  'description': instance.description,
  'allowMultipleQuantities': instance.allowMultipleQuantities,
  'companyID': instance.companyID,
  'createdAt': instance.createdAt,
  'updatedAt': instance.updatedAt,
  'deletedAt': instance.deletedAt,
};
