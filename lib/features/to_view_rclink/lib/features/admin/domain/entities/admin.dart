import 'package:equatable/equatable.dart';
import 'package:drift/drift.dart';
import '../../../../core/database/app_database.dart';

class Admin extends Equatable {
  final int id;
  final String uid;
  final String phone;
  final String? firstName;
  final String? lastName;
  final String? email;
  final DateTime updatedAt;
  final DateTime createdAt;

  const Admin({
    required this.id,
    required this.uid,
    required this.phone,
    this.firstName,
    this.lastName,
    this.email,
    required this.updatedAt,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [
    id,
    uid,
    phone,
    firstName,
    lastName,
    email,
    updatedAt,
    createdAt,
  ];

  Admin copyWith({
    int? id,
    String? uid,
    String? phone,
    String? firstName,
    String? lastName,
    String? email,
    DateTime? updatedAt,
    DateTime? createdAt,
  }) {
    return Admin(
      id: id ?? this.id,
      uid: uid ?? this.uid,
      phone: phone ?? this.phone,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      updatedAt: updatedAt ?? this.updatedAt,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  String get fullName {
    final parts = [
      firstName,
      lastName,
    ].where((part) => part?.isNotEmpty == true);
    return parts.isEmpty ? 'Unknown' : parts.join(' ');
  }

  String get displayName => fullName != 'Unknown' ? fullName : phone;
}

/// Extension to convert Admin domain entity to AdminRecord database entity
extension AdminToRecord on Admin {
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

  /// Create a database insertable for this admin
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

/// Extension to convert AdminRecord database entity to Admin domain entity
extension AdminRecordToDomain on AdminRecord {
  Admin toEntity() {
    return Admin(
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
