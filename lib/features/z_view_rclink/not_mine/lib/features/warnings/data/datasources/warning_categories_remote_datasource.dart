import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../../../company/presentation/bloc/company_bloc.dart';
import '../../../company/presentation/bloc/company_state.dart';
import '../models/warning_category_with_reasons_model.dart';
import 'warning_categories_api_service.dart';

abstract class WarningCategoriesRemoteDataSource {
  Future<Either<Failure, List<WarningCategoryWithReasonsModel>>>
      getCategories({
    String? warningType,
    String? workScopeUID,
  });
}

@LazySingleton(as: WarningCategoriesRemoteDataSource)
class WarningCategoriesRemoteDataSourceImpl
    implements WarningCategoriesRemoteDataSource {
  final WarningCategoriesApiService _apiService;
  final CompanyBloc _companyBloc;

  WarningCategoriesRemoteDataSourceImpl(
    this._apiService,
    this._companyBloc,
  );

  @override
  Future<Either<Failure, List<WarningCategoryWithReasonsModel>>>
      getCategories({
    String? warningType,
    String? workScopeUID,
  }) async {
    try {
      final companyState = _companyBloc.state;
      if (companyState is! CompanyLoaded ||
          companyState.selectedCompany == null) {
        return const Left(CacheFailure('No company selected'));
      }

      final companyUID = companyState.selectedCompany!.uid;

      final response = await _apiService.getCategories(
        companyUID: companyUID,
        limit: 0, // Get all categories
        warningType: warningType,
        workScopeUID: workScopeUID,
      );

      if (response.isSuccess && response.data != null) {
        return Right(response.data!);
      } else {
        return Left(
          ServerFailure(response.message, statusCode: response.statusCode),
        );
      }
    } catch (e) {
      return Left(ServerFailure('Unexpected error: ${e.toString()}'));
    }
  }
}
