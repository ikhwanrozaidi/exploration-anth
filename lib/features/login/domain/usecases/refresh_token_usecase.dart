import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../auth/domain/entities/auth_result.dart';
import '../../../user/domain/entities/user.dart';
import '../repositories/login_repository.dart';

@injectable
class RefreshTokenUseCase implements UseCaseNoParams<(AuthResult, User)> {
  final LoginRepository repository;

  RefreshTokenUseCase(this.repository);

  @override
  Future<Either<Failure, (AuthResult, User)>> call() async {
    return await repository.refreshToken();
  }
}
