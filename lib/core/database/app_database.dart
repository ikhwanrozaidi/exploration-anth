import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:injectable/injectable.dart';

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

// User account record
@DataClassName('UserRecord')
class Users extends Table with SyncableTable {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get uid => text()();
  TextColumn get phone => text()();
  TextColumn get firstName => text().nullable()();
  TextColumn get lastName => text().nullable()();
  TextColumn get email => text().nullable()();
  DateTimeColumn get updatedAt => dateTime()();
  DateTimeColumn get createdAt => dateTime()();

  @override
  List<Set<Column>> get uniqueKeys => [
    {uid},
    {phone},
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

@DriftDatabase(tables: [Users])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return NativeDatabase.memory();
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
