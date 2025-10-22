// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_daily_report_segment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CreateDailyReportSegmentModel _$CreateDailyReportSegmentModelFromJson(
  Map<String, dynamic> json,
) => _CreateDailyReportSegmentModel(
  segmentNumber: (json['segmentNumber'] as num).toInt(),
  startDistance: (json['startDistance'] as num).toDouble(),
  endDistance: (json['endDistance'] as num).toDouble(),
  segmentValues: (json['segmentValues'] as List<dynamic>)
      .map(
        (e) => CreateDailyReportQuantityFieldModel.fromJson(
          e as Map<String, dynamic>,
        ),
      )
      .toList(),
);

Map<String, dynamic> _$CreateDailyReportSegmentModelToJson(
  _CreateDailyReportSegmentModel instance,
) => <String, dynamic>{
  'segmentNumber': instance.segmentNumber,
  'startDistance': instance.startDistance,
  'endDistance': instance.endDistance,
  'segmentValues': instance.segmentValues,
};
