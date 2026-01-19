// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state_nested_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StateNested _$StateNestedFromJson(Map<String, dynamic> json) => StateNested(
  id: (json['id'] as num?)?.toInt(),
  uid: json['uid'] as String?,
  name: json['name'] as String?,
  code: json['code'] as String?,
  countryID: (json['countryID'] as num?)?.toInt(),
  createdAt: json['createdAt'] as String?,
  updatedAt: json['updatedAt'] as String?,
  country: json['country'] == null
      ? null
      : CountryNested.fromJson(json['country'] as Map<String, dynamic>),
);

Map<String, dynamic> _$StateNestedToJson(StateNested instance) =>
    <String, dynamic>{
      'id': instance.id,
      'uid': instance.uid,
      'name': instance.name,
      'code': instance.code,
      'countryID': instance.countryID,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'country': instance.country,
    };
