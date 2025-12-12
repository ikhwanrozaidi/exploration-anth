import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/otp_response.dart';
import '../repositories/auth_repository.dart';

@injectable
class SendOtpUseCase implements UseCase<OtpResponse, SendOtpParams> {
  final AuthRepository repository;

  SendOtpUseCase(this.repository);

  @override
  Future<Either<Failure, OtpResponse>> call(SendOtpParams params) async {
    // Validate phone number
    if (params.phone.isEmpty) {
      return const Left(ValidationFailure('Phone number cannot be empty'));
    }

    // Basic phone number validation (can be enhanced)
    if (!_isValidPhoneNumber(params.phone)) {
      return const Left(ValidationFailure('Invalid phone number format'));
    }

    return await repository.sendOtp(params.phone);
  }

  bool _isValidPhoneNumber(String phone) {
    // Basic validation - can be enhanced with proper regex
    final cleanPhone = phone.replaceAll(RegExp(r'[^\d+]'), '');
    return cleanPhone.length >= 10 && cleanPhone.length <= 15;
  }
}

class SendOtpParams extends Equatable {
  final String phone;

  const SendOtpParams(this.phone);

  @override
  List<Object> get props => [phone];
}
