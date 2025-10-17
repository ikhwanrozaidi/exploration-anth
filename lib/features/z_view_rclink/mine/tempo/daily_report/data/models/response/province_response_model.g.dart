// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'province_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StateResponseModel _$StateResponseModelFromJson(Map<String, dynamic> json) =>
    _StateResponseModel(
      name: json['name'] as String?,
      uid: json['uid'] as String?,
      country: json['country'] == null
          ? null
          : CountryResponseModel.fromJson(
              json['country'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$StateResponseModelToJson(_StateResponseModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'uid': instance.uid,
      'country': instance.country,
    };
