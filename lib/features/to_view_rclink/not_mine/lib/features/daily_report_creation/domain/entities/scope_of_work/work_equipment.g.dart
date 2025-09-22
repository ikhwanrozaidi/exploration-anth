// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_equipment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkEquipment _$WorkEquipmentFromJson(Map<String, dynamic> json) =>
    WorkEquipment(
      id: (json['id'] as num).toInt(),
      uid: json['uid'] as String,
      name: json['name'] as String,
      code: json['code'] as String,
    );

Map<String, dynamic> _$WorkEquipmentToJson(WorkEquipment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'uid': instance.uid,
      'name': instance.name,
      'code': instance.code,
    };
