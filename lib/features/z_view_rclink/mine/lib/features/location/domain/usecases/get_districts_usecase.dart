import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/district_entity.dart';
import '../repository/district_repository.dart';

@lazySingleton
class GetDistrictsUseCase
    implements UseCase<List<District>, GetDistrictsParams> {
  final DistrictRepository _repository;

  GetDistrictsUseCase(this._repository);

  @override
  Future<Either<Failure, List<District>>> call(
    GetDistrictsParams params,
  ) async {
    return await _repository.getDistricts(
      provinceUid: params.provinceUid,
      forceRefresh: params.forceRefresh,
      cacheTimeout: params.cacheTimeout,
    );
  }
}

class GetDistrictsParams {
  final String? provinceUid;
  final bool forceRefresh;
  final Duration? cacheTimeout;

  GetDistrictsParams({
    this.provinceUid,
    this.forceRefresh = false,
    this.cacheTimeout = const Duration(hours: 1),
  });
}
