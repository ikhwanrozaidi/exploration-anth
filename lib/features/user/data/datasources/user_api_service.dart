// lib/features/user/data/datasources/user_api_service.dart
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:injectable/injectable.dart';
import '../../../../shared/models/api_response.dart';
import '../models/user_model.dart';

part 'user_api_service.g.dart';

@injectable
@RestApi()
abstract class UserApiService {
  @factoryMethod
  factory UserApiService(Dio dio) = _UserApiService;

  // Get current user profile
  @GET('/client/me')
  Future<ApiResponse<UserModel>> getCurrentUser();

  // Update user profile
  @PUT('/client/me')
  Future<ApiResponse<UserModel>> updateUser({
    @Body() required Map<String, dynamic> data,
  });
}
