// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_program_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProgramResponseModel _$ProgramResponseModelFromJson(
  Map<String, dynamic> json,
) => _ProgramResponseModel(
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
  dividerValue: (json['dividerValue'] as num?)?.toInt(),
  inputValue: (json['inputValue'] as num?)?.toInt(),
  status: json['status'] as String?,
  createdByID: (json['createdByID'] as num?)?.toInt(),
  createdAt: json['createdAt'] as String?,
  updatedAt: json['updatedAt'] as String?,
  deletedAt: json['deletedAt'] as String?,
);

Map<String, dynamic> _$ProgramResponseModelToJson(
  _ProgramResponseModel instance,
) => <String, dynamic>{
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
  'status': instance.status,
  'createdByID': instance.createdByID,
  'createdAt': instance.createdAt,
  'updatedAt': instance.updatedAt,
  'deletedAt': instance.deletedAt,
};
