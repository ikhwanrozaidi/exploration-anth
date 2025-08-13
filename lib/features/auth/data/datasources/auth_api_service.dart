// lib/features/auth/data/datasources/auth_api_service.dart
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:injectable/injectable.dart';
import '../../../../shared/models/api_response.dart';
import '../../domain/entities/otp_response.dart';
import '../../domain/entities/auth_result.dart';
import '../models/send_otp_request_model.dart';
import '../models/signup_request_model.dart';

part 'auth_api_service.g.dart';

@injectable
@RestApi()
abstract class AuthApiService {
  @factoryMethod
  factory AuthApiService(Dio dio) = _AuthApiService;

  // Send OTP to phone number
  @POST('/auth/send-otp')
  Future<ApiResponse<OtpResponse>> sendOtp({
    @Body() required SendOtpRequestModel data,
  });

  // Check if email exists
  @GET('/auth/check-email')
  Future<ApiResponse<bool>> checkEmailExists({
    @Query('email') required String email,
  });

  // Sign up new user
  @POST('/auth/signup')
  Future<ApiResponse<AuthResult>> signUp({
    @Body() required SignUpRequestModel data,
  });
}