import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/sync/sync_constants.dart';
import '../entities/daily_report.dart';
import '../repository/daily_report_repository.dart';
import '../../data/mapper/report_data_to_update_model_mapper.dart';
import '../../presentation/bloc/daily_report_create/daily_report_create_state.dart';

@injectable
class UpdateDailyReportUseCase {
  final DailyReportRepository _repository;

  UpdateDailyReportUseCase(this._repository);

  Future<Either<Failure, DailyReport>> call({
    required String dailyReportUID,
    required ReportData reportData,
    required String companyUID,
  }) async {
    try {
      // Transform ReportData to UpdateDailyReportModel
      final updateModel = ReportDataToUpdateModelMapper.fromReportData(
        reportData,
        existingReportUID: dailyReportUID,
      );

      // Extract images from selections (condition snapshots and workerImages)
      print(
        '📷 [UPDATE] Condition snapshots keys: ${reportData.selections.conditionSnapshots.keys.toList()}',
      );
      print(
        '📷 [UPDATE] Worker images count: ${reportData.selections.workerImages.length}',
      );

      final images = _extractImagesFromSelections(reportData.selections);

      print(
        '📷 [UPDATE] Extracted images: ${images?.keys.map((k) => '${k.value}: ${images[k]?.length}').join(', ') ?? 'none'}',
      );

      // Call repository to update report with images
      return await _repository.updateDailyReport(
        companyUID: companyUID,
        dailyReportUID: dailyReportUID,
        data: updateModel,
        images: images,
      );
    } catch (e) {
      return Left(
        CacheFailure('Failed to update daily report: ${e.toString()}'),
      );
    }
  }

  /// Extract images from selections (condition snapshots, worker image, additional images, and quantity field images)
  static Map<ImageContextField, List<String>>? _extractImagesFromSelections(
    ReportSelections selections,
  ) {
    final result = <ImageContextField, List<String>>{};

    // Extract condition snapshots (before, current, after images)
    for (final entry in selections.conditionSnapshots.entries) {
      final key = entry.key;
      final snapshots = entry.value;

      // Extract image paths from snapshots
      final imagePaths = snapshots
          .map((snapshot) => snapshot['path'] as String?)
          .where((path) => path != null)
          .cast<String>()
          .toList();

      if (imagePaths.isNotEmpty) {
        // Map keys to ImageContextField
        switch (key.toLowerCase()) {
          case 'before':
            result[ImageContextField.beforeImage] = imagePaths;
            break;
          case 'current':
          case 'inprogress':
          case 'in-progress':
            result[ImageContextField.inprogressImage] = imagePaths;
            break;
          case 'after':
            result[ImageContextField.afterImage] = imagePaths;
            break;
        }
      }
    }

    // Extract worker image (single image from workerImage field)
    if (selections.workerImage != null) {
      final workerPath = selections.workerImage!['path'] as String?;
      if (workerPath != null) {
        result[ImageContextField.workersImage] = [workerPath];
      }
    }

    // Extract additional images
    if (selections.additionalImages.isNotEmpty) {
      final additionalPaths = selections.additionalImages
          .map((image) => image['path'] as String?)
          .where((path) => path != null)
          .cast<String>()
          .toList();

      if (additionalPaths.isNotEmpty) {
        // Add to appropriate field or create new context
        // For now, add to a general additional images field
        // TODO: Determine correct ImageContextField for additional images
        // result[ImageContextField.additionalImage] = additionalPaths;
      }
    }

    // Extract quantity field images
    for (final entry in selections.quantityFieldData.entries) {
      final quantityTypeData = entry.value;

      // Find all image fields (keys ending with '_images')
      for (final fieldEntry in quantityTypeData.entries) {
        if (fieldEntry.key.endsWith('_images')) {
          final images = fieldEntry.value as List<dynamic>?;
          if (images != null && images.isNotEmpty) {
            final imagePaths = images
                .map((path) => path.toString())
                .where((path) => path.isNotEmpty)
                .toList();

            if (imagePaths.isNotEmpty) {
              // TODO: Determine correct ImageContextField for quantity images
              // For now, these might need to be associated with the quantity itself
              // result[ImageContextField.quantityImage] = imagePaths;
            }
          }
        }
      }
    }

    return result.isEmpty ? null : result;
  }
}
