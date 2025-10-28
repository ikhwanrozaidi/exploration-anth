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
      stateUID: json['stateUID'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
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
      'stateUID': instance.stateUID,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'state': instance.state,
    };
