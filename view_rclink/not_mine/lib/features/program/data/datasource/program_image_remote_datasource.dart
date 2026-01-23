import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/database/app_database.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/sync/models/file_response_dto.dart';
import '../../../../core/sync/sync_constants.dart';
import 'program_api_service.dart';

abstract class ProgramImageRemoteDataSource {
  Future<Either<Failure, List<FileResponseDto>>> uploadImagesForProgram({
    required String companyUID,
    required String programUID,
    required List<ImageSyncQueueRecord> images,
  });
}

@LazySingleton(as: ProgramImageRemoteDataSource)
class ProgramImageRemoteDataSourceImpl implements ProgramImageRemoteDataSource {
  final ProgramApiService _apiService;

  ProgramImageRemoteDataSourceImpl(this._apiService);

  @override
  Future<Either<Failure, List<FileResponseDto>>> uploadImagesForProgram({
    required String companyUID,
    required String programUID,
    required List<ImageSyncQueueRecord> images,
  }) async {
    try {
      final Map<ImageContextField, List<ImageSyncQueueRecord>> groupedImages =
          {};

      for (final image in images) {
        try {
          final contextField = ImageContextField.fromString(image.contextField);
          groupedImages.putIfAbsent(contextField, () => []).add(image);
        } catch (e) {
          print('⚠️ Unknown context field: ${image.contextField}');
          continue;
        }
      }

      List<MultipartFile>? programImages;

      final List<String> missingImagePaths = [];
      final Map<ImageContextField, int> missingByContext = {};

      for (final entry in groupedImages.entries) {
        final contextField = entry.key;
        final imageRecords = entry.value;

        imageRecords.sort((a, b) => a.sequence.compareTo(b.sequence));

        final multipartFiles = <MultipartFile>[];
        for (final record in imageRecords) {
          final file = File(record.localFilePath);
          if (!await file.exists()) {
            print('⚠️ Image file not found: ${record.localFilePath}');

            missingImagePaths.add(record.localFilePath);
            missingByContext[contextField] =
                (missingByContext[contextField] ?? 0) + 1;
            continue;
          }

          final contentType = MediaType.parse(record.mimeType);

          print('📎 Adding file: ${record.fileName} (${record.mimeType})');

          multipartFiles.add(
            await MultipartFile.fromFile(
              record.localFilePath,
              filename: record.fileName,
              contentType: contentType,
            ),
          );
        }

        switch (contextField) {
          case ImageContextField.general:
            programImages = multipartFiles;
            break;
          default:
            print(
              '⚠️ Unsupported context field for programs: ${contextField.value}',
            );
            break;
        }
      }

      if (missingImagePaths.isNotEmpty) {
        final contextDetails = missingByContext.entries
            .map((e) => '${e.key.value}: ${e.value}')
            .join(', ');

        print(
          '❌ Missing ${missingImagePaths.length} image(s): $contextDetails',
        );
        print('   Missing paths: ${missingImagePaths.join(", ")}');

        return Left(
          ServerFailure(
            '${missingImagePaths.length} image(s) not found on device. '
            'Missing: $contextDetails. '
            'Please retake the photos and try again.',
          ),
        );
      }

      print('📤 Uploading images for program $programUID:');
      print('  - Program Images: ${programImages?.length ?? 0}');

      final response = await _apiService.uploadProgramFiles(
        companyUID,
        programUID,
        programImages,
      );

      if (response.statusCode >= 200 && response.statusCode < 300) {
        final uploadedFiles = response.data ?? [];
        print('✅ Images uploaded successfully: ${uploadedFiles.length} files');
        return Right(uploadedFiles);
      } else {
        print('❌ Image upload failed: ${response.message}');
        return Left(
          ServerFailure(
            response.message ?? 'Failed to upload images',
            statusCode: response.statusCode,
          ),
        );
      }
    } catch (e) {
      print('❌ Exception during image upload: $e');
      return Left(ServerFailure('Image upload failed: ${e.toString()}'));
    }
  }
}
