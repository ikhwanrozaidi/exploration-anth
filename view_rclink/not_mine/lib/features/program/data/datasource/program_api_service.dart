import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../shared/models/api_response.dart';
import '../models/create_program_response_model.dart';
import '../models/program_setting_model.dart';
import '../models/program_settings_filter_model.dart';
import '../models/submit_program_request_model.dart';

part 'program_api_service.g.dart';

@injectable
@RestApi()
abstract class ProgramApiService {
  @factoryMethod
  factory ProgramApiService(Dio dio) = _ProgramApiService;

  @GET('/companies/{companyUID}/program-settings')
  Future<ApiResponse<List<ProgramSettingModel>>> getProgramSettings(
    @Path('companyUID') String companyUID,
    @Queries() ProgramSettingsFilterModel filter,
  );

  @POST('companies/{companyUID}/programs')
  Future<ApiResponse<List<ProgramResponseModel>>> createProgram(
    @Path('companyUID') String companyUID,
    @Body() SubmitProgramRequestModel requestBody,
  );

  // @GET('/companies/{companyUID}/programs')
  // Future<ApiResponse<List<ProgramModel>>> getPrograms({
  //   @Path('companyUID') required String companyUID,
  // });

  // @POST('/companies/{companyUID}/programs')
  // Future<ApiResponse<ProgramModel>> createProgram({
  //   @Path('companyUID') required String companyUID,
  //   @Body() required Map<String, dynamic> body,
  // });
}
