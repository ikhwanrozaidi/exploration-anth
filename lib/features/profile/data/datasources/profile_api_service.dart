import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:injectable/injectable.dart';
import '../../../../shared/models/api_response.dart';
import '../models/update_profile_request_model.dart';
import '../models/update_profile_response_model.dart';

part 'profile_api_service.g.dart';

@injectable
@RestApi()
abstract class ProfileApiService {
  @factoryMethod
  factory ProfileApiService(Dio dio) = _ProfileApiService;

  @PUT('/users/profile')
  Future<ApiResponse<UpdateProfileResponseModel>> updateProfile({
    @Body() required UpdateProfileRequestModel data,
  });
}
