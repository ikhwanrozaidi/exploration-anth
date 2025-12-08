// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'warning_reason_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WarningReasonModel _$WarningReasonModelFromJson(Map<String, dynamic> json) =>
    _WarningReasonModel(
      id: (json['id'] as num).toInt(),
      uid: json['uid'] as String,
      name: json['name'] as String,
      warningType: json['warningType'] as String,
      categoryID: (json['categoryID'] as num).toInt(),
      workScopeID: (json['workScopeID'] as num).toInt(),
      requiresAction: json['requiresAction'] as bool? ?? true,
      isActive: json['isActive'] as bool? ?? true,
      displayOrder: (json['displayOrder'] as num?)?.toInt() ?? 0,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      category: json['category'] == null
          ? null
          : WarningCategoryModel.fromJson(
              json['category'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$WarningReasonModelToJson(_WarningReasonModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'uid': instance.uid,
      'name': instance.name,
      'warningType': instance.warningType,
      'categoryID': instance.categoryID,
      'workScopeID': instance.workScopeID,
      'requiresAction': instance.requiresAction,
      'isActive': instance.isActive,
      'displayOrder': instance.displayOrder,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'category': instance.category,
    };
