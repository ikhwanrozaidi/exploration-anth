// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'package_data_response_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PackageDataResponse _$PackageDataResponseFromJson(Map<String, dynamic> json) =>
    PackageDataResponse(
      package: json['package'] == null
          ? null
          : Package.fromJson(json['package'] as Map<String, dynamic>),
      countries: (json['countries'] as List<dynamic>?)
          ?.map((e) => Country.fromJson(e as Map<String, dynamic>))
          .toList(),
      states: (json['states'] as List<dynamic>?)
          ?.map((e) => Province.fromJson(e as Map<String, dynamic>))
          .toList(),
      districts: (json['districts'] as List<dynamic>?)
          ?.map((e) => District.fromJson(e as Map<String, dynamic>))
          .toList(),
      roads: (json['roads'] as List<dynamic>?)
          ?.map((e) => Road.fromJson(e as Map<String, dynamic>))
          .toList(),
      packageRoads: (json['packageRoads'] as List<dynamic>?)
          ?.map((e) => PackageRoad.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PackageDataResponseToJson(
  PackageDataResponse instance,
) => <String, dynamic>{
  'package': instance.package,
  'countries': instance.countries,
  'states': instance.states,
  'districts': instance.districts,
  'roads': instance.roads,
  'packageRoads': instance.packageRoads,
};
