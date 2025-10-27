import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/constants/api_query_params.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/repositories/base_sync_repository.dart';
import '../../domain/entities/district_entity.dart';
import '../../domain/repository/district_repository.dart';
import '../datasources/location_local_datasource.dart';
import '../datasources/location_remote_datasource.dart';
import '../models/district_model.dart';

@LazySingleton(as: DistrictRepository)
class DistrictRepositoryImpl
    extends BaseOfflineSyncRepository<List<District>, List<DistrictModel>>
    implements DistrictRepository {
  final LocationRemoteDataSource _remoteDataSource;
  final LocationLocalDataSource _localDataSource;

  DistrictRepositoryImpl(this._remoteDataSource, this._localDataSource);

  @override
  Future<Either<Failure, List<District>>> getDistricts({
    String? provinceUid,
    bool forceRefresh = false,
    Duration? cacheTimeout = const Duration(hours: 1),
  }) async {
    if (provinceUid != null) {
      final provinces = await _localDataSource.getCachedProvinces();
      final province = provinces.firstWhere(
        (p) => p.uid == provinceUid,
        orElse: () => throw Exception('Province not found: $provinceUid'),
      );

      final stateID = province.id;

      return await getOfflineFirst(
        getLocal: () async {
          final districts = await _localDataSource
              .getCachedDistrictsByProvinceId(provinceUid);
          return districts;
        },
        getRemote: () => _remoteDataSource.getDistricts(
          queryParams: const ApiQueryParams(limit: 0),
          stateID: stateID,
        ),
        saveLocal: (districts, {bool markForSync = false}) =>
            _localDataSource.cacheDistricts(districts),
        toEntity: (models) => models.map((model) => model.toEntity()).toList(),
        forceRefresh: forceRefresh,
        cacheTimeout: cacheTimeout,
      );
    }

    // Otherwise, get all districts
    return await getOfflineFirst(
      getLocal: () async {
        final districts = await _localDataSource.getCachedDistricts();
        return districts;
      },
      getRemote: () => _remoteDataSource.getDistricts(
        queryParams: const ApiQueryParams(limit: 0),
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
