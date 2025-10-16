import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:rclink_app/features/work_scope/data/models/work_scope_model.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../../../../to_view_rclink/not_mine/shared/models/api_response.dart';

part 'work_scope_api_service.g.dart';

@injectable
@RestApi()
abstract class WorkScopeApiService {
  @factoryMethod
  factory WorkScopeApiService(Dio dio) = _WorkScopeApiService;

  @GET('/companies/{companyUID}/work-scopes')
  Future<ApiResponse<List<WorkScopeModel>>> getWorkScopes({
    @Queries() Map<String, dynamic>? baseParams,

    @Path('companyUID') required String companyUID,
    @Query('search') String? search,
    @Query('code') String? code,
    @Query('allowMultipleQuantities') bool? allowMultipleQuantities,
    @Query('expand') List<String>? expand,
  });
}
