import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/daily_report_response_entity.dart';

abstract class DailyReportRepository {
  Future<Either<Failure, DailyReportResponse>> getDailyReports({
    required String companyUID,
    int page = 1,
    int limit = 10,
    String sortOrder = 'asc',
  });

  Future<Either<Failure, void>> clearCache();

  // Future<Either<Failure, DailyReportResponse>> createDailyReport({
  //   required CreateDailyReportModel data,
  //   required String companyUID,
  // });
}
