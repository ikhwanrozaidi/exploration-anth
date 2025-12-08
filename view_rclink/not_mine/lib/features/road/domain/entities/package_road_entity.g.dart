// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'package_road_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PackageRoad _$PackageRoadFromJson(Map<String, dynamic> json) => PackageRoad(
  uid: json['uid'] as String?,
  roadUID: json['roadUID'] as String?,
  sectionStart: (json['sectionStart'] as num?)?.toDouble(),
  sectionFinish: (json['sectionFinish'] as num?)?.toDouble(),
);

Map<String, dynamic> _$PackageRoadToJson(PackageRoad instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'roadUID': instance.roadUID,
      'sectionStart': instance.sectionStart,
      'sectionFinish': instance.sectionFinish,
    };
