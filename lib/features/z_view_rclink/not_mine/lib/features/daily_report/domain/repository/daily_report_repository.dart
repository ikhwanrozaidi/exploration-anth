import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/daily_report_response.dart';

abstract class DailyReportRepository {
  Future<Either<Failure, List<DailyReportResponse>>> getDailyReports({
    required String companyUID,
    int page = 1,
    int limit = 10,
    String sortOrder = 'asc',
  });

  Future<Either<Failure, void>> clearCache();
}
