import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import 'package:rclink_app/features/daily_report_creation/data/datasources/daily_report_creation_api_service.dart';
import 'package:rclink_app/features/daily_report_creation/data/models/scope_of_work/scope_of_work_model.dart';
import '../../../../core/errors/failures.dart';
import '../models/province/district_model.dart';
import '../models/province/province_model.dart';
import '../models/province/road_model.dart';

abstract class DailyReportCreationRemoteDataSource {
  Future<Either<Failure, List<ScopeOfWorkModel>>> getWorkScopes(
    String companyUID,
  );

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

@LazySingleton(as: DailyReportCreationRemoteDataSource)
class DailyReportCreationRemoteDataSourceImpl
    implements DailyReportCreationRemoteDataSource {
  final DailyReportCreationApiService _apiService;

  DailyReportCreationRemoteDataSourceImpl(this._apiService);

  @override
  Future<Either<Failure, List<ScopeOfWorkModel>>> getWorkScopes(
    String companyUID,
  ) async {
    try {
      final response = await _apiService.getWorkScopes(
        companyUID: companyUID,
        limit: 0, // Get all
        expand: ['workEquipments', 'workQuantityTypes'], // Always expanded
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
      // print('🌐 Fetching districts from API with params:');
      // print('   page: $page, limit: $limit, sortOrder: $sortOrder');
      // print('   sortBy: $sortBy, stateID: $stateID, search: $search');

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
        final error = 'API Error: ${response.message}';
        print('❌ getDistricts: $error');
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
      // print('🌐 Fetching roads from API with params:');
      // print('   page: $page, limit: $limit, sortOrder: $sortOrder');
      // print('   sortBy: $sortBy, districtID: $districtID');
      // print('   mainCategoryID: $mainCategoryID, secondaryCategoryID: $secondaryCategoryID',);
      // print('   search: $search, sectionStartMin: $sectionStartMin, sectionFinishMax: $sectionFinishMax',);

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
        final error = 'API Error: ${response.message}';
        print('❌ getRoads: $error');
        return Left(
          ServerFailure(response.message, statusCode: response.statusCode),
        );
      }
    } catch (e) {
      return Left(ServerFailure('Unexpected error: ${e.toString()}'));
    }
  }
}
