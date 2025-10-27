import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/database/app_database.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/repositories/base_sync_repository.dart';
import '../../../../core/sync/sync_constants.dart';
import '../../domain/entities/daily_report.dart';
import '../../domain/repository/daily_report_repository.dart';
import '../datasources/daily_report_local_datasource.dart';
import '../datasources/daily_report_remote_datasource.dart';
import '../models/create_daily_report_model.dart';
import '../models/daily_report_model.dart';

@Injectable(as: DailyReportRepository)
class DailyReportRepositoryImpl
    extends BaseOfflineSyncRepository<List<DailyReport>, List<DailyReportModel>>
    implements DailyReportRepository {
  final DailyReportRemoteDataSource _remoteDataSource;
  final DailyReportLocalDataSource _localDataSource;

  DailyReportRepositoryImpl(
    this._remoteDataSource,
    this._localDataSource,
    DatabaseService databaseService,
  ) : super(databaseService: databaseService);

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
        await _localDataSource.cacheDailyReports(models);

        return Right(models.map((model) => model.toEntity()).toList());
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

  @override
  Future<Either<Failure, DailyReport>> createDailyReport({
    required CreateDailyReportModel data,
    required String companyUID,
  }) async {
    try {
      // Use base class executeOptimistic with automatic SyncQueue fallback
      return await executeOptimistic<DailyReport, DailyReportModel>(
        local: () async {
          // Step 1: Create locally with temp UID (inside callback)
          final localReport = await _localDataSource.createDailyReportLocal(
            data,
            companyUID,
          );
          return localReport.toEntity();
        },
        remote: () => _remoteDataSource.createDailyReport(
          data: data,
          companyUID: companyUID,
        ),
        onSyncSuccess: (serverModel, tempUID) async {
          // Update local DB with server data (replaces temp UID with server UID)
          await _localDataSource.updateReportWithServerData(
            tempUID, // Temp UID automatically extracted and provided by base class
            serverModel,
          );
        },
        entityType: SyncEntityType.dailyReport,
        action: SyncAction.create,
        payload: {...data.toJson(), 'companyUID': companyUID},
        priority: 10,
      );
    } catch (e) {
      return Left(CacheFailure('Failed to create report locally: $e'));
    }
  }
}
