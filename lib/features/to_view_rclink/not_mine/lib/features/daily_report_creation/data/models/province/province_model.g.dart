// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'province_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProvinceModel _$ProvinceModelFromJson(Map<String, dynamic> json) =>
    _ProvinceModel(
      id: (json['id'] as num?)?.toInt(),
      uid: json['uid'] as String?,
      name: json['name'] as String?,
      countryId: (json['countryID'] as num?)?.toInt(),
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      country: json['country'] == null
          ? null
          : CountryModel.fromJson(json['country'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProvinceModelToJson(_ProvinceModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'uid': instance.uid,
      'name': instance.name,
      'countryID': instance.countryId,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'country': instance.country,
    };
