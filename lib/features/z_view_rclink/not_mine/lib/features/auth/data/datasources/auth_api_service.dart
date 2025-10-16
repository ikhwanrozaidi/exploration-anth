import 'package:dio/dio.dart';
import 'package:rclink_app/features/auth/data/models/request_otp_response_model.dart';
import 'package:rclink_app/features/auth/data/models/tokens_model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:injectable/injectable.dart';
import '../../../../shared/models/api_response.dart';
import '../models/request_otp_model.dart';
import '../models/verify_otp_request_model.dart';

part 'auth_api_service.g.dart';

@injectable
@RestApi()
abstract class AuthApiService {
  @factoryMethod
  factory AuthApiService(Dio dio) = _AuthApiService;

  // Send OTP to phone number
  @POST('/auth/request-otp')
  Future<ApiResponse<RequestOtpResponseModel>> requestOtp({
    @Body() required RequestOtpModel data,
  });

  // Verify OTP and return tokens
  @POST('/auth/verify-otp')
  Future<ApiResponse<TokensModel>> verifyOtp({
    @Body() required VerifyOtpRequestModel data,
  });

  // Refresh access token
  @POST('/auth/refresh')
  Future<ApiResponse<TokensModel>> refreshToken({
    @Header('Authorization') required String refreshToken,
  });
}
