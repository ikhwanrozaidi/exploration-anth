import 'package:freezed_annotation/freezed_annotation.dart';

part 'file_response_dto.freezed.dart';
part 'file_response_dto.g.dart';

/// Response DTO from backend after successful file upload
/// Maps to backend File model
@freezed
abstract class FileResponseDto with _$FileResponseDto {
  const factory FileResponseDto({
    required String uid,
    required String fileName,
    required String s3Key,
    required String s3Url,
    required String mimeType,
    required int size,
    required int sequence,
    required String contextField, // WORKERS_IMAGE, BEFORE_IMAGE, etc.
  }) = _FileResponseDto;

  factory FileResponseDto.fromJson(Map<String, dynamic> json) =>
      _$FileResponseDtoFromJson(json);
}

/// Batch upload response containing multiple uploaded files
@freezed
abstract class BatchFileUploadResponseDto with _$BatchFileUploadResponseDto {
  const factory BatchFileUploadResponseDto({
    required List<FileResponseDto> files,
    required int totalCount,
  }) = _BatchFileUploadResponseDto;

  factory BatchFileUploadResponseDto.fromJson(Map<String, dynamic> json) =>
      _$BatchFileUploadResponseDtoFromJson(json);
}
