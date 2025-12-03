// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_scope_equipment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WorkScopeEquipmentModel _$WorkScopeEquipmentModelFromJson(
  Map<String, dynamic> json,
) => _WorkScopeEquipmentModel(
  id: (json['id'] as num).toInt(),
  workScopeID: (json['workScopeID'] as num).toInt(),
  workEquipmentID: (json['workEquipmentID'] as num).toInt(),
  companyID: (json['companyID'] as num).toInt(),
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
  workEquipment: WorkEquipmentModel.fromJson(
    json['workEquipment'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$WorkScopeEquipmentModelToJson(
  _WorkScopeEquipmentModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'workScopeID': instance.workScopeID,
  'workEquipmentID': instance.workEquipmentID,
  'companyID': instance.companyID,
  'createdAt': instance.createdAt.toIso8601String(),
  'updatedAt': instance.updatedAt.toIso8601String(),
  'workEquipment': instance.workEquipment,
};
