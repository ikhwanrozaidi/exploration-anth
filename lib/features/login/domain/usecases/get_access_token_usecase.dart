import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/login_repository.dart';

@lazySingleton
class GetAccessTokenUseCase implements UseCaseNoParams<String?> {
  final LoginRepository repository;

  GetAccessTokenUseCase(this.repository);

  @override
  Future<Either<Failure, String?>> call() async {
    return await repository.getAccessToken();
  }
}
