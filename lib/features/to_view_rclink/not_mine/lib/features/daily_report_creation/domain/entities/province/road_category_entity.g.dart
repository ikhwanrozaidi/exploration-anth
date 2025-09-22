// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'road_category_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoadCategoryEntity _$RoadCategoryEntityFromJson(Map<String, dynamic> json) =>
    RoadCategoryEntity(
      id: (json['id'] as num?)?.toInt(),
      uid: json['uid'] as String?,
      name: json['name'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$RoadCategoryEntityToJson(RoadCategoryEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'uid': instance.uid,
      'name': instance.name,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
