import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:injectable/injectable.dart';
import '../../../../shared/models/api_response.dart';

import '../../../auth/domain/entities/auth_result.dart';
import '../../../user/data/models/verify_otp_response_model.dart';
import '../models/login_request_model.dart';
import '../models/verify_otp_request_model.dart';
// import '../models/verify_otp_request_model.dart';
// import '../models/login_response_model.dart';
// import '../models/verify_otp_response_model.dart';
// import '../models/forgot_password_request_model.dart';
// import '../models/verify_otp_forgot_request_model.dart';
// import '../models/change_password_request_model.dart';

part 'login_api_service.g.dart';

@injectable
@RestApi()
abstract class LoginApiService {
  @factoryMethod
  factory LoginApiService(Dio dio) = _LoginApiService;

  // Login with email and password
  @POST('/auth/sign-in')
  Future<ApiResponse<String>> signIn({@Body() required LoginRequestModel data});

  @POST('/auth/verify-otp')
  Future<ApiResponse<VerifyOtpResponseModel>> verifyOtp({
    @Body() required VerifyOtpRequestModel data,
  });

  @POST('/auth/refresh-token')
  Future<ApiResponse<AuthResult>> refreshToken({
    @Body() required Map<String, dynamic> data,
  });
}
