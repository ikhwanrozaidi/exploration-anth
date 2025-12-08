import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/work_scope.dart';
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
    implements UseCase<List<WorkScope>, GetWorkScopesParams> {
  final WorkScopesRepository _repository;

  GetWorkScopesUseCase(this._repository);

  @override
  Future<Either<Failure, List<WorkScope>>> call(
    GetWorkScopesParams params,
  ) async {
    return _repository.getWorkScopes(
      forceRefresh: params.forceRefresh,
      cacheTimeout: params.cacheTimeout,
    );
  }
}
