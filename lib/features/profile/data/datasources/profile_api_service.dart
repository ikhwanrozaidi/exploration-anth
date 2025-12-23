import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../shared/models/api_response.dart';

part 'profile_api_service.g.dart';

@RestApi()
@lazySingleton
abstract class ProfileApiService {
  @factoryMethod
  factory ProfileApiService(Dio dio) = _ProfileApiService;

  @PATCH('/users/profile')
  Future<ApiResponse<Map<String, dynamic>>> updateProfile({
    //REVISE: Need to do UpdateProfileResponseModel
    @Body() required Map<String, dynamic> data,
  });
}
