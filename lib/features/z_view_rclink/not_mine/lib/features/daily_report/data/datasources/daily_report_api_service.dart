import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:injectable/injectable.dart';
import '../models/daily_report_model.dart';
import '../models/create_daily_report_model.dart';
import '../models/daily_report_filter_model.dart';
import '../models/daily_report_response_model.dart';
import '../../../../shared/models/api_response.dart';
import '../../../../core/sync/models/file_response_dto.dart';

part 'daily_report_api_service.g.dart';

@injectable
@RestApi()
abstract class DailyReportApiService {
  @factoryMethod
  factory DailyReportApiService(Dio dio) = _DailyReportApiService;

  /// Get all daily reports for a company
  @GET('/companies/{companyUID}/daily-reports')
  Future<DailyReportResponseModel> getCompanyDailyReports(
    @Path('companyUID') String companyUID,
    @Queries() DailyReportFilterModel filter,
  );

  /// Get a single daily report by ID
  @GET('/companies/{companyUID}/daily-reports/{dailyReportUID}')
  Future<ApiResponse<DailyReportModel>> getDailyReportById(
    @Path('companyUID') String companyUID,
    @Path('dailyReportUID') String dailyReportUID,
    @Query('expand') List<String>? expand,
  );

  /// Create a new daily report for the company
  @POST('/companies/{companyUID}/daily-reports')
  Future<ApiResponse<DailyReportModel>> createDailyReport(
    @Path('companyUID') String companyUID,
    @Body() CreateDailyReportModel data,
  );

  /// Upload images for a daily report
  @POST('/companies/{companyUID}/daily-reports/{dailyReportUID}/files')
  @MultiPart()
  Future<ApiResponse<List<FileResponseDto>>> uploadDailyReportFiles(
    @Path('companyUID') String companyUID,
    @Path('dailyReportUID') String dailyReportUID,
    @Part(name: 'BEFORE_IMAGE') List<MultipartFile>? beforeImages,
    @Part(name: 'INPROGRESS_IMAGE') List<MultipartFile>? inprogressImages,
    @Part(name: 'AFTER_IMAGE') List<MultipartFile>? afterImages,
    @Part(name: 'WORKERS_IMAGE') List<MultipartFile>? workersImages,
  );
}
