// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'province_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProvinceEntity _$ProvinceEntityFromJson(Map<String, dynamic> json) =>
    ProvinceEntity(
      id: (json['id'] as num?)?.toInt(),
      uid: json['uid'] as String?,
      name: json['name'] as String?,
      countryId: (json['countryId'] as num?)?.toInt(),
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      country: json['country'] == null
          ? null
          : CountryEntity.fromJson(json['country'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProvinceEntityToJson(ProvinceEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'uid': instance.uid,
      'name': instance.name,
      'countryId': instance.countryId,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'country': instance.country,
    };
