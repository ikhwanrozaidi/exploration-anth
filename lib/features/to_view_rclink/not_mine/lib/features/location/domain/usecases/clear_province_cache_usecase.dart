import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repository/province_repository.dart';

@lazySingleton
class ClearProvinceCacheUseCase implements UseCaseNoParams<void> {
  final ProvinceRepository _repository;

  ClearProvinceCacheUseCase(this._repository);

  @override
  Future<Either<Failure, void>> call() async {
    return await _repository.clearProvinceCache();
  }
}
