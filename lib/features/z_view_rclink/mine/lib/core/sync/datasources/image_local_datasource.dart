import 'dart:io';
import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:mime/mime.dart';
import '../../database/app_database.dart';
import '../models/file_response_dto.dart';
import '../models/image_sync_status_model.dart';
import '../services/file_storage_service.dart';
import '../sync_constants.dart';

abstract class ImageLocalDataSource {
  /// Save images to sync queue after entity creation
  Future<void> saveImagesToQueue({
    required SyncEntityType entityType,
    required String entityUID,
    required String companyUID,
    required String uploadedByUID,
    required Map<ImageContextField, List<String>> imagesByContextField,
  });

  /// Get all images ready for upload (status = pending_upload, retryCount < maxRetries)
  Future<List<ImageSyncQueueRecord>> getImagesForUpload();

  /// Get images for a specific entity
  Future<List<ImageSyncQueueRecord>> getImagesByEntity({
    required SyncEntityType entityType,
    required String entityUID,
  });

  /// Replace temp UID with server UID and mark for upload
  Future<void> activateImagesForUpload(
    SyncEntityType entityType,
    String oldUID,
    String newUID,
  );

  /// Mark images as synced after successful upload
  Future<void> markImagesAsSynced(
    SyncEntityType entityType,
    String entityUID,
    List<FileResponseDto> uploadedFiles,
  );

  /// Increment retry count on failure
  Future<void> incrementRetryCount(
    SyncEntityType entityType,
    String entityUID,
    String error,
  );

  /// Get sync status for a specific entity
  Future<ImageSyncStatusModel> getImageSyncStatus(
    SyncEntityType entityType,
    String entityUID,
  );

  /// Delete synced images from queue (cleanup)
  Future<void> deleteSyncedImages(SyncEntityType entityType, String entityUID);

  /// Cleanup synced images - both files and database records
  Future<void> cleanupSyncedImageFiles(SyncEntityType entityType, String entityUID);

  // ==================== Draft Image Methods ====================

  /// Save draft images to permanent storage with draftPending status
  /// Images are copied from temporary locations to app documents directory
  Future<void> saveDraftImages({
    required SyncEntityType entityType,
    required String entityUID,
    required String companyUID,
    required Map<ImageContextField, List<String>> imagesByContextField,
  });

  /// Get draft images with permanent file paths
  /// Returns map of context field to list of local file paths
  Future<Map<ImageContextField, List<String>>> getDraftImages({
    required SyncEntityType entityType,
    required String entityUID,
  });

  /// Activate draft images for upload when draft is submitted
  /// Changes status from draftPending to pendingUpload and replaces draft UID with server UID
  Future<void> activateDraftImagesForSubmission({
    required SyncEntityType entityType,
    required String draftUID,
    required String serverUID,
    required String uploadedByUID,
  });

  /// Delete draft images when draft is deleted
  /// Removes both database records and files from storage
  Future<void> deleteDraftImages({
    required SyncEntityType entityType,
    required String draftUID,
  });
}

@LazySingleton(as: ImageLocalDataSource)
class ImageLocalDataSourceImpl implements ImageLocalDataSource {
  final DatabaseService _databaseService;
  final FileStorageService _fileStorageService;

  ImageLocalDataSourceImpl(
    this._databaseService,
    this._fileStorageService,
  );

  AppDatabase get _database => _databaseService.database;

