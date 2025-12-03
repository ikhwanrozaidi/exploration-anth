import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../../../company/presentation/bloc/company_bloc.dart';
import '../../../company/presentation/bloc/company_state.dart';
import '../../../contractor_relation/presentation/bloc/contractor_relation_bloc.dart';
import '../../../contractor_relation/presentation/bloc/contractor_relation_state.dart';
import '../models/work_scope_model.dart';
import '../models/work_equipment_model.dart';
import '../models/work_quantity_type_model.dart';
import 'work_scope_api_service.dart';

abstract class WorkScopeRemoteDataSource {
  Future<Either<Failure, List<WorkScopeModel>>> getWorkScopes();

  Future<Either<Failure, List<WorkQuantityTypeModel>>> getQuantities(
    String companyUID,
    String workScopeUID,
  );

  Future<Either<Failure, List<WorkEquipmentModel>>> getEquipments(
    String companyUID,
    String workScopeUID,
  );
}

@LazySingleton(as: WorkScopeRemoteDataSource)
class WorkScopeRemoteDataSourceImpl implements WorkScopeRemoteDataSource {
  final WorkScopeApiService _apiService;
  final ContractorRelationBloc _contractorRelationBloc;
  final CompanyBloc _companyBloc;

  WorkScopeRemoteDataSourceImpl(
    this._apiService,
    this._contractorRelationBloc,
    this._companyBloc,
  );

  @override
  Future<Either<Failure, List<WorkScopeModel>>> getWorkScopes() async {
    try {
      final companyState = _companyBloc.state;
      if (companyState is! CompanyLoaded ||
          companyState.selectedCompany == null) {
        return const Left(CacheFailure('No company selected'));
      }

      final companyUID = companyState.selectedCompany!.uid;
      final contractorRelationState = _contractorRelationBloc.state;

      bool isSelf = true;
      String? contractRelationUID;

      if (contractorRelationState is ContractorRelationLoaded &&
          contractorRelationState.selectedContractor != null) {
        final selectedContractor = contractorRelationState.selectedContractor!;
        isSelf = selectedContractor.isSelf ?? true;
        contractRelationUID = selectedContractor.contractRelationUID;
      }

      if (!isSelf &&
          contractRelationUID != null &&
          contractRelationUID.isNotEmpty) {
        print('getPackageWorkScopes RemoteDatasource');

        final response = await _apiService.getPackageWorkScopes(
          companyUID: companyUID,
          contractorRelationUID: contractRelationUID,
        );

        if (response.isSuccess && response.data != null) {
          final workScopes = response.data!.toWorkScopeModels();
          return Right(workScopes);
        } else {
          return Left(
            ServerFailure(response.message, statusCode: response.statusCode),
          );
        }
      } else {
        print('getWorkScopes RemoteDatasource (self/company)');

        final response = await _apiService.getWorkScopes(
          companyUID: companyUID,
          limit: 0,
          expand: ['workEquipments', 'workQuantityTypes'],
        );

        if (response.isSuccess && response.data != null) {
          return Right(response.data!);
        } else {
          return Left(
            ServerFailure(response.message, statusCode: response.statusCode),
          );
        }
      }
    } catch (e) {
      return Left(ServerFailure('Unexpected error: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, List<WorkQuantityTypeModel>>> getQuantities(
    String companyUID,
    String workScopeUID,
  ) async {
    try {
      final response = await _apiService.getQuantityTypes(
        companyUID: companyUID,
        workScopeUID: workScopeUID,
      );

      if (response.isSuccess && response.data != null) {
        return Right(response.data!);
      } else {
        return Left(
          ServerFailure(response.message, statusCode: response.statusCode),
        );
      }
    } catch (e) {
      return Left(ServerFailure('Unexpected error: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, List<WorkEquipmentModel>>> getEquipments(
    String companyUID,
    String workScopeUID,
  ) async {
    try {
      final response = await _apiService.getEquipments(
        companyUID: companyUID,
        workScopeUID: workScopeUID,
      );

      if (response.isSuccess && response.data != null) {
        final equipments = response.data!
            .map((junction) => junction.workEquipment)
            .toList();
        return Right(equipments);
      } else {
        return Left(
          ServerFailure(response.message, statusCode: response.statusCode),
        );
      }
    } catch (e) {
      return Left(ServerFailure('Unexpected error: ${e.toString()}'));
    }
  }
}
