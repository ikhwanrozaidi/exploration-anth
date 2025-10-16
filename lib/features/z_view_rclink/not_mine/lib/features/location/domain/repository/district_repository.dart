import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/district_entity.dart';

abstract class DistrictRepository {
  Future<Either<Failure, List<District>>> getDistricts({
    String? provinceUid,
    bool forceRefresh = false,
    Duration? cacheTimeout = const Duration(hours: 1),
  });

  Future<Either<Failure, void>> clearDistrictCache();
}
