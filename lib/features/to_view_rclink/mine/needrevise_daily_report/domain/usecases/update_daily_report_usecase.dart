import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/daily_report_response.dart';
import '../repository/daily_report_repository.dart';

class UpdateDailyReportParams {
  final String companyUID;
  final String dailyReportUID;
  final Map<String, dynamic> updateData;

  UpdateDailyReportParams({
    required this.companyUID,
    required this.dailyReportUID,
    required this.updateData,
  });
}

@lazySingleton
class UpdateDailyReportUseCase
    implements UseCase<DailyReportResponse, UpdateDailyReportParams> {
  final DailyReportRepository _repository;

  UpdateDailyReportUseCase(this._repository);

  @override
  Future<Either<Failure, DailyReportResponse>> call(
    UpdateDailyReportParams params,
  ) async {
    return await _repository.updateDailyReport(
      companyUID: params.companyUID,
      dailyReportUID: params.dailyReportUID,
      updateData: params.updateData,
    );
  }
}
