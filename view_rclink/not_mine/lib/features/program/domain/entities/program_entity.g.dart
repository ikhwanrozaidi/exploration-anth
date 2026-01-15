// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'program_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Program _$ProgramFromJson(Map<String, dynamic> json) => Program(
  id: (json['id'] as num?)?.toInt(),
  uid: json['uid'] as String?,
  name: json['name'] as String?,
  description: json['description'] as String?,
  companyID: (json['companyID'] as num?)?.toInt(),
  workScopeID: (json['workScopeID'] as num?)?.toInt(),
  contractRelationID: (json['contractRelationID'] as num?)?.toInt(),
  status: json['status'] as String?,
  totalReports: (json['totalReports'] as num?)?.toInt(),
  createdAt: json['createdAt'] as String?,
  updatedAt: json['updatedAt'] as String?,
  deletedAt: json['deletedAt'] as String?,
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
};
