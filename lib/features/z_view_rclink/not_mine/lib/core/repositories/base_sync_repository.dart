import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:drift/drift.dart';
import 'package:flutter/foundation.dart';
import '../database/app_database.dart';
import '../errors/failures.dart';
import '../sync/sync_constants.dart';

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
/// with automatic SyncQueue integration
abstract class BaseOfflineSyncRepository<T, M> {
  final DatabaseService? _databaseService;
  final dynamic
  _imageLocalDataSource; // ImageLocalDataSource - dynamic to avoid circular imports

  BaseOfflineSyncRepository({
    DatabaseService? databaseService,
    dynamic imageLocalDataSource,
  }) : _databaseService = databaseService,
       _imageLocalDataSource = imageLocalDataSource;

  /// Get operation - offline first
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

  /// Generic optimistic operation with sync and automatic SyncQueue fallback
  /// Works with any entity type regardless of repository's type parameters
  ///
  /// Flow:
  /// 1. Execute local operation immediately (optimistic)
  /// 2. Try immediate sync in background
  /// 3. If sync fails → Automatically add to SyncQueue for retry
  /// 4. SyncService will retry periodically until success
  ///
  /// Use this for create/update/delete operations on single entities
  Future<Either<Failure, EntityT>> executeOptimistic<EntityT, ModelT>({
    required Future<EntityT> Function() local,
    required Future<Either<Failure, ModelT>> Function()? remote,
    required Future<void> Function(ModelT serverModel, String tempUID)
    onSyncSuccess,
    EntityT? entity,
    required SyncEntityType entityType,
    required SyncAction action,
    Map<String, dynamic>? payload,
    int priority = 0,
    bool attemptImmediateSync = true,
  }) async {
    try {
      // Step 1: Execute local operation (optimistic)
      final updatedEntity = await local();
      final entityUid = _extractUidGeneric(updatedEntity);

      // Step 2: Attempt immediate sync if online
      if (remote != null && attemptImmediateSync) {
        remote()
            .then((result) async {
              await result.fold(
                (failure) async {
                  print(
                    '⚠️ Immediate sync failed for $entityUid: ${failure.message}',
                  );

                  // Step 3: Add to SyncQueue for background retry
                  await addToSyncQueue(
                    entityType: entityType,
                    entityUid: entityUid,
                    action: action,
                    payload: payload,
                    priority: priority,
                  );

                  print(
                    '📋 Added to SyncQueue for retry: ${entityType.value}/$entityUid',
                  );
                },
                (serverModel) async {
                  print('✅ Immediate sync successful for $entityUid');

                  // Step 4: Update with server data (including UID replacement)
                  await onSyncSuccess(serverModel, entityUid);

                  // Remove from SyncQueue if it was added before
                  await removeFromSyncQueue(entityType, entityUid);
                },
              );
            })
            .catchError((e) async {
              print('❌ Sync error for $entityUid: $e');

              // Add to SyncQueue on exception
              await addToSyncQueue(
                entityType: entityType,
                entityUid: entityUid,
                action: action,
                payload: payload,
                priority: priority,
              );
            });
      }

      return Right(updatedEntity);
    } catch (e) {
      return Left(CacheFailure('Failed to execute operation: ${e.toString()}'));
    }
  }

  /// Add to SyncQueue for background retry
  @protected
  Future<void> addToSyncQueue({
    required SyncEntityType entityType,
    required String entityUid,
    required SyncAction action,
    Map<String, dynamic>? payload,
    int priority = 0,
  }) async {
    if (_databaseService == null) {
      print('⚠️ DatabaseService not available, cannot add to SyncQueue');
      return;
    }

    try {
      final db = _databaseService.database;

      // Check if already in queue
      final existing =
          await (db.select(db.syncQueue)..where(
                (tbl) =>
                    tbl.entityType.equals(entityType.value) &
                    tbl.entityUid.equals(entityUid) &
                    tbl.isProcessed.equals(false),
              ))
              .getSingleOrNull();

      if (existing != null) {
        print('📋 Already in SyncQueue: ${entityType.value}/$entityUid');
        return;
      }

      // Add new entry
      await db
          .into(db.syncQueue)
          .insert(
            SyncQueueCompanion(
              entityType: Value(entityType.value),
              entityUid: Value(entityUid),
              action: Value(action.value),
              payload: payload != null
                  ? Value(jsonEncode(payload))
                  : const Value.absent(),
              priority: Value(priority),
              retryCount: const Value(0),
              createdAt: Value(DateTime.now()),
              isProcessed: const Value(false),
            ),
          );

      print(
        '✅ Added to SyncQueue: ${entityType.value}/$entityUid (priority: $priority)',
      );
    } catch (e) {
      print('❌ Failed to add to sync queue: $e');
    }
  }

