// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_equipment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ReportEquipmentModel _$ReportEquipmentModelFromJson(
  Map<String, dynamic> json,
) => _ReportEquipmentModel(
  id: (json['id'] as num).toInt(),
  reportType: json['reportType'] as String,
  dailyReportID: (json['dailyReportID'] as num?)?.toInt(),
  workEquipmentID: (json['workEquipmentID'] as num).toInt(),
  addedByID: (json['addedByID'] as num).toInt(),
  createdAt: DateTime.parse(json['createdAt'] as String),
  isSynced: json['isSynced'] as bool? ?? false,
  deletedAt: json['deletedAt'] == null
      ? null
      : DateTime.parse(json['deletedAt'] as String),
  syncAction: json['syncAction'] as String?,
  syncRetryCount: (json['syncRetryCount'] as num?)?.toInt() ?? 0,
  syncError: json['syncError'] as String?,
  lastSyncAttempt: json['lastSyncAttempt'] == null
      ? null
      : DateTime.parse(json['lastSyncAttempt'] as String),
);

Map<String, dynamic> _$ReportEquipmentModelToJson(
  _ReportEquipmentModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'reportType': instance.reportType,
  'dailyReportID': instance.dailyReportID,
  'workEquipmentID': instance.workEquipmentID,
  'addedByID': instance.addedByID,
  'createdAt': instance.createdAt.toIso8601String(),
  'isSynced': instance.isSynced,
  'deletedAt': instance.deletedAt?.toIso8601String(),
  'syncAction': instance.syncAction,
  'syncRetryCount': instance.syncRetryCount,
  'syncError': instance.syncError,
  'lastSyncAttempt': instance.lastSyncAttempt?.toIso8601String(),
};
