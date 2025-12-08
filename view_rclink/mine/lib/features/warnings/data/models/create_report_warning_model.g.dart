// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_report_warning_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CreateReportWarningModel _$CreateReportWarningModelFromJson(
  Map<String, dynamic> json,
) => _CreateReportWarningModel(
  dailyReportUID: json['dailyReportUID'] as String,
  warningReasonUIDs: (json['warningReasonUIDs'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  description: json['description'] as String?,
);

Map<String, dynamic> _$CreateReportWarningModelToJson(
  _CreateReportWarningModel instance,
) => <String, dynamic>{
  'dailyReportUID': instance.dailyReportUID,
  'warningReasonUIDs': instance.warningReasonUIDs,
  'description': instance.description,
};
