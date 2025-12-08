// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'warning_category_with_reasons_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WarningCategoryWithReasonsModel _$WarningCategoryWithReasonsModelFromJson(
  Map<String, dynamic> json,
) => _WarningCategoryWithReasonsModel(
  id: (json['id'] as num).toInt(),
  uid: json['uid'] as String,
  name: json['name'] as String,
  warningType: json['warningType'] as String,
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
  reasons:
      (json['reasons'] as List<dynamic>?)
          ?.map(
            (e) => WarningReasonWithWorkScopeModel.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList() ??
      const [],
);

Map<String, dynamic> _$WarningCategoryWithReasonsModelToJson(
  _WarningCategoryWithReasonsModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'uid': instance.uid,
  'name': instance.name,
  'warningType': instance.warningType,
  'createdAt': instance.createdAt?.toIso8601String(),
  'updatedAt': instance.updatedAt?.toIso8601String(),
  'reasons': instance.reasons,
};
