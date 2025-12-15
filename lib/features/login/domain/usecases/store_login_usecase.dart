import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/login_repository.dart';
import 'login_usecase.dart';

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
