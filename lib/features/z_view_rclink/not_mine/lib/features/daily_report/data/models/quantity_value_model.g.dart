// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quantity_value_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_QuantityValueModel _$QuantityValueModelFromJson(Map<String, dynamic> json) =>
    _QuantityValueModel(
      value: json['value'] as String,
      quantityField: QuantityFieldModel.fromJson(
        json['quantityField'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$QuantityValueModelToJson(_QuantityValueModel instance) =>
    <String, dynamic>{
      'value': instance.value,
      'quantityField': instance.quantityField,
    };
