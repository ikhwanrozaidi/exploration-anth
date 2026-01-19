// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'road_nested_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoadNested _$RoadNestedFromJson(Map<String, dynamic> json) => RoadNested(
  id: (json['id'] as num?)?.toInt(),
  uid: json['uid'] as String?,
  name: json['name'] as String?,
  roadNo: json['roadNo'] as String?,
  sectionStart: json['sectionStart'] as String?,
  sectionFinish: json['sectionFinish'] as String?,
  mainCategoryID: (json['mainCategoryID'] as num?)?.toInt(),
  secondaryCategoryID: (json['secondaryCategoryID'] as num?)?.toInt(),
  districtID: (json['districtID'] as num?)?.toInt(),
  createdAt: json['createdAt'] as String?,
  updatedAt: json['updatedAt'] as String?,
  district: json['district'] == null
      ? null
      : DistrictNested.fromJson(json['district'] as Map<String, dynamic>),
);

Map<String, dynamic> _$RoadNestedToJson(RoadNested instance) =>
    <String, dynamic>{
      'id': instance.id,
      'uid': instance.uid,
      'name': instance.name,
      'roadNo': instance.roadNo,
      'sectionStart': instance.sectionStart,
      'sectionFinish': instance.sectionFinish,
      'mainCategoryID': instance.mainCategoryID,
      'secondaryCategoryID': instance.secondaryCategoryID,
      'districtID': instance.districtID,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'district': instance.district,
    };
