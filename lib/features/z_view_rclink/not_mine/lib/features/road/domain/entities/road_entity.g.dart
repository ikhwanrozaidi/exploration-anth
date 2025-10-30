// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'road_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Road _$RoadFromJson(Map<String, dynamic> json) => Road(
  id: (json['id'] as num?)?.toInt(),
  uid: json['uid'] as String?,
  name: json['name'] as String?,
  roadNo: json['roadNo'] as String?,
  sectionStart: (json['sectionStart'] as num?)?.toDouble(),
  sectionFinish: (json['sectionFinish'] as num?)?.toDouble(),
  mainCategoryID: (json['mainCategoryID'] as num?)?.toInt(),
  secondaryCategoryID: (json['secondaryCategoryID'] as num?)?.toInt(),
  districtID: (json['districtID'] as num?)?.toInt(),
  districtUID: json['districtUID'] as String?,
  createdAt: json['createdAt'] as String?,
  updatedAt: json['updatedAt'] as String?,
  district: json['district'] == null
      ? null
      : District.fromJson(json['district'] as Map<String, dynamic>),
  mainCategory: json['mainCategory'] == null
      ? null
      : RoadCategory.fromJson(json['mainCategory'] as Map<String, dynamic>),
  secondaryCategory: json['secondaryCategory'] == null
      ? null
      : RoadCategory.fromJson(
          json['secondaryCategory'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$RoadToJson(Road instance) => <String, dynamic>{
  'id': instance.id,
  'uid': instance.uid,
  'name': instance.name,
  'roadNo': instance.roadNo,
  'sectionStart': instance.sectionStart,
  'sectionFinish': instance.sectionFinish,
  'mainCategoryID': instance.mainCategoryID,
  'secondaryCategoryID': instance.secondaryCategoryID,
  'districtID': instance.districtID,
  'districtUID': instance.districtUID,
  'createdAt': instance.createdAt,
  'updatedAt': instance.updatedAt,
  'district': instance.district,
  'mainCategory': instance.mainCategory,
  'secondaryCategory': instance.secondaryCategory,
};
