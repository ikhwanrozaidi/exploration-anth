// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'road_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RoadModel _$RoadModelFromJson(Map<String, dynamic> json) => _RoadModel(
  name: json['name'] as String,
  roadNo: json['roadNo'] as String,
  uid: json['uid'] as String,
  district: json['district'] == null
      ? null
      : DistrictModel.fromJson(json['district'] as Map<String, dynamic>),
);

Map<String, dynamic> _$RoadModelToJson(_RoadModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'roadNo': instance.roadNo,
      'uid': instance.uid,
      'district': instance.district,
    };
