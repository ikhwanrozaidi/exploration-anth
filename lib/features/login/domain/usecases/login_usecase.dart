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

// Parameters
class LoginParams extends Equatable {
  final String email;
  final String password;

  const LoginParams(this.email, this.password);

  @override
  List<Object> get props => [email, password];
}
