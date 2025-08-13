// lib/features/auth/domain/usecases/signup_usecase.dart
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/auth_result.dart';
import '../repositories/auth_repository.dart';

class SignUpUseCase implements UseCase<AuthResult, SignUpParams> {
  final AuthRepository repository;

  SignUpUseCase(this.repository);

  @override
  Future<Either<Failure, AuthResult>> call(SignUpParams params) async {
    // Validate input
    if (params.email.isEmpty || params.password.isEmpty) {
      return const Left(ValidationFailure('Email and password cannot be empty'));
    }

    if (!_isValidEmail(params.email)) {
      return const Left(ValidationFailure('Invalid email format'));
    }

    if (params.password.length < 6) {
      return const Left(ValidationFailure('Password must be at least 6 characters'));
    }

    return await repository.signUp(
      params.email,
      params.password,
      params.additionalData,
    );
  }

  bool _isValidEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }
}

class CheckEmailExistsUseCase implements UseCase<bool, CheckEmailParams> {
  final AuthRepository repository;

  CheckEmailExistsUseCase(this.repository);

  @override
  Future<Either<Failure, bool>> call(CheckEmailParams params) async {
    if (params.email.isEmpty) {
      return const Left(ValidationFailure('Email cannot be empty'));
    }

    if (!_isValidEmail(params.email)) {
      return const Left(ValidationFailure('Invalid email format'));
    }

    return await repository.checkEmailExists(params.email);
  }

  bool _isValidEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }
}

// Parameters
class SignUpParams extends Equatable {
  final String email;
  final String password;
  final Map<String, dynamic> additionalData;

  const SignUpParams(this.email, this.password, this.additionalData);

  @override
  List<Object> get props => [email, password, additionalData];
}

class CheckEmailParams extends Equatable {
  final String email;

  const CheckEmailParams(this.email);

  @override
  List<Object> get props => [email];
}