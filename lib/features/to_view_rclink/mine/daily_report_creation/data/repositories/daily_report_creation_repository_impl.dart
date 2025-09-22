import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/repositories/base_sync_repository.dart';
import '../../../company/presentation/bloc/company_state.dart';
import '../../domain/entities/scope_of_work.dart';
import '../../domain/repository/daily_report_creation_repository.dart';
import '../datasources/daily_report_creation_remote_datasource.dart';
import '../datasources/daily_report_creation_local_datasource.dart';
import '../models/scope_of_work_model.dart';
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
      saveLocal: (models, {bool markForSync = false}) =>
          _localDataSource.cacheScopeOfWorks(models),
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
