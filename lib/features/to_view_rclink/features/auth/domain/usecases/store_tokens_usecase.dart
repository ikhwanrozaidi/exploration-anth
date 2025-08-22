import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/tokens.dart';
import '../repositories/auth_repository.dart';

@lazySingleton
class StoreTokensUseCase implements UseCase<void, StoreTokensParams> {
  final AuthRepository repository;

  StoreTokensUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(StoreTokensParams params) async {
    return await repository.storeTokens(params.tokens);
  }
}

class StoreTokensParams {
  final Tokens tokens;

  const StoreTokensParams({required this.tokens});
}