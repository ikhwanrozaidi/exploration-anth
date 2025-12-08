// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quantity_field_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_QuantityFieldModel _$QuantityFieldModelFromJson(Map<String, dynamic> json) =>
    _QuantityFieldModel(
      name: json['name'] as String,
      fieldType: json['fieldType'] as String,
      unit: json['unit'] as String?,
      uid: json['uid'] as String,
    );

Map<String, dynamic> _$QuantityFieldModelToJson(_QuantityFieldModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'fieldType': instance.fieldType,
      'unit': instance.unit,
      'uid': instance.uid,
    };
