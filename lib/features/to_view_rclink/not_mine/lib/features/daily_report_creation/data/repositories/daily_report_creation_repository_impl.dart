import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/repositories/base_sync_repository.dart';
import '../../../company/presentation/bloc/company_state.dart';
import '../../domain/entities/province/district_entity.dart';
import '../../domain/entities/province/province_entity.dart';
import '../../domain/entities/province/road_entity.dart';
import '../../domain/entities/scope_of_work/scope_of_work.dart';
import '../../domain/repository/daily_report_creation_repository.dart';
import '../datasources/daily_report_creation_remote_datasource.dart';
import '../datasources/daily_report_creation_local_datasource.dart';
import '../models/scope_of_work/scope_of_work_model.dart';
import '../../../../features/company/presentation/bloc/company_bloc.dart';

@Injectable(as: DailyReportCreationRepository)
class DailyReportCreationRepositoryImpl
    extends BaseOfflineSyncRepository<List<ScopeOfWork>, List<ScopeOfWorkModel>>
    implements DailyReportCreationRepository {
  final DailyReportCreationRemoteDataSource _remoteDataSource;
  final DailyReportCreationLocalDatasource _localDataSource;
  final CompanyBloc _companyBloc;

  DailyReportCreationRepositoryImpl(
    this._remoteDataSource,
    this._localDataSource,
    this._companyBloc,
  );

  // =============================================================================
  // SCOPE OF WORK
  // =============================================================================
  @override
  Future<Either<Failure, List<ScopeOfWork>>> getWorkScopes({
    bool forceRefresh = false,
    Duration? cacheTimeout = const Duration(hours: 1),
  }) async {
    // Get selected company from CompanyBloc
    final currentState = _companyBloc.state;
    if (currentState is! CompanyLoaded ||
        currentState.selectedCompany == null) {
      return const Left(ServerFailure('No company selected'));
    }

    final companyUID = currentState.selectedCompany!.uid;

    return await getOfflineFirst(
      getLocal: () => _localDataSource.getCachedScopeOfWorks(),
      getRemote: () => _remoteDataSource.getWorkScopes(companyUID),
      saveLocal: (scopeOfWorks, {bool markForSync = false}) =>
          _localDataSource.cacheScopeOfWorks(scopeOfWorks),
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

  // =============================================================================
  // PROVINCES/STATES
  // =============================================================================

  @override
  Future<Either<Failure, List<Province>>> getStates({
    int? page = 1,
    int? limit = 0,
    String? sortOrder = 'asc',
    String? sortBy = 'name',
    int? countryID,
    String? search,
    bool forceRefresh = false,
    Duration? cacheTimeout = const Duration(hours: 1),
  }) async {
    try {
      // Check local first
      final localData = await _localDataSource.getCachedProvinces();

      if (localData != null && !forceRefresh) {
        if (_isCacheValid(cacheTimeout)) {
          return Right(localData);
        }
      }

      // Try remote
      try {
        final remoteResult = await _remoteDataSource.getStates(
          page: page,
          limit: limit,
          sortOrder: sortOrder,
          sortBy: sortBy,
          countryID: countryID,
          search: search,
        );

        return await remoteResult.fold(
          (failure) async {
            if (localData != null) return Right(localData);
            return Left(failure);
          },
          (models) async {
            final entities = models.map((model) => model.toEntity()).toList();
            await _localDataSource.cacheProvinces(entities);
            return Right(entities);
          },
        );
      } catch (e) {
        if (localData != null) return Right(localData);
        return Left(NetworkFailure('No internet connection'));
      }
    } catch (e) {
      return Left(CacheFailure('Failed to access local data: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, void>> clearProvinceCache() async {
    try {
      await _localDataSource.clearProvinceCache();
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure('Failed to clear province cache: $e'));
    }
  }

  // =============================================================================
  // DISTRICTS
  // =============================================================================

  @override
  Future<Either<Failure, List<District>>> getDistricts({
    int? page = 1,
    int? limit = 0,
    String? sortOrder = 'asc',
    String? sortBy = 'name',
    int? stateID,
    String? search,
    bool forceRefresh = false,
    Duration? cacheTimeout = const Duration(hours: 1),
  }) async {
    try {
      // Check local first
      final localData = await _localDataSource.getCachedDistricts();

      if (localData != null && !forceRefresh) {
        if (_isCacheValid(cacheTimeout)) {
          return Right(localData);
        }
      }

      // Try remote
      try {
        final remoteResult = await _remoteDataSource.getDistricts(
          page: page,
          limit: limit,
          sortOrder: sortOrder,
          sortBy: sortBy,
          stateID: stateID,
          search: search,
        );

        return await remoteResult.fold(
          (failure) async {
            if (localData != null) return Right(localData);
            return Left(failure);
          },
          (models) async {
            final entities = models.map((model) => model.toEntity()).toList();
            await _localDataSource.cacheDistricts(entities);
            return Right(entities);
          },
        );
      } catch (e) {
        if (localData != null) return Right(localData);
        return Left(NetworkFailure('No internet connection'));
      }
    } catch (e) {
      return Left(CacheFailure('Failed to access local data: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, void>> clearDistrictCache() async {
    try {
      await _localDataSource.clearDistrictCache();
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure('Failed to clear district cache: $e'));
    }
  }

  // =============================================================================
  // ROADS
  // =============================================================================

  @override
  Future<Either<Failure, List<Road>>> getRoads({
    int? page = 1,
    int? limit = 0,
    String? sortOrder = 'asc',
    String? sortBy = 'name',
    int? districtID,
    int? mainCategoryID,
    int? secondaryCategoryID,
    String? search,
    double? sectionStartMin,
    double? sectionFinishMax,
    bool forceRefresh = false,
    Duration? cacheTimeout = const Duration(hours: 1),
  }) async {
    try {
      // Check local first
      final localData = await _localDataSource.getCachedRoads();

      if (localData != null && !forceRefresh) {
        if (_isCacheValid(cacheTimeout)) {
          return Right(localData);
        }
      }

      // Try remote
      try {
        final remoteResult = await _remoteDataSource.getRoads(
          page: page,
          limit: limit,
          sortOrder: sortOrder,
          sortBy: sortBy,
          districtID: districtID,
          mainCategoryID: mainCategoryID,
          secondaryCategoryID: secondaryCategoryID,
          search: search,
          sectionStartMin: sectionStartMin,
          sectionFinishMax: sectionFinishMax,
        );

        return await remoteResult.fold(
          (failure) async {
            if (localData != null) return Right(localData);
            return Left(failure);
          },
          (models) async {
            final entities = models.map((model) => model.toEntity()).toList();
            await _localDataSource.cacheRoads(entities);
            return Right(entities);
          },
        );
      } catch (e) {
        if (localData != null) return Right(localData);
        return Left(NetworkFailure('No internet connection'));
      }
    } catch (e) {
      return Left(CacheFailure('Failed to access local data: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, void>> clearRoadCache() async {
    try {
      await _localDataSource.clearRoadCache();
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure('Failed to clear road cache: $e'));
    }
  }

  // Add this helper method
  bool _isCacheValid(Duration? cacheTimeout) {
    if (cacheTimeout == null) return true;
    // For simplicity, always consider cache valid for now
    // In a real implementation, you'd check timestamps
    return true;
  }
}
