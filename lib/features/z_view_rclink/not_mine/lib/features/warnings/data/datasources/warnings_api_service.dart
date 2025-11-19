import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../shared/models/api_response.dart';
import '../models/create_report_warning_model.dart';
import '../models/warning_model.dart';

part 'warnings_api_service.g.dart';

@injectable
@RestApi()
abstract class WarningsApiService {
  @factoryMethod
  factory WarningsApiService(Dio dio) = _WarningsApiService;

  /// Create a warning from daily report
  @POST('/companies/{companyUID}/warnings/report')
  Future<ApiResponse<WarningModel>> createReportWarning(
    @Path('companyUID') String companyUID,
    @Body() CreateReportWarningModel data,
  );
}
