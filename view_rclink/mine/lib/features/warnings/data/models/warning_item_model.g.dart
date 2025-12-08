// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'warning_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WarningItemModel _$WarningItemModelFromJson(Map<String, dynamic> json) =>
    _WarningItemModel(
      id: (json['id'] as num).toInt(),
      uid: json['uid'] as String,
      warningID: (json['warningID'] as num).toInt(),
      warningReasonID: (json['warningReasonID'] as num).toInt(),
      notes: json['notes'] as String?,
      isCompleted: json['isCompleted'] as bool? ?? false,
      completedAt: json['completedAt'] == null
          ? null
          : DateTime.parse(json['completedAt'] as String),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      warningReason: json['warningReason'] == null
          ? null
          : WarningReasonModel.fromJson(
              json['warningReason'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$WarningItemModelToJson(_WarningItemModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'uid': instance.uid,
      'warningID': instance.warningID,
      'warningReasonID': instance.warningReasonID,
      'notes': instance.notes,
      'isCompleted': instance.isCompleted,
      'completedAt': instance.completedAt?.toIso8601String(),
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'warningReason': instance.warningReason,
    };
