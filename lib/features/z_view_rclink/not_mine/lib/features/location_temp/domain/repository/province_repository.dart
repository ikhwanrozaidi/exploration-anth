import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/province_entity.dart';

abstract class ProvinceRepository {
  Future<Either<Failure, List<Province>>> getProvinces({
    String? countryUid,
    bool forceRefresh = false,
    Duration? cacheTimeout = const Duration(hours: 1),
  });

  Future<Either<Failure, void>> clearProvinceCache();
}
