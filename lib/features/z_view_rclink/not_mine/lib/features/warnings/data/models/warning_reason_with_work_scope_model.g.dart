// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'warning_reason_with_work_scope_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WarningReasonWithWorkScopeModel _$WarningReasonWithWorkScopeModelFromJson(
  Map<String, dynamic> json,
) => _WarningReasonWithWorkScopeModel(
  id: (json['id'] as num).toInt(),
  uid: json['uid'] as String,
  name: json['name'] as String,
  warningType: json['warningType'] as String,
  categoryID: (json['categoryID'] as num).toInt(),
  workScopeID: (json['workScopeID'] as num).toInt(),
  requiresAction: json['requiresAction'] as bool? ?? true,
  isActive: json['isActive'] as bool? ?? true,
  displayOrder: (json['displayOrder'] as num?)?.toInt() ?? 0,
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
  workScope: json['workScope'] == null
      ? null
      : WorkScopeResponseModel.fromJson(
          json['workScope'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$WarningReasonWithWorkScopeModelToJson(
  _WarningReasonWithWorkScopeModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'uid': instance.uid,
  'name': instance.name,
  'warningType': instance.warningType,
  'categoryID': instance.categoryID,
  'workScopeID': instance.workScopeID,
  'requiresAction': instance.requiresAction,
  'isActive': instance.isActive,
  'displayOrder': instance.displayOrder,
  'createdAt': instance.createdAt?.toIso8601String(),
  'updatedAt': instance.updatedAt?.toIso8601String(),
  'workScope': instance.workScope,
};
