// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'district_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DistrictEntity _$DistrictEntityFromJson(Map<String, dynamic> json) =>
    DistrictEntity(
      id: (json['id'] as num?)?.toInt(),
      uid: json['uid'] as String?,
      name: json['name'] as String?,
      stateId: (json['stateId'] as num?)?.toInt(),
      state: json['state'] == null
          ? null
          : ProvinceEntity.fromJson(json['state'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DistrictEntityToJson(DistrictEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'uid': instance.uid,
      'name': instance.name,
      'stateId': instance.stateId,
      'state': instance.state,
    };
