import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/login_repository.dart';

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
