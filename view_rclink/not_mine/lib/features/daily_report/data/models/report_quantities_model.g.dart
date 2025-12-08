// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_quantities_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ReportQuantitiesModel _$ReportQuantitiesModelFromJson(
  Map<String, dynamic> json,
) => _ReportQuantitiesModel(
  quantityType: QuantityTypeModel.fromJson(
    json['quantityType'] as Map<String, dynamic>,
  ),
  quantityValues: (json['quantityValues'] as List<dynamic>)
      .map((e) => QuantityValueModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$ReportQuantitiesModelToJson(
  _ReportQuantitiesModel instance,
) => <String, dynamic>{
  'quantityType': instance.quantityType,
  'quantityValues': instance.quantityValues,
};
