import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/repositories/base_sync_repository.dart';
import '../../../company/presentation/bloc/company_state.dart';
import '../../domain/entities/work_scope.dart';
import '../../domain/repository/workscopes_repository.dart';
import '../datasources/work_scope_remote_datasource.dart';
import '../datasources/work_scope_local_datasource.dart';
import '../models/work_scope_model.dart';
import '../../../../features/company/presentation/bloc/company_bloc.dart';

@LazySingleton(as: WorkScopesRepository)
class WorkScopesRepositoryImpl
    extends BaseOfflineSyncRepository<List<WorkScope>, List<WorkScopeModel>>
    implements WorkScopesRepository {
  final WorkScopeRemoteDataSource _remoteDataSource;
  final WorkScopeLocalDataSource _localDataSource;
  final CompanyBloc _companyBloc;

  WorkScopesRepositoryImpl(
    this._remoteDataSource,
    this._localDataSource,
    this._companyBloc,
  );

  @override
  Future<Either<Failure, List<WorkScope>>> getWorkScopes({
    bool forceRefresh = false,
    Duration? cacheTimeout = const Duration(hours: 1),
  }) async {
    final currentState = _companyBloc.state;
    if (currentState is! CompanyLoaded ||
        currentState.selectedCompany == null) {
      return const Left(ServerFailure('No company selected'));
    }

    final companyUID = currentState.selectedCompany!.uid;

    return await getOfflineFirst(
      getLocal: () => _localDataSource.getCachedWorkScopeModels(),
      getRemote: () => _remoteDataSource.getWorkScopes(),

      saveLocal: (models, {bool markForSync = false}) =>
          _localDataSource.cacheWorkScopeModels(models),
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
}
