// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_field_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ApiFieldModel _$ApiFieldModelFromJson(Map<String, dynamic> json) =>
    _ApiFieldModel(
      id: (json['id'] as num).toInt(),
      uid: json['uid'] as String,
      quantityTypeID: (json['quantityTypeID'] as num).toInt(),
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
      dropdownOptions: (json['dropdownOptions'] as List<dynamic>?)
          ?.map((e) => ApiDropdownOption.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ApiFieldModelToJson(_ApiFieldModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'uid': instance.uid,
      'quantityTypeID': instance.quantityTypeID,
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

_ApiDropdownOption _$ApiDropdownOptionFromJson(Map<String, dynamic> json) =>
    _ApiDropdownOption(
      id: (json['id'] as num).toInt(),
      uid: json['uid'] as String,
      fieldID: (json['fieldID'] as num).toInt(),
      value: json['value'] as String,
      displayOrder: (json['displayOrder'] as num).toInt(),
      isActive: json['isActive'] as bool,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$ApiDropdownOptionToJson(_ApiDropdownOption instance) =>
    <String, dynamic>{
      'id': instance.id,
      'uid': instance.uid,
      'fieldID': instance.fieldID,
      'value': instance.value,
      'displayOrder': instance.displayOrder,
      'isActive': instance.isActive,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
