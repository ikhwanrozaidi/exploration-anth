import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:injectable/injectable.dart';
import '../../../../shared/models/api_response.dart';
import '../../../../shared/models/paginated_result.dart';
import '../models/daily_report_model.dart';
import '../models/create_daily_report_model.dart';
import '../models/daily_report_filter_model.dart';

part 'daily_report_api_service.g.dart';

@injectable
@RestApi()
abstract class DailyReportApiService {
  @factoryMethod
  factory DailyReportApiService(Dio dio) = _DailyReportApiService;

  /// Get all daily reports for a company
  @GET('/companies/{companyUID}/daily-reports')
  Future<ApiResponse<PaginatedResult<DailyReportModel>>> getCompanyDailyReports(
    @Path('companyUID') String companyUID,
    @Queries() DailyReportFilterModel filter,
  );

  /// Create a new daily report for the company
  @POST('/companies/{companyUID}/daily-reports')
  Future<ApiResponse<DailyReportModel>> createDailyReport(
    @Path('companyUID') String companyUID,
    @Body() CreateDailyReportModel data,
  );
}
