// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CountryLocationModel _$CountryLocationModelFromJson(
  Map<String, dynamic> json,
) => _CountryLocationModel(
  id: (json['id'] as num?)?.toInt(),
  uid: json['uid'] as String?,
  name: json['name'] as String?,
  createdAt: json['createdAt'] as String?,
  updatedAt: json['updatedAt'] as String?,
);

Map<String, dynamic> _$CountryLocationModelToJson(
  _CountryLocationModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'uid': instance.uid,
  'name': instance.name,
  'createdAt': instance.createdAt,
  'updatedAt': instance.updatedAt,
};
