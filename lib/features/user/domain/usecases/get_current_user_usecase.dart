// lib/features/user/domain/usecases/get_current_user_usecase.dart
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/user.dart';
import '../repositories/user_repository.dart';

class GetCurrentUserParams {
  final bool forceRefresh;
  final Duration? cacheTimeout;

  const GetCurrentUserParams({
    this.forceRefresh = false,
    this.cacheTimeout = const Duration(hours: 1),
  });
}

@lazySingleton
class GetCurrentUserUseCase implements UseCase<User, GetCurrentUserParams> {
  final UserRepository _repository;

  GetCurrentUserUseCase(this._repository);

  @override
  Future<Either<Failure, User>> call(GetCurrentUserParams params) async {
    return await _repository.getCurrentUser(
      forceRefresh: params.forceRefresh,
      cacheTimeout: params.cacheTimeout,
    );
  }
}
