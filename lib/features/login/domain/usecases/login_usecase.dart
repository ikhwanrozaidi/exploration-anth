// lib/features/auth/domain/usecases/login_usecase.dart
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:gatepay_app/features/user/domain/entities/user.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../auth/domain/entities/auth_result.dart';
import '../repositories/login_repository.dart';

export 'credential_usecase.dart';

@injectable
class LoginUseCase implements UseCase<String, LoginParams> {
  final LoginRepository repository;

  LoginUseCase(this.repository);

  @override
  Future<Either<Failure, String>> call(LoginParams params) async {
    // Validate email and password
    if (params.email.isEmpty || params.password.isEmpty) {
      return const Left(
        ValidationFailure('Email and password cannot be empty'),
      );
    }

    if (!_isValidEmail(params.email)) {
      return const Left(ValidationFailure('Invalid email format'));
    }

    return await repository.login(params.email, params.password);
  }

  bool _isValidEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}').hasMatch(email);
  }
}

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

@injectable
class LogoutUseCase implements UseCaseNoParams<void> {
  final LoginRepository repository;

  LogoutUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call() async {
    return await repository.logout();
  }
}

@injectable
class GetStoredUserUseCase implements UseCaseNoParams<User?> {
  final LoginRepository repository;

  GetStoredUserUseCase(this.repository);

  @override
  Future<Either<Failure, User?>> call() async {
    return await repository.getStoredUser();
  }
}

@injectable
class RefreshTokenUseCase implements UseCaseNoParams<(AuthResult, User)> {
  final LoginRepository repository;

  RefreshTokenUseCase(this.repository);

  @override
  Future<Either<Failure, (AuthResult, User)>> call() async {
    return await repository.refreshToken();
  }
}

@injectable
class ForgotPasswordUseCase implements UseCase<String, ForgotPasswordParams> {
  final LoginRepository repository;

  ForgotPasswordUseCase(this.repository);

  @override
  Future<Either<Failure, String>> call(ForgotPasswordParams params) async {
    if (params.email.isEmpty) {
      return const Left(ValidationFailure('Email cannot be empty'));
    }

    if (!_isValidEmail(params.email)) {
      return const Left(ValidationFailure('Invalid email format'));
    }

    return await repository.forgotPassword(params.email);
  }

  bool _isValidEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}').hasMatch(email);
  }
}

@injectable
class VerifyOtpForgotUseCase implements UseCase<String, VerifyOtpForgotParams> {
  final LoginRepository repository;

  VerifyOtpForgotUseCase(this.repository);

  @override
  Future<Either<Failure, String>> call(VerifyOtpForgotParams params) async {
    if (params.email.isEmpty || params.otpForgot.isEmpty) {
      return const Left(ValidationFailure('Email and OTP cannot be empty'));
    }

    return await repository.verifyOtpForgot(params.email, params.otpForgot);
  }
}

@injectable
class ChangePasswordUseCase implements UseCase<String, ChangePasswordParams> {
  final LoginRepository repository;

  ChangePasswordUseCase(this.repository);

  @override
  Future<Either<Failure, String>> call(ChangePasswordParams params) async {
    if (params.email.isEmpty || params.newPassword.isEmpty) {
      return const Left(
        ValidationFailure('Email and new password cannot be empty'),
      );
    }

    if (params.newPassword.length < 6) {
      return const Left(
        ValidationFailure('Password must be at least 6 characters'),
      );
    }

    return await repository.changePassword(params.email, params.newPassword);
  }
}

@injectable
class StoreLoginCredentialsUseCase
    implements UseCase<void, StoreCredentialsParams> {
  final LoginRepository repository;

  StoreLoginCredentialsUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(StoreCredentialsParams params) async {
    if (params.email.isEmpty || params.password.isEmpty) {
      return const Left(
        ValidationFailure('Email and password cannot be empty'),
      );
    }

    return await repository.storeLoginCredentials(
      params.email,
      params.password,
    );
  }
}

@injectable
class GetStoredCredentialsUseCase
    implements UseCaseNoParams<Map<String, String>?> {
  final LoginRepository repository;

  GetStoredCredentialsUseCase(this.repository);

  @override
  Future<Either<Failure, Map<String, String>?>> call() async {
    return await repository.getStoredCredentials();
  }
}

// Add this new parameter class
class StoreCredentialsParams extends Equatable {
  final String email;
  final String password;

  const StoreCredentialsParams(this.email, this.password);

  @override
  List<Object> get props => [email, password];
}

// Parameters
class LoginParams extends Equatable {
  final String email;
  final String password;

  const LoginParams(this.email, this.password);

  @override
  List<Object> get props => [email, password];
}

class VerifyOtpParams extends Equatable {
  final String email;
  final String otp;

  const VerifyOtpParams(this.email, this.otp);

  @override
  List<Object> get props => [email, otp];
}

class ForgotPasswordParams extends Equatable {
  final String email;

  const ForgotPasswordParams(this.email);

  @override
  List<Object> get props => [email];
}

class VerifyOtpForgotParams extends Equatable {
  final String email;
  final String otpForgot;

  const VerifyOtpForgotParams(this.email, this.otpForgot);

  @override
  List<Object> get props => [email, otpForgot];
}

class ChangePasswordParams extends Equatable {
  final String email;
  final String newPassword;

  const ChangePasswordParams(this.email, this.newPassword);

  @override
  List<Object> get props => [email, newPassword];
}
