import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/constants/api_query_params.dart';
import '../../../../core/errors/failures.dart';
import '../../../../../../../to_view_rclink/not_mine/lib/core/repositories/base_offline_parentId_repository.dart';
import '../../domain/entities/district_entity.dart';
import '../../domain/repository/district_repository.dart';
import '../datasources/location_local_datasource.dart';
import '../datasources/location_remote_datasource.dart';
import '../models/district_model.dart';

@LazySingleton(as: DistrictRepository)
class DistrictRepositoryImpl
    extends BaseOfflineByIdSyncRepository<District, DistrictModel>
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
      // First, get the province's integer ID from cache
      final provinces = await _localDataSource.getCachedProvinces();
      final province = provinces.firstWhere(
        (p) => p.uid == provinceUid,
        orElse: () => throw Exception('Province not found: $provinceUid'),
      );

      final stateID = province.id;

      return await getOfflineFirstByParentId(
        parentId: provinceUid,
        getLocal: () =>
            _localDataSource.getCachedDistrictsByProvinceId(provinceUid),
        getRemote: () => _remoteDataSource.getDistricts(
          queryParams: const ApiQueryParams(limit: 0),
          stateID: stateID, // ✅ Pass the integer ID
        ),
        saveLocal: (districts) => _localDataSource.cacheDistricts(districts),
        toEntity: (model) => model.toEntity(),
        forceRefresh: forceRefresh,
        cacheDuration: cacheTimeout!,
      );
    }

    // Otherwise, use getListOfflineFirst for all districts
    return await getListOfflineFirst(
      getLocal: () => _localDataSource.getCachedDistricts(),
      getRemote: () => _remoteDataSource.getDistricts(
        queryParams: const ApiQueryParams(limit: 0),
      ),
      saveLocal: (districts) => _localDataSource.cacheDistricts(districts),
      toEntity: (model) => model.toEntity(),
      forceRefresh: forceRefresh,
      cacheDuration: cacheTimeout!,
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
