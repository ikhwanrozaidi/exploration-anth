import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/warning_categories_repository.dart';

@injectable
class GetWarningCategoriesParams {
  final bool forceRefresh;
  final Duration? cacheTimeout;
  final String? warningType;
  final String? workScopeUID;

  GetWarningCategoriesParams({
    this.forceRefresh = false,
    this.cacheTimeout = const Duration(hours: 24),
    this.warningType,
    this.workScopeUID,
  });
}

@injectable
class GetWarningCategoriesUseCase
    implements
        UseCase<List<WarningCategoryWithReasons>, GetWarningCategoriesParams> {
  final WarningCategoriesRepository _repository;

  GetWarningCategoriesUseCase(this._repository);

  @override
  Future<Either<Failure, List<WarningCategoryWithReasons>>> call(
    GetWarningCategoriesParams params,
  ) async {
    return _repository.getCategories(
      forceRefresh: params.forceRefresh,
      cacheTimeout: params.cacheTimeout,
      warningType: params.warningType,
      workScopeUID: params.workScopeUID,
    );
  }
}
