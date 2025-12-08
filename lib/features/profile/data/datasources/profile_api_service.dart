import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../shared/models/api_response.dart';
import '../models/user_settings_response_model.dart';

part 'profile_api_service.g.dart';

@RestApi()
@LazySingleton()
abstract class ProfileApiService {
  @factoryMethod
  factory ProfileApiService(Dio dio) = _ProfileApiService;

  @GET('/client/user-settings')
  Future<ApiResponse<UserSettingsResponseModel>> getUserSettings();
}
