// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'package_data_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PackageDataResponseModel _$PackageDataResponseModelFromJson(
  Map<String, dynamic> json,
) => _PackageDataResponseModel(
  package: json['package'] == null
      ? null
      : PackageModel.fromJson(json['package'] as Map<String, dynamic>),
  countries: (json['countries'] as List<dynamic>?)
      ?.map((e) => CountryModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  states: (json['states'] as List<dynamic>?)
      ?.map((e) => ProvinceModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  districts: (json['districts'] as List<dynamic>?)
      ?.map((e) => DistrictModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  roads: (json['roads'] as List<dynamic>?)
      ?.map((e) => RoadModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  packageRoads: (json['packageRoads'] as List<dynamic>?)
      ?.map((e) => PackageRoadModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$PackageDataResponseModelToJson(
  _PackageDataResponseModel instance,
) => <String, dynamic>{
  'package': instance.package,
  'countries': instance.countries,
  'states': instance.states,
  'districts': instance.districts,
  'roads': instance.roads,
  'packageRoads': instance.packageRoads,
};
