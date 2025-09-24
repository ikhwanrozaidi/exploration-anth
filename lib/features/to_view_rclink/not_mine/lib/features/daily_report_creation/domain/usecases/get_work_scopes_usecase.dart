import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/scope_of_work/scope_of_work.dart';
import '../repository/workscopes_repository.dart';

@injectable
class GetWorkScopesParams {
  final bool forceRefresh;
  final Duration? cacheTimeout;

  GetWorkScopesParams({
    this.forceRefresh = false,
    this.cacheTimeout = const Duration(hours: 1),
  });
}

@injectable
class GetWorkScopesUseCase
    implements UseCase<List<ScopeOfWork>, GetWorkScopesParams> {
  final WorkScopesRepository _repository;

  GetWorkScopesUseCase(this._repository);

  @override
  Future<Either<Failure, List<ScopeOfWork>>> call(
    GetWorkScopesParams params,
  ) async {
    return await _repository.getWorkScopes(
      forceRefresh: params.forceRefresh,
      cacheTimeout: params.cacheTimeout,
    );
  }
}
