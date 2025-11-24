import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../models/create_report_warning_model.dart';
import '../models/warning_filter_model.dart';
import '../models/warning_list_response_model.dart';
import '../models/warning_model.dart';
import 'warnings_api_service.dart';

abstract class WarningsRemoteDataSource {
  // CREATE Warning
  Future<Either<Failure, WarningModel>> createReportWarning({
    required CreateReportWarningModel data,
    required String companyUID,
  });

  // GET Warning
  Future<Either<Failure, List<WarningModel>>> getWarnings({
    required String companyUID,
    int page = 1,
    int limit = 50,
    String sortOrder = 'desc',
    List<String>? warningType,
    String? roadUID,
    String? workScopeUID,
    String? contractRelationUID,
    String? dailyReportUID,
    bool? isResolved,
    bool? requiresAction,
  });

  // GET Warning by Uid
  Future<Either<Failure, WarningModel>> getWarningById({
    required String companyUID,
    required String uid,
  });
}

@LazySingleton(as: WarningsRemoteDataSource)
class WarningsRemoteDataSourceImpl implements WarningsRemoteDataSource {
  final WarningsApiService _apiService;

  WarningsRemoteDataSourceImpl(this._apiService);

  /// CREATE Warning
  @override
  Future<Either<Failure, WarningModel>> createReportWarning({
    required CreateReportWarningModel data,
    required String companyUID,
  }) async {
    try {
      final response = await _apiService.createReportWarning(companyUID, data);

      if (response.statusCode >= 200 && response.statusCode < 300) {
        if (response.data != null) {
          return Right(response.data!);
        } else {
          return const Left(ServerFailure('No data returned from server'));
        }
      } else {
        return Left(
          ServerFailure(
            response.message ?? 'Failed to create warning',
            statusCode: response.statusCode,
          ),
        );
      }
    } on DioException catch (e) {
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

  /// GET Warning
  @override
  Future<Either<Failure, List<WarningModel>>> getWarnings({
    required String companyUID,
    int page = 1,
    int limit = 50,
    String sortOrder = 'desc',
    List<String>? warningType,
    String? roadUID,
    String? workScopeUID,
    String? contractRelationUID,
    String? dailyReportUID,
    bool? isResolved,
    bool? requiresAction,
  }) async {
    try {
      final filter = WarningFilterModel(
        warningType: warningType,
        roadID: roadUID,
        workScopeID: workScopeUID,
        contractRelationID: contractRelationUID,
        dailyReportID: dailyReportUID,
        isResolved: isResolved,
        requiresAction: requiresAction,
        expand: [
          'workScope',
          'road',
          'contractRelation',
          'files',
          'createdBy',
          'company',
        ],
      );

      final response = await _apiService.getWarnings(companyUID, filter);

      if (response.statusCode >= 200 && response.statusCode < 300) {
        print('✅ Total Warnings: ${response.data.length}');

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
  Future<Either<Failure, WarningModel>> getWarningById({
    required String companyUID,
    required String uid,
  }) async {
    try {
      final response = await _apiService.getWarningByUid(companyUID, uid, [
        'dailyReport',
        'resolvedBy',
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
}
