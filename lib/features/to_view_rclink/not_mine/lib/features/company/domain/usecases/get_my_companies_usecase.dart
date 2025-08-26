import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/company.dart';
import '../repositories/company_repository.dart';

@injectable
class GetMyCompaniesUseCase implements UseCaseNoParams<List<Company>> {
  final CompanyRepository _repository;

  GetMyCompaniesUseCase(this._repository);

  @override
  Future<Either<Failure, List<Company>>> call() async {
    return await _repository.getMyCompanies();
  }
}
