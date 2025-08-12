import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:injectable/injectable.dart';
import '../../../../shared/models/api_response.dart';

import '../models/login_request_model.dart';
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
  @POST('/auth/login')
  Future<ApiResponse<LoginResponseModel>> login({
    @Body() required LoginRequestModel data,
  });

  // Verify OTP after login
  @POST('/auth/verify-otp')
  Future<ApiResponse<VerifyOtpResponseModel>> verifyOtp({
    @Body() required VerifyOtpRequestModel data,
  });

  // Forgot password
  @POST('/auth/forgot-password')
  Future<ApiResponse<LoginResponseModel>> forgotPassword({
    @Body() required ForgotPasswordRequestModel data,
  });

  // Verify OTP for forgot password
  @POST('/auth/verify-otp-forgot')
  Future<ApiResponse<dynamic>> verifyOtpForgot({
    @Body() required VerifyOtpForgotRequestModel data,
  });

  // Change password
  @POST('/auth/change-password')
  Future<ApiResponse<dynamic>> changePassword({
    @Body() required ChangePasswordRequestModel data,
  });
}