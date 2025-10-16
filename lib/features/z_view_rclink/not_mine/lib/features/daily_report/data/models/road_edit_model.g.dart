// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'road_edit_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RoadEditModel _$RoadEditModelFromJson(Map<String, dynamic> json) =>
    _RoadEditModel(
      id: (json['id'] as num?)?.toInt(),
      uid: json['uid'] as String?,
      name: json['name'] as String?,
      roadNo: json['roadNo'] as String?,
      sectionStart: json['sectionStart'] as String?,
      sectionFinish: json['sectionFinish'] as String?,
      districtId: (json['districtId'] as num?)?.toInt(),
      districtName: json['districtName'] as String?,
    );

Map<String, dynamic> _$RoadEditModelToJson(_RoadEditModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'uid': instance.uid,
      'name': instance.name,
      'roadNo': instance.roadNo,
      'sectionStart': instance.sectionStart,
      'sectionFinish': instance.sectionFinish,
      'districtId': instance.districtId,
      'districtName': instance.districtName,
    };
