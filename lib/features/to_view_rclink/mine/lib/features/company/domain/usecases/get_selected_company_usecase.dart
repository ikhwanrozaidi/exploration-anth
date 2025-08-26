import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/company_repository.dart';

@injectable
class GetSelectedCompanyUseCase implements UseCaseNoParams<String?> {
  final CompanyRepository _repository;

  GetSelectedCompanyUseCase(this._repository);

  @override
  Future<Either<Failure, String?>> call() async {
    return await _repository.getSelectedCompany();
  }
}
