// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'program_setting_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProgramSetting _$ProgramSettingFromJson(Map<String, dynamic> json) =>
    ProgramSetting(
      id: (json['id'] as num?)?.toInt(),
      uid: json['uid'] as String?,
      companyID: (json['companyID'] as num?)?.toInt(),
      workScopeID: (json['workScopeID'] as num?)?.toInt(),
      calculationType: json['calculationType'] as String?,
      inputLabel: json['inputLabel'] as String?,
      inputValue: json['inputValue'] as String?,
      dividerValue: json['dividerValue'] as String?,
      dividerLabel: json['dividerLabel'] as String?,
      unitMeasurement: json['unitMeasurement'] as String?,
      photoRequired: json['photoRequired'] as bool?,
      isActive: json['isActive'] as bool?,
      createdByID: (json['createdByID'] as num?)?.toInt(),
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      deletedAt: json['deletedAt'] as String?,
      workScope: json['workScope'] == null
          ? null
          : WorkScopeNested.fromJson(json['workScope'] as Map<String, dynamic>),
      createdBy: json['createdBy'] == null
          ? null
          : CreatedByNested.fromJson(json['createdBy'] as Map<String, dynamic>),
      quantityTypes: (json['quantityTypes'] as List<dynamic>?)
          ?.map((e) => QuantityTypeNested.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProgramSettingToJson(ProgramSetting instance) =>
    <String, dynamic>{
      'id': instance.id,
      'uid': instance.uid,
      'companyID': instance.companyID,
      'workScopeID': instance.workScopeID,
      'calculationType': instance.calculationType,
      'inputLabel': instance.inputLabel,
      'inputValue': instance.inputValue,
      'dividerValue': instance.dividerValue,
      'dividerLabel': instance.dividerLabel,
      'unitMeasurement': instance.unitMeasurement,
      'photoRequired': instance.photoRequired,
      'isActive': instance.isActive,
      'createdByID': instance.createdByID,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'deletedAt': instance.deletedAt,
      'workScope': instance.workScope,
      'createdBy': instance.createdBy,
      'quantityTypes': instance.quantityTypes,
    };
