import 'package:dartz/dartz.dart';
import '../errors/failures.dart';

/// Simplified repository for GET operations with offline-first approach
///
/// Simple logic:
/// - Check if data exists locally by parentId/uid
/// - Check if data is fresh (updatedAt within 1 hour)
/// - If fresh → return it
/// - If stale or missing → fetch from API
abstract class BaseOfflineByIdSyncRepository<T, M> {
  /// For LIST operations by parent ID (e.g., roads by districtId)
  ///
  /// Logic:
  /// 1. Check if data for parentId exists locally
  /// 2. If exists and fresh (< 1 hour old) → return it
  /// 3. If stale or missing → fetch from API
  Future<Either<Failure, List<T>>> getOfflineFirstByParentId({
    required String parentId,
    required Future<List<T>> Function() getLocal,
    required Future<Either<Failure, List<M>>> Function() getRemote,
    required Future<void> Function(List<T> entities) saveLocal,
    required T Function(M model) toEntity,
    bool forceRefresh = false,
    Duration cacheDuration = const Duration(hours: 1),
  }) async {
    try {
      // If force refresh, skip cache
      if (!forceRefresh) {
        final localData = await getLocal();

        if (localData.isNotEmpty) {
          // Check if data is fresh
          final isFresh = _isDataFresh(localData, cacheDuration);

          if (isFresh) {
            return Right(localData);
          }
        }
      }

      // Fetch from remote (stale, missing, or force refresh)
      try {
        final remoteResult = await getRemote();

        return await remoteResult.fold(
          (failure) async {
            // If remote fails, return stale local data if available
            final localData = await getLocal();
            if (localData.isNotEmpty) {
              return Right(localData);
            }
            return Left(failure);
          },
          (models) async {
            final entities = models.map(toEntity).toList();
            await saveLocal(entities);
            return Right(entities);
          },
        );
      } catch (e) {
        // Network error - return local data if available
        final localData = await getLocal();
        if (localData.isNotEmpty) {
          return Right(localData);
        }
        return Left(NetworkFailure('No internet connection'));
      }
    } catch (e) {
      return Left(CacheFailure('Failed to access local data: ${e.toString()}'));
    }
  }

  /// For PAGINATED LIST operations
  ///
  /// Logic for page 1:
  /// - Check if data exists and is fresh (< 1 hour)
  /// - If fresh → return it
  /// - If stale → fetch from API
  ///
  /// Logic for page 2+:
  /// - Always fetch from API (append mode)
  Future<Either<Failure, List<T>>> getListPaginated({
    required String parentId,
    required int page,
    required int limit,
    required Future<List<T>> Function() getLocal,
    required Future<Either<Failure, List<M>>> Function() getRemote,
    required Future<void> Function(List<T> entities, {required bool append})
    saveLocal,
    required T Function(M model) toEntity,
    bool forceRefresh = false,
    Duration cacheDuration = const Duration(hours: 1),
  }) async {
    try {
      // Page 1: Check cache freshness
      if (page == 1 && !forceRefresh) {
        final localData = await getLocal();

        if (localData.isNotEmpty) {
          final isFresh = _isDataFresh(localData, cacheDuration);

          if (isFresh) {
            return Right(localData);
          }
        }
      }

      // Page 2+ or stale page 1: Fetch from API
      try {
        final remoteResult = await getRemote();

        return await remoteResult.fold(
          (failure) async {
            // If remote fails, return local data if available
            final localData = await getLocal();
            if (localData.isNotEmpty) {
              return Right(localData);
            }
            return Left(failure);
          },
          (models) async {
            final entities = models.map(toEntity).toList();

            // Page 1: Replace data (clear before save)
            // Page 2+: Append data (keep existing)
            await saveLocal(entities, append: page > 1);

            // Return all data (including accumulated from previous pages)
            final allData = await getLocal();
            return Right(allData);
          },
        );
      } catch (e) {
        // Network error
        final localData = await getLocal();
        if (localData.isNotEmpty) {
          return Right(localData);
        }
        return Left(NetworkFailure('No internet connection'));
      }
    } catch (e) {
      return Left(CacheFailure('Failed to access local data: ${e.toString()}'));
    }
  }

