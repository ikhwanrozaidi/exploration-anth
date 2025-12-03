import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/permission_repository.dart';

@injectable
class CheckAllPermissionsUseCase implements UseCase<bool, CheckAllPermissionsParams> {
  final PermissionRepository _repository;

  CheckAllPermissionsUseCase(this._repository);

  @override
  Future<Either<Failure, bool>> call(CheckAllPermissionsParams params) async {
    return await _repository.hasAllPermissions(params.permissionCodes);
  }
}

class CheckAllPermissionsParams extends Equatable {
  final List<String> permissionCodes;

  const CheckAllPermissionsParams({required this.permissionCodes});

  @override
  List<Object?> get props => [permissionCodes];
}