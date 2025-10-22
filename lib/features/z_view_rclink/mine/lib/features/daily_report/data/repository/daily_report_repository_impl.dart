import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/errors/failures.dart';
import '../../../../../core/repositories/base_sync_repository.dart';

import '../../domain/entities/daily_report_response_entity.dart';
import '../../domain/repository/daily_report_repository.dart';
import '../datasource/daily_report_local_datasource.dart';
import '../datasource/daily_report_remote_datasource.dart';
import '../models/daily_report_response_model.dart';

@Injectable(as: DailyReportRepository)
class DailyReportRepositoryImpl
    extends
        BaseOfflineSyncRepository<
          List<DailyReportResponse>,
          List<DailyReportResponseModel>
        >
    implements DailyReportRepository {
  final DailyReportRemoteDataSource _remoteDataSource;
  final DailyReportLocalDataSource _localDataSource;

  DailyReportRepositoryImpl(this._remoteDataSource, this._localDataSource);

  @override
  Future<Either<Failure, List<DailyReportResponse>>> getDailyReports({
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

  // @override
  // Future<Either<Failure, DailyReportResponse>> createDailyReport({
  //   required CreateDailyReportModel data,
  //   required String companyUID,
  // }) async {
  //   try {
  //     // Step 1: Create locally first with temp UID (optimistic)
  //     final localReport = await _localDataSource.createDailyReportLocal(
  //       data,
  //       companyUID,
  //     );

  //     final tempUID = localReport.uid;

  //     // Step 2: Attempt immediate sync (fire and forget)
  //     _attemptSync(tempUID: tempUID, data: data, companyUID: companyUID);

  //     // Step 3: Return success immediately (optimistic)
  //     return Right(localReport);
  //   } catch (e) {
  //     return Left(CacheFailure('Failed to create report locally: $e'));
  //   }
  // }
  // /// Attempt to sync the report to the server
  // Future<void> _attemptSync({
  //   required String tempUID,
  //   required CreateDailyReportModel data,
  //   required String companyUID,
  // }) async {
  //   try {
  //     // Attempt remote creation
  //     final remoteResult = await _remoteDataSource.createDailyReport(
  //       data: data,
  //       companyUID: companyUID,
  //     );

  //     await remoteResult.fold(
  //       (failure) async {
  //         print('⚠️ Sync failed for $tempUID: $failure');
  //         // Keep report in local DB with isSynced: false for future retry
  //       },
  //       (serverModel) async {
  //         print('✅ Sync successful for $tempUID → ${serverModel.uid}');
  //         // Update local DB with server data
  //         await _localDataSource.updateReportWithServerData(
  //           tempUID,
  //           serverModel.toJson(),
  //         );
  //       },
  //     );
  //   } catch (e) {
  //     print('❌ Sync error for $tempUID: $e');
  //     // Keep report in local DB with isSynced: false for future retry
  //   }
  // }
}
