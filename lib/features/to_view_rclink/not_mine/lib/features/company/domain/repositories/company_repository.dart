import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/company.dart';

abstract class CompanyRepository {
  Future<Either<Failure, List<Company>>> getMyCompanies();
  Future<Either<Failure, void>> cacheSelectedCompany(String companyId);
  Future<Either<Failure, String?>> getSelectedCompany();
  Future<Either<Failure, void>> clearCompanyCache();
}
