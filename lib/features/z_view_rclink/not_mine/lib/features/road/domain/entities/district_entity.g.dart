// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'district_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

District _$DistrictFromJson(Map<String, dynamic> json) => District(
  id: (json['id'] as num?)?.toInt(),
  uid: json['uid'] as String?,
  name: json['name'] as String?,
  stateID: (json['stateID'] as num?)?.toInt(),
  stateUID: json['stateUID'] as String?,
  createdAt: json['createdAt'] as String?,
  updatedAt: json['updatedAt'] as String?,
  state: json['state'] == null
      ? null
      : Province.fromJson(json['state'] as Map<String, dynamic>),
);

Map<String, dynamic> _$DistrictToJson(District instance) => <String, dynamic>{
  'id': instance.id,
  'uid': instance.uid,
  'name': instance.name,
  'stateID': instance.stateID,
  'stateUID': instance.stateUID,
  'createdAt': instance.createdAt,
  'updatedAt': instance.updatedAt,
  'state': instance.state,
};
