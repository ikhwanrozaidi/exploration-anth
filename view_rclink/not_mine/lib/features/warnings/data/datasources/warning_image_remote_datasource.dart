// lib/features/warnings/data/datasources/warning_image_remote_datasource.dart

import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/database/app_database.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/sync/models/file_response_dto.dart';
import '../../../../core/sync/sync_constants.dart';
import 'warnings_api_service.dart';

abstract class WarningImageRemoteDataSource {
  /// Upload images for a warning
  Future<Either<Failure, List<FileResponseDto>>> uploadImagesForWarning({
    required String companyUID,
    required String warningUID,
    required List<ImageSyncQueueRecord> images,
  });
}

@LazySingleton(as: WarningImageRemoteDataSource)
class WarningImageRemoteDataSourceImpl implements WarningImageRemoteDataSource {
  final WarningsApiService _apiService;

  WarningImageRemoteDataSourceImpl(this._apiService);

  @override
  Future<Either<Failure, List<FileResponseDto>>> uploadImagesForWarning({
    required String companyUID,
    required String warningUID,
    required List<ImageSyncQueueRecord> images,
  }) async {
    try {
      // Group images by contextField
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

      // Convert to MultipartFiles - WARNING_IMAGE only
      List<MultipartFile>? warningImages;

      // CRITICAL FIX: Track missing images to report to user
      final List<String> missingImagePaths = [];
      final Map<ImageContextField, int> missingByContext = {};

      for (final entry in groupedImages.entries) {
        final contextField = entry.key;
        final imageRecords = entry.value;

        // Sort by sequence to maintain order
        imageRecords.sort((a, b) => a.sequence.compareTo(b.sequence));

        final multipartFiles = <MultipartFile>[];
        for (final record in imageRecords) {
          final file = File(record.localFilePath);
          if (!await file.exists()) {
            print('⚠️ Image file not found: ${record.localFilePath}');
            // CRITICAL FIX: Track missing images instead of silently skipping
            missingImagePaths.add(record.localFilePath);
            missingByContext[contextField] =
                (missingByContext[contextField] ?? 0) + 1;
            continue;
          }

          // Parse MIME type for multipart upload
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

        // Assign to WARNING_IMAGE field (only one type for warnings)
        switch (contextField) {
          case ImageContextField.general:
            warningImages = multipartFiles;
            break;
          default:
            print(
              '⚠️ Unsupported context field for warnings: ${contextField.value}',
            );
            break;
        }
      }

      // CRITICAL FIX: Report missing images to user instead of silent skip
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

      // Call API
      print('📤 Uploading images for warning $warningUID:');
      print('  - Warning Images: ${warningImages?.length ?? 0}');

      final response = await _apiService.uploadWarningFiles(
        companyUID,
        warningUID,
        warningImages,
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
