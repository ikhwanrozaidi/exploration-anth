import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/constants/api_query_params.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/repositories/base_sync_repository.dart';
import '../../domain/entities/road_entity.dart';
import '../../domain/repository/road_repository.dart';
import '../datasources/location_local_datasource.dart';
import '../datasources/location_remote_datasource.dart';
import '../models/road_model.dart';

@LazySingleton(as: RoadRepository)
class RoadRepositoryImpl
    extends BaseOfflineSyncRepository<List<Road>, List<RoadModel>>
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
    // If districtUid is provided, filter by district
    if (districtUid != null) {
      // Get the district's integer ID from cache
      final districts = await _localDataSource.getCachedDistricts();
      final district = districts.firstWhere(
        (d) => d.uid == districtUid,
        orElse: () => throw Exception('District not found: $districtUid'),
      );

      final districtID = district.id;

      return await getOfflineFirst(
        getLocal: () async {
          final roads = await _localDataSource.getCachedRoadsByDistrictId(
            districtUid,
          );
          return roads;
        },
        getRemote: () => _remoteDataSource.getRoads(
          queryParams: const ApiQueryParams(limit: 0),
          districtID: districtID,
        ),
        saveLocal: (roads, {bool markForSync = false}) =>
            _localDataSource.cacheRoads(roads),
        toEntity: (models) => models.map((model) => model.toEntity()).toList(),
        forceRefresh: forceRefresh,
        cacheTimeout: cacheTimeout,
      );
    }

    // Otherwise, get all roads
    return await getOfflineFirst(
      getLocal: () async {
        final roads = await _localDataSource.getCachedRoads();
        return roads;
      },
      getRemote: () => _remoteDataSource.getRoads(
        queryParams: const ApiQueryParams(limit: 0),
      ),
      saveLocal: (roads, {bool markForSync = false}) =>
          _localDataSource.cacheRoads(roads),
      toEntity: (models) => models.map((model) => model.toEntity()).toList(),
      forceRefresh: forceRefresh,
      cacheTimeout: cacheTimeout,
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
