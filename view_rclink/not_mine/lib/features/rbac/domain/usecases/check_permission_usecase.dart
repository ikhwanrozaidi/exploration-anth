import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/permission_repository.dart';

@injectable
class CheckPermissionUseCase implements UseCase<bool, CheckPermissionParams> {
  final PermissionRepository _repository;

  CheckPermissionUseCase(this._repository);

  @override
  Future<Either<Failure, bool>> call(CheckPermissionParams params) async {
    return await _repository.hasPermission(params.permissionCode);
  }
}

class CheckPermissionParams extends Equatable {
  final String permissionCode;

  const CheckPermissionParams({required this.permissionCode});

  @override
  List<Object?> get props => [permissionCode];
}