import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../../../../shared/models/api_response.dart';
import '../../../contractor_relation/presentation/bloc/contractor_relation_bloc.dart';
import '../../../contractor_relation/presentation/bloc/contractor_relation_state.dart';
import '../../../company/presentation/bloc/company_bloc.dart';
import '../../../company/presentation/bloc/company_state.dart';
import '../models/package_data_response_model.dart';
import 'road_api_service.dart';

abstract class RoadRemoteDataSource {
  Future<Either<Failure, PackageDataResponseModel>> getRoads();
}

@LazySingleton(as: RoadRemoteDataSource)
class RoadRemoteDataSourceImpl implements RoadRemoteDataSource {
  final RoadApiService _apiService;
  final ContractorRelationBloc _contractorRelationBloc;
  final CompanyBloc _companyBloc;

  RoadRemoteDataSourceImpl(
    this._apiService,
    this._contractorRelationBloc,
    this._companyBloc,
  );

  @override
  Future<Either<Failure, PackageDataResponseModel>> getRoads() async {
    // TEMPORARY: Use dummy JSON response
    return await _getDummyResponse();

    // try {
    //   // Get company UID from CompanyBloc
    //   final companyState = _companyBloc.state;
    //   if (companyState is! CompanyLoaded ||
    //       companyState.selectedCompany == null) {
    //     return const Left(CacheFailure('No company selected'));
    //   }
    //   final companyUID = companyState.selectedCompany!.uid!;

    //   // Get contractor relation info from ContractorRelationBloc
    //   final contractorRelationState = _contractorRelationBloc.state;

    //   if (contractorRelationState is! ContractorRelationLoaded ||
    //       contractorRelationState.selectedContractor == null) {
    //     return const Left(CacheFailure('No contractor relation selected'));
    //   }

    //   final selectedContractor = contractorRelationState.selectedContractor!;
    //   final isSelf = selectedContractor.isSelf ?? false;
    //   final contractRelationUID = selectedContractor.contractRelationUID;

    //   // Conditional API call based on isSelf and contractRelationUID
    //   final ApiResponse<PackageDataResponseModel> response;

    //   if (isSelf == false &&
    //       contractRelationUID != null &&
    //       contractRelationUID.isNotEmpty) {
    //     // Call contractor package-roads endpoint
    //     response = await _apiService.getPackageRoads(
    //       companyUID: companyUID,
    //       contractRelationUID: contractRelationUID,
    //     );
    //   } else {
    //     // Call company roads endpoint (when isSelf = true or no contractRelationUID)
    //     response = await _apiService.getCompanyRoads(companyUID: companyUID);
    //   }

    //   if (response.isSuccess && response.data != null) {
    //     return Right(response.data!);
    //   } else {
    //     return Left(
    //       ServerFailure(response.message, statusCode: response.statusCode),
    //     );
    //   }
    // } catch (e) {
    //   return Left(ServerFailure('Unexpected error: ${e.toString()}'));
    // }
  }

  /// DUMMY!
  Future<Either<Failure, PackageDataResponseModel>> _getDummyResponse() async {
    try {
      await Future.delayed(const Duration(milliseconds: 500));

      final String jsonString = await rootBundle.loadString(
        'assets/dummy_response/get_packageroads_response.json',
      );

      final Map<String, dynamic> jsonData = json.decode(jsonString);

      // Extract the 'data' object from response
      final Map<String, dynamic> dataObject =
          jsonData['data'] as Map<String, dynamic>;

      // Parse into PackageDataResponseModel
      final PackageDataResponseModel packageData =
          PackageDataResponseModel.fromJson(dataObject);

      print('✅ Loaded package roads data from dummy JSON');
      print('   - Package: ${packageData.package?.name}');
      print('   - Countries: ${packageData.countries?.length ?? 0}');
      print('   - States: ${packageData.states?.length ?? 0}');
      print('   - Districts: ${packageData.districts?.length ?? 0}');
      print('   - Roads: ${packageData.roads?.length ?? 0}');
      print('   - PackageRoads: ${packageData.packageRoads?.length ?? 0}');

      return Right(packageData);
    } catch (e) {
      print('❌ Error loading dummy JSON: $e');
      return Left(ServerFailure('Failed to load dummy data: ${e.toString()}'));
    }
  }
}
