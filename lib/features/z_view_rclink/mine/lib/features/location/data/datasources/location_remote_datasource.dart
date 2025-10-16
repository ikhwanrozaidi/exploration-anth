import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/constants/api_query_params.dart';
import '../../../../core/errors/failures.dart';

import '../models/district_model.dart';
import '../models/province_model.dart';
import '../models/road_model.dart';
import 'location_api_service.dart';

abstract class LocationRemoteDataSource {
  Future<Either<Failure, List<ProvinceModel>>> getStates({
    ApiQueryParams? queryParams,
    int? countryID,
  });

  Future<Either<Failure, List<DistrictModel>>> getDistricts({
    ApiQueryParams? queryParams,
    int? stateID,
  });

  Future<Either<Failure, List<RoadModel>>> getRoads({
    ApiQueryParams? queryParams,

    int? districtID,
    int? mainCategoryID,
    int? secondaryCategoryID,
    double? sectionStartMin,
    double? sectionFinishMax,
  });
}

@LazySingleton(as: LocationRemoteDataSource)
class LocationRemoteDataSourceImpl implements LocationRemoteDataSource {
  final LocationApiService _apiService;

  LocationRemoteDataSourceImpl(this._apiService);

  @override
  Future<Either<Failure, List<ProvinceModel>>> getStates({
    ApiQueryParams? queryParams,
    int? countryID,
  }) async {
    final params = queryParams ?? const ApiQueryParams();

    try {
      final response = await _apiService.getStates(
        baseParams: params.toQueryParams(),
        countryID: countryID,
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
  Future<Either<Failure, List<DistrictModel>>> getDistricts({
    ApiQueryParams? queryParams,
    int? stateID,
  }) async {
    final params = queryParams ?? const ApiQueryParams();

    try {
      final response = await _apiService.getDistricts(
        baseParams: params.toQueryParams(),
        stateID: stateID,
      );

      if (response.isSuccess && response.data != null) {
        return Right(response.data!);
      } else {
        // final error = 'API Error: ${response.message}';
        // print('❌ getDistricts: $error');
        return Left(
          ServerFailure(response.message, statusCode: response.statusCode),
        );
      }
    } catch (e) {
      return Left(ServerFailure('Unexpected error: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, List<RoadModel>>> getRoads({
    ApiQueryParams? queryParams,

    int? districtID,
    int? mainCategoryID,
    int? secondaryCategoryID,
    double? sectionStartMin,
    double? sectionFinishMax,
  }) async {
    final params = queryParams ?? const ApiQueryParams();

    try {
      final response = await _apiService.getRoads(
        baseParams: params.toQueryParams(),

        districtID: districtID,
        mainCategoryID: mainCategoryID,
        secondaryCategoryID: secondaryCategoryID,
        sectionStartMin: sectionStartMin,
        sectionFinishMax: sectionFinishMax,
      );

      if (response.isSuccess && response.data != null) {
        return Right(response.data!);
      } else {
        // final error = 'API Error: ${response.message}';
        // print('❌ getRoads: $error');
        return Left(
          ServerFailure(response.message, statusCode: response.statusCode),
        );
      }
    } catch (e) {
      return Left(ServerFailure('Unexpected error: ${e.toString()}'));
    }
  }
}
