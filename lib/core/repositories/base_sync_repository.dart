import 'package:dartz/dartz.dart';
import '../errors/failures.dart';

///
/// Belum Pakai, by Imanikhwan
///
///
/// Base repository class for operations that require sync
/// Handles optimistic updates with background sync
abstract class BaseSyncRepository<T, M> {
  /// Executes an optimistic update with sync queue
  ///
  /// 1. Updates locally first (optimistic)
  /// 2. Marks for sync if remote update provided
  /// 3. Optionally attempts immediate sync
  /// 4. Returns success immediately (optimistic)
  Future<Either<Failure, T>> executeOptimisticUpdate({
    required Future<T> Function() updateLocal,
    Future<Either<Failure, M>> Function()? updateRemote,
    required T entity,
    bool attemptImmediateSync = true,
    Function(Failure)? onSyncFailure,
  }) async {
    try {
      // Step 1: Update locally first (optimistic)
      final updatedEntity = await updateLocal();

      // Step 2: If remote update is provided, attempt sync
      if (updateRemote != null && attemptImmediateSync) {
        // Fire and forget - don't wait for sync
        _attemptSync(
          updateRemote: updateRemote,
          entity: entity,
          onFailure: onSyncFailure,
        );
      }

      // Step 3: Return success immediately
      return Right(updatedEntity);
    } catch (e) {
      return Left(CacheFailure('Failed to update locally: ${e.toString()}'));
    }
  }

  /// Attempts to sync in the background
  Future<void> _attemptSync({
    required Future<Either<Failure, M>> Function() updateRemote,
    required T entity,
    Function(Failure)? onFailure,
  }) async {
    try {
      final result = await updateRemote();
      result.fold(
        (failure) {
          // Sync failed - entity remains marked for sync
          onFailure?.call(failure);
        },
        (_) {
          // Sync succeeded - mark as synced
          _markAsSynced(entity);
        },
      );
    } catch (e) {
      onFailure?.call(NetworkFailure('Sync failed: ${e.toString()}'));
    }
  }

  /// Override to mark entity as synced after successful remote update
  void _markAsSynced(T entity) {
    // To be implemented by subclasses
  }
}

/// Combined repository for both offline-first reads and optimistic writes
abstract class BaseOfflineSyncRepository<T, M> {
  /// Get operation - offline first
  Future<Either<Failure, T>> getOfflineFirst({
    required Future<T?> Function() getLocal,
    required Future<Either<Failure, M>> Function() getRemote,
    required Future<void> Function(T entity, {bool markForSync}) saveLocal,
    required T Function(M model) toEntity,
    bool forceRefresh = false,
    Duration? cacheTimeout = const Duration(hours: 1),
  }) async {
    try {
      // Check local first
      final localData = await getLocal();

      if (localData != null && !forceRefresh) {
        if (_isCacheValid(localData, cacheTimeout)) {
          return Right(localData);
        }
      }

      // Try remote
      try {
        final remoteResult = await getRemote();

        return await remoteResult.fold(
          (failure) async {
            if (localData != null) return Right(localData);
            return Left(failure);
          },
          (model) async {
            final entity = toEntity(model);
            // Save without marking for sync (data from server)
            await saveLocal(entity, markForSync: false);
            return Right(entity);
          },
        );
      } catch (e) {
        if (localData != null) return Right(localData);
        return Left(NetworkFailure('No internet connection'));
      }
    } catch (e) {
      return Left(CacheFailure('Failed to access local data: ${e.toString()}'));
    }
  }

  /// Update operation - optimistic with sync
  Future<Either<Failure, T>> updateOptimistic({
    required Future<T> Function() updateLocal,
    required Future<Either<Failure, M>> Function()? updateRemote,
    required Future<void> Function(String uid) markAsSynced,
    required T entity,
    bool attemptImmediateSync = true,
  }) async {
    try {
      // Update locally with sync flag
      final updatedEntity = await updateLocal();

      // Attempt immediate sync if remote update provided
      if (updateRemote != null && attemptImmediateSync) {
        // Don't await - let it run in background
        updateRemote().then((result) {
          result.fold(
            (failure) {
              // Remains in sync queue for retry
              // TODO: Use proper logging instead of print
              // print('Sync failed, will retry: $failure');
            },
            (_) async {
              // Mark as synced
              try {
                final dynamic e = entity;
                if (e.uid is String) {
                  await markAsSynced(e.uid as String);
                }
              } catch (_) {}
            },
          );
        });
      }

      return Right(updatedEntity);
    } catch (e) {
      return Left(CacheFailure('Failed to update: ${e.toString()}'));
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
