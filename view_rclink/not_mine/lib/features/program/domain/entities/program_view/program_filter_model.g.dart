// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'program_filter_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProgramFilterModel _$ProgramFilterModelFromJson(Map<String, dynamic> json) =>
    _ProgramFilterModel(
      page: (json['page'] as num?)?.toInt() ?? 1,
      limit: (json['limit'] as num?)?.toInt() ?? 10,
      search: json['search'] as String?,
      status: json['status'] as String?,
      workScopeUID: json['workScopeUID'] as String?,
      roadUID: json['roadUID'] as String?,
      contractRelationUID: json['contractRelationUID'] as String?,
      fromDate: json['fromDate'] as String?,
      toDate: json['toDate'] as String?,
      expand:
          (json['expand'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$ProgramFilterModelToJson(_ProgramFilterModel instance) =>
    <String, dynamic>{
      'page': instance.page,
      'limit': instance.limit,
      'search': ?instance.search,
      'status': ?instance.status,
      'workScopeUID': ?instance.workScopeUID,
      'roadUID': ?instance.roadUID,
      'contractRelationUID': ?instance.contractRelationUID,
      'fromDate': ?instance.fromDate,
      'toDate': ?instance.toDate,
      'expand': instance.expand,
    };
