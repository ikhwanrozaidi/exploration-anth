// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'district_nested_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DistrictNested _$DistrictNestedFromJson(Map<String, dynamic> json) =>
    DistrictNested(
      id: (json['id'] as num?)?.toInt(),
      uid: json['uid'] as String?,
      name: json['name'] as String?,
      stateID: (json['stateID'] as num?)?.toInt(),
      state: json['state'] == null
          ? null
          : StateNested.fromJson(json['state'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DistrictNestedToJson(DistrictNested instance) =>
    <String, dynamic>{
      'id': instance.id,
      'uid': instance.uid,
      'name': instance.name,
      'stateID': instance.stateID,
      'state': instance.state,
    };
