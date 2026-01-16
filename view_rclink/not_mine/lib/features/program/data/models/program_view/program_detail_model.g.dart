// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'program_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProgramDetailModel _$ProgramDetailModelFromJson(Map<String, dynamic> json) =>
    _ProgramDetailModel(
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
      longitude: (json['longitude'] as num?)?.toDouble(),
      latitude: (json['latitude'] as num?)?.toDouble(),
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
          : RoadModel.fromJson(json['road'] as Map<String, dynamic>),
      contractRelation: json['contractRelation'] == null
          ? null
          : ContractorRelationModel.fromJson(
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
      count: json['_count'] == null
          ? null
          : ProgramCountModel.fromJson(json['_count'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProgramDetailModelToJson(_ProgramDetailModel instance) =>
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
      '_count': instance.count,
    };
