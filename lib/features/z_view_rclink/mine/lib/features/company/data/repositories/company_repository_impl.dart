import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/repositories/base_sync_repository.dart';
import '../../domain/entities/company.dart';
import '../datasources/company_remote_datasource.dart';
import '../../domain/repositories/company_repository.dart';
import '../datasources/company_local_datasource.dart';
import '../models/company_model.dart';

@Injectable(as: CompanyRepository)
class CompanyRepositoryImpl
    extends BaseOfflineSyncRepository<List<Company>, List<CompanyModel>>
    implements CompanyRepository {
  final CompanyRemoteDataSource _remoteDataSource;
  final CompanyLocalDataSource _localDataSource;

  CompanyRepositoryImpl(this._remoteDataSource, this._localDataSource);

  @override
  Future<Either<Failure, List<Company>>> getMyCompanies({
    bool forceRefresh = false,
    Duration? cacheTimeout = const Duration(hours: 1),
  }) async {
    return await getOfflineFirst(
      getLocal: () => _localDataSource.getCachedCompanies(),
      getRemote: () => _remoteDataSource.getMyCompanies(),
      saveLocal: (companies, {bool markForSync = false}) =>
          _localDataSource.cacheCompanies(companies),
      toEntity: (models) => models.map((model) => model.toEntity()).toList(),
      forceRefresh: forceRefresh,
      cacheTimeout: cacheTimeout,
    );
  }

  @override
  Future<Either<Failure, void>> clearCache() async {
    try {
      await _localDataSource.clearCache();
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure('Failed to clear cache: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> cacheSelectedCompany(String companyId) async {
    try {
      await _localDataSource.cacheSelectedCompany(companyId);
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure('Failed to cache selected company: $e'));
    }
  }

  @override
  Future<Either<Failure, String?>> getSelectedCompany() async {
    try {
      final companyId = await _localDataSource.getSelectedCompany();
      return Right(companyId);
    } catch (e) {
      return Left(CacheFailure('Failed to get selected company: $e'));
    }
  }

  @override
  Future<Either<Failure, Company>> updateCompanyField({
    required String companyUid,
    required String fieldName,
    required String fieldValue,
  }) async {
    try {
      final result = await _remoteDataSource.updateCompanyField(
        companyUid: companyUid,
        fieldName: fieldName,
        fieldValue: fieldValue,
      );

      // Update local cache
      await _localDataSource.cacheCompany(result.toEntity());

      return Right(result.toEntity());
    } on ServerFailure {
      return const Left(ServerFailure('Failed to update company field'));
    } on CacheFailure {
      return const Left(CacheFailure('Failed to cache updated company'));
    }
  }
}
