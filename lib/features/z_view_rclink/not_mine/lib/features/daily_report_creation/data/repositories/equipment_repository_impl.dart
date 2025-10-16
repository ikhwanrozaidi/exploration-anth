import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:rclink_app/features/daily_report_creation/data/models/scope_of_work/work_equipment_model.dart';
import 'package:rclink_app/features/daily_report_creation/domain/entities/scope_of_work/work_equipment.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/repositories/base_sync_repository.dart';
import '../../../company/presentation/bloc/company_bloc.dart';
import '../../../company/presentation/bloc/company_state.dart';

import '../../domain/repository/equipment_repository.dart';
import '../datasources/daily_report_creation_remote_datasource.dart';
import '../datasources/daily_report_creation_local_datasource.dart';

@Injectable(as: EquipmentRepository)
class EquipmentRepositoryImpl
    extends
        BaseOfflineSyncRepository<List<WorkEquipment>, List<WorkEquipmentModel>>
    implements EquipmentRepository {
  final DailyReportCreationRemoteDataSource _remoteDataSource;
  final DailyReportCreationLocalDatasource _localDataSource;
  final CompanyBloc _companyBloc;

  EquipmentRepositoryImpl(
    this._remoteDataSource,
    this._localDataSource,
    this._companyBloc,
  );

  @override
  Future<Either<Failure, List<WorkEquipment>>> getEquipments({
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

    final result = await getOfflineFirst(
      getLocal: () => _localDataSource.getCachedEquipments(
        companyUID: companyUID,
        workScopeUID: workScopeUID,
      ),
      getRemote: () =>
          _remoteDataSource.getEquipments(companyUID, workScopeUID),
      saveLocal: (equipments, {bool markForSync = false}) =>
          _localDataSource.cacheEquipments(
            equipments,
            companyUID: companyUID,
            workScopeUID: workScopeUID,
          ),
      toEntity: (models) => models.map((model) => model.toEntity()).toList(),
      forceRefresh: forceRefresh,
      cacheTimeout: cacheTimeout,
    );
    return result;
  }

  @override
  Future<Either<Failure, void>> clearEquipmentCache() async {
    try {
      await _localDataSource.clearEquipmentsCache();
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure('Failed to clear quantities cache: $e'));
    }
  }
}