  @override
  Future<void> saveImagesToQueue({
    required SyncEntityType entityType,
    required String entityUID,
    required String companyUID,
    required String uploadedByUID,
    required Map<ImageContextField, List<String>> imagesByContextField,
  }) async {
    final records = <ImageSyncQueueCompanion>[];

    for (final entry in imagesByContextField.entries) {
      final contextField = entry.key;
      final imagePaths = entry.value;

      for (int i = 0; i < imagePaths.length; i++) {
        final imagePath = imagePaths[i];
        final file = File(imagePath);

        if (!await file.exists()) {
          print('⚠️ Image file not found: $imagePath');
          continue;
        }

        // Copy image to permanent storage
        final permanentPath = await _fileStorageService.copyToAppStorage(
          imagePath,
          entityType,
          entityUID,
          contextField,
          i,
        );

        final permanentFile = File(permanentPath);
        final fileSize = await permanentFile.length();
        final fileName = permanentFile.uri.pathSegments.last;
        final mimeType = lookupMimeType(permanentPath) ?? 'image/jpeg';

        print('🔍 Image metadata for ${contextField.value} #$i:');
        print('   Original path: $imagePath');
        print('   Permanent path: $permanentPath');
        print('   File name: $fileName');
        print('   File size: $fileSize bytes');
        print('   Detected MIME type: $mimeType');
        print('   Extension from path: ${permanentPath.split('.').last}');

        records.add(
          ImageSyncQueueCompanion.insert(
            entityType: entityType.value,
            entityUID: entityUID,
            contextField: contextField.value,
            sequence: i,
            localFilePath: permanentPath, // Store permanent path
            fileName: fileName,
            mimeType: mimeType,
            fileSize: fileSize,
            companyUID: companyUID,
            uploadedByUID: uploadedByUID,
            syncStatus: ImageSyncStatus.pendingEntitySync.value,
            createdAt: Value(DateTime.now()),
          ),
        );
      }
    }

    if (records.isNotEmpty) {
      await _database.batch((batch) {
        // CRITICAL FIX: Use insertOnConflictUpdate to prevent duplicates
        // If image already exists (same entityUID + contextField + sequence), update it
        for (final record in records) {
          batch.insert(
            _database.imageSyncQueue,
            record,
            onConflict: DoUpdate(
              (_) => record,
              target: [
                _database.imageSyncQueue.entityUID,
                _database.imageSyncQueue.contextField,
                _database.imageSyncQueue.sequence,
              ],
            ),
          );
        }
      });
      print('✅ Saved ${records.length} images to sync queue for ${entityType.value}/$entityUID (duplicates prevented)');
    }
  }

  @override
  Future<List<ImageSyncQueueRecord>> getImagesForUpload() async {
    final query = _database.select(_database.imageSyncQueue)
      ..where(
        (tbl) =>
            tbl.syncStatus.equals(ImageSyncStatus.pendingUpload.value) &
            tbl.retryCount.isSmallerThan(tbl.maxRetries),
      )
      ..orderBy([
        (tbl) => OrderingTerm(expression: tbl.createdAt, mode: OrderingMode.asc),
      ]);

    return await query.get();
  }

  @override
  Future<List<ImageSyncQueueRecord>> getImagesByEntity({
    required SyncEntityType entityType,
    required String entityUID,
  }) async {
    final query = _database.select(_database.imageSyncQueue)
      ..where(
        (tbl) =>
            tbl.entityType.equals(entityType.value) & tbl.entityUID.equals(entityUID),
      )
      ..orderBy([
        (tbl) => OrderingTerm(expression: tbl.contextField),
        (tbl) => OrderingTerm(expression: tbl.sequence),
      ]);

    return await query.get();
  }

  @override
  Future<void> activateImagesForUpload(
    SyncEntityType entityType,
    String oldUID,
    String newUID,
  ) async {
    await (_database.update(_database.imageSyncQueue)
          ..where(
            (tbl) =>
                tbl.entityType.equals(entityType.value) & tbl.entityUID.equals(oldUID),
          ))
        .write(
      ImageSyncQueueCompanion(
        entityUID: Value(newUID),
        syncStatus: Value(ImageSyncStatus.pendingUpload.value),
      ),
    );

    print('✅ Activated images for upload: ${entityType.value} $oldUID → $newUID');
  }

  @override
  Future<void> markImagesAsSynced(
    SyncEntityType entityType,
    String entityUID,
    List<FileResponseDto> uploadedFiles,
  ) async {
    // Create a map of contextField+sequence -> FileResponseDto for quick lookup
    final fileMap = <String, FileResponseDto>{};
    for (final file in uploadedFiles) {
      final key = '${file.contextField}_${file.sequence}';
      fileMap[key] = file;
    }

    // Get current queue records
    final currentRecords = await getImagesByEntity(
      entityType: entityType,
      entityUID: entityUID,
    );

    // Update each record with backend data
    await _database.batch((batch) {
      for (final record in currentRecords) {
        final key = '${record.contextField}_${record.sequence}';
        final uploadedFile = fileMap[key];

        if (uploadedFile != null) {
          batch.update(
            _database.imageSyncQueue,
            ImageSyncQueueCompanion(
              syncStatus: Value(ImageSyncStatus.synced.value),
              fileUID: Value(uploadedFile.uid),
              s3Key: Value(uploadedFile.s3Key),
              s3Url: Value(uploadedFile.s3Url),
              error: const Value(null),
              lastAttemptAt: Value(DateTime.now()),
            ),
            where: (_) => _database.imageSyncQueue.id.equals(record.id),
          );
        }
      }
    });

    print('✅ Marked ${uploadedFiles.length} images as synced for ${entityType.value}/$entityUID');

    // Delete local files after successful sync
    await _fileStorageService.deleteSyncedImages(entityType, entityUID);
  }

