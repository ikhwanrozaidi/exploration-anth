import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/road_entity.dart';

abstract class RoadRepository {
  Future<Either<Failure, List<Road>>> getRoads({
    String? districtUid,
    bool forceRefresh = false,
    Duration? cacheTimeout = const Duration(hours: 1),
  });

  Future<Either<Failure, void>> clearRoadCache();
}
