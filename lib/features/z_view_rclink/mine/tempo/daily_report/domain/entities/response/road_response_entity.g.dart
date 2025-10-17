// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'road_response_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoadResponse _$RoadResponseFromJson(Map<String, dynamic> json) => RoadResponse(
  name: json['name'] as String?,
  roadNo: json['roadNo'] as String?,
  uid: json['uid'] as String?,
  district: json['district'] == null
      ? null
      : DistrictResponse.fromJson(json['district'] as Map<String, dynamic>),
);

Map<String, dynamic> _$RoadResponseToJson(RoadResponse instance) =>
    <String, dynamic>{
      'name': instance.name,
      'roadNo': instance.roadNo,
      'uid': instance.uid,
      'district': instance.district,
    };
