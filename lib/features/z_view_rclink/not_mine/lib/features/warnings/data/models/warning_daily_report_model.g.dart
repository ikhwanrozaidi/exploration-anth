// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'warning_daily_report_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WarningDailyReportModel _$WarningDailyReportModelFromJson(
  Map<String, dynamic> json,
) => _WarningDailyReportModel(
  id: (json['id'] as num).toInt(),
  uid: json['uid'] as String,
  name: json['name'] as String,
  createdAt: DateTime.parse(json['createdAt'] as String),
  status: json['status'] as String,
  workPerformed: json['workPerformed'] as bool,
  reportEquipments:
      (json['reportEquipments'] as List<dynamic>?)
          ?.map(
            (e) => WarningEquipmentModel.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      const [],
  reportQuantities:
      (json['reportQuantities'] as List<dynamic>?)
          ?.map(
            (e) => ReportQuantitiesModel.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      const [],
);

Map<String, dynamic> _$WarningDailyReportModelToJson(
  _WarningDailyReportModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'uid': instance.uid,
  'name': instance.name,
  'createdAt': instance.createdAt.toIso8601String(),
  'status': instance.status,
  'workPerformed': instance.workPerformed,
  'reportEquipments': instance.reportEquipments,
  'reportQuantities': instance.reportQuantities,
};
