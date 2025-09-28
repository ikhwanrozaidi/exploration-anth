// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dropdown_option.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DropdownOption _$DropdownOptionFromJson(Map<String, dynamic> json) =>
    DropdownOption(
      id: (json['id'] as num).toInt(),
      uid: json['uid'] as String,
      value: json['value'] as String,
      displayOrder: (json['displayOrder'] as num).toInt(),
    );

Map<String, dynamic> _$DropdownOptionToJson(DropdownOption instance) =>
    <String, dynamic>{
      'id': instance.id,
      'uid': instance.uid,
      'value': instance.value,
      'displayOrder': instance.displayOrder,
    };
