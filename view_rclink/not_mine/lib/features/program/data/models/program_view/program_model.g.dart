// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'program_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProgramModel _$ProgramModelFromJson(Map<String, dynamic> json) =>
    _ProgramModel(
      id: (json['id'] as num?)?.toInt(),
      uid: json['uid'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      companyID: (json['companyID'] as num?)?.toInt(),
      workScopeID: (json['workScopeID'] as num?)?.toInt(),
      roadID: (json['roadID'] as num?)?.toInt(),
      periodStart: json['periodStart'] as String?,
      periodEnd: json['periodEnd'] as String?,
      contractRelationID: (json['contractRelationID'] as num?)?.toInt(),
      requiredReportsCount: (json['requiredReportsCount'] as num?)?.toInt(),
      totalReports: (json['totalReports'] as num?)?.toInt(),
      calculationType: json['calculationType'] as String?,
      fromSection: json['fromSection'] as String?,
      toSection: json['toSection'] as String?,
      dividerValue: json['dividerValue'] as String?,
      inputValue: json['inputValue'] as String?,
      longitude: json['longitude'] as String?,
      latitude: json['latitude'] as String?,
      status: json['status'] as String?,
      createdByID: (json['createdByID'] as num?)?.toInt(),
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      deletedAt: json['deletedAt'] as String?,
      workScope: json['workScope'] == null
          ? null
          : WorkScopeNestedModel.fromJson(
              json['workScope'] as Map<String, dynamic>,
            ),
      road: json['road'] == null
          ? null
          : RoadNestedModel.fromJson(json['road'] as Map<String, dynamic>),
      contractRelation: json['contractRelation'] == null
          ? null
          : ContractRelationNestedModel.fromJson(
              json['contractRelation'] as Map<String, dynamic>,
            ),
      createdBy: json['createdBy'] == null
          ? null
          : CreatedByNestedModel.fromJson(
              json['createdBy'] as Map<String, dynamic>,
            ),
      quantities: (json['quantities'] as List<dynamic>?)
          ?.map((e) => ProgramQuantityModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      files: (json['files'] as List<dynamic>?)
          ?.map((e) => FileModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      dailyReports: (json['dailyReports'] as List<dynamic>?)
          ?.map((e) => DailyReportModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      isSynced: json['isSynced'] as bool? ?? false,
      syncAction: json['syncAction'] as String?,
      syncRetryCount: (json['syncRetryCount'] as num?)?.toInt() ?? 0,
      syncError: json['syncError'] as String?,
      lastSyncAttempt: json['lastSyncAttempt'] == null
          ? null
          : DateTime.parse(json['lastSyncAttempt'] as String),
    );

Map<String, dynamic> _$ProgramModelToJson(_ProgramModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'uid': instance.uid,
      'name': instance.name,
      'description': instance.description,
      'companyID': instance.companyID,
      'workScopeID': instance.workScopeID,
      'roadID': instance.roadID,
      'periodStart': instance.periodStart,
      'periodEnd': instance.periodEnd,
      'contractRelationID': instance.contractRelationID,
      'requiredReportsCount': instance.requiredReportsCount,
      'totalReports': instance.totalReports,
      'calculationType': instance.calculationType,
      'fromSection': instance.fromSection,
      'toSection': instance.toSection,
      'dividerValue': instance.dividerValue,
      'inputValue': instance.inputValue,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
      'status': instance.status,
      'createdByID': instance.createdByID,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'deletedAt': instance.deletedAt,
      'workScope': instance.workScope,
      'road': instance.road,
      'contractRelation': instance.contractRelation,
      'createdBy': instance.createdBy,
      'quantities': instance.quantities,
      'files': instance.files,
      'dailyReports': instance.dailyReports,
      'isSynced': instance.isSynced,
      'syncAction': instance.syncAction,
      'syncRetryCount': instance.syncRetryCount,
      'syncError': instance.syncError,
      'lastSyncAttempt': instance.lastSyncAttempt?.toIso8601String(),
    };
