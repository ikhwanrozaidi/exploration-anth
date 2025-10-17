// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reportquantity_response_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReportQuantityResponse _$ReportQuantityResponseFromJson(
  Map<String, dynamic> json,
) => ReportQuantityResponse(
  quantityType: json['quantityType'] == null
      ? null
      : QuantityTypeResponse.fromJson(
          json['quantityType'] as Map<String, dynamic>,
        ),
  quantityValues: (json['quantityValues'] as List<dynamic>?)
      ?.map((e) => QuantityValueResponse.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$ReportQuantityResponseToJson(
  ReportQuantityResponse instance,
) => <String, dynamic>{
  'quantityType': instance.quantityType,
  'quantityValues': instance.quantityValues,
};
