import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:injectable/injectable.dart';
import '../../../../shared/models/api_response.dart';
import '../models/admin_model.dart';

part 'admin_api_service.g.dart';

@injectable
@RestApi()
abstract class AdminApiService {
  @factoryMethod
  factory AdminApiService(Dio dio) = _AdminApiService;

  // Get current admin profile
  @GET('/admin/me')
  Future<ApiResponse<AdminModel>> getCurrentAdmin();

  // Update admin profile
  @PUT('/admin/me')
  Future<ApiResponse<AdminModel>> updateAdmin({
    @Body() required Map<String, dynamic> data,
  });
}
