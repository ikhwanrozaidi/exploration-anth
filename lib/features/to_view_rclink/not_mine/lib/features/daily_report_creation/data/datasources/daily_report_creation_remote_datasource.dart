import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import 'package:rclink_app/features/daily_report_creation/data/datasources/daily_report_creation_api_service.dart';
import 'package:rclink_app/features/daily_report_creation/data/models/scope_of_work_model.dart';
import '../../../../core/errors/failures.dart';

abstract class DailyReportCreationRemoteDataSource {
  Future<Either<Failure, List<ScopeOfWorkModel>>> getCompleteScopeOfWork();
}

@LazySingleton(as: DailyReportCreationRemoteDataSource)
class DailyReportCreationRemoteDataSourceImpl
    implements DailyReportCreationRemoteDataSource {
  final DailyReportCreationApiService _apiService;

  DailyReportCreationRemoteDataSourceImpl(this._apiService);

  @override
  Future<Either<Failure, List<ScopeOfWorkModel>>>
  getCompleteScopeOfWork() async {
    try {
      final response = await _apiService.getScopeOfWWork();

      if (response.isSuccess && response.data != null) {
        return Right(response.data!);
      } else {
        return Left(
          ServerFailure(response.message, statusCode: response.statusCode),
        );
      }
    } catch (e) {
      return Left(ServerFailure('Unexpected error: ${e.toString()}'));
    }
  }
}
