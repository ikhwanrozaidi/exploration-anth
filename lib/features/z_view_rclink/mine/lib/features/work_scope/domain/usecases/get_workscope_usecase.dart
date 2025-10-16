import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:rclink_app/features/work_scope/domain/entities/work_scope.dart';
import '../../../../core/constants/api_query_params.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repository/work_scope_repository.dart';

@injectable
class GetWorkScopesParams {
  ApiQueryParams? queryParams;

  final String companyUID;
  final String? search;
  final String? code;
  final bool? allowMultipleQuantities;
  final List<String>? expand;

  final bool forceRefresh;
  final Duration? cacheTimeout;

  GetWorkScopesParams({
    this.queryParams,

    required this.companyUID,
    this.search,
    this.code,
    this.allowMultipleQuantities,
    this.expand,

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
    return await _repository.getWorkScopes(
      queryParams: params.queryParams,

      companyUID: params.companyUID,
      search: params.search,
      code: params.code,
      allowMultipleQuantities: params.allowMultipleQuantities,
      expand: params.expand,

      forceRefresh: params.forceRefresh,
      cacheTimeout: params.cacheTimeout,
    );
  }
}
