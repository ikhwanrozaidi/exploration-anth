import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:rclink_app/features/warnings/data/models/warning_filter_model.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../core/sync/models/file_response_dto.dart';
import '../../../../shared/models/api_response.dart';
import '../models/create_report_warning_model.dart';
import '../models/create_warning_model.dart';
import '../models/resolve_warning_item_dto.dart';
import '../models/warning_list_response_model.dart';
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

  /// Get warnings listings
  @GET('/companies/{companyUID}/warnings')
  Future<WarningListResponseModel> getWarnings(
    @Path('companyUID') String companyUID,
    @Queries() WarningFilterModel filter,
  );

  /// Get single warning by UID
  @GET('/companies/{companyUID}/warnings/{uid}')
  Future<ApiResponse<WarningModel>> getWarningByUid(
    @Path('companyUID') String companyUID,
    @Path('uid') String uid,
    @Query('expand') List<String>? expand,
  );

  /// Resolve a warning item
  @PUT('/companies/{companyUID}/warnings/{warningUID}/items/{itemUID}/resolve')
  Future<ApiResponse<WarningModel>> resolveWarningItem(
    @Path('companyUID') String companyUID,
    @Path('warningUID') String warningUID,
    @Path('itemUID') String itemUID,
    @Body() ResolveWarningItemDto dto,
  );

  /// Create a warning from site inspection
  @POST('/companies/{companyUID}/warnings/site')
  Future<ApiResponse<WarningModel>> createSiteWarning(
    @Path('companyUID') String companyUID,
    @Body() CreateWarningModel data,
  );

  @POST('/companies/{companyUID}/warnings/{uid}/files')
  @MultiPart()
  Future<ApiResponse<List<FileResponseDto>>> uploadWarningFiles(
    @Path('companyUID') String companyUID,
    @Path('uid') String warningUID,
    @Part(name: 'WARNING_IMAGE') List<MultipartFile>? warningImages,
  );
}
