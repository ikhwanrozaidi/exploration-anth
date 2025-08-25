import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../../auth/data/datasources/auth_local_data_source.dart';
import '../../domain/entities/company.dart';
import '../../domain/entities/role.dart';
import '../datasources/company_remote_datasource.dart';
import '../../domain/repositories/company_repository.dart';
import '../datasources/company_api_service.dart';
import '../datasources/company_local_datasource.dart';

@Injectable(as: CompanyRepository)
class CompanyRepositoryImpl implements CompanyRepository {
  final CompanyApiService _apiService;
  final CompanyLocalDataSource _localDataSource;
  final CompanyRemoteDataSource _remoteDataSource;
  final AuthLocalDataSource _authLocalDataSource;
  final NetworkInfo _networkInfo;

  CompanyRepositoryImpl(
    this._apiService,
    this._localDataSource,
    this._remoteDataSource,
    this._authLocalDataSource,
    this._networkInfo,
  );

  @override
  Future<Either<Failure, List<Company>>> getMyCompanies() async {
    if (await _networkInfo.isConnected) {
      try {
        // Get access token for API call
        final tokenResult = await _authLocalDataSource.getAccessToken();

        return await tokenResult.fold((failure) => Left(failure), (
          accessToken,
        ) async {
          if (accessToken == null) {
            return const Left(UnauthorizedFailure());
          }

          final response = await _apiService.getMyCompanies();

          if (response.isSuccess && response.data != null) {
            final companies = response.data!;

            // Cache the companies for offline use
            await _localDataSource.cacheCompanies(companies);

            return Right(companies.map((model) => model.toEntity()).toList());
          } else {
            return Left(
              ServerFailure(response.message ?? 'Failed to get companies'),
            );
          }
        });
      } catch (e) {
        return Left(NetworkFailure(e.toString()));
      }
    } else {
      // Use cached data when offline
      final cachedResult = await _localDataSource.getCachedCompanies();

      return cachedResult.fold((failure) => Left(failure), (cachedCompanies) {
        if (cachedCompanies.isEmpty) {
          return const Left(ConnectionFailure());
        }
        return Right(cachedCompanies.map((model) => model.toEntity()).toList());
      });
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
    return await _localDataSource.clearCache();
  }

  @override
  Future<Either<Failure, Role>> getRole(String roleUid) async {
    try {
      final result = await _remoteDataSource.getRole(roleUid);

      return result.fold(
        (failure) => Left(failure),
        (roleModel) => Right(roleModel.toEntity()),
      );
    } catch (e) {
      return Left(ServerFailure('Failed to fetch role: ${e.toString()}'));
    }
  }
}
