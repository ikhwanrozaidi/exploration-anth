import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/scope_of_work/scope_of_work.dart';

abstract class WorkScopesRepository {
  Future<Either<Failure, List<ScopeOfWork>>> getWorkScopes({
    bool forceRefresh = false,
    Duration? cacheTimeout = const Duration(hours: 1),
  });

  Future<Either<Failure, void>> clearCache();
}
