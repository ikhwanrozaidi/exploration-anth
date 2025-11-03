import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/constants/api_query_params.dart';
import '../../../../core/errors/failures.dart';
import '../models/contractor_relation_model.dart';
import 'contractor_relation_api_service.dart';

abstract class ContractorRelationRemoteDataSource {
  Future<Either<Failure, List<ContractorRelationModel>>> getContractorRelation({
    ApiQueryParams? queryParams,
    required String companyUID,
  });
}

@LazySingleton(as: ContractorRelationRemoteDataSource)
class ContractorRelationRemoteDataSourceImpl
    implements ContractorRelationRemoteDataSource {
  final ContractorRelationApiService _apiService;

  ContractorRelationRemoteDataSourceImpl(this._apiService);

  @override
  Future<Either<Failure, List<ContractorRelationModel>>> getContractorRelation({
    ApiQueryParams? queryParams,
    required String companyUID,
  }) async {
    // // TEMPORARY: Use dummy JSON response
    // return await _getDummyResponse();

    final params = queryParams ?? const ApiQueryParams();

    try {
      final response = await _apiService.getContractorsRelated(
        baseParams: params.toQueryParams(),
        companyUID: companyUID,
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

  /// DUMMY!
  Future<Either<Failure, List<ContractorRelationModel>>>
  _getDummyResponse() async {
    try {
      await Future.delayed(const Duration(milliseconds: 500));

      final String jsonString = await rootBundle.loadString(
        'assets/dummy_response/get_contractorrelation_response.json',
      );

      final Map<String, dynamic> jsonData = json.decode(jsonString);

      final List<dynamic> dataList = jsonData['data'] as List<dynamic>;

      final List<ContractorRelationModel> contractors = dataList
          .map(
            (json) =>
                ContractorRelationModel.fromJson(json as Map<String, dynamic>),
          )
          .toList();

      print('✅ Loaded ${contractors.length} contractors from dummy JSON');

      return Right(contractors);
    } catch (e) {
      print('❌ Error loading dummy JSON: $e');
      return Left(ServerFailure('Failed to load dummy data: ${e.toString()}'));
    }
  }
}
