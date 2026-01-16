// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quantity_field_nested_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuantityFieldNested _$QuantityFieldNestedFromJson(Map<String, dynamic> json) =>
    QuantityFieldNested(
      id: (json['id'] as num?)?.toInt(),
      uid: json['uid'] as String?,
      quantityTypeID: (json['quantityTypeID'] as num?)?.toInt(),
      name: json['name'] as String?,
      code: json['code'] as String?,
      fieldType: json['fieldType'] as String?,
      unit: json['unit'] as String?,
      unitMeasurement: json['unitMeasurement'] as String?,
      minValue: (json['minValue'] as num?)?.toDouble(),
      maxValue: (json['maxValue'] as num?)?.toDouble(),
      minLength: (json['minLength'] as num?)?.toInt(),
      maxLength: (json['maxLength'] as num?)?.toInt(),
      displayOrder: (json['displayOrder'] as num?)?.toInt(),
      isRequired: json['isRequired'] as bool?,
      isForSegment: json['isForSegment'] as bool?,
      defaultValue: json['defaultValue'] as String?,
      placeholder: json['placeholder'] as String?,
      helpText: json['helpText'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      dropdownOptions: (json['dropdownOptions'] as List<dynamic>?)
          ?.map((e) => DropdownOptionNested.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$QuantityFieldNestedToJson(
  QuantityFieldNested instance,
) => <String, dynamic>{
  'id': instance.id,
  'uid': instance.uid,
  'quantityTypeID': instance.quantityTypeID,
  'name': instance.name,
  'code': instance.code,
  'fieldType': instance.fieldType,
  'unit': instance.unit,
  'unitMeasurement': instance.unitMeasurement,
  'minValue': instance.minValue,
  'maxValue': instance.maxValue,
  'minLength': instance.minLength,
  'maxLength': instance.maxLength,
  'displayOrder': instance.displayOrder,
  'isRequired': instance.isRequired,
  'isForSegment': instance.isForSegment,
  'defaultValue': instance.defaultValue,
  'placeholder': instance.placeholder,
  'helpText': instance.helpText,
  'createdAt': instance.createdAt,
  'updatedAt': instance.updatedAt,
  'dropdownOptions': instance.dropdownOptions,
};
