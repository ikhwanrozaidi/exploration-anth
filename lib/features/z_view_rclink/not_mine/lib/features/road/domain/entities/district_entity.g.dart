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
  state: json['state'] == null
      ? null
      : Province.fromJson(json['state'] as Map<String, dynamic>),
);

Map<String, dynamic> _$DistrictToJson(District instance) => <String, dynamic>{
  'id': instance.id,
  'uid': instance.uid,
  'name': instance.name,
  'stateID': instance.stateID,
  'state': instance.state,
};
