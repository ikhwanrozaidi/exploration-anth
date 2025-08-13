// import 'dart:async';
// import 'package:drift/drift.dart';
// import 'package:injectable/injectable.dart';
// import '../../features/admin/data/datasources/admin_remote_data_source.dart';
// import '../../features/admin/data/models/admin_model.dart';
// import '../../features/admin/domain/entities/admin.dart';
// import '../database/app_database.dart';


///
/// Belum Pakai, by Imanikhwan
///
///
// /// Service that handles background synchronization of offline data
// @lazySingleton
// class SyncService {
//   final DatabaseService _databaseService;
//   final AdminRemoteDataSource _adminRemoteDataSource;
//   Timer? _syncTimer;
//   bool _isSyncing = false;
  
//   SyncService(this._databaseService, this._adminRemoteDataSource);
  
//   /// Start periodic sync
//   void startPeriodicSync({Duration interval = const Duration(minutes: 5)}) {
//     stopPeriodicSync();
//     _syncTimer = Timer.periodic(interval, (_) => syncAll());
    
//     // Also sync immediately
//     syncAll();
//   }
  
//   /// Stop periodic sync
//   void stopPeriodicSync() {
//     _syncTimer?.cancel();
//     _syncTimer = null;
//   }
  
//   /// Manually trigger sync for all pending items
//   Future<void> syncAll() async {
//     if (_isSyncing) return;
    
//     _isSyncing = true;
//     try {
//       await _syncFromQueue();
//     } finally {
//       _isSyncing = false;
//     }
//   }
  
//   /// Process items from sync queue
//   Future<void> _syncFromQueue() async {
//     final db = _databaseService.database;
    
//     // Get pending sync items ordered by priority and creation date
//     final query = db.select(db.syncQueue)
//       ..where((tbl) => tbl.isProcessed.equals(false))
//       ..orderBy([
//         (tbl) => OrderingTerm(expression: tbl.priority, mode: OrderingMode.desc),
//         (tbl) => OrderingTerm(expression: tbl.createdAt, mode: OrderingMode.asc),
//       ])
//       ..limit(10); // Process in batches
    
//     final pendingItems = await query.get();
    
//     for (final item in pendingItems) {
//       await _processSyncItem(item);
//     }
//   }
  
//   /// Process individual sync item
//   Future<void> _processSyncItem(SyncQueueRecord item) async {
//     try {
//       bool success = false;
      
//       switch (item.entityType) {
//         case 'admin':
//           success = await _syncAdmin(item);
//           break;
//         // Add other entity types here
//         default:
//           print('Unknown entity type: ${item.entityType}');
//           return;
//       }
      
//       if (success) {
//         // Mark as processed
//         await (db.update(db.syncQueue)
//           ..where((tbl) => tbl.id.equals(item.id)))
//           .write(const SyncQueueCompanion(
//             isProcessed: Value(true),
//           ));
//       } else {
//         // Update retry count
//         await (db.update(db.syncQueue)
//           ..where((tbl) => tbl.id.equals(item.id)))
//           .write(SyncQueueCompanion(
//             retryCount: Value(item.retryCount + 1),
//             error: const Value('Sync failed'),
//           ));
//       }
//     } catch (e) {
//       // Update error in queue
//       await (db.update(db.syncQueue)
//         ..where((tbl) => tbl.id.equals(item.id)))
//         .write(SyncQueueCompanion(
//           retryCount: Value(item.retryCount + 1),
//           error: Value(e.toString()),
//         ));
//     }
//   }
  
//   /// Sync admin entity
//   Future<bool> _syncAdmin(SyncQueueRecord item) async {
//     final db = _databaseService.database;
    
//     // Get the admin record
//     final adminQuery = db.select(db.admins)
//       ..where((tbl) => tbl.uid.equals(item.entityUid));
//     final adminRecord = await adminQuery.getSingleOrNull();
    
//     if (adminRecord == null) return true; // Already deleted
    
//     switch (item.action) {
//       case 'update':
//         // Convert admin record to entity then to model
//         final admin = adminRecord.toEntity();
//         final adminModel = AdminModel.fromEntity(admin);
        
//         // Call the update API
//         final result = await _adminRemoteDataSource.updateAdmin(adminModel.toJson());
        
//         return result.fold(
//           (failure) async {
//             // Update sync error in admin record
//             await (db.update(db.admins)
//               ..where((tbl) => tbl.uid.equals(item.entityUid)))
//               .write(AdminsCompanion(
//                 syncError: Value(failure.toString()),
//                 lastSyncAttempt: Value(DateTime.now()),
//               ));
//             return false;
//           },
//           (updatedModel) async {
//             // Mark admin as synced
//             await (db.update(db.admins)
//               ..where((tbl) => tbl.uid.equals(item.entityUid)))
//               .write(const AdminsCompanion(
//                 isSynced: Value(true),
//                 syncAction: Value(null),
//                 syncError: Value(null),
//                 lastSyncAttempt: Value(null),
//               ));
//             return true;
//           },
//         );
        
//       case 'delete':
//         // TODO: Call admin delete API
//         // final result = await _adminRemoteDataSource.deleteAdmin(item.entityUid);
//         // if (result.isRight()) {
//         //   // Actually delete from local DB after successful remote delete
//         //   await (db.delete(db.admins)..where((tbl) => tbl.uid.equals(item.entityUid))).go();
//         // }
//         // return result.isRight();
        
//         return false;
        
//       default:
//         return false;
//     }
//   }
  
//   AppDatabase get db => _databaseService.database;
  
//   /// Get sync status
//   Future<SyncStatus> getSyncStatus() async {
//     final pendingCount = await (db.select(db.syncQueue)
//       ..where((tbl) => tbl.isProcessed.equals(false)))
//       .get()
//       .then((items) => items.length);
    
//     final failedCount = await (db.select(db.syncQueue)
//       ..where((tbl) => 
//         tbl.isProcessed.equals(false) & 
//         tbl.error.isNotNull()))
//       .get()
//       .then((items) => items.length);
    
//     return SyncStatus(
//       pendingCount: pendingCount,
//       failedCount: failedCount,
//       isSyncing: _isSyncing,
//       lastSyncTime: DateTime.now(), // TODO: Track this properly
//     );
//   }
// }

// /// Sync status model
// class SyncStatus {
//   final int pendingCount;
//   final int failedCount;
//   final bool isSyncing;
//   final DateTime? lastSyncTime;
  
//   const SyncStatus({
//     required this.pendingCount,
//     required this.failedCount,
//     required this.isSyncing,
//     this.lastSyncTime,
//   });
  
//   bool get hasUnsyncedData => pendingCount > 0;
//   bool get hasFailedSync => failedCount > 0;
// }