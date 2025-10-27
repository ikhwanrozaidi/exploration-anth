import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/repositories/base_sync_repository.dart';
import '../../../company/presentation/bloc/company_bloc.dart';
import '../../../company/presentation/bloc/company_state.dart';
import '../../domain/entities/work_quantity_type.dart';

import '../../domain/repository/quantity_repository.dart';
import '../datasources/work_scope_remote_datasource.dart';
import '../datasources/work_scope_local_datasource.dart';
import '../models/work_quantity_type_model.dart';

@LazySingleton(as: QuantityRepository)
class QuantityRepositoryImpl
    extends
        BaseOfflineSyncRepository<
          List<WorkQuantityType>,
          List<WorkQuantityTypeModel>
        >
    implements QuantityRepository {
  final WorkScopeRemoteDataSource _remoteDataSource;
  final WorkScopeLocalDataSource _localDataSource;
  final CompanyBloc _companyBloc;

  QuantityRepositoryImpl(
    this._remoteDataSource,
    this._localDataSource,
    this._companyBloc,
  );

  @override
  Future<Either<Failure, List<WorkQuantityType>>> getQuantities({
    bool forceRefresh = false,
    required String companyUID,
    required String workScopeUID,
    Duration? cacheTimeout = const Duration(hours: 1),
  }) async {
    final currentState = _companyBloc.state;
    if (currentState is! CompanyLoaded ||
        currentState.selectedCompany == null) {
      return const Left(ServerFailure('No company selected'));
    }

    if (currentState.selectedCompany!.uid != companyUID) {
      return const Left(ServerFailure('Company mismatch'));
    }

    return await getOfflineFirst(
      getLocal: () => _localDataSource.getCachedQuantities(
        companyUID: companyUID,
        workScopeUID: workScopeUID,
      ),
      getRemote: () =>
          _remoteDataSource.getQuantities(companyUID, workScopeUID),
      saveLocal: (models, {bool markForSync = false}) =>
          _localDataSource.cacheQuantities(
            models,
            companyUID: companyUID,
            workScopeUID: workScopeUID,
          ),
      toEntity: (models) => models.map((model) => model.toEntity()).toList(),
      forceRefresh: forceRefresh,
      cacheTimeout: cacheTimeout,
    );
  }

  @override
  Future<Either<Failure, void>> clearQuantityCache() async {
    try {
      await _localDataSource.clearQuantitiesCache();
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure('Failed to clear quantities cache: $e'));
    }
  }
}
