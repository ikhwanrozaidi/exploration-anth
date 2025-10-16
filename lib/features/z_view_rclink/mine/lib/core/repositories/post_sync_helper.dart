import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:uuid/uuid.dart';
import 'dart:convert';
import 'package:drift/drift.dart' as drift;
import '../errors/failures.dart';
import '../database/app_database.dart';

/// Helper service for POST sync queue management
/// Use this in RemoteDataSource to queue failed POST requests
@lazySingleton
class PostSyncHelper {
  final DatabaseService _databaseService;

  PostSyncHelper(this._databaseService);

  /// Save failed POST request to sync queue
  Future<void> queueForSync({
    required String endpoint,
    required String method,
    required Map<String, dynamic> jsonPayload,
    required String featureName,
    required String entityType,
    String? localEntityId,
    List<String>? filePaths,
    String? fileFieldName,
    String? fileUploadEndpoint,
  }) async {
    final db = _databaseService.database;
    final idempotencyKey = const Uuid().v4();

    await db
        .into(db.syncQueue)
        .insert(
          SyncQueueCompanion.insert(
            // NEW columns (for POST sync)
            endpoint: drift.Value(endpoint),
            method: drift.Value(method),
            jsonPayload: drift.Value(jsonEncode(jsonPayload)),
            idempotencyKey: drift.Value(idempotencyKey),
            filePaths: filePaths != null
                ? drift.Value(jsonEncode(filePaths))
                : const drift.Value(null),
            fileFieldName: drift.Value(fileFieldName),
            fileUploadEndpoint: drift.Value(fileUploadEndpoint),
            featureName: drift.Value(featureName),
            localEntityId: drift.Value(localEntityId),

            // OLD columns (set defaults for compatibility)
            entityType: entityType,
            entityUid: localEntityId ?? '',
            action: method,
            payload: drift.Value(jsonEncode(jsonPayload)),

            // Timestamps
            createdAt: DateTime.now(),
            updatedAt: drift.Value(DateTime.now()),
          ),
        );

    print('📝 PostSyncHelper: Queued $method $endpoint for sync');
  }

  /// Check if error is connectivity-related
  bool isConnectivityError(dynamic error) {
    final errorString = error.toString().toLowerCase();
    return errorString.contains('socketexception') ||
        errorString.contains('network') ||
        errorString.contains('connection') ||
        errorString.contains('timeout');
  }

  /// Get pending sync count (for UI badges)
  Future<int> getPendingSyncCount() async {
    final db = _databaseService.database;
    final query = db.select(db.syncQueue)
      ..where((tbl) => tbl.isSynced.equals(false));
    final items = await query.get();
    return items.length;
  }

  /// Clear all synced items (cleanup)
  Future<void> clearSyncedItems() async {
    final db = _databaseService.database;
    await (db.delete(
      db.syncQueue,
    )..where((tbl) => tbl.isSynced.equals(true))).go();
  }
}


// endpoint: endpoint URL path
// method: HTTP method (POST, PUT, DELETE)
// jsonPayload: request body JSON as a Map
// featureName: feature/module name this request belongs to
// entityType: type of entity being synced
// localEntityId: temporary ID for tracking the entity in UI
// filePaths: list of local file paths to upload
// fileFieldName: form field name for file upload
// fileUploadEndpoint: seperate endpoint for file upload
// idempotencyKey: unique key to prevent duplication