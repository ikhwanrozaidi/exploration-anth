import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/province/province_entity.dart';

abstract class ProvinceRepository {
  Future<Either<Failure, List<Province>>> getStates({
    int? page = 1,
    int? limit = 0,
    String? sortOrder = 'asc',
    String? sortBy = 'name',
    int? countryID,
    String? search,
    bool forceRefresh = false,
    Duration? cacheTimeout = const Duration(hours: 1),
  });

  Future<Either<Failure, void>> clearProvinceCache();
}
