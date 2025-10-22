// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_report_response_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DailyReportResponse _$DailyReportResponseFromJson(
  Map<String, dynamic> json,
) => DailyReportResponse(
  id: (json['id'] as num?)?.toInt(),
  uid: json['uid'] as String?,
  name: json['name'] as String?,
  notes: json['notes'] as String?,
  weatherCondition: json['weatherCondition'] as String?,
  workPerformed: json['workPerformed'] as bool?,
  companyID: (json['companyID'] as num?)?.toInt(),
  status: json['status'] as String?,
  contractRelationID: (json['contractRelationID'] as num?)?.toInt(),
  approvedByID: (json['approvedByID'] as num?)?.toInt(),
  approvedAt: json['approvedAt'] == null
      ? null
      : DateTime.parse(json['approvedAt'] as String),
  rejectionReason: json['rejectionReason'] as String?,
  workScopeID: (json['workScopeID'] as num?)?.toInt(),
  roadID: (json['roadID'] as num?)?.toInt(),
  totalWorkers: (json['totalWorkers'] as num?)?.toInt(),
  fromSection: json['fromSection'] as String?,
  toSection: json['toSection'] as String?,
  longitude: json['longitude'] as String?,
  latitude: json['latitude'] as String?,
  createdByID: (json['createdByID'] as num?)?.toInt(),
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
  deletedAt: json['deletedAt'] == null
      ? null
      : DateTime.parse(json['deletedAt'] as String),
  workScope: json['workScope'] == null
      ? null
      : WorkScopeResponse.fromJson(json['workScope'] as Map<String, dynamic>),
  road: json['road'] == null
      ? null
      : RoadResponse.fromJson(json['road'] as Map<String, dynamic>),
  equipments: (json['equipments'] as List<dynamic>?)
      ?.map((e) => EquipmentResponse.fromJson(e as Map<String, dynamic>))
      .toList(),
  reportQuantities: (json['reportQuantities'] as List<dynamic>?)
      ?.map((e) => ReportQuantityResponse.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$DailyReportResponseToJson(
  DailyReportResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'uid': instance.uid,
  'name': instance.name,
  'notes': instance.notes,
  'weatherCondition': instance.weatherCondition,
  'workPerformed': instance.workPerformed,
  'companyID': instance.companyID,
  'status': instance.status,
  'contractRelationID': instance.contractRelationID,
  'approvedByID': instance.approvedByID,
  'approvedAt': instance.approvedAt?.toIso8601String(),
  'rejectionReason': instance.rejectionReason,
  'workScopeID': instance.workScopeID,
  'roadID': instance.roadID,
  'totalWorkers': instance.totalWorkers,
  'fromSection': instance.fromSection,
  'toSection': instance.toSection,
  'longitude': instance.longitude,
  'latitude': instance.latitude,
  'createdByID': instance.createdByID,
  'createdAt': instance.createdAt?.toIso8601String(),
  'updatedAt': instance.updatedAt?.toIso8601String(),
  'deletedAt': instance.deletedAt?.toIso8601String(),
  'workScope': instance.workScope,
  'road': instance.road,
  'equipments': instance.equipments,
  'reportQuantities': instance.reportQuantities,
};
