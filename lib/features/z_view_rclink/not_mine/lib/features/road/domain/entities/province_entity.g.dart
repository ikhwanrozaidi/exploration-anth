// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'province_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Province _$ProvinceFromJson(Map<String, dynamic> json) => Province(
  id: (json['id'] as num?)?.toInt(),
  uid: json['uid'] as String?,
  name: json['name'] as String?,
  countryID: (json['countryID'] as num?)?.toInt(),
  createdAt: json['createdAt'] as String?,
  updatedAt: json['updatedAt'] as String?,
  country: json['country'] == null
      ? null
      : Country.fromJson(json['country'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ProvinceToJson(Province instance) => <String, dynamic>{
  'id': instance.id,
  'uid': instance.uid,
  'name': instance.name,
  'countryID': instance.countryID,
  'createdAt': instance.createdAt,
  'updatedAt': instance.updatedAt,
  'country': instance.country,
};
