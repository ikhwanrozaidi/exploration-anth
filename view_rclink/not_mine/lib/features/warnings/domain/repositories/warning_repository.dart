import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../data/models/create_report_warning_model.dart';
import '../../data/models/create_warning_model.dart';
import '../entities/warning.dart';

abstract class WarningRepository {
  /// Get warnings list with filters
  Future<Either<Failure, List<Warning>>> getWarnings({
    required String companyUID,
    int page = 1,
    int limit = 50,
    String sortOrder = 'desc',
    List<String>? warningType,
    String? roadUID,
    String? workScopeUID,
    String? contractRelationUID,
    String? dailyReportUID,
    bool? isResolved,
    bool? requiresAction,
  });

  /// Get single warning by UID
  Future<Either<Failure, Warning>> getWarningById({
    required String companyUID,
    required String uid,
    bool forceRefresh = false,
  });

  // /// Create a warning from a daily report
  // Future<Either<Failure, Warning>> createReportWarning({
  //   required String companyUID,
  //   required String dailyReportUID,
  //   required List<String> warningReasonUIDs,
  //   String? description,
  // });

  /// Resolve a warning item
  Future<Either<Failure, Warning>> resolveWarningItem({
    required String companyUID,
    required String warningUID,
    required String itemUID,
    String? notes,
  });

  Future<Either<Failure, List<Warning>?>> getDraftWarnings(String companyUID);

  /// Clear cache
  Future<Either<Failure, void>> clearCache();

  /// Create warning from site inspection with offline support
  Future<Either<Failure, Warning>> createSiteWarning({
    required CreateWarningModel data,
    required String companyUID,
  });
}
