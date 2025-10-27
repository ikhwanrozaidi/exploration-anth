import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repository/road_repository.dart';

@lazySingleton
class ClearRoadCacheUseCase implements UseCaseNoParams<void> {
  final RoadRepository _repository;

  ClearRoadCacheUseCase(this._repository);

  @override
  Future<Either<Failure, void>> call() async {
    return await _repository.clearRoadCache();
  }
}
