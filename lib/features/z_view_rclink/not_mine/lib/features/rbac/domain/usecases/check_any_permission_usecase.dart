import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/permission_repository.dart';

@injectable
class CheckAnyPermissionUseCase implements UseCase<bool, CheckAnyPermissionParams> {
  final PermissionRepository _repository;

  CheckAnyPermissionUseCase(this._repository);

  @override
  Future<Either<Failure, bool>> call(CheckAnyPermissionParams params) async {
    return await _repository.hasAnyPermission(params.permissionCodes);
  }
}

class CheckAnyPermissionParams extends Equatable {
  final List<String> permissionCodes;

  const CheckAnyPermissionParams({required this.permissionCodes});

  @override
  List<Object?> get props => [permissionCodes];
}