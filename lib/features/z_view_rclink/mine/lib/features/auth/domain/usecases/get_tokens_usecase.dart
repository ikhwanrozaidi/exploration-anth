import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/tokens.dart';
import '../repositories/auth_repository.dart';

@lazySingleton
class GetTokensUseCase implements UseCaseNoParams<Tokens?> {
  final AuthRepository repository;

  GetTokensUseCase(this.repository);

  @override
  Future<Either<Failure, Tokens?>> call() async {
    return await repository.getTokens();
  }
}