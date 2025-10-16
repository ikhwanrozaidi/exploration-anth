import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../../../../../../../to_view_rclink/not_mine/lib/features/needrevise_daily_report/data/models/create_daily_report_model.dart';
import '../../../../../../../to_view_rclink/not_mine/lib/features/needrevise_daily_report/domain/entities/daily_report_response.dart';
import '../../../../../../../to_view_rclink/not_mine/lib/features/needrevise_daily_report/domain/repository/daily_report_repository.dart';
import '../../data/mapper/report_data_to_create_model_mapper.dart';
import '../../presentation/bloc/report_creation_state.dart';

@injectable
class SubmitDailyReportUseCase {
  final DailyReportRepository _repository;

  SubmitDailyReportUseCase(this._repository);

  Future<Either<Failure, DailyReportResponse>> call({
    required ReportData reportData,
    required String companyUID,
  }) async {
    try {
      // Transform ReportData to CreateDailyReportModel
      final createModel = ReportDataToCreateModelMapper.fromReportData(
        reportData,
      );

      // Call repository to create report
      return await _repository.createDailyReport(
        data: createModel,
        companyUID: companyUID,
      );
    } catch (e) {
      return Left(
        CacheFailure('Failed to submit daily report: ${e.toString()}'),
      );
    }
  }
}
