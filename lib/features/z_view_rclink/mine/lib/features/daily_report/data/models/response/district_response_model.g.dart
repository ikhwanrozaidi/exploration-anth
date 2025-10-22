// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'district_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DistrictResponseModel _$DistrictResponseModelFromJson(
  Map<String, dynamic> json,
) => _DistrictResponseModel(
  name: json['name'] as String?,
  uid: json['uid'] as String?,
  state: json['state'] == null
      ? null
      : StateResponseModel.fromJson(json['state'] as Map<String, dynamic>),
);

Map<String, dynamic> _$DistrictResponseModelToJson(
  _DistrictResponseModel instance,
) => <String, dynamic>{
  'name': instance.name,
  'uid': instance.uid,
  'state': instance.state,
};
