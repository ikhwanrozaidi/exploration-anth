import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../shared/models/api_response.dart';
import '../models/role_model.dart';

part 'role_api_service.g.dart';

@injectable
@RestApi()
abstract class RoleApiService {
  @factoryMethod
  factory RoleApiService(Dio dio) = _RoleApiService;

  @GET('/roles/{uid}')
  Future<ApiResponse<RoleModel>> getRole(@Path('uid') String uid);
}
