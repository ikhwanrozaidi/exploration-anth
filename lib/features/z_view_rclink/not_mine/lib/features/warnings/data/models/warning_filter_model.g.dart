// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'warning_filter_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WarningFilterModel _$WarningFilterModelFromJson(Map<String, dynamic> json) =>
    _WarningFilterModel(
      warningType: (json['warningType'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      roadID: json['roadID'] as String?,
      workScopeID: json['workScopeID'] as String?,
      contractRelationID: json['contractRelationID'] as String?,
      dailyReportID: json['dailyReportID'] as String?,
      isResolved: json['isResolved'] as bool?,
      requiresAction: json['requiresAction'] as bool?,
    );

Map<String, dynamic> _$WarningFilterModelToJson(_WarningFilterModel instance) =>
    <String, dynamic>{
      'warningType': ?instance.warningType,
      'roadID': ?instance.roadID,
      'workScopeID': ?instance.workScopeID,
      'contractRelationID': ?instance.contractRelationID,
      'dailyReportID': ?instance.dailyReportID,
      'isResolved': ?instance.isResolved,
      'requiresAction': ?instance.requiresAction,
    };
