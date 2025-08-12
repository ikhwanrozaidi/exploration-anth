// lib/features/auth/data/datasources/auth_remote_data_source.dart
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/entities/otp_response.dart';
import '../../domain/entities/auth_result.dart';
import '../models/send_otp_request_model.dart';
import '../models/signup_request_model.dart';
import 'auth_api_service.dart';

abstract class AuthRemoteDataSource {
  Future<Either<Failure, OtpResponse>> sendOtp(String phone);
  Future<Either<Failure, bool>> checkEmailExists(String email);
  Future<Either<Failure, AuthResult>> signUp(
    String email,
    String password,
    Map<String, dynamic> additionalData,
  );
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

  @override
  Future<Either<Failure, bool>> checkEmailExists(String email) async {
    try {
      final response = await _apiService.checkEmailExists(email: email);

      if (response.isSuccess && response.data != null) {
        return Right(response.data!);
      } else {
        return Left(
          ServerFailure(response.message, statusCode: response.statusCode),
        );
      }
    } catch (e) {
      return Left(ServerFailure('Unexpected error: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, AuthResult>> signUp(
    String email,
    String password,
    Map<String, dynamic> additionalData,
  ) async {
    try {
      final request = SignUpRequestModel(
        email: email,
        password: password,
        additionalData: additionalData,
      );
      
      final response = await _apiService.signUp(data: request);

      if (response.isSuccess && response.data != null) {
        return Right(response.data!);
      } else {
        return Left(
          ServerFailure(response.message, statusCode: response.statusCode),
        );
      }
    } catch (e) {
      return Left(ServerFailure('Unexpected error: ${e.toString()}'));
    }
  }
}