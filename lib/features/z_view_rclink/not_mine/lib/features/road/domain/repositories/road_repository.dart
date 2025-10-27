import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/package_data_response_entity.dart';

abstract class RoadRepository {
  Future<Either<Failure, PackageDataResponse>> getRoads({
    bool forceRefresh = false,
    Duration? cacheTimeout = const Duration(hours: 1),
  });

  Future<Either<Failure, void>> clearRoadCache();
}
