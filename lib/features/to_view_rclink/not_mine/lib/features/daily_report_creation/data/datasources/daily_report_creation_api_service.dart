import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../../shared/models/api_response.dart';
import '../models/scope_of_work_model.dart';

part 'daily_report_creation_api_service.g.dart';

@injectable
@RestApi()
abstract class DailyReportCreationApiService {
  @factoryMethod
  factory DailyReportCreationApiService(Dio dio) =
      _DailyReportCreationApiService;

  @GET('/companies/{companyUid}/work-scopes')
  Future<ApiResponse<List<ScopeOfWorkModel>>> getScopeOfWWork();
}
