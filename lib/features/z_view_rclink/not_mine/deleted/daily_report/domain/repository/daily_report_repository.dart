import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../data/models/create_daily_report_model.dart';
import '../entities/daily_report_response.dart';

abstract class DailyReportRepository {
  Future<Either<Failure, List<DailyReportResponse>>> getDailyReports({
    required String companyUID,
    int page = 1,
    int limit = 10,
    String sortOrder = 'asc',
  });

  Future<Either<Failure, DailyReportResponse>> createDailyReport({
    required CreateDailyReportModel data,
    required String companyUID,
  });

  Future<Either<Failure, void>> clearCache();
}
