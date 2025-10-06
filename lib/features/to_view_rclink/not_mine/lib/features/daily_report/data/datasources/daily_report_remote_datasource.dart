import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../models/daily_report_model.dart';
import '../models/daily_report_filter_model.dart';
import 'daily_report_api_service.dart';

abstract class DailyReportRemoteDataSource {
  Future<Either<Failure, List<DailyReportModel>>> getDailyReports({
    required String companyUID,
    int page = 1,
    int limit = 10,
    String sortOrder = 'asc',
  });
}

@LazySingleton(as: DailyReportRemoteDataSource)
class DailyReportRemoteDataSourceImpl implements DailyReportRemoteDataSource {
  final DailyReportApiService _apiService;

  DailyReportRemoteDataSourceImpl(this._apiService);

  @override
  Future<Either<Failure, List<DailyReportModel>>> getDailyReports({
    required String companyUID,
    int page = 1,
    int limit = 10,
    String sortOrder = 'asc',
  }) async {
    try {
      print('🌐 RemoteDataSource: Fetching daily reports');
      print('🌐 RemoteDataSource: companyUID = $companyUID');
      print(
        '🌐 RemoteDataSource: page = $page, limit = $limit, sortOrder = $sortOrder',
      );

      final filter = DailyReportFilterModel(
        page: page,
        limit: limit,
        sortOrder: sortOrder,
        expand: ['workScope', 'road', 'quantities'],
      );

      print('🌐 RemoteDataSource: Calling API...');
      final response = await _apiService.getCompanyDailyReports(
        companyUID,
        filter,
      );

      print('🌐 RemoteDataSource: Response received');
      print('🌐 RemoteDataSource: statusCode = ${response.statusCode}');
      print('🌐 RemoteDataSource: data length = ${response.data.length}');

      if (response.statusCode >= 200 && response.statusCode < 300) {
        print(
          '✅ RemoteDataSource: Success - ${response.data.length} reports found',
        );
        return Right(response.data);
      } else {
        print('❌ RemoteDataSource: API returned error - ${response.message}');
        return Left(
          ServerFailure(response.message, statusCode: response.statusCode),
        );
      }
    } on DioException catch (e) {
      print('❌ RemoteDataSource: DioException caught');
      print('❌ RemoteDataSource: Type = ${e.type}');
      print('❌ RemoteDataSource: Message = ${e.message}');
      print('❌ RemoteDataSource: StatusCode = ${e.response?.statusCode}');

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
