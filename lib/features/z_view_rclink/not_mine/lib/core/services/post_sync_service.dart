import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:drift/drift.dart' as drift;
import 'package:injectable/injectable.dart';
import '../database/app_database.dart';
import '../network/connectivity_service.dart';

@lazySingleton
class PostSyncService {
  final DatabaseService _databaseService;
  final ConnectivityService _connectivityService;
  final Dio _dio;

  Timer? _connectivityCheckTimer;
  StreamSubscription? _connectivitySubscription;
  bool _isSyncing = false;
  bool _wasOffline = false;

  PostSyncService(this._databaseService, this._connectivityService, this._dio);

  /// Start monitoring connectivity and auto-sync
  void startMonitoring() {
    _connectivitySubscription = _connectivityService.connectivityStream.listen((
      isConnected,
    ) async {
      if (isConnected && _wasOffline) {
        print('📡 PostSyncService: Back online, starting sync...');
        _wasOffline = false;
        await syncPendingRequests();
      } else if (!isConnected) {
        _wasOffline = true;
        print('📴 PostSyncService: Offline detected');
      }
    });

    _connectivityCheckTimer = Timer.periodic(
      const Duration(seconds: 10),
      (_) => _checkAndSync(),
    );

    _checkAndSync();
  }

  void stopMonitoring() {
    _connectivityCheckTimer?.cancel();
    _connectivitySubscription?.cancel();
    _connectivityCheckTimer = null;
    _connectivitySubscription = null;
  }

  Future<void> _checkAndSync() async {
    final isConnected = await _connectivityService.checkConnectivity();
    if (isConnected && !_isSyncing) {
      await syncPendingRequests();
    }
  }

  Future<SyncResult> syncPendingRequests() async {
    if (_isSyncing) {
      print('⚠️ PostSyncService: Already syncing, skipping...');
      return SyncResult(success: 0, failed: 0, total: 0);
    }

    _isSyncing = true;
    int successCount = 0;
    int failedCount = 0;

    try {
      final db = _databaseService.database;

      final query = db.select(db.syncQueue)
        ..where((tbl) => tbl.isSynced.equals(false))
        ..where((tbl) => tbl.endpoint.isNotNull())
        ..orderBy([(tbl) => drift.OrderingTerm.asc(tbl.createdAt)]);

      final pendingItems = await query.get();
      print('📤 PostSyncService: Found ${pendingItems.length} pending items');

      if (pendingItems.isEmpty) {
        return SyncResult(success: 0, failed: 0, total: 0);
      }

      for (final item in pendingItems) {
        final success = await _syncItem(item);
        if (success) {
          successCount++;
          await (db.update(
            db.syncQueue,
          )..where((tbl) => tbl.id.equals(item.id))).write(
            const SyncQueueCompanion(
              isSynced: drift.Value(true),
              isProcessed: drift.Value(true),
            ),
          );
        } else {
          failedCount++;
          await (db.update(
            db.syncQueue,
          )..where((tbl) => tbl.id.equals(item.id))).write(
            SyncQueueCompanion(
              retryCount: drift.Value(item.retryCount + 1),
              lastSyncAttempt: drift.Value(DateTime.now()),
              updatedAt: drift.Value(DateTime.now()),
            ),
          );
        }
      }

      print(
        '✅ PostSyncService: Sync complete - $successCount succeeded, $failedCount failed',
      );
      return SyncResult(
        success: successCount,
        failed: failedCount,
        total: pendingItems.length,
      );
    } catch (e) {
      print('❌ PostSyncService: Sync error - $e');
      return SyncResult(success: successCount, failed: failedCount, total: 0);
    } finally {
      _isSyncing = false;
    }
  }

