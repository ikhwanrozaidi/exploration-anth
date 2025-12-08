// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_equipment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WorkEquipmentModel _$WorkEquipmentModelFromJson(Map<String, dynamic> json) =>
    _WorkEquipmentModel(
      id: (json['id'] as num).toInt(),
      uid: json['uid'] as String,
      name: json['name'] as String,
      code: json['code'] as String,
    );

Map<String, dynamic> _$WorkEquipmentModelToJson(_WorkEquipmentModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'uid': instance.uid,
      'name': instance.name,
      'code': instance.code,
    };
