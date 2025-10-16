// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_segment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ReportSegmentModel _$ReportSegmentModelFromJson(Map<String, dynamic> json) =>
    _ReportSegmentModel(
      id: (json['id'] as num).toInt(),
      reportQuantityID: (json['reportQuantityID'] as num).toInt(),
      segmentNumber: (json['segmentNumber'] as num).toInt(),
      startDistance: (json['startDistance'] as num).toDouble(),
      endDistance: (json['endDistance'] as num).toDouble(),
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

Map<String, dynamic> _$ReportSegmentModelToJson(_ReportSegmentModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'reportQuantityID': instance.reportQuantityID,
      'segmentNumber': instance.segmentNumber,
      'startDistance': instance.startDistance,
      'endDistance': instance.endDistance,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'isSynced': instance.isSynced,
      'deletedAt': instance.deletedAt?.toIso8601String(),
      'syncAction': instance.syncAction,
      'syncRetryCount': instance.syncRetryCount,
      'syncError': instance.syncError,
      'lastSyncAttempt': instance.lastSyncAttempt?.toIso8601String(),
    };
