import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/company.dart';
import '../repositories/company_repository.dart';

@lazySingleton
class UpdateCompanyFieldUseCase
    implements UseCase<Company, UpdateCompanyFieldParams> {
  final CompanyRepository repository;

  UpdateCompanyFieldUseCase(this.repository);

  @override
  Future<Either<Failure, Company>> call(UpdateCompanyFieldParams params) async {
    return await repository.updateCompanyField(
      companyUid: params.companyUid,
      fieldName: params.fieldName,
      fieldValue: params.fieldValue,
    );
  }
}

class UpdateCompanyFieldParams {
  final String companyUid;
  final String fieldName;
  final String fieldValue;

  UpdateCompanyFieldParams({
    required this.companyUid,
    required this.fieldName,
    required this.fieldValue,
  });
}
