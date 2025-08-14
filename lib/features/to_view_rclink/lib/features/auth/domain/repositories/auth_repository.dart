import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/otp_response.dart';
import '../entities/tokens.dart';

abstract class AuthRepository {
  Future<Either<Failure, OtpResponse>> requestOtp(String phone);
  Future<Either<Failure, Tokens>> verifyOtp(String phone, String otp);
  Future<Either<Failure, Tokens>> refreshToken(String refreshToken);
}
