import 'package:dartz/dartz.dart';
import 'package:rclink_app/features/road/domain/entities/road_entity.dart';
import '../../../../core/errors/failures.dart';

abstract class RoadRepository {
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
  });

  Future<Either<Failure, void>> clearRoadCache();
}
