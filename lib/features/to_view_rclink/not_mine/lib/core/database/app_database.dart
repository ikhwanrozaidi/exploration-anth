import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import '../config/flavor_config.dart';

part 'app_database.g.dart';

// Configure drift runtime options to handle multiple database instances during development
void _configureDriftOptions() {
  // Only configure in development to avoid multiple database warnings during hot reload
  driftRuntimeOptions.dontWarnAboutMultipleDatabases = true;
}

// Base mixin for all syncable tables
mixin SyncableTable on Table {
  // Sync metadata columns
  BoolColumn get isSynced => boolean().withDefault(const Constant(false))();
  DateTimeColumn get deletedAt => dateTime().nullable()();
  TextColumn get syncAction =>
      text().nullable()(); // 'create', 'update', 'delete'
  IntColumn get syncRetryCount => integer().withDefault(const Constant(0))();
  TextColumn get syncError => text().nullable()();
  DateTimeColumn get lastSyncAttempt => dateTime().nullable()();
}

// Admins table for authentication
@DataClassName('AdminRecord')
class Admins extends Table with SyncableTable {
  IntColumn get id => integer().autoIncrement()(); // Primary key - Server ID
  TextColumn get uid => text()(); // Business UUID - unique for public lookup
  TextColumn get phone => text()();
  TextColumn get firstName => text().nullable()();
  TextColumn get lastName => text().nullable()();
  TextColumn get email => text().nullable()();
  DateTimeColumn get updatedAt => dateTime()();
  DateTimeColumn get createdAt => dateTime()();

  @override
  List<Set<Column>> get uniqueKeys => [
    {uid}, // UID must be unique for public lookup
    {phone}, // Phone must be unique
  ];
}

// Device registration table (for push notifications, etc.)
// @DataClassName('DeviceEntity')
// class Devices extends Table with SyncableTable {
//   IntColumn get id => integer().autoIncrement()(); // Primary key - Server ID
//   TextColumn get uid => text()(); // Business UUID - unique for public lookup
//   TextColumn get deviceId => text()(); // Unique device identifier
//   TextColumn get deviceCode => text()(); // Human-readable device code
//   TextColumn get type => text()(); // 'mobile', 'web', 'desktop'
//   TextColumn get name => text().nullable()(); // Device name
//   DateTimeColumn get lastActiveAt => dateTime().nullable()();
//   DateTimeColumn get updatedAt => dateTime()();
//   DateTimeColumn get createdAt => dateTime()();

//   @override
//   List<Set<Column>> get uniqueKeys => [
//     {uid}, // UID must be unique for public lookup
//     {deviceId}, // Device ID must be unique
//     {deviceCode}, // Device code must be unique
//   ];
// }

// Sync queue for offline operations
@DataClassName('SyncQueueRecord')
class SyncQueue extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get entityType => text()(); // 'admin', 'device', etc.
  TextColumn get entityUid => text()(); // UID of the entity
  TextColumn get action => text()(); // 'create', 'update', 'delete'
  TextColumn get payload => text().nullable()(); // JSON payload
  IntColumn get priority => integer().withDefault(const Constant(0))();
  IntColumn get retryCount => integer().withDefault(const Constant(0))();
  TextColumn get error => text().nullable()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get scheduledAt => dateTime().nullable()();
  BoolColumn get isProcessed => boolean().withDefault(const Constant(false))();
}

// Single role record for current company (only 1 row at a time)
@DataClassName('RoleRecord')
class Roles extends Table with SyncableTable {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get uid => text()();
  TextColumn get name => text()();
  TextColumn get description => text().nullable()();
  IntColumn get companyID => integer()(); // Match API field name
  BoolColumn get isSystemRole => boolean().withDefault(const Constant(false))();
  BoolColumn get isActive => boolean().withDefault(const Constant(true))();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
}

// Permissions table - stores all permissions for current role
@DataClassName('PermissionRecord')
class Permissions extends Table with SyncableTable {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get uid => text()();
  TextColumn get code => text()(); // e.g., "COMPANY_VIEW"
  TextColumn get name => text()();
  TextColumn get description => text().nullable()();
  TextColumn get category => text()(); // e.g., "Company", "User", "Role"
  TextColumn get scope => text()(); // e.g., "COMPANY"
  IntColumn get roleID => integer()(); // Link to current role
}

@DriftDatabase(tables: [Admins, SyncQueue, Roles, Permissions])
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? e]) : super(e ?? _openConnection());

  @override
  int get schemaVersion => 4; // Added Roles and Permissions tables

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        // Called when installing the app for the first time
        await m.createAll();
      },
      onUpgrade: (Migrator m, int from, int to) async {
        if (from < 3) {
          // Migration from version 2 to 3: Drop avatarUrl column
          // SQLite doesn't support DROP COLUMN, so we need to recreate the table
          
          // Disable foreign keys temporarily
          await customStatement('PRAGMA foreign_keys = OFF');
          
          // Rename existing table
          await customStatement('ALTER TABLE admins RENAME TO admins_old');
          
          // Create new table with new schema (without avatarUrl)
          await m.createTable(admins);
          
          // Copy data from old table to new table (excluding avatarUrl)
          await customStatement('''
            INSERT INTO admins (id, uid, phone, first_name, last_name, email, 
                               updated_at, created_at, is_synced, deleted_at, 
                               sync_action, sync_retry_count, sync_error, last_sync_attempt)
            SELECT id, uid, phone, first_name, last_name, email, 
                   updated_at, created_at, is_synced, deleted_at, 
                   sync_action, sync_retry_count, sync_error, last_sync_attempt
            FROM admins_old
          ''');
          
          // Drop old table
          await customStatement('DROP TABLE admins_old');
          
          // Re-enable foreign keys
          await customStatement('PRAGMA foreign_keys = ON');
        }
        
        if (from < 4) {
          // Migration from version 3 to 4: Add Roles and Permissions tables
          await m.createTable(roles);
          await m.createTable(permissions);
        }
      },
      beforeOpen: (details) async {
        // Enable foreign keys
        await customStatement('PRAGMA foreign_keys = ON');
      },
    );
  }

  static QueryExecutor _openConnection() {
    return LazyDatabase(() async {
      final dbFolder = await getApplicationDocumentsDirectory();
      final flavorName = FlavorConfig.flavorName;
      final dbName = 'rclink_$flavorName.db';
      final file = File(p.join(dbFolder.path, dbName));

      return NativeDatabase.createInBackground(file);
    });
  }
}

@singleton
class DatabaseService {
  static AppDatabase? _database;

  DatabaseService() {
    // Configure drift options to prevent warnings during development
    _configureDriftOptions();

    // Only create database if it doesn't exist
    _database ??= AppDatabase();
  }

  AppDatabase get database => _database!;

  Future<void> close() async {
    await _database?.close();
    _database = null;
  }
}
