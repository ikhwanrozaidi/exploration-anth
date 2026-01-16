import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:rclink_app/features/program/data/models/program_settings/program_setting_model.dart';
import '../../../../core/errors/failures.dart';
import '../../../company/presentation/bloc/company_bloc.dart';
import '../../../company/presentation/bloc/company_state.dart';
import '../../../contractor_relation/presentation/bloc/contractor_relation_bloc.dart';
import '../../../road/data/datasources/road_api_service.dart';
import '../../../road/domain/entities/package_data_response_entity.dart';
import '../../domain/entities/program_settings/program_setting_entity.dart';
import '../models/program_create/create_program_response_model.dart';
import '../models/program_settings/program_settings_filter_model.dart';
import '../models/program_create/submit_program_request_model.dart';
import 'program_api_service.dart';

abstract class ProgramRemoteDataSource {
  Future<Either<Failure, List<ProgramSetting>>> getProgramSettings();
  Future<Either<Failure, PackageDataResponse>> getContractorRoads({
    required String contractorRelationUID,
  });

  Future<Either<Failure, ProgramResponseModel>> submitProgram({
    required String companyUID,
    required SubmitProgramRequestModel requestModel,
  });
}

@LazySingleton(as: ProgramRemoteDataSource)
class ProgramRemoteDataSourceImpl implements ProgramRemoteDataSource {
  final ProgramApiService _apiService;
  final RoadApiService _roadApiService;
  final CompanyBloc _companyBloc;
  final ContractorRelationBloc _contractorRelationBloc;

  ProgramRemoteDataSourceImpl(
    this._apiService,
    this._roadApiService,
    this._companyBloc,
    this._contractorRelationBloc,
  );

  @override
  Future<Either<Failure, List<ProgramSetting>>> getProgramSettings({
    int page = 1,
    int limit = 50,
    String? sortOrder,
    String? sortBy,
    String? workScopeUid,
    String? calculationType,
    bool? isActive,
  }) async {
    try {
      final companyState = _companyBloc.state;
      if (companyState is! CompanyLoaded ||
          companyState.selectedCompany == null) {
        return const Left(CacheFailure('No company selected'));
      }

      final companyUID = companyState.selectedCompany!.uid!;

      final filter = ProgramSettingsFilterModel(
        page: page,
        limit: limit,
        sortOrder: sortOrder,
        sortBy: sortBy,
        workScopeUID: workScopeUid,
        calculationType: calculationType,
        isActive: isActive,

        expand: ['workScope', 'createdBy', 'quantityTypes'],
      );

      final response = await _apiService.getProgramSettings(companyUID, filter);

      if (response.isSuccess && response.data != null) {
        final entities = response.data!
            .map((model) => model.toEntity())
            .toList();
        return Right(entities);
      } else {
        return Left(
          ServerFailure(response.message, statusCode: response.statusCode),
        );
      }
    } catch (e) {
      print('❌ Error fetching program settings: $e');
      return Left(ServerFailure('Unexpected error: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, PackageDataResponse>> getContractorRoads({
    required String contractorRelationUID,
  }) async {
    try {
      final companyState = _companyBloc.state;
      if (companyState is! CompanyLoaded ||
          companyState.selectedCompany == null) {
        return const Left(CacheFailure('No company selected'));
      }

      final companyUID = companyState.selectedCompany!.uid!;

      print('🚗 Fetching contractor roads for: $contractorRelationUID');

      final response = await _roadApiService.getPackageRoads(
        companyUID: companyUID,
        contractRelationUID: contractorRelationUID,
      );

      if (response.isSuccess && response.data != null) {
        final entity = response.data!.toEntity();
        print('✅ Retrieved ${entity.roads?.length ?? 0} contractor roads');
        return Right(entity);
      } else {
        return Left(
          ServerFailure(response.message, statusCode: response.statusCode),
        );
      }
    } catch (e) {
      print('❌ Error fetching contractor roads: $e');
      return Left(ServerFailure('Unexpected error: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, ProgramResponseModel>> submitProgram({
    required String companyUID,
    required SubmitProgramRequestModel requestModel,
  }) async {
    try {
      print('🌐 Remote Datasource: Calling API...');
      print('   Company UID: $companyUID');

      final response = await _apiService.createProgram(
        companyUID,
        requestModel, // ✅ Pass model directly (Retrofit handles serialization)
      );

      print('✅ Remote Datasource: API response received');

      // API returns array in data field, get first item
      if (response.data != null && response.data!.isNotEmpty) {
        return Right(response.data!.first);
      } else {
        return Left(ServerFailure('No program data in response'));
      }
    } catch (e) {
      print('❌ Error fetching contractor roads: $e');
      return Left(ServerFailure('Unexpected error: ${e.toString()}'));
    }
  }
}