  /// Remove from SyncQueue after successful sync
  @protected
  Future<void> removeFromSyncQueue(
    SyncEntityType entityType,
    String entityUid,
  ) async {
    if (_databaseService == null) return;

    try {
      final db = _databaseService.database;

      await (db.delete(db.syncQueue)..where(
            (tbl) =>
                tbl.entityType.equals(entityType.value) &
                tbl.entityUid.equals(entityUid),
          ))
          .go();

      print('🗑️ Removed from SyncQueue: ${entityType.value}/$entityUid');
    } catch (e) {
      print('❌ Failed to remove from sync queue: $e');
    }
  }

  /// Extract UID from entity
  String _extractUidGeneric<EntityT>(EntityT entity) {
    try {
      final dynamic e = entity;
      if (e.uid is String) return e.uid as String;
    } catch (_) {}
    return '';
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

  // ==================== Image Sync Methods ====================

  /// Save images for an entity to sync queue
  /// Called during entity creation (e.g., createDailyReport)
  @protected
  Future<void> saveImagesForEntity({
    required SyncEntityType entityType,
    required String entityUID,
    required String companyUID,
    required String uploadedByUID,
    required Map<dynamic, List<String>>
    imagesByContextField, // dynamic for ImageContextField
  }) async {
    if (_imageLocalDataSource == null) {
      print('⚠️ ImageLocalDataSource not available, cannot save images');
      return;
    }

    try {
      await _imageLocalDataSource.saveImagesToQueue(
        entityType: entityType,
        entityUID: entityUID,
        companyUID: companyUID,
        uploadedByUID: uploadedByUID,
        imagesByContextField: imagesByContextField,
      );
    } catch (e) {
      print('❌ Failed to save images to queue: $e');
    }
  }

  /// Activate images for upload after entity sync
  /// Replaces temp UID with server UID and marks status as pending_upload
  /// Called from onSyncSuccess callback
  @protected
  Future<void> activateImageUpload(
    SyncEntityType entityType,
    String oldUID,
    String newUID,
  ) async {
    if (_imageLocalDataSource == null) return;

    try {
      await _imageLocalDataSource.activateImagesForUpload(
        entityType,
        oldUID,
        newUID,
      );
      print(
        '✅ Images activated for upload: ${entityType.value} $oldUID → $newUID',
      );
    } catch (e) {
      print('❌ Failed to activate images for upload: $e');
    }
  }

  /// Get image sync status for an entity
  /// Returns status indicating pending, synced, failed image counts
  @protected
  Future<dynamic> getImageSyncStatus(
    SyncEntityType entityType,
    String entityUID,
  ) async {
    if (_imageLocalDataSource == null) {
      // Return empty status model
      return _createEmptyImageSyncStatus(entityType, entityUID);
    }

    try {
      return await _imageLocalDataSource.getImageSyncStatus(
        entityType,
        entityUID,
      );
    } catch (e) {
      print('❌ Failed to get image sync status: $e');
      return _createEmptyImageSyncStatus(entityType, entityUID);
    }
  }

  /// Helper to create empty status when ImageLocalDataSource is not available
  dynamic _createEmptyImageSyncStatus(
    SyncEntityType entityType,
    String entityUID,
  ) {
    // This will be ImageSyncStatusModel but we use dynamic to avoid imports
    return {
      'entityUID': entityUID,
      'entityType': entityType.value,
      'totalImages': 0,
      'pendingCount': 0,
      'syncedCount': 0,
      'failedCount': 0,
      'uploadingCount': 0,
    };
  }
}
