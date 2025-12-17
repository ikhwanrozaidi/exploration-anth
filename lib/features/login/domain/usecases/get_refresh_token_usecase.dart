import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/login_repository.dart';

@lazySingleton
class GetRefreshTokenUseCase implements UseCaseNoParams<String?> {
  final LoginRepository repository;

  GetRefreshTokenUseCase(this.repository);

  @override
  Future<Either<Failure, String?>> call() async {
    return await repository.getRefreshToken();
  }
}
