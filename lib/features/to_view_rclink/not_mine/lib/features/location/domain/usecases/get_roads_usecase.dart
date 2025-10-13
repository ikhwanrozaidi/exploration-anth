import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/road_entity.dart';
import '../repository/road_repository.dart';

@lazySingleton
class GetRoadsUseCase implements UseCase<List<Road>, GetRoadsParams> {
  final RoadRepository _repository;

  GetRoadsUseCase(this._repository);

  @override
  Future<Either<Failure, List<Road>>> call(GetRoadsParams params) async {
    return await _repository.getRoads(
      districtUid: params.districtUid,
      forceRefresh: params.forceRefresh,
      cacheTimeout: params.cacheTimeout,
    );
  }
}

class GetRoadsParams {
  final String? districtUid;
  final bool forceRefresh;
  final Duration? cacheTimeout;

  GetRoadsParams({
    this.districtUid,
    this.forceRefresh = false,
    this.cacheTimeout = const Duration(hours: 1),
  });
}
