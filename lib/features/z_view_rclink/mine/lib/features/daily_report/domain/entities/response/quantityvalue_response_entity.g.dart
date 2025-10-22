// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quantityvalue_response_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuantityValueResponse _$QuantityValueResponseFromJson(
  Map<String, dynamic> json,
) => QuantityValueResponse(
  value: json['value'] as String?,
  quantityField: json['quantityField'] == null
      ? null
      : QuantityFieldResponse.fromJson(
          json['quantityField'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$QuantityValueResponseToJson(
  QuantityValueResponse instance,
) => <String, dynamic>{
  'value': instance.value,
  'quantityField': instance.quantityField,
};
