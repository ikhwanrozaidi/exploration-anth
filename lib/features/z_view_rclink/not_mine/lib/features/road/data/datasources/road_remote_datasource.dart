import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../models/district_model.dart';
import '../models/province_model.dart';
import '../models/road_model.dart';
import 'road_api_service.dart';

abstract class RoadRemoteDataSource {
  Future<Either<Failure, List<ProvinceModel>>> getStates({
    int? page,
    int? limit,
    String? sortOrder,
    String? sortBy,
    int? countryID,
    String? search,
  });

  Future<Either<Failure, List<DistrictModel>>> getDistricts({
    int? page,
    int? limit,
    String? sortOrder,
    String? sortBy,
    int? stateID,
    String? search,
  });

  Future<Either<Failure, List<RoadModel>>> getRoads({
    int? page,
    int? limit,
    String? sortOrder,
    String? sortBy,
    int? districtID,
    int? mainCategoryID,
    int? secondaryCategoryID,
    String? search,
    double? sectionStartMin,
    double? sectionFinishMax,
  });
}

@LazySingleton(as: RoadRemoteDataSource)
class RoadRemoteDataSourceImpl implements RoadRemoteDataSource {
  final RoadApiService _apiService;

  RoadRemoteDataSourceImpl(this._apiService);

  @override
  Future<Either<Failure, List<ProvinceModel>>> getStates({
    int? page = 1,
    int? limit = 0,
    String? sortOrder = 'asc',
    String? sortBy = 'name',
    int? countryID,
    String? search,
  }) async {
    try {
      final response = await _apiService.getStates(
        page: page,
        limit: limit,
        sortOrder: sortOrder,
        sortBy: sortBy,
        countryID: countryID,
        search: search,
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
    int? page = 1,
    int? limit = 0, // 0 = all items
    String? sortOrder = 'asc',
    String? sortBy = 'name',
    int? stateID,
    String? search,
  }) async {
    try {
      final response = await _apiService.getDistricts(
        page: page,
        limit: limit,
        sortOrder: sortOrder,
        sortBy: sortBy,
        stateID: stateID,
        search: search,
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
  Future<Either<Failure, List<RoadModel>>> getRoads({
    int? page = 1,
    int? limit = 0, // 0 = all items
    String? sortOrder = 'asc',
    String? sortBy = 'name',
    int? districtID,
    int? mainCategoryID,
    int? secondaryCategoryID,
    String? search,
    double? sectionStartMin,
    double? sectionFinishMax,
  }) async {
    try {
      final response = await _apiService.getRoads(
        page: page,
        limit: limit,
        sortOrder: sortOrder,
        sortBy: sortBy,
        districtID: districtID,
        mainCategoryID: mainCategoryID,
        secondaryCategoryID: secondaryCategoryID,
        search: search,
        sectionStartMin: sectionStartMin,
        sectionFinishMax: sectionFinishMax,
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
}
