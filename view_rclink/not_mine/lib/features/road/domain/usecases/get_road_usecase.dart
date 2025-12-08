import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/package_data_response_entity.dart';
import '../repositories/road_repository.dart';

@injectable
class GetRoadsParams {
  final bool forceRefresh;
  final Duration? cacheTimeout;

  GetRoadsParams({
    this.forceRefresh = false,
    this.cacheTimeout = const Duration(hours: 1),
  });
}

@lazySingleton
class GetRoadsUseCase implements UseCase<PackageDataResponse, GetRoadsParams> {
  final RoadRepository _repository;

  GetRoadsUseCase(this._repository);

  @override
  Future<Either<Failure, PackageDataResponse>> call(
    GetRoadsParams params,
  ) async {
    return await _repository.getRoads(
      forceRefresh: params.forceRefresh,
      cacheTimeout: params.cacheTimeout,
    );
  }
}
