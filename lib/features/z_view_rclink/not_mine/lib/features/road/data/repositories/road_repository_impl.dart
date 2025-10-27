import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/repositories/base_sync_repository.dart';
import '../../domain/entities/package_data_response_entity.dart';
import '../../domain/repositories/road_repository.dart';
import '../datasources/road_local_datasource.dart';
import '../datasources/road_remote_datasource.dart';
import '../models/package_data_response_model.dart';

@LazySingleton(as: RoadRepository)
class RoadRepositoryImpl
    extends
        BaseOfflineSyncRepository<PackageDataResponse, PackageDataResponseModel>
    implements RoadRepository {
  final RoadRemoteDataSource _remoteDataSource;
  final RoadLocalDataSource _localDataSource;

  RoadRepositoryImpl(this._remoteDataSource, this._localDataSource);

  @override
  Future<Either<Failure, PackageDataResponse>> getRoads({
    bool forceRefresh = false,
    Duration? cacheTimeout = const Duration(hours: 1),
  }) async {
    return await getOfflineFirst(
      getLocal: () => _localDataSource.getCachedPackageData(),
      getRemote: () => _remoteDataSource.getPackageData(),
      saveLocal: (packageData, {bool markForSync = false}) =>
          _localDataSource.cachePackageData(packageData),
      toEntity: (model) => model.toEntity(),
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
