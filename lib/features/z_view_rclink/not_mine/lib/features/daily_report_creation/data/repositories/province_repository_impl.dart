import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/repositories/base_sync_repository.dart';
import '../../domain/entities/province/province_entity.dart';
import '../../domain/repository/province_repository.dart';
import '../datasources/daily_report_creation_remote_datasource.dart';
import '../datasources/daily_report_creation_local_datasource.dart';
import '../models/province/province_model.dart';

@Injectable(as: ProvinceRepository)
class ProvinceRepositoryImpl
    extends BaseOfflineSyncRepository<List<Province>, List<ProvinceModel>>
    implements ProvinceRepository {
  final DailyReportCreationRemoteDataSource _remoteDataSource;
  final DailyReportCreationLocalDatasource _localDataSource;

  ProvinceRepositoryImpl(this._remoteDataSource, this._localDataSource);

  @override
  Future<Either<Failure, List<Province>>> getStates({
    int? page = 1,
    int? limit = 0,
    String? sortOrder = 'asc',
    String? sortBy = 'name',
    int? countryID,
    String? search,
    bool forceRefresh = true,
    Duration? cacheTimeout = const Duration(hours: 1),
  }) async {
    return await getOfflineFirst(
      getLocal: () {
        return _localDataSource.getCachedProvinces();
      },
      getRemote: () {
        return _remoteDataSource.getStates(
          page: page,
          limit: limit,
          sortOrder: sortOrder,
          sortBy: sortBy,
          countryID: countryID,
          search: search,
        );
      },
      saveLocal: (provinces, {bool markForSync = false}) {
        return _localDataSource.cacheProvinces(provinces);
      },
      toEntity: (models) {
        return models.map((model) => model.toEntity()).toList();
      },
      forceRefresh: forceRefresh,
      cacheTimeout: cacheTimeout,
    );
  }

  @override
  Future<Either<Failure, void>> clearProvinceCache() async {
    try {
      await _localDataSource.clearProvinceCache();
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure('Failed to clear province cache: $e'));
    }
  }
}
