import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/repositories/base_sync_repository.dart';
import '../../domain/entities/province/province_entity.dart';
import '../../domain/entities/province/road_entity.dart';
import '../../domain/repository/road_repository.dart';
import '../datasources/daily_report_creation_remote_datasource.dart';
import '../datasources/daily_report_creation_local_datasource.dart';
import '../models/province/province_model.dart';
import '../models/province/road_model.dart';

@Injectable(as: RoadRepository)
class RoadRepositoryImpl
    extends BaseOfflineSyncRepository<List<Road>, List<RoadModel>>
    implements RoadRepository {
  final DailyReportCreationRemoteDataSource _remoteDataSource;
  final DailyReportCreationLocalDatasource _localDataSource;

  RoadRepositoryImpl(this._remoteDataSource, this._localDataSource);

  @override
  Future<Either<Failure, List<Road>>> getRoads({
    int? page = 1,
    int? limit = 0,
    String? sortOrder = 'asc',
    String? sortBy = 'name',
    int? districtID,
    int? mainCategoryID,
    int? secondaryCategoryID,
    String? search,
    double? sectionStartMin,
    double? sectionFinishMax,
    bool forceRefresh = false,
    Duration? cacheTimeout = const Duration(hours: 1),
  }) async {
    return await getOfflineFirst(
      getLocal: () => _localDataSource.getCachedRoads(),
      getRemote: () => _remoteDataSource.getRoads(
        page: page,
        limit: limit,
        sortOrder: sortOrder,
        sortBy: sortBy,
        districtID: districtID,
        mainCategoryID: mainCategoryID,
        secondaryCategoryID: secondaryCategoryID,
        search: search,
        sectionStartMin: sectionStartMin,
        sectionFinishMax: sectionFinishMax,
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