  /// For LIST operations WITHOUT parent ID (e.g., all companies)
  ///
  /// Logic:
  /// 1. Check if data exists locally
  /// 2. If exists and fresh (< 1 hour old) → return it
  /// 3. If stale or missing → fetch from API
  Future<Either<Failure, List<T>>> getListOfflineFirst({
    required Future<List<T>> Function() getLocal,
    required Future<Either<Failure, List<M>>> Function() getRemote,
    required Future<void> Function(List<T> entities) saveLocal,
    required T Function(M model) toEntity,
    bool forceRefresh = false,
    Duration cacheDuration = const Duration(hours: 1),
  }) async {
    try {
      if (!forceRefresh) {
        final localData = await getLocal();

        if (localData.isNotEmpty) {
          final isFresh = _isDataFresh(localData, cacheDuration);

          if (isFresh) {
            return Right(localData);
          }
        }
      }

      try {
        final remoteResult = await getRemote();

        return await remoteResult.fold(
          (failure) async {
            final localData = await getLocal();
            if (localData.isNotEmpty) {
              return Right(localData);
            }
            return Left(failure);
          },
          (models) async {
            final entities = models.map(toEntity).toList();
            await saveLocal(entities);
            return Right(entities);
          },
        );
      } catch (e) {
        final localData = await getLocal();
        if (localData.isNotEmpty) {
          return Right(localData);
        }
        return Left(NetworkFailure('No internet connection'));
      }
    } catch (e) {
      return Left(CacheFailure('Failed to access local data: ${e.toString()}'));
    }
  }

  /// For SINGLE ENTITY by UID
  ///
  /// Logic:
  /// 1. Check if entity with uid exists locally
  /// 2. If exists and fresh (< 1 hour old) → return it
  /// 3. If stale or missing → fetch from API
  Future<Either<Failure, T>> getSingleByUid({
    required String uid,
    required Future<T?> Function() getLocal,
    required Future<Either<Failure, M>> Function() getRemote,
    required Future<void> Function(T entity) saveLocal,
    required T Function(M model) toEntity,
    bool forceRefresh = false,
    Duration cacheDuration = const Duration(hours: 1),
  }) async {
    try {
      if (!forceRefresh) {
        final localData = await getLocal();

        if (localData != null) {
          final isFresh = _isSingleEntityFresh(localData, cacheDuration);

          if (isFresh) {
            return Right(localData);
          }
        }
      }

      try {
        final remoteResult = await getRemote();

        return await remoteResult.fold(
          (failure) async {
            final localData = await getLocal();
            if (localData != null) return Right(localData);
            return Left(failure);
          },
          (model) async {
            final entity = toEntity(model);
            await saveLocal(entity);
            return Right(entity);
          },
        );
      } catch (e) {
        final localData = await getLocal();
        if (localData != null) return Right(localData);
        return Left(NetworkFailure('No internet connection'));
      }
    } catch (e) {
      return Left(CacheFailure('Failed to access local data: ${e.toString()}'));
    }
  }

  /// Check if list data is fresh (within cacheDuration)
  ///
  /// Logic: Check the OLDEST item's updatedAt
  /// If oldest item is still fresh, all items are fresh
  bool _isDataFresh(List<T> data, Duration cacheDuration) {
    if (data.isEmpty) return false;

    try {
      // Find the oldest updatedAt
      DateTime? oldestUpdate;

      for (final item in data) {
        final dynamic entity = item;
        if (entity.updatedAt is DateTime) {
          final updatedAt = entity.updatedAt as DateTime;
          if (oldestUpdate == null || updatedAt.isBefore(oldestUpdate)) {
            oldestUpdate = updatedAt;
          }
        }
      }

      if (oldestUpdate == null) return false;

      final age = DateTime.now().difference(oldestUpdate);
      return age < cacheDuration;
    } catch (_) {
      return false;
    }
  }

  /// Check if single entity is fresh
  bool _isSingleEntityFresh(T entity, Duration cacheDuration) {
    try {
      final dynamic e = entity;
      if (e.updatedAt is DateTime) {
        final age = DateTime.now().difference(e.updatedAt as DateTime);
        return age < cacheDuration;
      }
    } catch (_) {}
    return false;
  }
}
