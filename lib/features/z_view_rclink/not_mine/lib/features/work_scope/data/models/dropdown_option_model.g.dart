// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dropdown_option_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DropdownOptionModel _$DropdownOptionModelFromJson(Map<String, dynamic> json) =>
    _DropdownOptionModel(
      id: (json['id'] as num).toInt(),
      uid: json['uid'] as String,
      value: json['value'] as String,
      displayOrder: (json['displayOrder'] as num).toInt(),
    );

Map<String, dynamic> _$DropdownOptionModelToJson(
  _DropdownOptionModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'uid': instance.uid,
  'value': instance.value,
  'displayOrder': instance.displayOrder,
};
