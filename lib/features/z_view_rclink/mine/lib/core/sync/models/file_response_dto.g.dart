// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FileResponseDto _$FileResponseDtoFromJson(Map<String, dynamic> json) =>
    _FileResponseDto(
      uid: json['uid'] as String,
      fileName: json['fileName'] as String,
      s3Key: json['s3Key'] as String,
      s3Url: json['s3Url'] as String,
      mimeType: json['mimeType'] as String,
      size: (json['size'] as num).toInt(),
      sequence: (json['sequence'] as num).toInt(),
      contextField: json['contextField'] as String,
    );

Map<String, dynamic> _$FileResponseDtoToJson(_FileResponseDto instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'fileName': instance.fileName,
      's3Key': instance.s3Key,
      's3Url': instance.s3Url,
      'mimeType': instance.mimeType,
      'size': instance.size,
      'sequence': instance.sequence,
      'contextField': instance.contextField,
    };

_BatchFileUploadResponseDto _$BatchFileUploadResponseDtoFromJson(
  Map<String, dynamic> json,
) => _BatchFileUploadResponseDto(
  files: (json['files'] as List<dynamic>)
      .map((e) => FileResponseDto.fromJson(e as Map<String, dynamic>))
      .toList(),
  totalCount: (json['totalCount'] as num).toInt(),
);

Map<String, dynamic> _$BatchFileUploadResponseDtoToJson(
  _BatchFileUploadResponseDto instance,
) => <String, dynamic>{
  'files': instance.files,
  'totalCount': instance.totalCount,
};
