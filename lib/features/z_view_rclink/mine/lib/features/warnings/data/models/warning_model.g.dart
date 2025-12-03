// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'warning_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WarningModel _$WarningModelFromJson(Map<String, dynamic> json) =>
    _WarningModel(
      id: (json['id'] as num?)?.toInt(),
      uid: json['uid'] as String,
      warningType: json['warningType'] as String,
      dailyReportID: (json['dailyReportID'] as num?)?.toInt(),
      companyID: (json['companyID'] as num).toInt(),
      roadID: (json['roadID'] as num).toInt(),
      workScopeID: (json['workScopeID'] as num).toInt(),
      contractRelationID: (json['contractRelationID'] as num?)?.toInt(),
      fromSection: json['fromSection'] as String?,
      toSection: json['toSection'] as String?,
      warningItems:
          (json['warningItems'] as List<dynamic>?)
              ?.map((e) => WarningItemModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      dailyReport: json['dailyReport'] == null
          ? null
          : WarningDailyReportModel.fromJson(
              json['dailyReport'] as Map<String, dynamic>,
            ),
      requiresAction: json['requiresAction'] as bool? ?? true,
      isResolved: json['isResolved'] as bool? ?? false,
      resolvedByID: (json['resolvedByID'] as num?)?.toInt(),
      resolvedAt: json['resolvedAt'] == null
          ? null
          : DateTime.parse(json['resolvedAt'] as String),
      resolutionNotes: json['resolutionNotes'] as String?,
      longitude: json['longitude'] as String?,
      latitude: json['latitude'] as String?,
      description: json['description'] as String?,
      createdByID: (json['createdByID'] as num).toInt(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      deletedAt: json['deletedAt'] == null
          ? null
          : DateTime.parse(json['deletedAt'] as String),
      files: (json['files'] as List<dynamic>?)
          ?.map((e) => FileModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      company: json['company'] == null
          ? null
          : CompanyResponseModel.fromJson(
              json['company'] as Map<String, dynamic>,
            ),
      road: json['road'] == null
          ? null
          : RoadResponseModel.fromJson(json['road'] as Map<String, dynamic>),
      workScope: json['workScope'] == null
          ? null
          : WorkScopeResponseModel.fromJson(
              json['workScope'] as Map<String, dynamic>,
            ),
      createdBy: json['createdBy'] == null
          ? null
          : CreatedByResponseModel.fromJson(
              json['createdBy'] as Map<String, dynamic>,
            ),
      resolvedBy: json['resolvedBy'] == null
          ? null
          : CreatedByResponseModel.fromJson(
              json['resolvedBy'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$WarningModelToJson(_WarningModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'uid': instance.uid,
      'warningType': instance.warningType,
      'dailyReportID': instance.dailyReportID,
      'companyID': instance.companyID,
      'roadID': instance.roadID,
      'workScopeID': instance.workScopeID,
      'contractRelationID': instance.contractRelationID,
      'fromSection': instance.fromSection,
      'toSection': instance.toSection,
      'warningItems': instance.warningItems,
      'dailyReport': instance.dailyReport,
      'requiresAction': instance.requiresAction,
      'isResolved': instance.isResolved,
      'resolvedByID': instance.resolvedByID,
      'resolvedAt': instance.resolvedAt?.toIso8601String(),
      'resolutionNotes': instance.resolutionNotes,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
      'description': instance.description,
      'createdByID': instance.createdByID,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'deletedAt': instance.deletedAt?.toIso8601String(),
      'files': instance.files,
      'company': instance.company,
      'road': instance.road,
      'workScope': instance.workScope,
      'createdBy': instance.createdBy,
      'resolvedBy': instance.resolvedBy,
    };
