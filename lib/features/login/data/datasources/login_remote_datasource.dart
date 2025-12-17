import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../../../../shared/entities/auth_result.dart';
import '../../../user/domain/entities/user.dart';
import '../models/login_request_model.dart';
import '../models/verify_otp_request_model.dart';
import 'login_api_service.dart';

abstract class LoginRemoteDataSource {
  Future<Either<Failure, String>> login(String email, String password);

  Future<Either<Failure, (AuthResult, User)>> verifyOtp(
    String email,
    String otp,
  );
}

@LazySingleton(as: LoginRemoteDataSource)
class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
  final LoginApiService _apiService;

  LoginRemoteDataSourceImpl(this._apiService);

  @override
  Future<Either<Failure, String>> login(String email, String password) async {
    try {
      final response = await _apiService.signIn(
        data: LoginRequestModel(email: email, password: password),
      );

      if (response.isSuccess && response.data != null) {
        final otpResponse = response.data!;
        return Right(otpResponse.message);
      } else {
        return Left(
          ServerFailure(
            response.message.isEmpty ? 'Login failed' : response.message,
            statusCode: response.statusCode,
          ),
        );
      }
    } catch (e) {
      print('❌ Login Error: $e');
      return Left(ServerFailure('Unexpected error: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, (AuthResult, User)>> verifyOtp(
    String email,
    String otp,
  ) async {
    try {
      final response = await _apiService.verifyOtp(
        data: VerifyOtpRequestModel(email: email, otp: otp),
      );

      if (response.isSuccess && response.data != null) {
        final verifyOtpResponse = response.data!;

        final authResult = verifyOtpResponse.toAuthResult();
        final user = verifyOtpResponse.toUser();

        return Right((authResult, user));
      } else {
        return Left(
          ServerFailure(
            response.message.isEmpty
                ? 'OTP verification failed'
                : response.message,
            statusCode: response.statusCode,
          ),
        );
      }
    } catch (e) {
      print('❌ VerifyOtp Error: $e');
      return Left(ServerFailure('Unexpected error: ${e.toString()}'));
    }
  }
}
