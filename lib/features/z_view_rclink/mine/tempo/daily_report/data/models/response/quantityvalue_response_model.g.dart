// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quantityvalue_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_QuantityValueResponseModel _$QuantityValueResponseModelFromJson(
  Map<String, dynamic> json,
) => _QuantityValueResponseModel(
  value: json['value'] as String?,
  quantityField: json['quantityField'] == null
      ? null
      : QuantityFieldResponseModel.fromJson(
          json['quantityField'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$QuantityValueResponseModelToJson(
  _QuantityValueResponseModel instance,
) => <String, dynamic>{
  'value': instance.value,
  'quantityField': instance.quantityField,
};
