import 'package:dartz/dartz.dart';
import 'package:rclink_app/features/work_scope/domain/entities/work_scope.dart';
import '../../../../core/constants/api_query_params.dart';
import '../../../../core/errors/failures.dart';

abstract class WorkScopesRepository {
  Future<Either<Failure, List<WorkScope>>> getWorkScopes({
    ApiQueryParams? queryParams,

    required String companyUID,
    String? search,
    String? code,
    bool? allowMultipleQuantities,
    List<String>? expand,

    bool forceRefresh = false,
    Duration? cacheTimeout = const Duration(hours: 1),
  });

  Future<Either<Failure, void>> clearCache();
}
