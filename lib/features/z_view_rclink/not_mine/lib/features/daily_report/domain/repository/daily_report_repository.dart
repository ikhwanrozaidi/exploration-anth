import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../data/models/create_daily_report_model.dart';
import '../entities/daily_report.dart';

abstract class DailyReportRepository {
  Future<Either<Failure, List<DailyReport>>> getDailyReports({
    required String companyUID,
    int page = 1,
    int limit = 10,
    String sortOrder = 'asc',
  });

  Future<Either<Failure, DailyReport>> createDailyReport({
    required CreateDailyReportModel data,
    required String companyUID,
  });

  Future<Either<Failure, void>> clearCache();
}
