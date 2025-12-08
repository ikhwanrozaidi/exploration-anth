import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/otp_response.dart';
import '../repositories/auth_repository.dart';

@lazySingleton
class RequestOtpUseCase implements UseCase<OtpResponse, RequestOtpParams> {
  final AuthRepository repository;

  RequestOtpUseCase(this.repository);

  @override
  Future<Either<Failure, OtpResponse>> call(RequestOtpParams params) async {
    // Validate phone number
    if (params.phone.isEmpty) {
      return const Left(ValidationFailure('Phone number cannot be empty'));
    }

    if (!_isValidPhoneNumber(params.phone)) {
      return const Left(ValidationFailure('Invalid phone number format'));
    }

    return await repository.requestOtp(params.phone);
  }

  bool _isValidPhoneNumber(String phone) {
    final cleanPhone = phone.replaceAll(RegExp(r'[^\d+]'), '');
    return cleanPhone.length >= 10 && cleanPhone.length <= 15;
  }
}

class RequestOtpParams extends Equatable {
  final String phone;

  const RequestOtpParams(this.phone);

  @override
  List<Object> get props => [phone];
}
