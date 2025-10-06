// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_report_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DailyReportModel _$DailyReportModelFromJson(Map<String, dynamic> json) =>
    _DailyReportModel(
      id: (json['id'] as num).toInt(),
      uid: json['uid'] as String,
      name: json['name'] as String,
      notes: json['notes'] as String?,
      weatherCondition: json['weatherCondition'] as String,
      workPerformed: json['workPerformed'] as bool? ?? false,
      longitude: (json['longitude'] as num?)?.toDouble(),
      latitude: (json['latitude'] as num?)?.toDouble(),
      companyID: (json['companyID'] as num).toInt(),
      contractRelationID: (json['contractRelationID'] as num?)?.toInt(),
      status: json['status'] as String? ?? 'SUBMITTED',
      approvedByID: (json['approvedByID'] as num?)?.toInt(),
      approvedAt: json['approvedAt'] == null
          ? null
          : DateTime.parse(json['approvedAt'] as String),
      rejectionReason: json['rejectionReason'] as String?,
      workScopeID: (json['workScopeID'] as num).toInt(),
      roadID: (json['roadID'] as num).toInt(),
      totalWorkers: (json['totalWorkers'] as num?)?.toInt(),
      fromSection: (json['fromSection'] as num?)?.toDouble(),
      toSection: (json['toSection'] as num?)?.toDouble(),
      createdByID: (json['createdByID'] as num).toInt(),
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

Map<String, dynamic> _$DailyReportModelToJson(_DailyReportModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'uid': instance.uid,
      'name': instance.name,
      'notes': instance.notes,
      'weatherCondition': instance.weatherCondition,
      'workPerformed': instance.workPerformed,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
      'companyID': instance.companyID,
      'contractRelationID': instance.contractRelationID,
      'status': instance.status,
      'approvedByID': instance.approvedByID,
      'approvedAt': instance.approvedAt?.toIso8601String(),
      'rejectionReason': instance.rejectionReason,
      'workScopeID': instance.workScopeID,
      'roadID': instance.roadID,
      'totalWorkers': instance.totalWorkers,
      'fromSection': instance.fromSection,
      'toSection': instance.toSection,
      'createdByID': instance.createdByID,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'isSynced': instance.isSynced,
      'deletedAt': instance.deletedAt?.toIso8601String(),
      'syncAction': instance.syncAction,
      'syncRetryCount': instance.syncRetryCount,
      'syncError': instance.syncError,
      'lastSyncAttempt': instance.lastSyncAttempt?.toIso8601String(),
    };
