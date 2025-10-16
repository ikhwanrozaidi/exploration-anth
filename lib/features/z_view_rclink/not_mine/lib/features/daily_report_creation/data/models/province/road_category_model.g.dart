// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'road_category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RoadCategoryModel _$RoadCategoryModelFromJson(Map<String, dynamic> json) =>
    _RoadCategoryModel(
      id: (json['id'] as num?)?.toInt(),
      uid: json['uid'] as String?,
      name: json['name'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$RoadCategoryModelToJson(_RoadCategoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'uid': instance.uid,
      'name': instance.name,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
