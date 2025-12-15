import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:gatepay_app/features/user/domain/entities/user.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../auth/domain/entities/auth_result.dart';
import '../repositories/login_repository.dart';

@injectable
class VerifyOtpUseCase implements UseCase<(AuthResult, User), VerifyOtpParams> {
  final LoginRepository repository;

  VerifyOtpUseCase(this.repository);

  @override
  Future<Either<Failure, (AuthResult, User)>> call(
    VerifyOtpParams params,
  ) async {
    if (params.email.isEmpty || params.otp.isEmpty) {
      return const Left(ValidationFailure('Email and OTP cannot be empty'));
    }

    if (params.otp.length != 6) {
      return const Left(ValidationFailure('OTP must be 6 digits'));
    }

    return await repository.verifyOtp(params.email, params.otp);
  }
}

class VerifyOtpParams extends Equatable {
  final String email;
  final String otp;

  const VerifyOtpParams(this.email, this.otp);

  @override
  List<Object> get props => [email, otp];
}
