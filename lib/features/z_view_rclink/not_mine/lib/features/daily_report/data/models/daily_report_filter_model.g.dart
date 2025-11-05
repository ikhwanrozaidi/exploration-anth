// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_report_filter_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DailyReportFilterModel _$DailyReportFilterModelFromJson(
  Map<String, dynamic> json,
) => _DailyReportFilterModel(
  page: (json['page'] as num?)?.toInt() ?? 1,
  limit: (json['limit'] as num?)?.toInt() ?? 10,
  status: json['status'] as String?,
  workScopeUID: json['workScopeUID'] as String?,
  roadUID: json['roadUID'] as String?,
  createdByID: (json['createdByID'] as num?)?.toInt(),
  startDate: json['startDate'] == null
      ? null
      : DateTime.parse(json['startDate'] as String),
  endDate: json['endDate'] == null
      ? null
      : DateTime.parse(json['endDate'] as String),
  search: json['search'] as String?,
  contractorRelationUID: json['contractorRelationUID'] as String?,
  sortBy: json['sortBy'] as String?,
  sortOrder: json['sortOrder'] as String?,
  expand: (json['expand'] as List<dynamic>?)?.map((e) => e as String).toList(),
);

Map<String, dynamic> _$DailyReportFilterModelToJson(
  _DailyReportFilterModel instance,
) => <String, dynamic>{
  'page': instance.page,
  'limit': instance.limit,
  'status': ?instance.status,
  'workScopeUID': ?instance.workScopeUID,
  'roadUID': ?instance.roadUID,
  'createdByID': ?instance.createdByID,
  'startDate': ?instance.startDate?.toIso8601String(),
  'endDate': ?instance.endDate?.toIso8601String(),
  'search': ?instance.search,
  'contractorRelationUID': ?instance.contractorRelationUID,
  'sortBy': ?instance.sortBy,
  'sortOrder': ?instance.sortOrder,
  'expand': ?instance.expand,
};
