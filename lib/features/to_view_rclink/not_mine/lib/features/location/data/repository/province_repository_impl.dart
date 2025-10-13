import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/constants/api_query_params.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/repositories/base_offline_parentId_repository.dart';
import '../../domain/entities/province_entity.dart';
import '../../domain/repository/province_repository.dart';
import '../datasources/location_local_datasource.dart';
import '../datasources/location_remote_datasource.dart';
import '../models/province_model.dart';

@LazySingleton(as: ProvinceRepository)
class ProvinceRepositoryImpl
    extends BaseOfflineByIdSyncRepository<Province, ProvinceModel>
    implements ProvinceRepository {
  final LocationRemoteDataSource _remoteDataSource;
  final LocationLocalDataSource _localDataSource;

  ProvinceRepositoryImpl(this._remoteDataSource, this._localDataSource);

  @override
  Future<Either<Failure, List<Province>>> getProvinces({
    String? countryUid,
    bool forceRefresh = false,
    Duration? cacheTimeout = const Duration(hours: 1),
  }) async {
    // If countryUid is provided, use getOfflineFirstByParentId
    if (countryUid != null) {
      return await getOfflineFirstByParentId(
        parentId: countryUid,
        getLocal: () =>
            _localDataSource.getCachedProvincesByCountryId(countryUid),
        getRemote: () => _remoteDataSource.getStates(
          queryParams: const ApiQueryParams(limit: 0),
        ),
        saveLocal: (provinces) => _localDataSource.cacheProvinces(provinces),
        toEntity: (model) => model.toEntity(),
        forceRefresh: forceRefresh,
        cacheDuration: cacheTimeout!,
      );
    }

    // Otherwise, use getListOfflineFirst for all provinces
    return await getListOfflineFirst(
      getLocal: () => _localDataSource.getCachedProvinces(),
      getRemote: () => _remoteDataSource.getStates(
        queryParams: const ApiQueryParams(limit: 0),
        countryID: 1,
      ),
      saveLocal: (provinces) => _localDataSource.cacheProvinces(provinces),
      toEntity: (model) => model.toEntity(),
      forceRefresh: forceRefresh,
      cacheDuration: cacheTimeout!,
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
