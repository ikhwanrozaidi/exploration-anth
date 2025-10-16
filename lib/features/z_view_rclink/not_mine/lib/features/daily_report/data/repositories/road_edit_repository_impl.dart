import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/repositories/base_sync_repository.dart';
import '../../domain/entities/road_edit_entity.dart';
import '../../domain/repository/road_edit_repository.dart';
import '../datasources/daily_report_local_datasource.dart';
import '../datasources/daily_report_remote_datasource.dart';
import '../models/road_edit_model.dart';

@LazySingleton(as: RoadEditRepository)
class RoadEditRepositoryImpl
    extends BaseOfflineSyncRepository<List<RoadEdit>, List<RoadEditModel>>
    implements RoadEditRepository {
  final DailyReportRemoteDataSource _remoteDataSource;
  final DailyReportLocalDataSource _localDataSource;

  RoadEditRepositoryImpl(this._remoteDataSource, this._localDataSource);

  @override
  Future<Either<Failure, List<RoadEdit>>> getRoadsByDistrictName({
    required String districtName,
    bool forceRefresh = false,
    Duration? cacheTimeout = const Duration(hours: 1),
  }) async {
    final remoteResult = await _remoteDataSource.getRoadsByDistrictName(districtName);

    return remoteResult.fold(
      (failure) {
        return Left(failure);
      },
      (models) async {
        final entities = models.map((model) => model.toEntity()).toList();
        await _localDataSource.cacheRoads(entities, districtName);

        return Right(entities);
      },
    );
  }

  @override
  Future<Either<Failure, void>> clearRoadEditCache() async {
    try {
      await _localDataSource.clearRoadEditCache();
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure('Failed to clear road edit cache: $e'));
    }
  }
}
