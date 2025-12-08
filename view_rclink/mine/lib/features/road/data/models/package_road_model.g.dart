// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'package_road_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PackageRoadModel _$PackageRoadModelFromJson(Map<String, dynamic> json) =>
    _PackageRoadModel(
      uid: json['uid'] as String?,
      roadUID: json['roadUID'] as String?,
      sectionStart: (json['sectionStart'] as num?)?.toDouble(),
      sectionFinish: (json['sectionFinish'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$PackageRoadModelToJson(_PackageRoadModel instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'roadUID': instance.roadUID,
      'sectionStart': instance.sectionStart,
      'sectionFinish': instance.sectionFinish,
    };
