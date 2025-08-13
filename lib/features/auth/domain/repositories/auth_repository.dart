import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/auth_result.dart';
import '../entities/otp_response.dart';

abstract class AuthRepository {
  Future<Either<Failure, OtpResponse>> sendOtp(String phone);
  Future<Either<Failure, bool>> checkEmailExists(String email);
  Future<Either<Failure, AuthResult>> signUp(
    String email,
    String password,
    Map<String, dynamic> additionalData,
  );
}
