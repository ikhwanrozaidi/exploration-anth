import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../../shared/models/api_response.dart';
import '../../../../core/database/app_database.dart';
import '../models/province/district_model.dart';
import '../models/province/province_model.dart';
import '../models/province/road_model.dart';
import '../models/scope_of_work/scope_of_work_model.dart';
import '../models/scope_of_work/work_quantity_type_model.dart';

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

  @GET('/districts')
  Future<ApiResponse<List<DistrictModel>>> getDistricts({
    @Query('page') int? page = 1,
    @Query('limit') int? limit = 0, // 0 = all items
    @Query('sortOrder') String? sortOrder = 'asc',
    @Query('sortBy') String? sortBy = 'name',
    @Query('stateID') int? stateID, // Match API parameter name
    @Query('search') String? search,
  });

  @GET('/roads')
  Future<ApiResponse<List<RoadModel>>> getRoads({
    @Query('page') int? page = 1,
    @Query('limit') int? limit = 0, // 0 = all items
    @Query('sortOrder') String? sortOrder = 'asc',
    @Query('sortBy') String? sortBy = 'name',
    @Query('districtID') int? districtID,
    @Query('mainCategoryID') int? mainCategoryID,
    @Query('secondaryCategoryID') int? secondaryCategoryID,
    @Query('search') String? search,
    @Query('sectionStartMin') double? sectionStartMin,
    @Query('sectionFinishMax') double? sectionFinishMax,
  });

  @GET('/companies/{companyUID}/work-scopes/{workScopeUID}/equipments')
  Future<ApiResponse<List<ScopeOfWorkModel>>> getEquipments({
    @Path('companyUID') required String companyUID,
    @Path('workScopeUID') required String workScopeUID,
  });

  @GET('/companies/{companyUID}/work-scopes/{workScopeUID}/quantity-types')
  Future<ApiResponse<List<WorkQuantityTypeModel>>> getQuantityTypes({
    @Path('companyUID') required String companyUID,
    @Path('workScopeUID') required String workScopeUID,
    @Query('page') int? page = 1,
    @Query('limit') int? limit = 0, // 0 = all items
    @Query('sortOrder') String? sortOrder = 'asc',
    @Query('sortBy') String? sortBy,
    @Query('search') String? search,
    @Query('isActive') bool? isActive,
    @Query('hasSegmentBreakdown') bool? hasSegmentBreakdown,
  });
}
