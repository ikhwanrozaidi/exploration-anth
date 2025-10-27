import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/constants/api_query_params.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/repositories/base_sync_repository.dart';
import '../../domain/entities/province_entity.dart';
import '../../domain/repository/province_repository.dart';
import '../datasources/location_local_datasource.dart';
import '../datasources/location_remote_datasource.dart';
import '../models/province_model.dart';

@LazySingleton(as: ProvinceRepository)
class ProvinceRepositoryImpl
    extends BaseOfflineSyncRepository<List<Province>, List<ProvinceModel>>
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
    // If countryUid is provided, filter by country
    if (countryUid != null) {
      return await getOfflineFirst(
        getLocal: () async {
          final provinces = await _localDataSource
              .getCachedProvincesByCountryId(countryUid);
          return provinces;
        },
        getRemote: () => _remoteDataSource.getStates(
          queryParams: const ApiQueryParams(limit: 0),
        ),
        saveLocal: (provinces, {bool markForSync = false}) =>
            _localDataSource.cacheProvinces(provinces),
        toEntity: (models) => models.map((model) => model.toEntity()).toList(),
        forceRefresh: forceRefresh,
        cacheTimeout: cacheTimeout,
      );
    }

    // Otherwise, get all provinces (with default countryID = 1 for Malaysia)
    return await getOfflineFirst(
      getLocal: () async {
        final provinces = await _localDataSource.getCachedProvinces();
        return provinces;
      },
      getRemote: () => _remoteDataSource.getStates(
        queryParams: const ApiQueryParams(limit: 0),
        countryID: 1, // Default to Malaysia
      ),
      saveLocal: (provinces, {bool markForSync = false}) =>
          _localDataSource.cacheProvinces(provinces),
      toEntity: (models) => models.map((model) => model.toEntity()).toList(),
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
