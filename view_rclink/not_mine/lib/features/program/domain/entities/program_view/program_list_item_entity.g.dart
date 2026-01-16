// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'program_list_item_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProgramListItem _$ProgramListItemFromJson(Map<String, dynamic> json) =>
    ProgramListItem(
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
          : WorkScopeNested.fromJson(json['workScope'] as Map<String, dynamic>),
      road: json['road'] == null
          ? null
          : Road.fromJson(json['road'] as Map<String, dynamic>),
      contractRelation: json['contractRelation'] == null
          ? null
          : ContractorRelation.fromJson(
              json['contractRelation'] as Map<String, dynamic>,
            ),
      createdBy: json['createdBy'] == null
          ? null
          : CreatedByNested.fromJson(json['createdBy'] as Map<String, dynamic>),
      count: json['count'] == null
          ? null
          : ProgramCount.fromJson(json['count'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProgramListItemToJson(ProgramListItem instance) =>
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
      'workScope': instance.workScope?.toJson(),
      'road': instance.road?.toJson(),
      'contractRelation': instance.contractRelation?.toJson(),
      'createdBy': instance.createdBy?.toJson(),
      'count': instance.count?.toJson(),
    };

ProgramCount _$ProgramCountFromJson(Map<String, dynamic> json) =>
    ProgramCount(dailyReports: (json['dailyReports'] as num?)?.toInt());

Map<String, dynamic> _$ProgramCountToJson(ProgramCount instance) =>
    <String, dynamic>{'dailyReports': instance.dailyReports};
