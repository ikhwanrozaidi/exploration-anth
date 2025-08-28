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
  final CompanyLocalDataSource _localDataSource;
  final CompanyRemoteDataSource _remoteDataSource;

  CompanyRepositoryImpl(this._localDataSource, this._remoteDataSource);

  @override
  Future<Either<Failure, List<Company>>> getMyCompanies({
    bool forceRefresh = false,
    Duration? cacheTimeout = const Duration(hours: 1),
  }) async {
    return await getOfflineFirst(
      getLocal: () => _getLocalCompanies(),
      getRemote: () => _getRemoteCompanies(),
      saveLocal: (companies, {bool markForSync = false}) =>
          _saveLocalCompanies(companies),
      toEntity: (models) => models.map((model) => model.toEntity()).toList(),
      forceRefresh: forceRefresh,
      cacheTimeout: cacheTimeout,
    );
  }

  /// Get companies from local cache
  Future<List<Company>?> _getLocalCompanies() async {
    try {
      final cachedResult = await _localDataSource.getCachedCompanies();

      return cachedResult.fold(
        (failure) => null, // Return null if cache fails or is empty
        (cachedModels) {
          if (cachedModels.isEmpty) return null;
          return cachedModels.map((model) => model.toEntity()).toList();
        },
      );
    } catch (e) {
      return null;
    }
  }

  /// Get companies from remote API
  Future<Either<Failure, List<CompanyModel>>> _getRemoteCompanies() async {
    return await _remoteDataSource.getMyCompanies();
  }

  /// Save companies to local cache
  Future<void> _saveLocalCompanies(List<Company> companies) async {
    try {
      // Convert entities back to models for caching
      // You'll need to implement CompanyModel.fromEntity() or modify this approach
      final models = companies
          .map((entity) => CompanyModel.fromEntity(entity))
          .toList();
      await _localDataSource.cacheCompanies(models);
    } catch (e) {
      // Handle save failure silently - base class handles main error flow
    }
  }

  @override
  Future<Either<Failure, void>> cacheSelectedCompany(String companyId) async {
    return await _localDataSource.cacheSelectedCompany(companyId);
  }

  @override
  Future<Either<Failure, String?>> getSelectedCompany() async {
    return await _localDataSource.getSelectedCompany();
  }

  @override
  Future<Either<Failure, void>> clearCompanyCache() async {
    try {
      await _localDataSource.clearCache();
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure('Failed to clear cache: $e'));
    }
  }
}
