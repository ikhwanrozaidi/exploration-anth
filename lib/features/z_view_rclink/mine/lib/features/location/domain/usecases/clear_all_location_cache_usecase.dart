import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repository/location_repository.dart';

@lazySingleton
class ClearAllLocationCacheUseCase implements UseCaseNoParams<void> {
  final LocationRepository _repository;

  ClearAllLocationCacheUseCase(this._repository);

  @override
  Future<Either<Failure, void>> call() async {
    return await _repository.clearAllLocationCache();
  }
}
