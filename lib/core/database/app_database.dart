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

@DataClassName('UserRecord')
class Users extends Table {
  IntColumn get id => integer()();
  TextColumn get email => text()();
  TextColumn get role => text()();
  TextColumn get phone => text()();
  TextColumn get status => text()();
  TextColumn get balance => text().withDefault(const Constant('0.00'))();
  IntColumn get merchantId => integer().nullable()();
  TextColumn get country => text().nullable()();
  DateTimeColumn get createdAt => dateTime()();

  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get deletedAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('UserDetailRecord')
class UserDetails extends Table {
  IntColumn get userId => integer()(); // Foreign key to Users
  TextColumn get firstName => text()();
  TextColumn get lastName => text()();
  TextColumn get fullName => text()();
  TextColumn get address => text().nullable()();
  TextColumn get birthDate => text().nullable()();
  TextColumn get profilePicture => text().nullable()();
  IntColumn get gatePoint => integer().withDefault(const Constant(0))();
  BoolColumn get verify => boolean().withDefault(const Constant(false))();
  TextColumn get vaccount => text().nullable()();

  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {userId};
}

@DataClassName('UserSettingRecord')
class UserSettingsDetails extends Table {
  IntColumn get userId => integer()(); // Foreign key to Users
  BoolColumn get marketing => boolean().withDefault(const Constant(true))();
  BoolColumn get notifications => boolean().withDefault(const Constant(true))();
  BoolColumn get twoFA => boolean().withDefault(const Constant(false))();

  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {userId};
}

@DriftDatabase(tables: [Users, UserDetails, UserSettingsDetails])
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? e]) : super(e ?? _openConnection());

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
