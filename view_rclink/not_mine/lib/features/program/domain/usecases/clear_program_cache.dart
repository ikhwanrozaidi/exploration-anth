import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/program_list_repository.dart';

@lazySingleton
class ClearProgramCacheUseCase implements UseCaseNoParams<void> {
  final ProgramListRepository _repository;

  ClearProgramCacheUseCase(this._repository);

  @override
  Future<Either<Failure, void>> call() async {
    return _repository.clearCache();
  }
}
