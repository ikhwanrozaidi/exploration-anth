// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'program_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Program _$ProgramFromJson(Map<String, dynamic> json) => Program(
  id: (json['id'] as num).toInt(),
  uid: json['uid'] as String,
  name: json['name'] as String?,
  description: json['description'] as String?,
  companyID: (json['companyID'] as num?)?.toInt(),
  workScopeID: (json['workScopeID'] as num?)?.toInt(),
  roadID: (json['roadID'] as num?)?.toInt(),
  periodStart: json['periodStart'] as String?,
  periodEnd: json['periodEnd'] as String?,
  contractRelationID: (json['contractRelationID'] as num?)?.toInt(),
  requiredReportsCount: (json['requiredReportsCount'] as num?)?.toInt(),
  calculationType: json['calculationType'] as String?,
  fromSection: json['fromSection'] as String?,
  toSection: json['toSection'] as String?,
  dividerValue: json['dividerValue'] as String?,
  inputValue: (json['inputValue'] as num?)?.toInt(),
  longitude: json['longitude'] as String?,
  latitude: json['latitude'] as String?,
  status: json['status'] as String?,
  totalReports: (json['totalReports'] as num?)?.toInt(),
  createdByID: (json['createdByID'] as num?)?.toInt(),
  createdAt: json['createdAt'] as String?,
  updatedAt: json['updatedAt'] as String?,
  deletedAt: json['deletedAt'] as String?,
  workScope: json['workScope'] == null
      ? null
      : WorkScopeNested.fromJson(json['workScope'] as Map<String, dynamic>),
  road: json['road'] == null
      ? null
      : RoadNested.fromJson(json['road'] as Map<String, dynamic>),
  contractRelation: json['contractRelation'] == null
      ? null
      : ContractRelationNested.fromJson(
          json['contractRelation'] as Map<String, dynamic>,
        ),
  createdBy: json['createdBy'] == null
      ? null
      : CreatedByNested.fromJson(json['createdBy'] as Map<String, dynamic>),
  quantities: (json['quantities'] as List<dynamic>?)
      ?.map((e) => ProgramQuantity.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$ProgramToJson(Program instance) => <String, dynamic>{
  'id': instance.id,
  'uid': instance.uid,
  'name': instance.name,
  'description': instance.description,
  'companyID': instance.companyID,
  'workScopeID': instance.workScopeID,
  'contractRelationID': instance.contractRelationID,
  'status': instance.status,
  'totalReports': instance.totalReports,
  'createdAt': instance.createdAt,
  'updatedAt': instance.updatedAt,
  'deletedAt': instance.deletedAt,
  'roadID': instance.roadID,
  'periodStart': instance.periodStart,
  'periodEnd': instance.periodEnd,
  'requiredReportsCount': instance.requiredReportsCount,
  'calculationType': instance.calculationType,
  'fromSection': instance.fromSection,
  'toSection': instance.toSection,
  'dividerValue': instance.dividerValue,
  'inputValue': instance.inputValue,
  'longitude': instance.longitude,
  'latitude': instance.latitude,
  'createdByID': instance.createdByID,
  'workScope': instance.workScope?.toJson(),
  'road': instance.road?.toJson(),
  'contractRelation': instance.contractRelation?.toJson(),
  'createdBy': instance.createdBy?.toJson(),
  'quantities': instance.quantities?.map((e) => e.toJson()).toList(),
};
