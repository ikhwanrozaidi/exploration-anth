import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/admin.dart';
import '../repositories/admin_repository.dart';

class GetCurrentAdminParams {
  final bool forceRefresh;
  final Duration? cacheTimeout;

  const GetCurrentAdminParams({
    this.forceRefresh = false,
    this.cacheTimeout = const Duration(hours: 1),
  });
}

@lazySingleton
class GetCurrentAdminUseCase implements UseCase<Admin, GetCurrentAdminParams> {
  final AdminRepository _repository;

  GetCurrentAdminUseCase(this._repository);

  @override
  Future<Either<Failure, Admin>> call(GetCurrentAdminParams params) async {
    return await _repository.getCurrentAdmin(
      forceRefresh: params.forceRefresh,
      cacheTimeout: params.cacheTimeout,
    );
  }
}