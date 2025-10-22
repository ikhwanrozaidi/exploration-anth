// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'district_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DistrictModel _$DistrictModelFromJson(Map<String, dynamic> json) =>
    _DistrictModel(
      id: (json['id'] as num?)?.toInt(),
      uid: json['uid'] as String?,
      name: json['name'] as String?,
      stateID: (json['stateID'] as num?)?.toInt(),
      state: json['state'] == null
          ? null
          : ProvinceModel.fromJson(json['state'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DistrictModelToJson(_DistrictModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'uid': instance.uid,
      'name': instance.name,
      'stateID': instance.stateID,
      'state': instance.state,
    };
