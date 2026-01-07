// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_warning_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CreateWarningModel _$CreateWarningModelFromJson(Map<String, dynamic> json) =>
    _CreateWarningModel(
      roadUID: json['roadUID'] as String,
      workScopeUID: json['workScopeUID'] as String,
      fromSection: (json['fromSection'] as num?)?.toDouble(),
      toSection: (json['toSection'] as num?)?.toDouble(),
      contractRelationUID: json['contractRelationUID'] as String?,
      warningReasonUIDs: (json['warningReasonUIDs'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      description: json['description'] as String?,
      longitude: (json['longitude'] as num?)?.toDouble(),
      latitude: (json['latitude'] as num?)?.toDouble(),
      requiresAction: json['requiresAction'] as bool?,
    );

Map<String, dynamic> _$CreateWarningModelToJson(_CreateWarningModel instance) =>
    <String, dynamic>{
      'roadUID': instance.roadUID,
      'workScopeUID': instance.workScopeUID,
      'fromSection': instance.fromSection,
      'toSection': instance.toSection,
      'contractRelationUID': ?instance.contractRelationUID,
      'warningReasonUIDs': instance.warningReasonUIDs,
      'description': instance.description,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
      'requiresAction': instance.requiresAction,
    };
