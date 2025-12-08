import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:rclink_app/core/constants/api_query_params.dart';
import 'package:rclink_app/features/contractor_relation/data/datasource/contractor_relation_remote_datasource.dart';
import 'package:rclink_app/features/contractor_relation/data/models/contractor_relation_model.dart';
import 'package:rclink_app/features/contractor_relation/domain/entities/contractor_relation_entity.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/repositories/base_sync_repository.dart';
import '../../../company/presentation/bloc/company_state.dart';
import '../../../company/presentation/bloc/company_bloc.dart';
import '../../domain/repository/contractor_relation_repository.dart';
import '../datasource/contractor_relation_local_datasource.dart';

@Injectable(as: ContractorRelationRepository)
class ContractorRelationRepositoryImpl
    extends
        BaseOfflineSyncRepository<
          List<ContractorRelation>,
          List<ContractorRelationModel>
        >
    implements ContractorRelationRepository {
  final ContractorRelationRemoteDataSource _remoteDataSource;
  final ContractorRelationLocalDataSource _localDataSource;
  final CompanyBloc _companyBloc;

  ContractorRelationRepositoryImpl(
    this._remoteDataSource,
    this._localDataSource,
    this._companyBloc,
  );

  @override
  Future<Either<Failure, List<ContractorRelation>>> getContractorRelation({
    ApiQueryParams? queryParams,

    String? companyUID,
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

      getRemote: () => _remoteDataSource.getContractorRelation(
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
