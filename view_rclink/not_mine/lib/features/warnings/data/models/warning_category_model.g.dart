// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'warning_category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WarningCategoryModel _$WarningCategoryModelFromJson(
  Map<String, dynamic> json,
) => _WarningCategoryModel(
  id: (json['id'] as num).toInt(),
  uid: json['uid'] as String,
  name: json['name'] as String,
  warningType: json['warningType'] as String,
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$WarningCategoryModelToJson(
  _WarningCategoryModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'uid': instance.uid,
  'name': instance.name,
  'warningType': instance.warningType,
  'createdAt': instance.createdAt?.toIso8601String(),
  'updatedAt': instance.updatedAt?.toIso8601String(),
};
