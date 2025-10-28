import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/database/app_database.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/sync/models/file_response_dto.dart';
import '../../../../core/sync/sync_constants.dart';
import 'daily_report_api_service.dart';

abstract class DailyReportImageRemoteDataSource {
  /// Upload images for a daily report
  Future<Either<Failure, List<FileResponseDto>>> uploadImagesForReport({
    required String companyUID,
    required String dailyReportUID,
    required List<ImageSyncQueueRecord> images,
  });
}

@LazySingleton(as: DailyReportImageRemoteDataSource)
class DailyReportImageRemoteDataSourceImpl
    implements DailyReportImageRemoteDataSource {
  final DailyReportApiService _apiService;

  DailyReportImageRemoteDataSourceImpl(this._apiService);

  @override
  Future<Either<Failure, List<FileResponseDto>>> uploadImagesForReport({
    required String companyUID,
    required String dailyReportUID,
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

      // Convert to MultipartFiles grouped by context field
      List<MultipartFile>? beforeImages;
      List<MultipartFile>? inprogressImages;
      List<MultipartFile>? afterImages;
      List<MultipartFile>? workersImages;

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

        // Assign to appropriate field
        switch (contextField) {
          case ImageContextField.beforeImage:
            beforeImages = multipartFiles;
            break;
          case ImageContextField.inprogressImage:
            inprogressImages = multipartFiles;
            break;
          case ImageContextField.afterImage:
            afterImages = multipartFiles;
            break;
          case ImageContextField.workersImage:
            workersImages = multipartFiles;
            break;
          case ImageContextField.general:
            // Additional images not supported in daily report endpoint
            print('⚠️ GENERAL images not supported for daily reports');
            break;
        }
      }

      // Call API
      print('📤 Uploading images for report $dailyReportUID:');
      print('  - Before: ${beforeImages?.length ?? 0}');
      print('  - In Progress: ${inprogressImages?.length ?? 0}');
      print('  - After: ${afterImages?.length ?? 0}');
      print('  - Workers: ${workersImages?.length ?? 0}');

      final response = await _apiService.uploadDailyReportFiles(
        companyUID,
        dailyReportUID,
        beforeImages,
        inprogressImages,
        afterImages,
        workersImages,
      );

      if (response.statusCode >= 200 && response.statusCode < 300) {
        final uploadedFiles = response.data ?? [];
        print('✅ Images uploaded successfully: ${uploadedFiles.length} files');
        return Right(uploadedFiles);
      } else {
        print('❌ Image upload failed: ${response.message}');
        return Left(
          ServerFailure(
            response.message ?? 'Image upload failed',
            statusCode: response.statusCode,
          ),
        );
      }
    } on DioException catch (e) {
      print('❌ Network error during image upload: ${e.message}');

      if (e.response?.statusCode == 404) {
        return const Left(NotFoundFailure());
      }
      if (e.response?.statusCode == 401) {
        return const Left(UnauthorizedFailure());
      }

      return Left(NetworkFailure('Network error: ${e.message}'));
    } catch (e) {
      print('❌ Unexpected error during image upload: $e');
      return Left(ServerFailure('Failed to upload images: $e'));
    }
  }
}
