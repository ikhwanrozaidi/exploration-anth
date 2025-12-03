import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/company.dart';

abstract class CompanyRepository {
  Future<Either<Failure, List<Company>>> getMyCompanies({
    bool forceRefresh = false,
    Duration? cacheTimeout = const Duration(hours: 1),
  });

  Future<Either<Failure, void>> clearCache();
  Future<Either<Failure, void>> cacheSelectedCompany(String companyId);
  Future<Either<Failure, String?>> getSelectedCompany();

  Future<Either<Failure, Company>> updateCompanyField({
    required String companyUid,
    required String fieldName,
    required String fieldValue,
  });
}
