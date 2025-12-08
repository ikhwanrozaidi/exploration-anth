import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/daily_report.dart';
import '../repository/daily_report_repository.dart';

class ApproveDailyReportParams {
  final String companyUID;
  final String dailyReportUID;
  final String reviewComment;

  ApproveDailyReportParams({
    required this.companyUID,
    required this.dailyReportUID,
    required this.reviewComment,
  });
}

@injectable
class ApproveDailyReportUseCase
    implements UseCase<DailyReport, ApproveDailyReportParams> {
  final DailyReportRepository _repository;

  ApproveDailyReportUseCase(this._repository);

  @override
  Future<Either<Failure, DailyReport>> call(
    ApproveDailyReportParams params,
  ) async {
    return _repository.approveDailyReport(
      companyUID: params.companyUID,
      dailyReportUID: params.dailyReportUID,
      reviewComment: params.reviewComment,
    );
  }
}
