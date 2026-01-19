// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'district_nested_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DistrictNestedModel _$DistrictNestedModelFromJson(Map<String, dynamic> json) =>
    _DistrictNestedModel(
      id: (json['id'] as num?)?.toInt(),
      uid: json['uid'] as String?,
      name: json['name'] as String?,
      stateID: (json['stateID'] as num?)?.toInt(),
      state: json['state'] == null
          ? null
          : StateNestedModel.fromJson(json['state'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DistrictNestedModelToJson(
  _DistrictNestedModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'uid': instance.uid,
  'name': instance.name,
  'stateID': instance.stateID,
  'state': instance.state,
};
