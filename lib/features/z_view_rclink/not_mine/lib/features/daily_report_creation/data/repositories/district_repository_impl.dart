import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/repositories/base_sync_repository.dart';
import '../../domain/entities/province/district_entity.dart';
import '../../domain/repository/district_repository.dart';
import '../datasources/daily_report_creation_remote_datasource.dart';
import '../datasources/daily_report_creation_local_datasource.dart';
import '../models/province/district_model.dart';

@Injectable(as: DistrictRepository)
class DistrictRepositoryImpl
    extends BaseOfflineSyncRepository<List<District>, List<DistrictModel>>
    implements DistrictRepository {
  final DailyReportCreationRemoteDataSource _remoteDataSource;
  final DailyReportCreationLocalDatasource _localDataSource;

  DistrictRepositoryImpl(this._remoteDataSource, this._localDataSource);

  @override
  Future<Either<Failure, List<District>>> getDistricts({
    int? page = 1,
    int? limit = 0,
    String? sortOrder = 'asc',
    String? sortBy = 'name',
    int? stateID,
    String? search,
    bool forceRefresh = false,
    Duration? cacheTimeout = const Duration(hours: 1),
  }) async {
    return await getOfflineFirst(
      getLocal: () => _localDataSource.getCachedDistricts(),
      getRemote: () => _remoteDataSource.getDistricts(
        page: page,
        limit: limit,
        sortOrder: sortOrder,
        sortBy: sortBy,
        stateID: stateID,
        search: search,
      ),
      saveLocal: (districts, {bool markForSync = false}) =>
          _localDataSource.cacheDistricts(districts),
      toEntity: (models) => models.map((model) => model.toEntity()).toList(),
      forceRefresh: forceRefresh,
      cacheTimeout: cacheTimeout,
    );
  }

  @override
  Future<Either<Failure, void>> clearDistrictCache() async {
    try {
      await _localDataSource.clearDistrictCache();
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure('Failed to clear district cache: $e'));
    }
  }
}
