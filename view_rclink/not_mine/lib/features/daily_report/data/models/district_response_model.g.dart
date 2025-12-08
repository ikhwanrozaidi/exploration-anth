// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'district_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DistrictResponseModel _$DistrictResponseModelFromJson(
  Map<String, dynamic> json,
) => _DistrictResponseModel(
  name: json['name'] as String,
  uid: json['uid'] as String,
  state: json['state'] == null
      ? null
      : StateResponseModel.fromJson(json['state'] as Map<String, dynamic>),
);

Map<String, dynamic> _$DistrictResponseModelToJson(
  _DistrictResponseModel instance,
) => <String, dynamic>{
  'name': instance.name,
  'uid': instance.uid,
  'state': instance.state,
};

_StateResponseModel _$StateResponseModelFromJson(Map<String, dynamic> json) =>
    _StateResponseModel(
      name: json['name'] as String,
      uid: json['uid'] as String,
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

_CountryResponseModel _$CountryResponseModelFromJson(
  Map<String, dynamic> json,
) => _CountryResponseModel(
  name: json['name'] as String,
  uid: json['uid'] as String,
);

Map<String, dynamic> _$CountryResponseModelToJson(
  _CountryResponseModel instance,
) => <String, dynamic>{'name': instance.name, 'uid': instance.uid};
