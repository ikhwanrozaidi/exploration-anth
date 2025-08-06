import 'package:dio/dio.dart';
import 'package:rclink_app/features/auth/domain/entities/otp_response.dart';
import 'package:retrofit/retrofit.dart';
import 'package:injectable/injectable.dart';
import '../../../../shared/models/api_response.dart';
import '../models/send_otp_request_model.dart';

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
}
