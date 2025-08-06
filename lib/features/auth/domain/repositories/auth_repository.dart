import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/otp_response.dart';

abstract class AuthRepository {
  Future<Either<Failure, OtpResponse>> sendOtp(String phone);
}
