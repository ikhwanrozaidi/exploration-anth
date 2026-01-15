import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/program_repository.dart';

@lazySingleton
class ClearProgramCacheUseCase implements UseCaseNoParams<void> {
  final ProgramRepository _repository;

  ClearProgramCacheUseCase(this._repository);

  @override
  Future<Either<Failure, void>> call() async {
    return await _repository.clearCache();
  }
}
