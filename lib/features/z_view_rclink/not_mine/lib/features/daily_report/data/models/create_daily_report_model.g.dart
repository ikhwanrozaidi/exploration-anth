// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_daily_report_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CreateDailyReportModel _$CreateDailyReportModelFromJson(
  Map<String, dynamic> json,
) => _CreateDailyReportModel(
  name: json['name'] as String,
  notes: json['notes'] as String?,
  weatherCondition: $enumDecode(
    _$WeatherConditionEnumMap,
    json['weatherCondition'],
  ),
  workPerformed: json['workPerformed'] as bool,
  workScopeUID: json['workScopeUID'] as String,
  roadUID: json['roadUID'] as String,
  totalWorkers: (json['totalWorkers'] as num?)?.toInt(),
  fromSection: (json['fromSection'] as num?)?.toDouble(),
  toSection: (json['toSection'] as num?)?.toDouble(),
  longitude: (json['longitude'] as num?)?.toDouble(),
  latitude: (json['latitude'] as num?)?.toDouble(),
  equipments: (json['equipments'] as List<dynamic>?)
      ?.map(
        (e) =>
            CreateDailyReportEquipmentModel.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  quantities: (json['quantities'] as List<dynamic>?)
      ?.map(
        (e) =>
            CreateDailyReportQuantityModel.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$CreateDailyReportModelToJson(
  _CreateDailyReportModel instance,
) => <String, dynamic>{
  'name': instance.name,
  'notes': instance.notes,
  'weatherCondition': _$WeatherConditionEnumMap[instance.weatherCondition]!,
  'workPerformed': instance.workPerformed,
  'workScopeUID': instance.workScopeUID,
  'roadUID': instance.roadUID,
  'totalWorkers': instance.totalWorkers,
  'fromSection': instance.fromSection,
  'toSection': instance.toSection,
  'longitude': instance.longitude,
  'latitude': instance.latitude,
  'equipments': instance.equipments,
  'quantities': instance.quantities,
};

const _$WeatherConditionEnumMap = {
  WeatherCondition.sunny: 'SUNNY',
  WeatherCondition.rainy: 'RAINY',
  WeatherCondition.cloudy: 'CLOUDY',
  WeatherCondition.foggy: 'FOGGY',
  WeatherCondition.windy: 'WINDY',
};
