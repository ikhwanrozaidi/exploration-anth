import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../../data/datasources/daily_report_api_service.dart';
import '../models/create_daily_report_model.dart';
import '../models/update_daily_report_model.dart';
import '../models/daily_report_model.dart';
import '../models/daily_report_filter_model.dart';
import '../models/approve_daily_report_dto.dart';

abstract class DailyReportRemoteDataSource {
  Future<Either<Failure, List<DailyReportModel>>> getDailyReports({
    required String companyUID,
    int page = 1,
    int limit = 10,
    String sortOrder = 'asc',
    String? search,
    String? roadUid,
    String? workScopeUid,
    String? contractorUid,
    String? fromDate,
    String? toDate,
  });

  Future<Either<Failure, DailyReportModel>> getDailyReportById({
    required String companyUID,
    required String dailyReportUID,
  });

  Future<Either<Failure, DailyReportModel>> createDailyReport({
    required CreateDailyReportModel data,
    required String companyUID,
  });

  Future<Either<Failure, DailyReportModel>> updateDailyReport({
    required String companyUID,
    required String dailyReportUID,
    required UpdateDailyReportModel data,
  });

  Future<Either<Failure, DailyReportModel>> approveDailyReport({
    required String companyUID,
    required String dailyReportUID,
    required String reviewComment,
  });

  // Future<Either<Failure, List<RoadModel>>> getRoadsByDistrictName(
  //   String districtName,
  // );
}

@LazySingleton(as: DailyReportRemoteDataSource)
class DailyReportRemoteDataSourceImpl implements DailyReportRemoteDataSource {
  final DailyReportApiService _apiService;

  DailyReportRemoteDataSourceImpl(this._apiService);

  @override
  Future<Either<Failure, List<DailyReportModel>>> getDailyReports({
    required String companyUID,
    int page = 1,
    int limit = 50,
    String sortOrder = 'desc',
    String? search,
    String? roadUid,
    String? workScopeUid,
    String? contractorUid,
    String? fromDate,
    String? toDate,
  }) async {
    try {
      final filter = DailyReportFilterModel(
        page: page,
        limit: limit,
        sortOrder: sortOrder,
        search: search,
        roadUID: roadUid,
        workScopeUID: workScopeUid,
        contractorRelationUID: contractorUid,
        fromDate: fromDate,
        toDate: toDate,

        expand: [
          'contractRelation',
          'workScope',
          'road',
          'quantities',
          'equipments',
          'files',
          'company',
          'createdBy',
        ],
      );

      final response = await _apiService.getCompanyDailyReports(
        companyUID,
        filter,
      );

      if (response.statusCode >= 200 && response.statusCode < 300) {
        print('Total Reports: ${response.data.length}');
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
  Future<Either<Failure, DailyReportModel>> getDailyReportById({
    required String companyUID,
    required String dailyReportUID,
  }) async {
    try {
      final response = await _apiService
          .getDailyReportById(companyUID, dailyReportUID, [
            'contractRelation',
            'workScope',
            'road',
            'quantities',
            'equipments',
            'files',
            'company',
            'createdBy',
            'warning',
          ]);

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(response.data!);
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
  Future<Either<Failure, DailyReportModel>> updateDailyReport({
    required String companyUID,
    required String dailyReportUID,
    required UpdateDailyReportModel data,
  }) async {
    try {
      final response = await _apiService.updateDailyReport(
        companyUID,
        dailyReportUID,
        data,
      );

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(response.data!);
      } else {
        print('❌ RemoteDataSource: Update failed - ${response.message}');
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
      if (e.response?.statusCode == 403) {
        return const Left(UnauthorizedFailure());
      }
      if (e.response?.statusCode == 400) {
        return Left(
          ValidationFailure(e.response?.data['message'] ?? 'Invalid data'),
        );
      }
      return Left(NetworkFailure('Network error: ${e.message}'));
    } catch (e) {
      print('❌ RemoteDataSource: Update unexpected error - $e');
      return Left(ServerFailure('Unexpected error: $e'));
    }
  }

  @override
  Future<Either<Failure, DailyReportModel>> approveDailyReport({
    required String companyUID,
    required String dailyReportUID,
    required String reviewComment,
  }) async {
    print('🟡 [DailyReportRemoteDataSource] approveDailyReport called');
    try {
      final dto = ApproveDailyReportDto(reviewComment: reviewComment);
      print('🟡 [DailyReportRemoteDataSource] Making API call...');

      final response = await _apiService.approveDailyReport(
        companyUID,
        dailyReportUID,
        dto,
      );

      print(
        '🟡 [DailyReportRemoteDataSource] API response received, status: ${response.statusCode}',
      );

      if (response.statusCode >= 200 && response.statusCode < 300) {
        if (response.data != null) {
          print(
            '✅ [DailyReportRemoteDataSource] Success! Returning updated report',
          );
          return Right(response.data!);
        } else {
          print('❌ [DailyReportRemoteDataSource] No data in response');
          return const Left(ServerFailure('No data returned from server'));
        }
      } else {
        print(
          '❌ [DailyReportRemoteDataSource] Bad status code: ${response.statusCode}',
        );
        return Left(
          ServerFailure(
            response.message ?? 'Failed to approve daily report',
            statusCode: response.statusCode,
          ),
        );
      }
    } on DioException catch (e) {
      print('❌ [DailyReportRemoteDataSource] DioException: ${e.message}');
      // Handle specific HTTP status codes
      if (e.response?.statusCode == 401) {
        return const Left(UnauthorizedFailure());
      }

      if (e.response?.statusCode == 403) {
        return const Left(ForbiddenFailure());
      }

      if (e.response?.statusCode == 404) {
        return const Left(NotFoundFailure());
      }

      if (e.response?.statusCode == 400 || e.response?.statusCode == 422) {
        final errorMessage = e.response?.data is Map
            ? (e.response?.data['message'] ?? 'Invalid data provided')
            : 'Invalid data provided';
        return Left(ValidationFailure(errorMessage));
      }

      // Network/timeout errors
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.sendTimeout) {
        return const Left(TimeoutFailure());
      }

      if (e.type == DioExceptionType.connectionError ||
          e.type == DioExceptionType.unknown) {
        return Left(
          NetworkFailure(
            'Network error: ${e.message ?? "Please check your connection"}',
          ),
        );
      }

      // Server error (5xx)
      if (e.response?.statusCode != null && e.response!.statusCode! >= 500) {
        return Left(
          ServerFailure(
            'Server error: ${e.response?.data?['message'] ?? e.message}',
            statusCode: e.response?.statusCode,
          ),
        );
      }

      return Left(NetworkFailure('Network error: ${e.message}'));
    } catch (e) {
      return Left(ServerFailure('Unexpected error: $e'));
    }
  }

  // @override
  // Future<Either<Failure, List<RoadModel>>> getRoadsByDistrictName(
  //   String districtName,
  // ) async {
  //   try {
  //     final response = await _roadApiService.getRoads(
  //       search: districtName,
  //       limit: 0, // Get all roads
  //     );

  //     if (response.isSuccess && response.data != null) {
  //       // Convert RoadModel (from road feature) to RoadEditModel
  //       final roadModels = response.data!
  //           .map((roadModel) => roadModel)
  //           .toList();

  //       return Right(roadModels);
  //     } else {
  //       return Left(
  //         ServerFailure(response.message, statusCode: response.statusCode),
  //       );
  //     }
  //   } catch (e) {
  //     return Left(ServerFailure('Unexpected error: ${e.toString()}'));
  //   }
  // }
}
