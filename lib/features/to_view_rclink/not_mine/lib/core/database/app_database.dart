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

// Companies table
@DataClassName('CompanyRecord')
class Companies extends Table {
  IntColumn get id => integer().autoIncrement()(); // Primary key - Server ID
  TextColumn get uid => text()(); // Business UUID - unique for public lookup
  TextColumn get name => text()();
  TextColumn get regNo => text().nullable()(); // Registration number
  TextColumn get cidbNo => text().nullable()(); // CIDB number
  TextColumn get address => text().nullable()();
  TextColumn get postalCode => text().nullable()();
  TextColumn get city => text().nullable()();
  TextColumn get state => text().nullable()();
  TextColumn get country => text().nullable()();
  TextColumn get phone => text().nullable()();
  TextColumn get email => text().nullable()();
  TextColumn get website => text().nullable()();
  TextColumn get companyType => text()(); // e.g., "PRIVATE_LIMITED_COMPANY"
  IntColumn get ownerID => integer()(); // Owner admin ID
  TextColumn get defaultBankAcc => text().nullable()(); // Default bank account
  TextColumn get defaultBankAccType => text().nullable()(); // e.g., "MAYBANK"
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  DateTimeColumn get deletedAt => dateTime().nullable()();
  TextColumn get adminRoleUid => text().nullable()(); // Admin role UID
  TextColumn get adminRoleName => text().nullable()(); // Admin role name
  BoolColumn get bumiputera => boolean().withDefault(const Constant(false))();
  TextColumn get einvoiceTinNo => text().nullable()();
  DateTimeColumn get registrationDate => dateTime().nullable()();

  @override
  List<Set<Column>> get uniqueKeys => [
    {uid}, // UID must be unique for public lookup
  ];
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

// Work Scope table
@DataClassName('WorkScopeRecord')
class WorkScopes extends Table with SyncableTable {
  IntColumn get id => integer().autoIncrement()(); // Primary key - Server ID
  TextColumn get uid => text()(); // Business UUID
  TextColumn get name => text()();
  TextColumn get code => text()();
  TextColumn get description => text()();
  BoolColumn get allowMultipleQuantities =>
      boolean().withDefault(const Constant(false))();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  IntColumn get companyID => integer()();

  @override
  List<Set<Column>> get uniqueKeys => [
    {uid}, // UID must be unique for public lookup
  ];
}

// Work Quantity Types table
@DataClassName('WorkQuantityTypeRecord')
class WorkQuantityTypes extends Table with SyncableTable {
  IntColumn get id => integer().autoIncrement()(); // Primary key - Server ID
  TextColumn get uid => text()(); // Business UUID
  TextColumn get name => text()();
  TextColumn get code => text()();
  IntColumn get displayOrder => integer()();
  BoolColumn get hasSegmentBreakdown =>
      boolean().withDefault(const Constant(false))();
  IntColumn get segmentSize => integer().nullable()();
  IntColumn get maxSegmentLength => integer().nullable()();
  IntColumn get workScopeID => integer()(); // Foreign key to WorkScopes

  @override
  List<Set<Column>> get uniqueKeys => [
    {uid}, // UID must be unique for public lookup
  ];
}

// Work Quantity Fields table
@DataClassName('WorkQuantityFieldRecord')
class WorkQuantityFields extends Table with SyncableTable {
  IntColumn get id => integer().autoIncrement()(); // Primary key - Server ID
  TextColumn get uid => text()(); // Business UUID
  TextColumn get name => text()();
  TextColumn get code => text()();
  TextColumn get fieldType => text()(); // e.g., "DROPDOWN", "TEXT", "NUMBER"
  TextColumn get unit => text().nullable()();
  TextColumn get validationRules => text().nullable()();
  IntColumn get displayOrder => integer()();
  BoolColumn get isRequired => boolean().withDefault(const Constant(false))();
  BoolColumn get isForSegment => boolean().withDefault(const Constant(false))();
  TextColumn get defaultValue => text().nullable()();
  TextColumn get placeholder => text().nullable()();
  TextColumn get helpText => text().nullable()();
  IntColumn get quantityTypeID =>
      integer()(); // Foreign key to WorkQuantityTypes

  @override
  List<Set<Column>> get uniqueKeys => [
    {uid}, // UID must be unique for public lookup
  ];
}

// Work Quantity Field Options table
@DataClassName('WorkQuantityFieldOptionRecord')
class WorkQuantityFieldOptions extends Table with SyncableTable {
  IntColumn get id => integer().autoIncrement()(); // Primary key - Server ID
  TextColumn get uid => text()(); // Business UUID
  TextColumn get value => text()();
  IntColumn get displayOrder => integer()();
  IntColumn get fieldID => integer()(); // Foreign key to WorkQuantityFields

  @override
  List<Set<Column>> get uniqueKeys => [
    {uid}, // UID must be unique for public lookup
  ];
}

// Work Scope Equipments table
@DataClassName('WorkScopeEquipmentsRecord')
class WorkScopeEquipments extends Table with SyncableTable {
  IntColumn get id => integer().autoIncrement()(); // Primary key - Server ID
  TextColumn get uid => text()(); // Business UUID
  TextColumn get name => text()();
  TextColumn get code => text()();

