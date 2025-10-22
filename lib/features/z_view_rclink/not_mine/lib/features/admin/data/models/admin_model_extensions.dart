import 'package:drift/drift.dart';
import '../../../../core/database/app_database.dart';
import 'admin_model.dart';

/// Extension to add database methods to AdminModel
extension AdminModelX on AdminModel {
  /// Convert AdminModel to AdminRecord database entity
  AdminRecord toRecord({
    bool isSynced = true,
    DateTime? deletedAt,
    String? syncAction,
    int syncRetryCount = 0,
    String? syncError,
    DateTime? lastSyncAttempt,
  }) {
    return AdminRecord(
      // Sync fields
      isSynced: isSynced,
      deletedAt: deletedAt,
      syncAction: syncAction,
      syncRetryCount: syncRetryCount,
      syncError: syncError,
      lastSyncAttempt: lastSyncAttempt,
      // Business fields
      id: id,
      uid: uid,
      phone: phone,
      firstName: firstName,
      lastName: lastName,
      email: email,
      updatedAt: updatedAt,
      createdAt: createdAt,
    );
  }

  /// Create a database insertable for this admin model
  AdminsCompanion toCompanion({
    bool isSynced = false,
    String? syncAction = 'create',
  }) {
    return AdminsCompanion.insert(
      uid: uid,
      phone: phone,
      firstName: firstName != null ? Value(firstName) : const Value.absent(),
      lastName: lastName != null ? Value(lastName) : const Value.absent(),
      email: email != null ? Value(email) : const Value.absent(),
      updatedAt: updatedAt,
      createdAt: createdAt,
      isSynced: Value(isSynced),
      syncAction: Value(syncAction),
    );
  }
}

/// Extension to convert AdminRecord database entity to AdminModel
extension AdminRecordToModel on AdminRecord {
  AdminModel toModel() {
    return AdminModel(
      id: id,
      uid: uid,
      phone: phone,
      firstName: firstName,
      lastName: lastName,
      email: email,
      updatedAt: updatedAt,
      createdAt: createdAt,
    );
  }

  /// Check if this record needs to be synced to server
  bool get needsSync => !isSynced && deletedAt == null;

  /// Check if this record is marked for deletion
  bool get isDeleted => deletedAt != null;

  /// Check if this record has sync errors
  bool get hasSyncError => syncError != null;
}
