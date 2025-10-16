import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/tokens.dart';
import '../repositories/auth_repository.dart';

@lazySingleton
class VerifyOtpUseCase implements UseCase<Tokens, VerifyOtpParams> {
  final AuthRepository repository;

  VerifyOtpUseCase(this.repository);

  @override
  Future<Either<Failure, Tokens>> call(VerifyOtpParams params) async {
    // Validate phone number
    if (params.phone.isEmpty) {
      return const Left(ValidationFailure('Phone number cannot be empty'));
    }

    // Validate OTP
    if (params.otp.isEmpty) {
      return const Left(ValidationFailure('OTP cannot be empty'));
    }

    if (params.otp.length != 6) {
      return const Left(ValidationFailure('OTP must be 6 digits'));
    }

    // Basic validation - only digits
    if (!RegExp(r'^\d{6}$').hasMatch(params.otp)) {
      return const Left(ValidationFailure('OTP must contain only digits'));
    }

    return await repository.verifyOtp(params.phone, params.otp);
  }
}

class VerifyOtpParams extends Equatable {
  final String phone;
  final String otp;

  const VerifyOtpParams({required this.phone, required this.otp});

  @override
  List<Object> get props => [phone, otp];
}
