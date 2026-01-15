// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'program_settings_filter_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProgramSettingsFilterModel _$ProgramSettingsFilterModelFromJson(
  Map<String, dynamic> json,
) => _ProgramSettingsFilterModel(
  page: (json['page'] as num?)?.toInt() ?? 1,
  limit: (json['limit'] as num?)?.toInt() ?? 10,
  sortOrder: json['sortOrder'] as String?,
  sortBy: json['sortBy'] as String?,
  workScopeUID: json['workScopeUID'] as String?,
  calculationType: json['calculationType'] as String?,
  isActive: json['isActive'] as bool?,
  expand: (json['expand'] as List<dynamic>?)?.map((e) => e as String).toList(),
);

Map<String, dynamic> _$ProgramSettingsFilterModelToJson(
  _ProgramSettingsFilterModel instance,
) => <String, dynamic>{
  'page': instance.page,
  'limit': instance.limit,
  'sortOrder': ?instance.sortOrder,
  'sortBy': ?instance.sortBy,
  'workScopeUID': ?instance.workScopeUID,
  'calculationType': ?instance.calculationType,
  'isActive': ?instance.isActive,
  'expand': ?instance.expand,
};
