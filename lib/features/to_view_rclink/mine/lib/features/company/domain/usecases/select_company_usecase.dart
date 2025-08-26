import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/company_repository.dart';

class SelectCompanyParams {
  final String companyId;

  SelectCompanyParams({required this.companyId});
}

@injectable
class SelectCompanyUseCase implements UseCase<void, SelectCompanyParams> {
  final CompanyRepository _repository;

  SelectCompanyUseCase(this._repository);

  @override
  Future<Either<Failure, void>> call(SelectCompanyParams params) async {
    return await _repository.cacheSelectedCompany(params.companyId);
  }
}
