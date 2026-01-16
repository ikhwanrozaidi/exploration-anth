// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dropdown_option_nested_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DropdownOptionNested _$DropdownOptionNestedFromJson(
  Map<String, dynamic> json,
) => DropdownOptionNested(
  id: (json['id'] as num?)?.toInt(),
  uid: json['uid'] as String?,
  fieldID: (json['fieldID'] as num?)?.toInt(),
  value: json['value'] as String?,
  displayOrder: (json['displayOrder'] as num?)?.toInt(),
  isActive: json['isActive'] as bool?,
  createdAt: json['createdAt'] as String?,
  updatedAt: json['updatedAt'] as String?,
);

Map<String, dynamic> _$DropdownOptionNestedToJson(
  DropdownOptionNested instance,
) => <String, dynamic>{
  'id': instance.id,
  'uid': instance.uid,
  'fieldID': instance.fieldID,
  'value': instance.value,
  'displayOrder': instance.displayOrder,
  'isActive': instance.isActive,
  'createdAt': instance.createdAt,
  'updatedAt': instance.updatedAt,
};
