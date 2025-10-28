import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/sync/sync_constants.dart';
import '../../../daily_report/data/models/create_daily_report_model.dart';
import '../../../daily_report/domain/entities/daily_report.dart';
import '../../../daily_report/domain/repository/daily_report_repository.dart';
import '../../data/mapper/report_data_to_create_model_mapper.dart';
import '../../presentation/bloc/daily_report_create/daily_report_create_state.dart';

@injectable
class SubmitDailyReportUseCase {
  final DailyReportRepository _repository;

  SubmitDailyReportUseCase(this._repository);

  Future<Either<Failure, DailyReport>> call({
    required ReportData reportData,
    required String companyUID,
    String? adminUID,
  }) async {
    try {
      // Transform ReportData to CreateDailyReportModel
      final createModel = ReportDataToCreateModelMapper.fromReportData(
        reportData,
      );

      // Extract images from selections (conditionSnapshots and workerImages)
      print('📷 Condition snapshots keys: ${reportData.selections.conditionSnapshots.keys.toList()}');
      print('📷 Worker images count: ${reportData.selections.workerImages.length}');

      final images = _extractImagesFromSelections(reportData.selections);

      print('📷 Extracted images: ${images?.keys.map((k) => '${k.value}: ${images[k]?.length}').join(', ') ?? 'none'}');
      print('📷 Admin UID for images: $adminUID');

      // Call repository to create report with images
      return await _repository.createDailyReport(
        data: createModel,
        companyUID: companyUID,
        images: images,
        adminUID: adminUID,
      );
    } catch (e) {
      return Left(
        CacheFailure('Failed to submit daily report: ${e.toString()}'),
      );
    }
  }

  /// Extract images from selections (conditionSnapshots and workerImages)
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

    // Extract worker images
    if (selections.workerImages.isNotEmpty) {
      final workerPaths = selections.workerImages
          .map((image) => image['path'] as String?)
          .where((path) => path != null)
          .cast<String>()
          .toList();

      if (workerPaths.isNotEmpty) {
        result[ImageContextField.workersImage] = workerPaths;
      }
    }

    return result.isEmpty ? null : result;
  }
}
