import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/warning_repository.dart';

@injectable
class ClearWarningCacheUseCase implements UseCaseNoParams<void> {
  final WarningRepository _repository;

  ClearWarningCacheUseCase(this._repository);

  @override
  Future<Either<Failure, void>> call() async {
    return await _repository.clearCache();
  }
}
