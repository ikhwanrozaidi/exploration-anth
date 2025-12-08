// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'road_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RoadResponseModel _$RoadResponseModelFromJson(Map<String, dynamic> json) =>
    _RoadResponseModel(
      uid: json['uid'] as String,
      name: json['name'] as String,
      roadNo: json['roadNo'] as String?,
      district: json['district'] == null
          ? null
          : DistrictResponseModel.fromJson(
              json['district'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$RoadResponseModelToJson(_RoadResponseModel instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
      'roadNo': instance.roadNo,
      'district': instance.district,
    };
