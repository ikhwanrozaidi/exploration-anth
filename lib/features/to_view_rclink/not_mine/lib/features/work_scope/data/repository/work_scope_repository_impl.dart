import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:rclink_app/core/constants/api_query_params.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/repositories/base_sync_repository.dart';
import '../../../company/presentation/bloc/company_state.dart';
import '../../../../features/company/presentation/bloc/company_bloc.dart';
import '../../domain/entities/work_scope.dart';
import '../../domain/repository/work_scope_repository.dart';
import '../datasource/work_scope_local_datasource.dart';
import '../datasource/work_scope_remote_datasource.dart';
import '../models/work_scope_model.dart';

@Injectable(as: WorkScopesRepository)
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
    ApiQueryParams? queryParams,

    required String companyUID,
    String? search,
    String? code,
    bool? allowMultipleQuantities,
    List<String>? expand,

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
      getLocal: () => _localDataSource.getLocal(),

      getRemote: () => _remoteDataSource.getWorkScopes(
        queryParams: ApiQueryParams(),
        companyUID: companyUID,
      ),

      saveLocal: (scopeOfWorks, {bool markForSync = false}) =>
          _localDataSource.saveLocal(scopeOfWorks),

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
