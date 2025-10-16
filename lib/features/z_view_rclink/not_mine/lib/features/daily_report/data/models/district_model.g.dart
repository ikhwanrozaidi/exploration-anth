// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'district_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DistrictModel _$DistrictModelFromJson(Map<String, dynamic> json) =>
    _DistrictModel(
      name: json['name'] as String,
      uid: json['uid'] as String,
      state: json['state'] == null
          ? null
          : StateModel.fromJson(json['state'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DistrictModelToJson(_DistrictModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'uid': instance.uid,
      'state': instance.state,
    };

_StateModel _$StateModelFromJson(Map<String, dynamic> json) => _StateModel(
  name: json['name'] as String,
  uid: json['uid'] as String,
  country: json['country'] == null
      ? null
      : CountryModel.fromJson(json['country'] as Map<String, dynamic>),
);

Map<String, dynamic> _$StateModelToJson(_StateModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'uid': instance.uid,
      'country': instance.country,
    };

_CountryModel _$CountryModelFromJson(Map<String, dynamic> json) =>
    _CountryModel(name: json['name'] as String, uid: json['uid'] as String);

Map<String, dynamic> _$CountryModelToJson(_CountryModel instance) =>
    <String, dynamic>{'name': instance.name, 'uid': instance.uid};
