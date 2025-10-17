// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_quantity_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ReportQuantityModel _$ReportQuantityModelFromJson(Map<String, dynamic> json) =>
    _ReportQuantityModel(
      id: (json['id'] as num).toInt(),
      reportType: json['reportType'] as String,
      dailyReportID: (json['dailyReportID'] as num?)?.toInt(),
      quantityTypeID: (json['quantityTypeID'] as num).toInt(),
      sequenceNo: (json['sequenceNo'] as num?)?.toInt() ?? 1,
      totalLength: (json['totalLength'] as num?)?.toDouble(),
      notes: json['notes'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
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

Map<String, dynamic> _$ReportQuantityModelToJson(
  _ReportQuantityModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'reportType': instance.reportType,
  'dailyReportID': instance.dailyReportID,
  'quantityTypeID': instance.quantityTypeID,
  'sequenceNo': instance.sequenceNo,
  'totalLength': instance.totalLength,
  'notes': instance.notes,
  'createdAt': instance.createdAt.toIso8601String(),
  'updatedAt': instance.updatedAt.toIso8601String(),
  'isSynced': instance.isSynced,
  'deletedAt': instance.deletedAt?.toIso8601String(),
  'syncAction': instance.syncAction,
  'syncRetryCount': instance.syncRetryCount,
  'syncError': instance.syncError,
  'lastSyncAttempt': instance.lastSyncAttempt?.toIso8601String(),
};
