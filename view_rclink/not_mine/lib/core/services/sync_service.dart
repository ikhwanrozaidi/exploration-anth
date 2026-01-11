import 'dart:async';
import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import '../../features/admin/data/datasources/admin_remote_data_source.dart';
import '../../features/admin/data/models/admin_model.dart';
import '../../features/admin/data/models/admin_model_extensions.dart';
import '../../features/daily_report/data/datasources/daily_report_image_remote_datasource.dart';
import '../../features/daily_report/data/datasources/daily_report_local_datasource.dart';
import '../../features/daily_report/data/datasources/daily_report_remote_datasource.dart';
import '../database/app_database.dart';
import '../sync/datasources/image_local_datasource.dart';
import '../sync/sync_constants.dart';

/// Service that handles background synchronization of offline data
@lazySingleton
class SyncService {
  final DatabaseService _databaseService;
  final AdminRemoteDataSource _adminRemoteDataSource;
  final DailyReportLocalDataSource _dailyReportLocalDataSource;
  final DailyReportRemoteDataSource _dailyReportRemoteDataSource;
  final DailyReportImageRemoteDataSource _dailyReportImageRemoteDataSource;
  final ImageLocalDataSource _imageLocalDataSource;
  Timer? _syncTimer;
  bool _isSyncing = false;

  SyncService(
    this._databaseService,
    this._adminRemoteDataSource,
    this._dailyReportLocalDataSource,
    this._dailyReportRemoteDataSource,
    this._dailyReportImageRemoteDataSource,
    this._imageLocalDataSource,
  );

  /// Start periodic sync
  void startPeriodicSync({Duration interval = const Duration(minutes: 5)}) {
    stopPeriodicSync();
    _syncTimer = Timer.periodic(interval, (_) => syncAll());

    // Also sync immediately
    syncAll();
  }

  /// Stop periodic sync
  void stopPeriodicSync() {
    _syncTimer?.cancel();
    _syncTimer = null;
  }

  /// Manually trigger sync for all pending items
  Future<void> syncAll() async {
    if (_isSyncing) return;

    _isSyncing = true;
    try {
      // Sync entities first (reports, etc.)
      await _syncFromQueue();

      // Then sync pending images
      await _syncPendingImages();
    } finally {
      _isSyncing = false;
    }
  }

  /// Process items from sync queue
  Future<void> _syncFromQueue() async {
    final db = _databaseService.database;

    // Get pending sync items ordered by priority and creation date
    final query = db.select(db.syncQueue)
      ..where((tbl) => tbl.isProcessed.equals(false))
      ..orderBy([
        (tbl) =>
            OrderingTerm(expression: tbl.priority, mode: OrderingMode.desc),
        (tbl) =>
            OrderingTerm(expression: tbl.createdAt, mode: OrderingMode.asc),
      ])
      ..limit(10); // Process in batches

    final pendingItems = await query.get();

    for (final item in pendingItems) {
      await _processSyncItem(item);
    }
  }

  /// Process individual sync item
  Future<void> _processSyncItem(SyncQueueRecord item) async {
    try {
      bool success = false;

      // Parse entity type from DB string
      final SyncEntityType entityType;
      try {
        entityType = SyncEntityType.fromString(item.entityType);
      } catch (e) {
        print('❌ Unknown entity type: ${item.entityType}');
        return;
      }

      switch (entityType) {
        case SyncEntityType.admin:
          success = await _syncAdmin(item);
          break;
        case SyncEntityType.dailyReport:
          success = await _syncDailyReport(item);
          break;
        // Add other entity types here as needed
        case SyncEntityType.company:
        case SyncEntityType.workScope:
        case SyncEntityType.road:
        case SyncEntityType.district:
        case SyncEntityType.province:
        case SyncEntityType.equipment:
        case SyncEntityType.quantity:
        case SyncEntityType.warning:
        case SyncEntityType.warningItem:
        case SyncEntityType.program:
          print('⚠️ Sync handler not implemented for: ${entityType.value}');
          return;
      }

      if (success) {
        // Mark as processed
        await (db.update(db.syncQueue)..where((tbl) => tbl.id.equals(item.id)))
            .write(const SyncQueueCompanion(isProcessed: Value(true)));
      } else {
        // Update retry count
        await (db.update(
          db.syncQueue,
        )..where((tbl) => tbl.id.equals(item.id))).write(
          SyncQueueCompanion(
            retryCount: Value(item.retryCount + 1),
            error: const Value('Sync failed'),
          ),
        );
      }
    } catch (e) {
      // Update error in queue
      await (db.update(
        db.syncQueue,
      )..where((tbl) => tbl.id.equals(item.id))).write(
        SyncQueueCompanion(
          retryCount: Value(item.retryCount + 1),
          error: Value(e.toString()),
        ),
      );
    }
  }

