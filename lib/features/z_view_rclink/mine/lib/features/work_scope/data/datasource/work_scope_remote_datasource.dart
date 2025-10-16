import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/constants/api_query_params.dart';
import '../../../../core/errors/failures.dart';
import '../models/work_scope_model.dart';
import 'work_scope_api_service.dart';

abstract class WorkScopeRemoteDataSource {
  Future<Either<Failure, List<WorkScopeModel>>> getWorkScopes({
    ApiQueryParams? queryParams,

    required String companyUID,
    String? search,
    String? code,
    bool? allowMultipleQuantities,
    List<String>? expand,
  });
}

@LazySingleton(as: WorkScopeRemoteDataSource)
class WorkScopeRemoteDataSourceImpl implements WorkScopeRemoteDataSource {
  final WorkScopeApiService _apiService;

  WorkScopeRemoteDataSourceImpl(this._apiService);

  @override
  Future<Either<Failure, List<WorkScopeModel>>> getWorkScopes({
    ApiQueryParams? queryParams,

    required String companyUID,
    String? search,
    String? code,
    bool? allowMultipleQuantities,
    List<String>? expand,
  }) async {
    final params = queryParams ?? const ApiQueryParams();

    try {
      final response = await _apiService.getWorkScopes(
        baseParams: params.toQueryParams(),

        companyUID: companyUID,
        search: search,
        code: code,
        allowMultipleQuantities: allowMultipleQuantities,
        expand: expand,
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
