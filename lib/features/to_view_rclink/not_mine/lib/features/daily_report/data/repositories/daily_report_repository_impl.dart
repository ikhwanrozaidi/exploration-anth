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
    print('📦 Repository: getDailyReports called');
    print('📦 Repository: companyUID = $companyUID');
    print('📦 Repository: forceRefresh = $forceRefresh');

    final result = await getOfflineFirst(
      getLocal: () async {
        print('💾 Repository: Attempting to get from local cache...');
        final reports = await _localDataSource.getCachedDailyReports(
          companyUID,
        );
        print(
          '💾 Repository: Local cache returned ${reports?.length ?? 0} reports',
        );
        return reports;
      },
      getRemote: () async {
        print('🌐 Repository: Attempting to get from remote...');
        final result = await _remoteDataSource.getDailyReports(
          companyUID: companyUID,
          page: page,
          limit: limit,
          sortOrder: sortOrder,
        );
        result.fold(
          (failure) => print('❌ Repository: Remote fetch failed - $failure'),
          (reports) => print(
            '✅ Repository: Remote fetch success - ${reports.length} reports',
          ),
        );
        return result;
      },
      saveLocal: (reports, {bool markForSync = false}) async {
        print(
          '💾 Repository: Saving ${reports.length} reports to local cache...',
        );
        await _localDataSource.cacheDailyReports(reports);
        print('✅ Repository: Saved to local cache');
      },
      toEntity: (models) {
        print(
          '🔄 Repository: Converting ${models.length} models to entities...',
        );
        final entities = models.map((model) => model.toEntity()).toList();
        print('✅ Repository: Conversion complete');
        return entities;
      },
      forceRefresh: forceRefresh,
      cacheTimeout: cacheTimeout,
    );

    result.fold(
      (failure) => print('❌ Repository: Final result - Failure: $failure'),
      (reports) => print(
        '✅ Repository: Final result - Success: ${reports.length} reports',
      ),
    );

    return result;
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
