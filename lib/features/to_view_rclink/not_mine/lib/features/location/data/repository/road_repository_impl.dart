import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/constants/api_query_params.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/repositories/base_offline_parentId_repository.dart';
import '../../domain/entities/road_entity.dart';
import '../../domain/repository/road_repository.dart';
import '../datasources/location_local_datasource.dart';
import '../datasources/location_remote_datasource.dart';
import '../models/road_model.dart';

@LazySingleton(as: RoadRepository)
class RoadRepositoryImpl extends BaseOfflineByIdSyncRepository<Road, RoadModel>
    implements RoadRepository {
  final LocationRemoteDataSource _remoteDataSource;
  final LocationLocalDataSource _localDataSource;

  RoadRepositoryImpl(this._remoteDataSource, this._localDataSource);

  @override
  Future<Either<Failure, List<Road>>> getRoads({
    String? districtUid,
    bool forceRefresh = false,
    Duration? cacheTimeout = const Duration(hours: 1),
  }) async {
    // If districtUid is provided, use getOfflineFirstByParentId
    if (districtUid != null) {
      return await getOfflineFirstByParentId(
        parentId: districtUid,
        getLocal: () =>
            _localDataSource.getCachedRoadsByDistrictId(districtUid),
        getRemote: () => _remoteDataSource.getRoads(
          queryParams: const ApiQueryParams(limit: 0),
        ),
        saveLocal: (roads) => _localDataSource.cacheRoads(roads),
        toEntity: (model) => model.toEntity(),
        forceRefresh: forceRefresh,
        cacheDuration: cacheTimeout!,
      );
    }

    // Otherwise, use getListOfflineFirst for all roads
    return await getListOfflineFirst(
      getLocal: () => _localDataSource.getCachedRoads(),
      getRemote: () => _remoteDataSource.getRoads(
        queryParams: const ApiQueryParams(limit: 0),
      ),
      saveLocal: (roads) => _localDataSource.cacheRoads(roads),
      toEntity: (model) => model.toEntity(),
      forceRefresh: forceRefresh,
      cacheDuration: cacheTimeout!,
    );
  }

  @override
  Future<Either<Failure, void>> clearRoadCache() async {
    try {
      await _localDataSource.clearRoadCache();
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure('Failed to clear road cache: $e'));
    }
  }
}
