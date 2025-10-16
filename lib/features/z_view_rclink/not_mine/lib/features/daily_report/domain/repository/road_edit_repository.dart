import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/road_edit_entity.dart';

abstract class RoadEditRepository {
  Future<Either<Failure, List<RoadEdit>>> getRoadsByDistrictName({
    required String districtName,
    bool forceRefresh = false,
    Duration? cacheTimeout = const Duration(hours: 1),
  });

  Future<Either<Failure, void>> clearRoadEditCache();
}
