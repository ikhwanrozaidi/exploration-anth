import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../shared/models/api_response.dart';
import '../../domain/entities/program_view/program_filter_model.dart';
import '../models/program_create/create_program_response_model.dart';
import '../models/program_settings/program_setting_model.dart';
import '../models/program_settings/program_settings_filter_model.dart';
import '../models/program_create/submit_program_request_model.dart';

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

  @POST('/companies/{companyUID}/programs')
  Future<ApiResponse<List<ProgramResponseModel>>> createProgram(
    @Path('companyUID') String companyUID,
    @Body() SubmitProgramRequestModel requestBody,
  );

  @GET('/companies/{companyUID}/programs')
  Future<ApiResponse<dynamic>> getPrograms(
    @Path('companyUID') String companyUID,
    @Queries() ProgramFilterModel filter,
  );

  @GET('/companies/{companyUID}/programs/{uid}')
  Future<ApiResponse<dynamic>> getProgramDetail(
    @Path('companyUID') String companyUID,
    @Path('uid') String uid,
    @Queries() Map<String, dynamic> queries,
  );
}
