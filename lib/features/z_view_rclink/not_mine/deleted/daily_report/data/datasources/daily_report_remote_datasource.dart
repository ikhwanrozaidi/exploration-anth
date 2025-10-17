import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../../../daily_report_creation/data/datasources/daily_report_creation_api_service.dart';
import '../models/create_daily_report_model.dart';
import '../models/daily_report_model.dart';
import '../models/daily_report_filter_model.dart';
import '../models/road_edit_model.dart';
import 'daily_report_api_service.dart';

abstract class DailyReportRemoteDataSource {
  Future<Either<Failure, List<DailyReportModel>>> getDailyReports({
    required String companyUID,
    int page = 1,
    int limit = 10,
    String sortOrder = 'asc',
  });

  Future<Either<Failure, DailyReportModel>> createDailyReport({
    required CreateDailyReportModel data,
    required String companyUID,
  });

  Future<Either<Failure, List<RoadEditModel>>> getRoadsByDistrictName(
    String districtName,
  );
}

@LazySingleton(as: DailyReportRemoteDataSource)
class DailyReportRemoteDataSourceImpl implements DailyReportRemoteDataSource {
  final DailyReportApiService _apiService;
  final DailyReportCreationApiService _dailyCreationapiService;

  DailyReportRemoteDataSourceImpl(
    this._apiService,
    this._dailyCreationapiService,
  );

  @override
  Future<Either<Failure, List<DailyReportModel>>> getDailyReports({
    required String companyUID,
    int page = 1,
    int limit = 10,
    String sortOrder = 'asc',
  }) async {
    try {
      final filter = DailyReportFilterModel(
        page: page,
        limit: limit,
        sortOrder: sortOrder,
        expand: ['workScope', 'road', 'quantities', 'equipments'],
      );

      final response = await _apiService.getCompanyDailyReports(
        companyUID,
        filter,
      );

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(response.data);
      } else {
        print('❌ RemoteDataSource: API returned error - ${response.message}');
        return Left(
          ServerFailure(response.message, statusCode: response.statusCode),
        );
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        return const Left(NotFoundFailure());
      }
      if (e.response?.statusCode == 401) {
        return const Left(UnauthorizedFailure());
      }
      return Left(NetworkFailure('Network error: ${e.message}'));
    } catch (e) {
      print('❌ RemoteDataSource: Unexpected error - $e');
      return Left(ServerFailure('Unexpected error: $e'));
    }
  }

  @override
  Future<Either<Failure, DailyReportModel>> createDailyReport({
    required CreateDailyReportModel data,
    required String companyUID,
  }) async {
    try {
      final response = await _apiService.createDailyReport(companyUID, data);

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(response.data!);
      } else {
        print('❌ RemoteDataSource: Create failed - ${response.message}');
        return Left(
          ServerFailure(response.message, statusCode: response.statusCode),
        );
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        return const Left(NotFoundFailure());
      }
      if (e.response?.statusCode == 401) {
        return const Left(UnauthorizedFailure());
      }
      if (e.response?.statusCode == 400) {
        return Left(
          ValidationFailure(e.response?.data['message'] ?? 'Invalid data'),
        );
      }
      return Left(NetworkFailure('Network error: ${e.message}'));
    } catch (e) {
      print('❌ RemoteDataSource: Create unexpected error - $e');
      return Left(ServerFailure('Unexpected error: $e'));
    }
  }

  @override
  Future<Either<Failure, List<RoadEditModel>>> getRoadsByDistrictName(
    String districtName,
  ) async {
    try {
      final response = await _dailyCreationapiService.getRoads(
        search: districtName,
        limit: 0, // Get all roads
      );

      if (response.isSuccess && response.data != null) {
        // Convert RoadModel (from daily_report_creation) to RoadEditModel
        final roadEditModels = response.data!
            .map((roadModel) => RoadEditModel.fromCreationRoadModel(roadModel))
            .toList();

        return Right(roadEditModels);
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
