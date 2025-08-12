import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import 'login_api_service.dart';
import '../models/login_request_model.dart';

// import '../models/verify_otp_request_model.dart';
// import '../models/login_response_model.dart';
// import '../models/verify_otp_response_model.dart';
// import '../models/forgot_password_request_model.dart';
// import '../models/verify_otp_forgot_request_model.dart';
// import '../models/change_password_request_model.dart';

abstract class LoginRemoteDataSource {
  Future<Either<Failure, LoginResponseModel>> login(String email, String password);
  Future<Either<Failure, VerifyOtpResponseModel>> verifyOtp(String email, String otp);
  Future<Either<Failure, LoginResponseModel>> forgotPassword(String email);
  Future<Either<Failure, String>> verifyOtpForgot(String email, String otpForgot);
  Future<Either<Failure, String>> changePassword(String email, String newPassword);
  Future<Either<Failure, (VerifyOtpResponseModel, String)>> refreshToken();
}

@LazySingleton(as: LoginRemoteDataSource)
class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
  final LoginApiService _apiService;

  LoginRemoteDataSourceImpl(this._apiService);

  @override
  Future<Either<Failure, LoginResponseModel>> login(String email, String password) async {
    try {
      final request = LoginRequestModel(email: email, password: password);
      final response = await _apiService.login(data: request);

      if (response.isSuccess && response.data != null) {
        return Right(response.data!);
      } else {
        return Left(
          ServerFailure(response.message, statusCode: response.statusCode),
        );
      }
    } catch (e) {
      return Left(ServerFailure('Login failed: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, VerifyOtpResponseModel>> verifyOtp(String email, String otp) async {
    try {
      final request = VerifyOtpRequestModel(email: email, otp: otp);
      final response = await _apiService.verifyOtp(data: request);

      if (response.isSuccess && response.data != null) {
        return Right(response.data!);
      } else {
        return Left(
          ServerFailure(response.message, statusCode: response.statusCode),
        );
      }
    } catch (e) {
      return Left(ServerFailure('OTP verification failed: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, LoginResponseModel>> forgotPassword(String email) async {
    try {
      final request = ForgotPasswordRequestModel(email: email);
      final response = await _apiService.forgotPassword(data: request);

      if (response.isSuccess && response.data != null) {
        return Right(response.data!);
      } else {
        return Left(
          ServerFailure(response.message, statusCode: response.statusCode),
        );
      }
    } catch (e) {
      return Left(ServerFailure('Forgot password failed: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, String>> verifyOtpForgot(String email, String otpForgot) async {
    try {
      final request = VerifyOtpForgotRequestModel(email: email, otpForgot: otpForgot);
      final response = await _apiService.verifyOtpForgot(data: request);

      if (response.isSuccess) {
        return Right(response.message);
      } else {
        return Left(
          ServerFailure(response.message, statusCode: response.statusCode),
        );
      }
    } catch (e) {
      return Left(ServerFailure('OTP verification failed: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, String>> changePassword(String email, String newPassword) async {
    try {
      final request = ChangePasswordRequestModel(email: email, newPassword: newPassword);
      final response = await _apiService.changePassword(data: request);

      if (response.isSuccess) {
        return Right(response.message);
      } else {
        return Left(
          ServerFailure(response.message, statusCode: response.statusCode),
        );
      }
    } catch (e) {
      return Left(ServerFailure('Change password failed: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, (VerifyOtpResponseModel, String)>> refreshToken() async {
    try {
      // TODO: Implement refresh token logic
      // This would typically use a stored refresh token to get new access token
      return Left(ServerFailure('Refresh token not implemented'));
    } catch (e) {
      return Left(ServerFailure('Refresh token failed: ${e.toString()}'));
    }
  }
}