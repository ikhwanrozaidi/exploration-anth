import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/role.dart';
import '../repositories/permission_repository.dart';

@injectable
class GetRoleUseCase implements UseCase<Role?, GetRoleParams> {
  final PermissionRepository _repository;

  GetRoleUseCase(this._repository);

  @override
  Future<Either<Failure, Role?>> call(GetRoleParams params) async {
    return await _repository.getRole(
      roleUID: params.roleUID,
      forceRefresh: params.forceRefresh,
      cacheTimeout: params.cacheTimeout,
    );
  }
}

class GetRoleParams extends Equatable {
  final String roleUID;
  final bool forceRefresh;
  final Duration? cacheTimeout;

  const GetRoleParams({
    required this.roleUID,
    this.forceRefresh = false,
    this.cacheTimeout = const Duration(hours: 1),
  });

  @override
  List<Object?> get props => [roleUID, forceRefresh, cacheTimeout];
}