  /// Sync admin entity
  Future<bool> _syncAdmin(SyncQueueRecord item) async {
    final db = _databaseService.database;

    // Get the admin record
    final adminQuery = db.select(db.admins)
      ..where((tbl) => tbl.uid.equals(item.entityUid));
    final adminRecord = await adminQuery.getSingleOrNull();

    if (adminRecord == null) return true; // Already deleted

    // Parse action from DB string
    final SyncAction action;
    try {
      action = SyncAction.fromString(item.action);
    } catch (e) {
      print('❌ Unknown action: ${item.action}');
      return false;
    }

    switch (action) {
      case SyncAction.update:
        // Convert admin record to model
        final adminModel = adminRecord.toModel();

        // Call the update API
        final result = await _adminRemoteDataSource.updateAdmin(
          adminModel.toJson(),
        );

        return result.fold(
          (failure) async {
            // Update sync error in admin record
            await (db.update(
              db.admins,
            )..where((tbl) => tbl.uid.equals(item.entityUid))).write(
              AdminsCompanion(
                syncError: Value(failure.toString()),
                lastSyncAttempt: Value(DateTime.now()),
              ),
            );
            return false;
          },
          (updatedModel) async {
            // Mark admin as synced
            await (db.update(
              db.admins,
            )..where((tbl) => tbl.uid.equals(item.entityUid))).write(
              const AdminsCompanion(
                isSynced: Value(true),
                syncAction: Value(null),
                syncError: Value(null),
                lastSyncAttempt: Value(null),
              ),
            );
            return true;
          },
        );

      case SyncAction.delete:
        // TODO: Call admin delete API
        // final result = await _adminRemoteDataSource.deleteAdmin(item.entityUid);
        // if (result.isRight()) {
        //   // Actually delete from local DB after successful remote delete
        //   await (db.delete(db.admins)..where((tbl) => tbl.uid.equals(item.entityUid))).go();
        // }
        // return result.isRight();

        return false;

      case SyncAction.create:
      case SyncAction.patch:
        print('⚠️ Action not supported for admin: ${action.value}');
        return false;
    }
  }

  /// Sync daily report with temp UID replacement
  Future<bool> _syncDailyReport(SyncQueueRecord item) async {
    // Parse action from DB string
    final SyncAction action;
    try {
      action = SyncAction.fromString(item.action);
    } catch (e) {
      print('❌ Unknown action: ${item.action}');
      return false;
    }

    if (action != SyncAction.create) {
      print('⚠️ Unsupported action for daily_report: ${action.value}');
      return false;
    }

    try {
      // Get unsynced report data with companyUID
      final reportData = await _dailyReportLocalDataSource
          .getUnsyncedReportData(item.entityUid);

      if (reportData == null) {
        print('⚠️ Report not found or already synced: ${item.entityUid}');
        return true; // Mark as processed
      }

      print('🔄 Retrying sync for daily report: ${item.entityUid}');

      // Attempt remote creation
      final result = await _dailyReportRemoteDataSource.createDailyReport(
        data: reportData.model,
        companyUID: reportData.companyUID,
      );

      return await result.fold(
        (failure) async {
          print(
            '⚠️ Sync retry failed for ${item.entityUid}: ${failure.message}',
          );
          return false; // Will retry later
        },
        (serverModel) async {
          print('✅ Sync retry successful for ${item.entityUid}');

          // Update with server data + REPLACE TEMP UID
          await _dailyReportLocalDataSource.updateReportWithServerData(
            item.entityUid, // Old temp UID
            serverModel,
          );

          print('✅ Replaced temp UID ${item.entityUid} → ${serverModel.uid}');

          // Activate and upload images for this report
          await _imageLocalDataSource.activateImagesForUpload(
            SyncEntityType.dailyReport,
            item.entityUid, // Old temp UID
            serverModel.uid, // New server UID
          );

          // Upload images immediately
          await _syncImagesForReport(reportData.companyUID, serverModel.uid);

          return true; // Success
        },
      );
    } catch (e) {
      print('❌ Error syncing daily report ${item.entityUid}: $e');
      return false;
    }
  }

