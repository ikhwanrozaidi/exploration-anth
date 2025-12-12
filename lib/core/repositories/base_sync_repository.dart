// lib/core/repositories/base_sync_repository.dart
import 'package:dartz/dartz.dart';
import '../errors/failures.dart';

/// Base repository for offline-first operations
abstract class BaseOfflineSyncRepository<T, M> {
  /// Get operation - offline first
  ///
  /// Flow:
  /// 1. Check local cache first
  /// 2. If valid cache exists and not forcing refresh → return cached data
  /// 3. Try remote fetch
  /// 4. If remote succeeds → save locally and return
  /// 5. If remote fails → fallback to cached data if available
  Future<Either<Failure, T>> getOfflineFirst({
    required Future<M?> Function() getLocal,
    required Future<Either<Failure, M>> Function() getRemote,
    required Future<void> Function(M model, {bool markForSync}) saveLocal,
    required T Function(M model) toEntity,
    bool forceRefresh = false,
    Duration? cacheTimeout = const Duration(hours: 1),
  }) async {
    try {
      // Check local first - get model from cache
      final localModel = await getLocal();

      if (localModel != null && !forceRefresh) {
        // Convert model to entity for cache validation
        final localEntity = toEntity(localModel);
        if (_isCacheValid(localEntity, cacheTimeout)) {
          return Right(localEntity);
        }
      }

      // Try remote
      try {
        final remoteResult = await getRemote();

        return await remoteResult.fold(
          (failure) async {
            // Fallback to local if available
            if (localModel != null) {
              return Right(toEntity(localModel));
            }
            return Left(failure);
          },
          (remoteModel) async {
            final entity = toEntity(remoteModel);
            // Save model without marking for sync (data from server)
            await saveLocal(remoteModel, markForSync: false);
            return Right(entity);
          },
        );
      } catch (e) {
        // Fallback to local on network error
        if (localModel != null) {
          return Right(toEntity(localModel));
        }
        return Left(NetworkFailure('No internet connection'));
      }
    } catch (e) {
      return Left(CacheFailure('Failed to access local data: ${e.toString()}'));
    }
  }

  bool _isCacheValid(T entity, Duration? cacheTimeout) {
    if (cacheTimeout == null) return true;

    try {
      final dynamic e = entity;
      if (e.updatedAt is DateTime) {
        final age = DateTime.now().difference(e.updatedAt as DateTime);
        return age < cacheTimeout;
      }
    } catch (_) {}

    return true;
  }
}
