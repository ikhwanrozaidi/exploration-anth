// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'road_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoadEntity _$RoadEntityFromJson(Map<String, dynamic> json) => RoadEntity(
  id: (json['id'] as num?)?.toInt(),
  uid: json['uid'] as String?,
  name: json['name'] as String?,
  roadNo: json['roadNo'] as String?,
  sectionStart: json['sectionStart'] as String?,
  sectionFinish: json['sectionFinish'] as String?,
  mainCategoryId: (json['mainCategoryId'] as num?)?.toInt(),
  secondaryCategoryId: (json['secondaryCategoryId'] as num?)?.toInt(),
  districtId: (json['districtId'] as num?)?.toInt(),
  createdAt: json['createdAt'] as String?,
  updatedAt: json['updatedAt'] as String?,
  district: json['district'] == null
      ? null
      : DistrictEntity.fromJson(json['district'] as Map<String, dynamic>),
  mainCategory: json['mainCategory'] == null
      ? null
      : RoadCategoryEntity.fromJson(
          json['mainCategory'] as Map<String, dynamic>,
        ),
  secondaryCategory: json['secondaryCategory'] == null
      ? null
      : RoadCategoryEntity.fromJson(
          json['secondaryCategory'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$RoadEntityToJson(RoadEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'uid': instance.uid,
      'name': instance.name,
      'roadNo': instance.roadNo,
      'sectionStart': instance.sectionStart,
      'sectionFinish': instance.sectionFinish,
      'mainCategoryId': instance.mainCategoryId,
      'secondaryCategoryId': instance.secondaryCategoryId,
      'districtId': instance.districtId,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'district': instance.district,
      'mainCategory': instance.mainCategory,
      'secondaryCategory': instance.secondaryCategory,
    };
