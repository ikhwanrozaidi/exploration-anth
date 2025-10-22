// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quantity_field_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_QuantityFieldModel _$QuantityFieldModelFromJson(Map<String, dynamic> json) =>
    _QuantityFieldModel(
      id: (json['id'] as num).toInt(),
      uid: json['uid'] as String,
      name: json['name'] as String,
      code: json['code'] as String,
      fieldType: json['fieldType'] as String,
      unit: json['unit'] as String?,
      validationRules: json['validationRules'] as String?,
      displayOrder: (json['displayOrder'] as num).toInt(),
      isRequired: json['isRequired'] as bool,
      isForSegment: json['isForSegment'] as bool,
      defaultValue: json['defaultValue'] as String?,
      placeholder: json['placeholder'] as String?,
      helpText: json['helpText'] as String?,
      dropdownOptions:
          (json['dropdownOptions'] as List<dynamic>?)
              ?.map(
                (e) => DropdownOptionModel.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const [],
    );

Map<String, dynamic> _$QuantityFieldModelToJson(_QuantityFieldModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'uid': instance.uid,
      'name': instance.name,
      'code': instance.code,
      'fieldType': instance.fieldType,
      'unit': instance.unit,
      'validationRules': instance.validationRules,
      'displayOrder': instance.displayOrder,
      'isRequired': instance.isRequired,
      'isForSegment': instance.isForSegment,
      'defaultValue': instance.defaultValue,
      'placeholder': instance.placeholder,
      'helpText': instance.helpText,
      'dropdownOptions': instance.dropdownOptions,
    };
