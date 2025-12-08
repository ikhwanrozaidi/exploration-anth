import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/tokens.dart';
import '../repositories/auth_repository.dart';

@lazySingleton
class RefreshTokenUseCase implements UseCase<Tokens, RefreshTokenParams> {
  final AuthRepository _repository;

  RefreshTokenUseCase(this._repository);

  @override
  Future<Either<Failure, Tokens>> call(RefreshTokenParams params) async {
    return await _repository.refreshToken(params.refreshToken);
  }
}

class RefreshTokenParams extends Equatable {
  final String refreshToken;

  const RefreshTokenParams(this.refreshToken);

  @override
  List<Object?> get props => [refreshToken];
}