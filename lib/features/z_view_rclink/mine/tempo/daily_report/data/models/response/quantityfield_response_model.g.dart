// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quantityfield_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_QuantityFieldResponseModel _$QuantityFieldResponseModelFromJson(
  Map<String, dynamic> json,
) => _QuantityFieldResponseModel(
  name: json['name'] as String?,
  fieldType: json['fieldType'] as String?,
  unit: json['unit'] as String?,
  validationRules: json['validationRules'] as String?,
  displayOrder: (json['displayOrder'] as num?)?.toInt(),
  isRequired: json['isRequired'] as bool?,
  isForSegment: json['isForSegment'] as bool?,
  defaultValue: json['defaultValue'] as String?,
  uid: json['uid'] as String?,
  dropdownOptions: (json['dropdownOptions'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
);

Map<String, dynamic> _$QuantityFieldResponseModelToJson(
  _QuantityFieldResponseModel instance,
) => <String, dynamic>{
  'name': instance.name,
  'fieldType': instance.fieldType,
  'unit': instance.unit,
  'validationRules': instance.validationRules,
  'displayOrder': instance.displayOrder,
  'isRequired': instance.isRequired,
  'isForSegment': instance.isForSegment,
  'defaultValue': instance.defaultValue,
  'uid': instance.uid,
  'dropdownOptions': instance.dropdownOptions,
};
