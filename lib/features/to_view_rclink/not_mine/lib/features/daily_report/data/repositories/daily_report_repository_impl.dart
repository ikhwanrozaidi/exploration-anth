import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/repositories/base_sync_repository.dart';
import '../../domain/entities/daily_report.dart';
import '../../domain/repository/daily_report_repository.dart';
import '../datasources/daily_report_local_datasource.dart';
import '../datasources/daily_report_remote_datasource.dart';
import '../models/daily_report_model.dart';

@Injectable(as: DailyReportRepository)
class DailyReportRepositoryImpl
    extends BaseOfflineSyncRepository<List<DailyReport>, List<DailyReportModel>>
    implements DailyReportRepository {
  final DailyReportRemoteDataSource _remoteDataSource;
  final DailyReportLocalDataSource _localDataSource;

  DailyReportRepositoryImpl(this._remoteDataSource, this._localDataSource);

  @override
  Future<Either<Failure, List<DailyReport>>> getDailyReports({
    required String companyUID,
    int page = 1,
    int limit = 10,
    String sortOrder = 'asc',
    bool forceRefresh = false,
    Duration? cacheTimeout = const Duration(hours: 1),
  }) async {
    final remoteResult = await _remoteDataSource.getDailyReports(
      companyUID: companyUID,
      page: page,
      limit: limit,
      sortOrder: sortOrder,
    );

    return remoteResult.fold(
      (failure) {
        return Left(failure);
      },
      (models) async {
        final entities = models.map((model) {
          return model.toEntity();
        }).toList();
        await _localDataSource.cacheDailyReports(entities);

        return Right(entities);
      },
    );
  }

  @override
  Future<Either<Failure, void>> clearCache() async {
    try {
      await _localDataSource.clearCache();
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure('Failed to clear cache: $e'));
    }
  }
}
