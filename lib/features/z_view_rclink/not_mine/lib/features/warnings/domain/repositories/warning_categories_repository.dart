import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/warning_category.dart';
import '../entities/warning_reason.dart';

/// Repository for warning categories with nested reasons
abstract class WarningCategoriesRepository {
  /// Fetches warning categories with their nested reasons
  ///
  /// Uses offline-first approach with configurable cache timeout
  /// [forceRefresh] - if true, bypass cache and fetch from API
  /// [cacheTimeout] - how long cached data is considered valid (default: 24 hours)
  /// [warningType] - optional filter by warning type
  /// [workScopeUID] - optional filter by work scope
  Future<Either<Failure, List<WarningCategoryWithReasons>>> getCategories({
    bool forceRefresh = false,
    Duration? cacheTimeout = const Duration(hours: 24),
    String? warningType,
    String? workScopeUID,
  });

  Future<Either<Failure, void>> clearCache();
}

/// Domain entity for warning category with nested reasons
class WarningCategoryWithReasons {
  final WarningCategory category;
  final List<WarningReason> reasons;

  WarningCategoryWithReasons({
    required this.category,
    required this.reasons,
  });
}