  Future<bool> _syncItem(SyncQueueRecord item) async {
    try {
      print('🔄 Syncing: ${item.method} ${item.endpoint}');

      if (item.filePaths != null && item.filePaths!.isNotEmpty) {
        return await _syncItemWithFiles(item);
      } else {
        return await _syncItemJsonOnly(item);
      }
    } catch (e) {
      print('❌ Sync failed for ${item.endpoint}: $e');

      final db = _databaseService.database;
      await (db.update(
        db.syncQueue,
      )..where((tbl) => tbl.id.equals(item.id))).write(
        SyncQueueCompanion(
          syncError: drift.Value(e.toString()),
          error: drift.Value(e.toString()),
          lastSyncAttempt: drift.Value(DateTime.now()),
        ),
      );

      return false;
    }
  }

  Future<bool> _syncItemJsonOnly(SyncQueueRecord item) async {
    try {
      if (item.endpoint == null || item.method == null) {
        print('❌ Missing required fields for JSON sync');
        return false;
      }

      final payloadJson = item.jsonPayload ?? item.payload;
      if (payloadJson == null) {
        print('❌ No payload found');
        return false;
      }

      final payload = jsonDecode(payloadJson) as Map<String, dynamic>;

      final response = await _dio.request(
        item.endpoint!,
        data: payload,
        options: Options(
          method: item.method!,
          headers: {
            if (item.idempotencyKey != null)
              'Idempotency-Key': item.idempotencyKey!,
          },
        ),
      );

      return response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300;
    } on DioException catch (e) {
      if (e.response?.statusCode == 409) {
        print('✅ Already synced (idempotency): ${item.endpoint}');
        return true;
      }
      print('❌ Sync failed: ${e.message}');
      return false;
    } catch (e) {
      print('❌ Sync error: $e');
      return false;
    }
  }

  Future<bool> _syncItemWithFiles(SyncQueueRecord item) async {
    try {
      if (item.jsonPayload == null ||
          item.endpoint == null ||
          item.method == null ||
          item.filePaths == null ||
          item.fileFieldName == null) {
        print('❌ Missing required fields for file sync');
        return false;
      }

      final filePaths = (jsonDecode(item.filePaths!) as List)
          .map((e) => e.toString())
          .toList();

      final formData = FormData();
      for (int i = 0; i < filePaths.length; i++) {
        formData.files.add(
          MapEntry(
            item.fileFieldName!,
            await MultipartFile.fromFile(
              filePaths[i],
              filename: filePaths[i].split('/').last,
            ),
          ),
        );
      }

      final uploadEndpoint = item.fileUploadEndpoint ?? '/upload';
      final fileUploadResponse = await _dio.post(
        uploadEndpoint,
        data: formData,
        options: Options(contentType: 'multipart/form-data'),
      );

      if (fileUploadResponse.statusCode == null ||
          fileUploadResponse.statusCode! < 200 ||
          fileUploadResponse.statusCode! >= 300) {
        print('❌ File upload failed: ${fileUploadResponse.statusCode}');
        return false;
      }

      final fileData = fileUploadResponse.data['data'] as List?;
      if (fileData == null || fileData.isEmpty) {
        print('❌ No file URLs returned from upload');
        return false;
      }

      final fileUrls = fileData.map((item) => item['url'] as String).toList();

      final payload = jsonDecode(item.jsonPayload!) as Map<String, dynamic>;
      payload[item.fileFieldName!] = fileUrls;

      final response = await _dio.request(
        item.endpoint!,
        data: payload,
        options: Options(
          method: item.method!,
          headers: {
            if (item.idempotencyKey != null)
              'Idempotency-Key': item.idempotencyKey!,
          },
        ),
      );

      return response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300;
    } on DioException catch (e) {
      if (e.response?.statusCode == 409) {
        print('✅ Already synced (idempotency): ${item.endpoint}');
        return true;
      }
      print('❌ File sync failed: ${e.message}');
      return false;
    } catch (e) {
      print('❌ File sync error: $e');
      return false;
    }
  }

  void dispose() {
    stopMonitoring();
  }
}

class SyncResult {
  final int success;
  final int failed;
  final int total;

  SyncResult({
    required this.success,
    required this.failed,
    required this.total,
  });

  bool get hasFailures => failed > 0;
  bool get allSucceeded => total > 0 && failed == 0;
}
