import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/province_entity.dart';
import '../repository/province_repository.dart';

@lazySingleton
class GetProvincesUseCase
    implements UseCase<List<Province>, GetProvincesParams> {
  final ProvinceRepository _repository;

  GetProvincesUseCase(this._repository);

  @override
  Future<Either<Failure, List<Province>>> call(
    GetProvincesParams params,
  ) async {
    return await _repository.getProvinces(
      countryUid: params.countryUid,
      forceRefresh: params.forceRefresh,
      cacheTimeout: params.cacheTimeout,
    );
  }
}

class GetProvincesParams {
  final String? countryUid;
  final bool forceRefresh;
  final Duration? cacheTimeout;

  GetProvincesParams({
    this.countryUid,
    this.forceRefresh = false,
    this.cacheTimeout = const Duration(hours: 1),
  });
}
