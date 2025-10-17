// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'province_response_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StateResponse _$StateResponseFromJson(Map<String, dynamic> json) =>
    StateResponse(
      name: json['name'] as String?,
      uid: json['uid'] as String?,
      country: json['country'] == null
          ? null
          : CountryResponse.fromJson(json['country'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$StateResponseToJson(StateResponse instance) =>
    <String, dynamic>{
      'name': instance.name,
      'uid': instance.uid,
      'country': instance.country,
    };