  @override
  List<Set<Column>> get uniqueKeys => [
    {uid}, // UID must be unique for public lookup
  ];
}

// Junction table for many-to-many relationship between WorkScope and WorkScopeEquipments
@DataClassName('WorkScopeEquipmentRecord')
class WorkScopeEquipment extends Table with SyncableTable {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get workScopeID => integer()(); // Foreign key to WorkScopes
  IntColumn get workEquipmentID =>
      integer()(); // Foreign key to WorkScopeEquipments

  @override
  List<Set<Column>> get uniqueKeys => [
    {workScopeID, workEquipmentID}, // Prevent duplicate relationships
  ];
}

// Countries table
@DataClassName('CountryRecord')
class Countries extends Table with SyncableTable {
  IntColumn get id => integer().autoIncrement()(); // Primary key - Server ID
  TextColumn get uid => text()(); // Business UUID
  TextColumn get name => text()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  List<Set<Column>> get uniqueKeys => [
    {uid}, // UID must be unique for public lookup
  ];
}

// Provinces/States table
@DataClassName('ProvinceRecord')
class Provinces extends Table with SyncableTable {
  IntColumn get id => integer().autoIncrement()(); // Primary key - Server ID
  TextColumn get uid => text()(); // Business UUID
  TextColumn get name => text()();
  IntColumn get countryID => integer()(); // Foreign key to Countries
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  List<Set<Column>> get uniqueKeys => [
    {uid}, // UID must be unique for public lookup
  ];
}

// Districts table
@DataClassName('DistrictRecord')
class Districts extends Table with SyncableTable {
  IntColumn get id => integer().autoIncrement()(); // Primary key - Server ID
  TextColumn get uid => text()(); // Business UUID
  TextColumn get name => text()();
  IntColumn get stateId =>
      integer()(); // Foreign key to Provinces (matches entity field name)
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  List<Set<Column>> get uniqueKeys => [
    {uid}, // UID must be unique for public lookup
  ];
}

// Road Categories table
@DataClassName('RoadCategoryRecord')
class RoadCategories extends Table with SyncableTable {
  IntColumn get id => integer().autoIncrement()(); // Primary key - Server ID
  TextColumn get uid => text()(); // Business UUID
  TextColumn get name => text()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  List<Set<Column>> get uniqueKeys => [
    {uid}, // UID must be unique for public lookup
  ];
}

// Roads table
@DataClassName('RoadRecord')
class Roads extends Table with SyncableTable {
  IntColumn get id => integer().autoIncrement()(); // Primary key - Server ID
  TextColumn get uid => text()(); // Business UUID
  TextColumn get name => text()();
  TextColumn get roadNo => text().nullable()(); // Road number
  TextColumn get sectionStart => text().nullable()(); // Section start point
  TextColumn get sectionFinish => text().nullable()(); // Section finish point
  IntColumn get mainCategoryId =>
      integer().nullable()(); // FK to RoadCategories
  IntColumn get secondaryCategoryId =>
      integer().nullable()(); // FK to RoadCategories
  IntColumn get districtId => integer()(); // Foreign key to Districts
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  List<Set<Column>> get uniqueKeys => [
    {uid}, // UID must be unique for public lookup
  ];
}

@DriftDatabase(
  tables: [
    Admins,
    SyncQueue,
    Roles,
    Permissions,
    Companies,
    WorkScopes,
    WorkQuantityTypes,
    WorkQuantityFields,
    WorkQuantityFieldOptions,
    WorkScopeEquipments,
    WorkScopeEquipment,
    Countries,
    Provinces,
    Districts,
    RoadCategories,
    Roads,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? e]) : super(e ?? _openConnection());

  @override
  int get schemaVersion => 9; // Renamed tables in version 8

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

        if (from < 5) {
          // Migration from version 4 to 5: Add Companies tables
          await m.createTable(companies);
        }

        if (from < 6) {
          // Migration from version 5 to 6: Add new columns to Companies table
          // Check which columns exist before adding them
          final result = await customSelect(
            "PRAGMA table_info('companies')",
          ).get();

          final existingColumns = result
              .map((row) => row.data['name'] as String)
              .toSet();

          if (!existingColumns.contains('bumiputera')) {
            await m.addColumn(companies, companies.bumiputera);
          }
          if (!existingColumns.contains('einvoice_tin_no')) {
            await m.addColumn(companies, companies.einvoiceTinNo);
          }
          if (!existingColumns.contains('registration_date')) {
            await m.addColumn(companies, companies.registrationDate);
          }
          if (!existingColumns.contains('admin_role_uid')) {
            await m.addColumn(companies, companies.adminRoleUid);
          }
          if (!existingColumns.contains('admin_role_name')) {
            await m.addColumn(companies, companies.adminRoleName);
          }
        }

