import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/scope_of_work/scope_of_work.dart';
import '../entities/province/province_entity.dart';
import '../entities/province/district_entity.dart';
import '../entities/province/road_entity.dart';

abstract class DailyReportCreationRepository {
  // =============================================================================
  // WORK SCOPES
  // =============================================================================

  Future<Either<Failure, List<ScopeOfWork>>> getWorkScopes({
    bool forceRefresh = false,
    Duration? cacheTimeout = const Duration(hours: 1),
  });

  // =============================================================================
  // PROVINCES/STATES
  // =============================================================================

  Future<Either<Failure, List<Province>>> getStates({
    int? page = 1,
    int? limit = 0,
    String? sortOrder = 'asc',
    String? sortBy = 'name',
    int? countryID,
    String? search,
    bool forceRefresh = false,
    Duration? cacheTimeout = const Duration(hours: 1),
  });

  // =============================================================================
  // DISTRICTS
  // =============================================================================

  Future<Either<Failure, List<District>>> getDistricts({
    int? page = 1,
    int? limit = 0,
    String? sortOrder = 'asc',
    String? sortBy = 'name',
    int? stateID,
    String? search,
    bool forceRefresh = false,
    Duration? cacheTimeout = const Duration(hours: 1),
  });

  // =============================================================================
  // ROADS
  // =============================================================================

  Future<Either<Failure, List<Road>>> getRoads({
    int? page = 1,
    int? limit = 0,
    String? sortOrder = 'asc',
    String? sortBy = 'name',
    int? districtID,
    int? mainCategoryID,
    int? secondaryCategoryID,
    String? search,
    double? sectionStartMin,
    double? sectionFinishMax,
    bool forceRefresh = false,
    Duration? cacheTimeout = const Duration(hours: 1),
  });

  // =============================================================================
  // CACHE MANAGEMENT
  // =============================================================================

  Future<Either<Failure, void>> clearCache();
  Future<Either<Failure, void>> clearProvinceCache();
  Future<Either<Failure, void>> clearDistrictCache();
  Future<Either<Failure, void>> clearRoadCache();
}
