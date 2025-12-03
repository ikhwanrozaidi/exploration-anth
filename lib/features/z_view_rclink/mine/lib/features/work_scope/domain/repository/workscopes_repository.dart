import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/work_scope.dart';

abstract class WorkScopesRepository {
  Future<Either<Failure, List<WorkScope>>> getWorkScopes({
    bool forceRefresh = false,
    Duration? cacheTimeout = const Duration(hours: 1),
  });

  Future<Either<Failure, void>> clearCache();
}
