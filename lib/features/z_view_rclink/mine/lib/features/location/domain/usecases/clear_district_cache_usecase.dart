import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repository/district_repository.dart';

@lazySingleton
class ClearDistrictCacheUseCase implements UseCaseNoParams<void> {
  final DistrictRepository _repository;

  ClearDistrictCacheUseCase(this._repository);

  @override
  Future<Either<Failure, void>> call() async {
    return await _repository.clearDistrictCache();
  }
}
