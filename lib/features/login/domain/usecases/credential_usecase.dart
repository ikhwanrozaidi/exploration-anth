import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/login_repository.dart';

@injectable
class StoreLoginCredentialsUseCase implements UseCase<void, StoreCredentialsParams> {
  final LoginRepository repository;

  StoreLoginCredentialsUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(StoreCredentialsParams params) async {
    if (params.email.isEmpty || params.password.isEmpty) {
      return const Left(ValidationFailure('Email and password cannot be empty'));
    }

    return await repository.storeLoginCredentials(params.email, params.password);
  }
}

@injectable
class GetStoredCredentialsUseCase implements UseCaseNoParams<Map<String, String>?> {
  final LoginRepository repository;

  GetStoredCredentialsUseCase(this.repository);

  @override
  Future<Either<Failure, Map<String, String>?>> call() async {
    return await repository.getStoredCredentials();
  }
}

class StoreCredentialsParams extends Equatable {
  final String email;
  final String password;

  const StoreCredentialsParams(this.email, this.password);

  @override
  List<Object> get props => [email, password];
}