        if (from < 7) {
          // Migration from version 6 to 7: Add Scope of Work related tables (original names)
          // These tables were created with old names in version 7
          // They will be renamed in version 8
          await customStatement('''
            CREATE TABLE IF NOT EXISTS scope_of_works (
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              uid TEXT NOT NULL,
              name TEXT NOT NULL,
              code TEXT NOT NULL,
              description TEXT NOT NULL,
              allow_multiple_quantities INTEGER NOT NULL DEFAULT 0,
              created_at INTEGER NOT NULL,
              updated_at INTEGER NOT NULL,
              company_i_d INTEGER NOT NULL,
              is_synced INTEGER NOT NULL DEFAULT 0,
              deleted_at INTEGER,
              sync_action TEXT,
              sync_retry_count INTEGER NOT NULL DEFAULT 0,
              sync_error TEXT,
              last_sync_attempt INTEGER,
              UNIQUE(uid)
            )
          ''');

          await customStatement('''
            CREATE TABLE IF NOT EXISTS work_quantity_types (
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              uid TEXT NOT NULL,
              name TEXT NOT NULL,
              code TEXT NOT NULL,
              display_order INTEGER NOT NULL,
              has_segment_breakdown INTEGER NOT NULL DEFAULT 0,
              segment_size INTEGER,
              max_segment_length INTEGER,
              scope_of_work_id INTEGER NOT NULL,
              is_synced INTEGER NOT NULL DEFAULT 0,
              deleted_at INTEGER,
              sync_action TEXT,
              sync_retry_count INTEGER NOT NULL DEFAULT 0,
              sync_error TEXT,
              last_sync_attempt INTEGER,
              UNIQUE(uid)
            )
          ''');

          await customStatement('''
            CREATE TABLE IF NOT EXISTS quantity_fields (
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              uid TEXT NOT NULL,
              name TEXT NOT NULL,
              code TEXT NOT NULL,
              field_type TEXT NOT NULL,
              unit TEXT,
              validation_rules TEXT,
              display_order INTEGER NOT NULL,
              is_required INTEGER NOT NULL DEFAULT 0,
              is_for_segment INTEGER NOT NULL DEFAULT 0,
              default_value TEXT,
              placeholder TEXT,
              help_text TEXT,
              work_quantity_type_id INTEGER NOT NULL,
              is_synced INTEGER NOT NULL DEFAULT 0,
              deleted_at INTEGER,
              sync_action TEXT,
              sync_retry_count INTEGER NOT NULL DEFAULT 0,
              sync_error TEXT,
              last_sync_attempt INTEGER,
              UNIQUE(uid)
            )
          ''');

          await customStatement('''
            CREATE TABLE IF NOT EXISTS dropdown_options (
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              uid TEXT NOT NULL,
              value TEXT NOT NULL,
              display_order INTEGER NOT NULL,
              quantity_field_id INTEGER NOT NULL,
              is_synced INTEGER NOT NULL DEFAULT 0,
              deleted_at INTEGER,
              sync_action TEXT,
              sync_retry_count INTEGER NOT NULL DEFAULT 0,
              sync_error TEXT,
              last_sync_attempt INTEGER,
              UNIQUE(uid)
            )
          ''');

          await customStatement('''
            CREATE TABLE IF NOT EXISTS work_equipments (
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              uid TEXT NOT NULL,
              name TEXT NOT NULL,
              code TEXT NOT NULL,
              is_synced INTEGER NOT NULL DEFAULT 0,
              deleted_at INTEGER,
              sync_action TEXT,
              sync_retry_count INTEGER NOT NULL DEFAULT 0,
              sync_error TEXT,
              last_sync_attempt INTEGER,
              UNIQUE(uid)
            )
          ''');

          await customStatement('''
            CREATE TABLE IF NOT EXISTS scope_of_work_equipments (
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              scope_of_work_id INTEGER NOT NULL,
              work_equipment_id INTEGER NOT NULL,
              is_synced INTEGER NOT NULL DEFAULT 0,
              deleted_at INTEGER,
              sync_action TEXT,
              sync_retry_count INTEGER NOT NULL DEFAULT 0,
              sync_error TEXT,
              last_sync_attempt INTEGER,
              UNIQUE(scope_of_work_id, work_equipment_id)
            )
          ''');
        }

        if (from < 8) {
          // Migration from version 7 to 8: Rename tables and columns
          // Note: SQLite doesn't support direct column renaming, but table renaming works

          // Rename tables
          await customStatement(
            'ALTER TABLE scope_of_works RENAME TO work_scopes',
          );
          await customStatement(
            'ALTER TABLE quantity_fields RENAME TO work_quantity_fields',
          );
          await customStatement(
            'ALTER TABLE dropdown_options RENAME TO work_quantity_field_options',
          );
          await customStatement(
            'ALTER TABLE work_equipments RENAME TO work_scope_equipments',
          );
          await customStatement(
            'ALTER TABLE scope_of_work_equipments RENAME TO work_scope_equipment',
          );

          // For column renames in SQLite, we need to recreate tables with new column names
          // This is handled automatically by Drift when we regenerate the migration helpers
        }

        if (from < 9) {
          // Migration from version 8 to 9: Add Countries and Provinces tables
          await m.createTable(countries);
          await m.createTable(provinces);
          await m.createTable(districts);
          await m.createTable(roadCategories);
          await m.createTable(roads);
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
