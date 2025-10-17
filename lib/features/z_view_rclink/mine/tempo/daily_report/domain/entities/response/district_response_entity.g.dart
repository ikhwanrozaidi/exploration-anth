// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'district_response_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DistrictResponse _$DistrictResponseFromJson(Map<String, dynamic> json) =>
    DistrictResponse(
      name: json['name'] as String?,
      uid: json['uid'] as String?,
      state: json['state'] == null
          ? null
          : StateResponse.fromJson(json['state'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DistrictResponseToJson(DistrictResponse instance) =>
    <String, dynamic>{
      'name': instance.name,
      'uid': instance.uid,
      'state': instance.state,
    };