  /// Upload images for a daily report
  Future<void> _syncImagesForReport(
    String companyUID,
    String dailyReportUID,
  ) async {
    try {
      // Get pending images for this report
      final images = await _imageLocalDataSource.getImagesByEntity(
        entityType: SyncEntityType.dailyReport,
        entityUID: dailyReportUID,
      );

      if (images.isEmpty) {
        print('ℹ️ No images to upload for report $dailyReportUID');
        return;
      }

      print('📤 Uploading ${images.length} images for report $dailyReportUID');

      // Attempt upload
      final result = await _dailyReportImageRemoteDataSource
          .uploadImagesForReport(
            companyUID: companyUID,
            dailyReportUID: dailyReportUID,
            images: images,
          );

      await result.fold(
        (failure) async {
          print(
            '❌ Image upload failed for $dailyReportUID: ${failure.message}',
          );

          // Increment retry count for all images
          await _imageLocalDataSource.incrementRetryCount(
            SyncEntityType.dailyReport,
            dailyReportUID,
            failure.message,
          );
        },
        (uploadedFiles) async {
          print(
            '✅ Successfully uploaded ${uploadedFiles.length} images for $dailyReportUID',
          );

          // Mark images as synced with server metadata
          await _imageLocalDataSource.markImagesAsSynced(
            SyncEntityType.dailyReport,
            dailyReportUID,
            uploadedFiles,
          );
        },
      );
    } catch (e) {
      print('❌ Error uploading images for $dailyReportUID: $e');

      // Increment retry count on exception
      await _imageLocalDataSource.incrementRetryCount(
        SyncEntityType.dailyReport,
        dailyReportUID,
        e.toString(),
      );
    }
  }

  /// Sync all pending images (periodic retry for failed uploads)
  Future<void> _syncPendingImages() async {
    try {
      // Get all images ready for upload (pending_upload status, retryCount < maxRetries)
      final pendingImages = await _imageLocalDataSource.getImagesForUpload();

      if (pendingImages.isEmpty) {
        return;
      }

      print('🔄 Found ${pendingImages.length} pending images to sync');

      // Group images by entity
      final Map<String, List<ImageSyncQueueRecord>> imagesByEntity = {};
      for (final image in pendingImages) {
        final key =
            '${image.entityType}|${image.entityUID}|${image.companyUID}';
        imagesByEntity.putIfAbsent(key, () => []).add(image);
      }

      // Upload images for each entity
      for (final entry in imagesByEntity.entries) {
        final parts = entry.key.split('|');
        final entityType = parts[0];
        final entityUID = parts[1];
        final companyUID = parts[2];
        final images = entry.value;

        print(
          '📤 Uploading ${images.length} images for $entityType/$entityUID',
        );

        // Currently only support daily_report
        if (entityType == SyncEntityType.dailyReport.value) {
          final result = await _dailyReportImageRemoteDataSource
              .uploadImagesForReport(
                companyUID: companyUID,
                dailyReportUID: entityUID,
                images: images,
              );

          await result.fold(
            (failure) async {
              print(
                '❌ Image upload failed for $entityType/$entityUID: ${failure.message}',
              );
              await _imageLocalDataSource.incrementRetryCount(
                SyncEntityType.dailyReport,
                entityUID,
                failure.message,
              );
            },
            (uploadedFiles) async {
              print(
                '✅ Uploaded ${uploadedFiles.length} images for $entityType/$entityUID',
              );
              await _imageLocalDataSource.markImagesAsSynced(
                SyncEntityType.dailyReport,
                entityUID,
                uploadedFiles,
              );
            },
          );
        } else {
          print('⚠️ Image upload not implemented for entity type: $entityType');
        }
      }
    } catch (e) {
      print('❌ Error syncing pending images: $e');
    }
  }

  AppDatabase get db => _databaseService.database;

  /// Get sync status
  Future<SyncStatus> getSyncStatus() async {
    final pendingCount =
        await (db.select(db.syncQueue)
              ..where((tbl) => tbl.isProcessed.equals(false)))
            .get()
            .then((items) => items.length);

    final failedCount =
        await (db.select(db.syncQueue)..where(
              (tbl) => tbl.isProcessed.equals(false) & tbl.error.isNotNull(),
            ))
            .get()
            .then((items) => items.length);

    return SyncStatus(
      pendingCount: pendingCount,
      failedCount: failedCount,
      isSyncing: _isSyncing,
      lastSyncTime: DateTime.now(), // TODO: Track this properly
    );
  }
}

/// Sync status model
class SyncStatus {
  final int pendingCount;
  final int failedCount;
  final bool isSyncing;
  final DateTime? lastSyncTime;

  const SyncStatus({
    required this.pendingCount,
    required this.failedCount,
    required this.isSyncing,
    this.lastSyncTime,
  });

  bool get hasUnsyncedData => pendingCount > 0;
  bool get hasFailedSync => failedCount > 0;
}
