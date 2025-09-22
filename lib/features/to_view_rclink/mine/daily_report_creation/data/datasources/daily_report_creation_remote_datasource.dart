import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import 'package:rclink_app/features/daily_report_creation/data/datasources/daily_report_creation_api_service.dart';
import 'package:rclink_app/features/daily_report_creation/data/models/scope_of_work_model.dart';
import '../../../../core/errors/failures.dart';

abstract class DailyReportCreationRemoteDataSource {
  Future<Either<Failure, List<ScopeOfWorkModel>>> getWorkScopes(
    String companyUID,
  );
}

@LazySingleton(as: DailyReportCreationRemoteDataSource)
class DailyReportCreationRemoteDataSourceImpl
    implements DailyReportCreationRemoteDataSource {
  final DailyReportCreationApiService _apiService;

  DailyReportCreationRemoteDataSourceImpl(this._apiService);

  @override
  Future<Either<Failure, List<ScopeOfWorkModel>>> getWorkScopes(
    String companyUID,
  ) async {
    try {
      final response = await _apiService.getWorkScopes(
        companyUID: companyUID,
        limit: 0, // Get all
        expand: ['workEquipments', 'workQuantityTypes'], // Always expanded
      );

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
