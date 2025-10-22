import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/database/app_database.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/repositories/base_sync_repository.dart';
import '../../domain/entities/daily_report.dart';
import '../../domain/repository/daily_report_repository.dart';
import '../datasources/daily_report_local_datasource.dart';
import '../datasources/daily_report_remote_datasource.dart';
import '../models/create_daily_report_model.dart';
import '../models/daily_report_model.dart';

@Injectable(as: DailyReportRepository)
class DailyReportRepositoryImpl
    extends
        BaseOfflineSyncRepository<
          List<DailyReport>,
          List<DailyReportModel>
        >
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

  @override
  Future<Either<Failure, DailyReport>> createDailyReport({
    required CreateDailyReportModel data,
    required String companyUID,
  }) async {
    try {
      // Step 1: Create locally first with temp UID (optimistic)
      final localReport = await _localDataSource.createDailyReportLocal(
        data,
        companyUID,
      );

      final tempUID = localReport.uid;

      // Step 2: Attempt immediate sync with SyncQueue fallback
      _attemptSyncWithQueue(
        tempUID: tempUID,
        data: data,
        companyUID: companyUID,
      );

      // Step 3: Return success immediately (optimistic)
      return Right(localReport);
    } catch (e) {
      return Left(CacheFailure('Failed to create report locally: $e'));
    }
  }

  /// Attempt sync with automatic SyncQueue fallback
  /// Uses base repository SyncQueue methods
  Future<void> _attemptSyncWithQueue({
    required String tempUID,
    required CreateDailyReportModel data,
    required String companyUID,
  }) async {
    try {
      // Attempt remote creation
      final remoteResult = await _remoteDataSource.createDailyReport(
        data: data,
        companyUID: companyUID,
      );

      await remoteResult.fold(
        (failure) async {
          print('⚠️ Immediate sync failed for $tempUID: ${failure.message}');
          // Add to SyncQueue for retry (using base repository method)
          await addToSyncQueue(
            entityType: 'daily_report',
            entityUid: tempUID,
            action: 'create',
            payload: {
              ...data.toJson(),
              'companyUID': companyUID,
              'tempUID': tempUID,
            },
            priority: 10,
          );
          print('📋 Added to SyncQueue for retry: daily_report/$tempUID');
        },
        (serverModel) async {
          print('✅ Immediate sync successful for $tempUID → ${serverModel.uid}');
          // Update local DB with server data
          await _localDataSource.updateReportWithServerData(
            tempUID,
            serverModel.toJson(),
          );
          // Remove from SyncQueue if it was added before (using base repository method)
          await removeFromSyncQueue('daily_report', tempUID);
        },
      );
    } catch (e) {
      print('❌ Sync error for $tempUID: $e');
      // Add to SyncQueue on exception (using base repository method)
      await addToSyncQueue(
        entityType: 'daily_report',
        entityUid: tempUID,
        action: 'create',
        payload: {
          ...data.toJson(),
          'companyUID': companyUID,
          'tempUID': tempUID,
        },
        priority: 10,
      );
    }
  }
}
