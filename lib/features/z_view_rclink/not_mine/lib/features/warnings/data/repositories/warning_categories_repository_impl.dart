import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/repositories/base_sync_repository.dart';
import '../../../company/presentation/bloc/company_bloc.dart';
import '../../../company/presentation/bloc/company_state.dart';
import '../../domain/entities/warning_category.dart';
import '../../domain/entities/warning_reason.dart';
import '../../domain/entities/warning_type.dart';
import '../../domain/repositories/warning_categories_repository.dart';
import '../datasources/warning_categories_local_datasource.dart';
import '../datasources/warning_categories_remote_datasource.dart';
import '../models/warning_category_with_reasons_model.dart';

@LazySingleton(as: WarningCategoriesRepository)
class WarningCategoriesRepositoryImpl
    extends BaseOfflineSyncRepository<List<WarningCategoryWithReasons>,
        List<WarningCategoryWithReasonsModel>>
    implements WarningCategoriesRepository {
  final WarningCategoriesRemoteDataSource _remoteDataSource;
  final WarningCategoriesLocalDataSource _localDataSource;
  final CompanyBloc _companyBloc;

  WarningCategoriesRepositoryImpl(
    this._remoteDataSource,
    this._localDataSource,
    this._companyBloc,
  );

  @override
  Future<Either<Failure, List<WarningCategoryWithReasons>>> getCategories({
    bool forceRefresh = false,
    Duration? cacheTimeout = const Duration(hours: 24),
    String? warningType,
    String? workScopeUID,
  }) async {
    final currentState = _companyBloc.state;
    if (currentState is! CompanyLoaded ||
        currentState.selectedCompany == null) {
      return const Left(ServerFailure('No company selected'));
    }

    return await getOfflineFirst(
      getLocal: () => _localDataSource.getCachedCategories(
        warningType: warningType,
        workScopeUID: workScopeUID,
      ),
      getRemote: () => _remoteDataSource.getCategories(
        warningType: warningType,
        workScopeUID: workScopeUID,
      ),
      saveLocal: (models, {bool markForSync = false}) =>
          _localDataSource.cacheCategories(models),
      toEntity: _convertModelsToEntities,
      forceRefresh: forceRefresh,
      cacheTimeout: cacheTimeout,
    );
  }

  @override
  Future<Either<Failure, void>> clearCache() async {
    try {
      await _localDataSource.clearCache();
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure('Failed to clear cache: $e'));
    }
  }

  /// Converts models to domain entities
  List<WarningCategoryWithReasons> _convertModelsToEntities(
    List<WarningCategoryWithReasonsModel> models,
  ) {
    return models.map((model) {
      // Convert category model to entity
      final category = model.toEntity();

      // Convert reason models to entities
      final reasons = model.reasons.map((reasonModel) {
        return WarningReason(
          id: reasonModel.id,
          uid: reasonModel.uid,
          name: reasonModel.name,
          warningType: WarningType.fromString(reasonModel.warningType),
          categoryID: reasonModel.categoryID,
          workScopeID: reasonModel.workScopeID,
          requiresAction: reasonModel.requiresAction,
          isActive: reasonModel.isActive,
          displayOrder: reasonModel.displayOrder,
          createdAt: reasonModel.createdAt ?? DateTime.now(),
          updatedAt: reasonModel.updatedAt ?? DateTime.now(),
          category: null, // Don't include circular reference
        );
      }).toList();

      return WarningCategoryWithReasons(
        category: category,
        reasons: reasons,
      );
    }).toList();
  }
}
