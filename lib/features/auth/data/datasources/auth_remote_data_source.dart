import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:rclink_app/features/auth/data/models/request_otp_model.dart';
import 'package:rclink_app/features/auth/data/models/request_otp_response_model.dart';
import 'package:rclink_app/features/auth/data/models/tokens_model.dart';
import '../../../../core/errors/failures.dart';
import '../models/verify_otp_request_model.dart';
import 'auth_api_service.dart';

abstract class AuthRemoteDataSource {
  Future<Either<Failure, RequestOtpResponseModel>> requestOtp(String phone);
  Future<Either<Failure, TokensModel>> verifyOtp(String phone, String otp);
  Future<Either<Failure, TokensModel>> refreshToken(String refreshToken);
}

@LazySingleton(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final AuthApiService _apiService;

  AuthRemoteDataSourceImpl(this._apiService);

  @override
  Future<Either<Failure, RequestOtpResponseModel>> requestOtp(String phone) async {
    try {
      final request = RequestOtpModel(phone: phone);
      final response = await _apiService.requestOtp(data: request);

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

  @override
  Future<Either<Failure, TokensModel>> verifyOtp(String phone, String otp) async {
    try {
      final request = VerifyOtpRequestModel(phone: phone, otp: otp);
      final response = await _apiService.verifyOtp(data: request);

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

  @override
  Future<Either<Failure, TokensModel>> refreshToken(String refreshToken) async {
    try {
      final response = await _apiService.refreshToken(
        refreshToken: 'Bearer $refreshToken',
      );

      // Check if the API response is successful
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
