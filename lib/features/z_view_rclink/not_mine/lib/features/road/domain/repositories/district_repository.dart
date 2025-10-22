import 'package:dartz/dartz.dart';
import 'package:rclink_app/features/road/domain/entities/district_entity.dart';
import '../../../../core/errors/failures.dart';

abstract class DistrictRepository {
  Future<Either<Failure, List<District>>> getDistricts({
    int? page = 1,
    int? limit = 0,
    String? sortOrder = 'asc',
    String? sortBy = 'name',
    int? stateID,
    String? search,
    bool forceRefresh = false,
    Duration? cacheTimeout = const Duration(hours: 1),
  });

  Future<Either<Failure, void>> clearDistrictCache();
}
