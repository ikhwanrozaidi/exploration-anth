// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_nested_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CountryNested _$CountryNestedFromJson(Map<String, dynamic> json) =>
    CountryNested(
      id: (json['id'] as num?)?.toInt(),
      uid: json['uid'] as String?,
      name: json['name'] as String?,
      code: json['code'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$CountryNestedToJson(CountryNested instance) =>
    <String, dynamic>{
      'id': instance.id,
      'uid': instance.uid,
      'name': instance.name,
      'code': instance.code,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