  @override
  Future<void> incrementRetryCount(
    SyncEntityType entityType,
    String entityUID,
    String error,
  ) async {
    final records = await getImagesByEntity(
      entityType: entityType,
      entityUID: entityUID,
    );

    await _database.batch((batch) {
      for (final record in records) {
        final newRetryCount = record.retryCount + 1;
        final newStatus = newRetryCount >= record.maxRetries
            ? ImageSyncStatus.failed.value
            : ImageSyncStatus.pendingUpload.value;

        batch.update(
          _database.imageSyncQueue,
          ImageSyncQueueCompanion(
            retryCount: Value(newRetryCount),
            syncStatus: Value(newStatus),
            error: Value(error),
            lastAttemptAt: Value(DateTime.now()),
          ),
          where: (_) => _database.imageSyncQueue.id.equals(record.id),
        );
      }
    });

    print('⚠️ Incremented retry count for ${entityType.value}/$entityUID images');
  }

  @override
  Future<ImageSyncStatusModel> getImageSyncStatus(
    SyncEntityType entityType,
    String entityUID,
  ) async {
    final images = await getImagesByEntity(
      entityType: entityType,
      entityUID: entityUID,
    );

    int pendingCount = 0;
    int syncedCount = 0;
    int failedCount = 0;
    int uploadingCount = 0;

    for (final image in images) {
      final status = ImageSyncStatus.fromString(image.syncStatus);
      switch (status) {
        case ImageSyncStatus.draftPending:
          pendingCount++;
          break;
        case ImageSyncStatus.pendingEntitySync:
        case ImageSyncStatus.pendingUpload:
          pendingCount++;
          break;
        case ImageSyncStatus.uploading:
          uploadingCount++;
          break;
        case ImageSyncStatus.synced:
          syncedCount++;
          break;
        case ImageSyncStatus.failed:
          failedCount++;
          break;
      }
    }

    return ImageSyncStatusModel(
      entityUID: entityUID,
      entityType: entityType.value,
      totalImages: images.length,
      pendingCount: pendingCount,
      syncedCount: syncedCount,
      failedCount: failedCount,
      uploadingCount: uploadingCount,
    );
  }

  @override
  Future<void> deleteSyncedImages(SyncEntityType entityType, String entityUID) async {
    await (_database.delete(_database.imageSyncQueue)
          ..where(
            (tbl) =>
                tbl.entityType.equals(entityType.value) &
                tbl.entityUID.equals(entityUID) &
                tbl.syncStatus.equals(ImageSyncStatus.synced.value),
          ))
        .go();

    print('🗑️ Deleted synced images for ${entityType.value}/$entityUID');
  }

  @override
  Future<void> cleanupSyncedImageFiles(
    SyncEntityType entityType,
    String entityUID,
  ) async {
    // Delete local files
    await _fileStorageService.deleteSyncedImages(entityType, entityUID);

    // Delete database records
    await deleteSyncedImages(entityType, entityUID);

    print('🧹 Cleaned up synced images (files + DB) for ${entityType.value}/$entityUID');
  }

  // ==================== Draft Image Methods Implementation ====================

