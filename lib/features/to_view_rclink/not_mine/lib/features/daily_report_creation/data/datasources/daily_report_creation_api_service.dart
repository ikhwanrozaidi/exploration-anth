import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../../shared/models/api_response.dart';
import '../models/province/province_model.dart';
import '../models/scope_of_work/scope_of_work_model.dart';

part 'daily_report_creation_api_service.g.dart';

@injectable
@RestApi()
abstract class DailyReportCreationApiService {
  @factoryMethod
  factory DailyReportCreationApiService(Dio dio) =
      _DailyReportCreationApiService;

  @GET('/companies/{companyUID}/work-scopes')
  Future<ApiResponse<List<ScopeOfWorkModel>>> getWorkScopes({
    @Path('companyUID') required String companyUID,
    @Query('page') int? page = 1,
    @Query('limit') int? limit = 0, // 0 = all items
    @Query('sortOrder') String? sortOrder = 'asc',
    @Query('sortBy') String? sortBy,
    @Query('search') String? search,
    @Query('code') String? code,
    @Query('allowMultipleQuantities') bool? allowMultipleQuantities,
    @Query('expand')
    List<String>? expand = const ['workEquipments', 'workQuantityTypes'],
  });

  @GET('/states')
  Future<ApiResponse<List<ProvinceModel>>> getStates({
    @Query('page') int? page = 1,
    @Query('limit') int? limit = 0,
    @Query('sortOrder') String? sortOrder = 'asc',
    @Query('sortBy') String? sortBy = 'name',
    @Query('countryID') int? countryID,
    @Query('search') String? search,
  });
}
