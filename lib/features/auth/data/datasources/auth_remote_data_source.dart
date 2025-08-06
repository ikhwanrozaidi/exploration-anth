import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/entities/otp_response.dart';
import '../models/send_otp_request_model.dart';
import 'auth_api_service.dart';

abstract class AuthRemoteDataSource {
  Future<Either<Failure, OtpResponse>> sendOtp(String phone);
}

@LazySingleton(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final AuthApiService _apiService;

  AuthRemoteDataSourceImpl(this._apiService);

  @override
  Future<Either<Failure, OtpResponse>> sendOtp(String phone) async {
    try {
      final request = SendOtpRequestModel(phone: phone);
      final response = await _apiService.sendOtp(data: request);

      // Check if the API response is successful using statusCode
      if (response.isSuccess && response.data != null) {
        return Right(response.data!);
      } else {
        // Handle non-success status codes
        return Left(
          ServerFailure(response.message, statusCode: response.statusCode),
        );
      }
    } catch (e) {
      return Left(ServerFailure('Unexpected error: ${e.toString()}'));
    }
  }
}
