// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FileModel _$FileModelFromJson(Map<String, dynamic> json) => _FileModel(
  id: (json['id'] as num).toInt(),
  uid: json['uid'] as String,
  fileName: json['fileName'] as String,
  s3Url: json['s3Url'] as String,
  mimeType: json['mimeType'] as String,
  size: (json['size'] as num).toInt(),
  sequence: (json['sequence'] as num?)?.toInt(),
  companyID: (json['companyID'] as num).toInt(),
  contextType: json['contextType'] as String,
  contextField: json['contextField'] as String?,
  uploadedByID: (json['uploadedByID'] as num).toInt(),
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
  isSynced: json['isSynced'] as bool? ?? false,
  deletedAt: json['deletedAt'] == null
      ? null
      : DateTime.parse(json['deletedAt'] as String),
  syncAction: json['syncAction'] as String?,
  syncRetryCount: (json['syncRetryCount'] as num?)?.toInt() ?? 0,
  syncError: json['syncError'] as String?,
  lastSyncAttempt: json['lastSyncAttempt'] == null
      ? null
      : DateTime.parse(json['lastSyncAttempt'] as String),
);

Map<String, dynamic> _$FileModelToJson(_FileModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'uid': instance.uid,
      'fileName': instance.fileName,
      's3Url': instance.s3Url,
      'mimeType': instance.mimeType,
      'size': instance.size,
      'sequence': instance.sequence,
      'companyID': instance.companyID,
      'contextType': instance.contextType,
      'contextField': instance.contextField,
      'uploadedByID': instance.uploadedByID,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'isSynced': instance.isSynced,
      'deletedAt': instance.deletedAt?.toIso8601String(),
      'syncAction': instance.syncAction,
      'syncRetryCount': instance.syncRetryCount,
      'syncError': instance.syncError,
      'lastSyncAttempt': instance.lastSyncAttempt?.toIso8601String(),
    };
