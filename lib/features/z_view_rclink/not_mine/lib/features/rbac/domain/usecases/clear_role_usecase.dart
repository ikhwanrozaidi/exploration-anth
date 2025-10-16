import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/permission_repository.dart';

@injectable
class ClearRoleUseCase implements UseCaseNoParams<void> {
  final PermissionRepository _repository;

  ClearRoleUseCase(this._repository);

  @override
  Future<Either<Failure, void>> call() async {
    return await _repository.clearCache();
  }
}