import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repository/workscopes_repository.dart';

@injectable
class ClearWorkScopesCacheUseCase implements UseCaseNoParams<void> {
  final WorkScopesRepository _repository;

  ClearWorkScopesCacheUseCase(this._repository);

  @override
  Future<Either<Failure, void>> call() async {
    return await _repository.clearCache();
  }
}
