import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../shared/models/api_response.dart';
import '../models/work_scope_model.dart';
import '../models/work_quantity_type_model.dart';
import '../models/work_scope_equipment_model.dart';

part 'work_scope_api_service.g.dart';

@injectable
@RestApi()
abstract class WorkScopeApiService {
  @factoryMethod
  factory WorkScopeApiService(Dio dio) = _WorkScopeApiService;

  @GET('/companies/{companyUID}/work-scopes')
  Future<ApiResponse<List<WorkScopeModel>>> getWorkScopes({
    @Path('companyUID') required String companyUID,
    @Query('page') int? page = 1,
    @Query('limit') int? limit = 0, // 0 = all items
    @Query('sortOrder') String? sortOrder = 'asc',
    @Query('sortBy') String? sortBy,
    @Query('search') String? search,
    @Query('code') String? code,
    @Query('allowMultipleQuantities') bool? allowMultipleQuantities,
    @Query('expand') List<String>? expand,
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

  @GET('/companies/{companyUID}/work-scopes/{workScopeUID}/equipments')
  Future<ApiResponse<List<WorkScopeEquipmentModel>>> getEquipments({
    @Path('companyUID') required String companyUID,
    @Path('workScopeUID') required String workScopeUID,
  });
}
