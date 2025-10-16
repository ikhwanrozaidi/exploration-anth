import 'package:injectable/injectable.dart';
import 'package:drift/drift.dart';
import '../../../../core/database/app_database.dart';
import '../../domain/entities/admin.dart';

abstract class AdminLocalDataSource {
  Future<Admin?> getCurrentAdmin();
  Future<List<Admin>> getAllAdmins();
  Future<Admin?> getAdminByUid(String uid);
  Future<Admin?> getAdminByPhone(String phone);
  Future<Admin> updateAdmin(Admin admin);
  Future<Admin> saveAdmin(Admin admin, {bool markForSync = true});
  Future<void> deleteAdmin(String uid);
  Future<List<Admin>> getUnsyncedAdmins();
  Future<void> markAdminAsSynced(String uid);
  Future<void> addToSyncQueue({
    required String entityUid,
    required String action,
    int priority = 0,
  });
}

@LazySingleton(as: AdminLocalDataSource)
class AdminLocalDataSourceImpl implements AdminLocalDataSource {
  final DatabaseService _databaseService;

  AdminLocalDataSourceImpl(this._databaseService);

  AppDatabase get _database => _databaseService.database;

  @override
  Future<Admin?> getCurrentAdmin() async {
    final query = _database.select(_database.admins)
      ..where((a) => a.deletedAt.isNull())
      ..limit(1);

    final result = await query.getSingleOrNull();
    return result?.toEntity();
  }

  @override
  Future<List<Admin>> getAllAdmins() async {
    final query = _database.select(_database.admins)
      ..where((a) => a.deletedAt.isNull());

    final results = await query.get();
    return results.map((record) => record.toEntity()).toList();
  }

  @override
  Future<Admin?> getAdminByUid(String uid) async {
    final query = _database.select(_database.admins)
      ..where((a) => a.uid.equals(uid) & a.deletedAt.isNull());

    final result = await query.getSingleOrNull();
    return result?.toEntity();
  }

  @override
  Future<Admin?> getAdminByPhone(String phone) async {
    final query = _database.select(_database.admins)
      ..where((a) => a.phone.equals(phone) & a.deletedAt.isNull());

    final result = await query.getSingleOrNull();
    return result?.toEntity();
  }

  @override
  Future<Admin> updateAdmin(Admin admin) async {
    // Always marks for sync - use this for user-initiated updates
    return saveAdmin(admin, markForSync: true);
  }

  @override
  Future<Admin> saveAdmin(Admin admin, {bool markForSync = true}) async {
    final companion = markForSync
        ? admin.toCompanion(isSynced: false, syncAction: 'update')
        : admin.toCompanion(isSynced: true);

    await _database.update(_database.admins).replace(companion);

    // Only add to sync queue if marking for sync
    if (markForSync) {
      await addToSyncQueue(entityUid: admin.uid, action: 'update');
    }

    return admin;
  }

  @override
  Future<void> deleteAdmin(String uid) async {
    final now = DateTime.now();

    final updateQuery = _database.update(_database.admins)
      ..where((a) => a.uid.equals(uid));

    await updateQuery.write(
      AdminsCompanion(
        deletedAt: Value(now),
        isSynced: const Value(false),
        syncAction: const Value('delete'),
      ),
    );

    // Add to sync queue for deletion
    await addToSyncQueue(
      entityUid: uid,
      action: 'delete',
      priority: 1, // Higher priority for deletions
    );
  }

  @override
  Future<List<Admin>> getUnsyncedAdmins() async {
    final query = _database.select(_database.admins)
      ..where((a) => a.isSynced.equals(false) & a.deletedAt.isNull());

    final results = await query.get();
    return results.map((record) => record.toEntity()).toList();
  }

  @override
  Future<void> markAdminAsSynced(String uid) async {
    final updateQuery = _database.update(_database.admins)
      ..where((a) => a.uid.equals(uid));

    await updateQuery.write(
      const AdminsCompanion(
        isSynced: Value(true),
        syncAction: Value.absent(),
        syncError: Value.absent(),
        lastSyncAttempt: Value.absent(),
      ),
    );
  }

  @override
  Future<void> addToSyncQueue({
    required String entityUid,
    required String action,
    int priority = 0,
  }) async {
    await _database
        .into(_database.syncQueue)
        .insert(
          SyncQueueCompanion.insert(
            entityType: 'admin',
            entityUid: entityUid,
            action: action,
            priority: Value(priority),
            createdAt: DateTime.now(),
          ),
        );
  }
}
