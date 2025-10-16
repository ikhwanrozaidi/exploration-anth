// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_daily_report_quantity_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CreateDailyReportQuantityModel _$CreateDailyReportQuantityModelFromJson(
  Map<String, dynamic> json,
) => _CreateDailyReportQuantityModel(
  quantityTypeUID: json['quantityTypeUID'] as String,
  sequenceNo: (json['sequenceNo'] as num?)?.toInt() ?? 1,
  totalLength: (json['totalLength'] as num?)?.toDouble(),
  notes: json['notes'] as String?,
  quantityValues: (json['quantityValues'] as List<dynamic>)
      .map(
        (e) => CreateDailyReportQuantityFieldModel.fromJson(
          e as Map<String, dynamic>,
        ),
      )
      .toList(),
  segments: (json['segments'] as List<dynamic>?)
      ?.map(
        (e) =>
            CreateDailyReportSegmentModel.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$CreateDailyReportQuantityModelToJson(
  _CreateDailyReportQuantityModel instance,
) => <String, dynamic>{
  'quantityTypeUID': instance.quantityTypeUID,
  'sequenceNo': instance.sequenceNo,
  'totalLength': instance.totalLength,
  'notes': instance.notes,
  'quantityValues': instance.quantityValues,
  'segments': instance.segments,
};
