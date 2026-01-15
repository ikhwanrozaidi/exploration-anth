// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quantity_type_nested_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuantityTypeNested _$QuantityTypeNestedFromJson(Map<String, dynamic> json) =>
    QuantityTypeNested(
      id: (json['id'] as num?)?.toInt(),
      uid: json['uid'] as String?,
      name: json['name'] as String?,
      code: json['code'] as String?,
      description: json['description'] as String?,
      workScopeID: (json['workScopeID'] as num?)?.toInt(),
      companyID: (json['companyID'] as num?)?.toInt(),
      displayOrder: (json['displayOrder'] as num?)?.toInt(),
      isActive: json['isActive'] as bool?,
      hasSegmentBreakdown: json['hasSegmentBreakdown'] as bool?,
      segmentSize: (json['segmentSize'] as num?)?.toInt(),
      maxSegmentLength: (json['maxSegmentLength'] as num?)?.toInt(),
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      deletedAt: json['deletedAt'] as String?,
      quantityFields: (json['quantityFields'] as List<dynamic>?)
          ?.map((e) => QuantityFieldNested.fromJson(e as Map<String, dynamic>))
          .toList(),
      programSettingID: (json['programSettingID'] as num?)?.toInt(),
      quantityTypeID: (json['quantityTypeID'] as num?)?.toInt(),
      settingDisplayOrder: (json['settingDisplayOrder'] as num?)?.toInt(),
      isRequiredInSetting: json['isRequiredInSetting'] as bool?,
    );

Map<String, dynamic> _$QuantityTypeNestedToJson(QuantityTypeNested instance) =>
    <String, dynamic>{
      'id': instance.id,
      'uid': instance.uid,
      'name': instance.name,
      'code': instance.code,
      'description': instance.description,
      'workScopeID': instance.workScopeID,
      'companyID': instance.companyID,
      'displayOrder': instance.displayOrder,
      'isActive': instance.isActive,
      'hasSegmentBreakdown': instance.hasSegmentBreakdown,
      'segmentSize': instance.segmentSize,
      'maxSegmentLength': instance.maxSegmentLength,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'deletedAt': instance.deletedAt,
      'quantityFields': instance.quantityFields,
      'programSettingID': instance.programSettingID,
      'quantityTypeID': instance.quantityTypeID,
      'settingDisplayOrder': instance.settingDisplayOrder,
      'isRequiredInSetting': instance.isRequiredInSetting,
    };
