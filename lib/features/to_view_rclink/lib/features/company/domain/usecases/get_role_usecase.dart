import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/role.dart';
import '../repositories/company_repository.dart';

@injectable
class GetRoleUseCase implements UseCase<Role, GetRoleParams> {
  final CompanyRepository _repository;

  GetRoleUseCase(this._repository);

  @override
  Future<Either<Failure, Role>> call(GetRoleParams params) async {
    return await _repository.getRole(params.roleUid);
  }
}

class GetRoleParams {
  final String roleUid;

  GetRoleParams({required this.roleUid});
}