  @override
  Future<void> saveDraftImages({
    required SyncEntityType entityType,
    required String entityUID,
    required String companyUID,
    required Map<ImageContextField, List<String>> imagesByContextField,
  }) async {
    // First, delete existing draft images for this entity to avoid duplicates
    await (_database.delete(_database.imageSyncQueue)
          ..where(
            (tbl) =>
                tbl.entityType.equals(entityType.value) &
                tbl.entityUID.equals(entityUID) &
                tbl.syncStatus.equals(ImageSyncStatus.draftPending.value),
          ))
        .go();

    final records = <ImageSyncQueueCompanion>[];

    for (final entry in imagesByContextField.entries) {
      final contextField = entry.key;
      final imagePaths = entry.value;

      for (int i = 0; i < imagePaths.length; i++) {
        final imagePath = imagePaths[i];
        final file = File(imagePath);

        if (!await file.exists()) {
          print('⚠️ Draft image not found: $imagePath');
          continue;
        }

        // Copy to permanent storage
        final permanentPath = await _fileStorageService.copyToAppStorage(
          imagePath,
          entityType,
          entityUID,
          contextField,
          i,
        );

        final permanentFile = File(permanentPath);
        final fileSize = await permanentFile.length();
        final fileName = permanentFile.uri.pathSegments.last;
        final mimeType = lookupMimeType(permanentPath) ?? 'image/jpeg';

        records.add(
          ImageSyncQueueCompanion.insert(
            entityType: entityType.value,
            entityUID: entityUID,
            contextField: contextField.value,
            sequence: i,
            localFilePath: permanentPath,
            fileName: fileName,
            mimeType: mimeType,
            fileSize: fileSize,
            companyUID: companyUID,
            uploadedByUID: '', // Will be set on submission
            syncStatus: ImageSyncStatus.draftPending.value, // NEW: Draft status
            createdAt: Value(DateTime.now()),
          ),
        );
      }
    }

    if (records.isNotEmpty) {
      await _database.batch((batch) {
        batch.insertAll(_database.imageSyncQueue, records);
      });
      print(
        '✅ Saved ${records.length} draft images for ${entityType.value}/$entityUID',
      );
    }
  }

  @override
  Future<Map<ImageContextField, List<String>>> getDraftImages({
    required SyncEntityType entityType,
    required String entityUID,
  }) async {
    final images = await (_database.select(_database.imageSyncQueue)
          ..where(
            (tbl) =>
                tbl.entityType.equals(entityType.value) &
                tbl.entityUID.equals(entityUID) &
                tbl.syncStatus.equals(ImageSyncStatus.draftPending.value),
          )
          ..orderBy([
            (tbl) => OrderingTerm(expression: tbl.contextField),
            (tbl) => OrderingTerm(expression: tbl.sequence),
          ]))
        .get();

    // Group by context field
    final result = <ImageContextField, List<String>>{};

    for (final image in images) {
      final contextField = ImageContextField.fromString(image.contextField);
      result.putIfAbsent(contextField, () => []).add(image.localFilePath);
    }

    print(
      '📂 Loaded ${images.length} draft images for ${entityType.value}/$entityUID',
    );
    return result;
  }

  @override
  Future<void> activateDraftImagesForSubmission({
    required SyncEntityType entityType,
    required String draftUID,
    required String serverUID,
    required String uploadedByUID,
  }) async {
    // Update all draft images:
    // 1. Change UID from draft to server
    // 2. Change status from draftPending to pendingUpload
    // 3. Set uploadedByUID
    final updated = await (_database.update(_database.imageSyncQueue)
          ..where(
            (tbl) =>
                tbl.entityType.equals(entityType.value) &
                tbl.entityUID.equals(draftUID) &
                tbl.syncStatus.equals(ImageSyncStatus.draftPending.value),
          ))
        .write(
      ImageSyncQueueCompanion(
        entityUID: Value(serverUID),
        uploadedByUID: Value(uploadedByUID),
        syncStatus: Value(ImageSyncStatus.pendingUpload.value),
      ),
    );

    print(
      '✅ Activated $updated draft images for upload: ${entityType.value} $draftUID → $serverUID',
    );
  }

  @override
  Future<void> deleteDraftImages({
    required SyncEntityType entityType,
    required String draftUID,
  }) async {
    // Get all draft images to delete files
    final images = await (_database.select(_database.imageSyncQueue)
          ..where(
            (tbl) =>
                tbl.entityType.equals(entityType.value) &
                tbl.entityUID.equals(draftUID) &
                tbl.syncStatus.equals(ImageSyncStatus.draftPending.value),
          ))
        .get();

    // Delete files from storage
    for (final image in images) {
      try {
        final file = File(image.localFilePath);
        if (await file.exists()) {
          await file.delete();
        }
      } catch (e) {
        print('⚠️ Failed to delete draft image file: ${image.localFilePath}');
      }
    }

    // Delete database records
    await (_database.delete(_database.imageSyncQueue)
          ..where(
            (tbl) =>
                tbl.entityType.equals(entityType.value) &
                tbl.entityUID.equals(draftUID) &
                tbl.syncStatus.equals(ImageSyncStatus.draftPending.value),
          ))
        .go();

    print(
      '🗑️ Deleted ${images.length} draft images for ${entityType.value}/$draftUID',
    );
  }
}
