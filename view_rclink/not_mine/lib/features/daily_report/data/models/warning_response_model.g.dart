// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'warning_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WarningResponseModel _$WarningResponseModelFromJson(
  Map<String, dynamic> json,
) => _WarningResponseModel(
  id: (json['id'] as num).toInt(),
  uid: json['uid'] as String,
  warningItems:
      (json['warningItems'] as List<dynamic>?)
          ?.map((e) => WarningItemModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  createdBy: CreatedByResponseModel.fromJson(
    json['createdBy'] as Map<String, dynamic>,
  ),
  description: json['description'] as String?,
  longitude: json['longitude'] as String?,
  latitude: json['latitude'] as String?,
  fromSection: json['fromSection'] as String?,
  toSection: json['toSection'] as String?,
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$WarningResponseModelToJson(
  _WarningResponseModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'uid': instance.uid,
  'warningItems': instance.warningItems,
  'createdBy': instance.createdBy,
  'description': instance.description,
  'longitude': instance.longitude,
  'latitude': instance.latitude,
  'fromSection': instance.fromSection,
  'toSection': instance.toSection,
  'createdAt': instance.createdAt.toIso8601String(),
  'updatedAt': instance.updatedAt.toIso8601String(),
};
