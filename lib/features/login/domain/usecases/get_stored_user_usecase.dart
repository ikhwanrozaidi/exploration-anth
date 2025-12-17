import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/user.dart';
import '../repositories/login_repository.dart';

@injectable
class GetStoredUserUseCase implements UseCaseNoParams<User?> {
  final LoginRepository repository;

  GetStoredUserUseCase(this.repository);

  @override
  Future<Either<Failure, User?>> call() async {
    return await repository.getStoredUser();
  }
}
