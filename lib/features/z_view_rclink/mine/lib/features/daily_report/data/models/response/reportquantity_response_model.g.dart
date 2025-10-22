// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reportquantity_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ReportQuantityResponseModel _$ReportQuantityResponseModelFromJson(
  Map<String, dynamic> json,
) => _ReportQuantityResponseModel(
  quantityType: json['quantityType'] == null
      ? null
      : QuantityTypeResponseModel.fromJson(
          json['quantityType'] as Map<String, dynamic>,
        ),
  quantityValues: (json['quantityValues'] as List<dynamic>?)
      ?.map(
        (e) => QuantityValueResponseModel.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$ReportQuantityResponseModelToJson(
  _ReportQuantityResponseModel instance,
) => <String, dynamic>{
  'quantityType': instance.quantityType,
  'quantityValues': instance.quantityValues,
};
