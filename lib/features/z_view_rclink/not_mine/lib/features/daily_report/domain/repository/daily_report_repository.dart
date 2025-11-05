import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/sync/sync_constants.dart';
import '../../data/models/create_daily_report_model.dart';
import '../../data/models/update_daily_report_model.dart';
import '../entities/daily_report.dart';

abstract class DailyReportRepository {
  Future<Either<Failure, List<DailyReport>>> getDailyReports({
    required String companyUID,
    int page = 1,
    int limit = 10,
    String sortOrder = 'asc',
    String? search,
    String? roadUid,
    String? workScopeUid,
    String? contractorUid,
  });

  Future<Either<Failure, DailyReport>> getDailyReportById({
    required String companyUID,
    required String dailyReportUID,
    bool forceRefresh = false,
  });

  Future<Either<Failure, DailyReport>> createDailyReport({
    required CreateDailyReportModel data,
    required String companyUID,
    Map<ImageContextField, List<String>>? images,
    String? adminUID,
  });

  Future<Either<Failure, DailyReport>> updateDailyReport({
    required String companyUID,
    required String dailyReportUID,
    required UpdateDailyReportModel data,
    Map<ImageContextField, List<String>>? images,
  });

  Future<Either<Failure, void>> clearCache();
}
