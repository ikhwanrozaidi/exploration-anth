import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import '../config/flavor_config.dart';
import 'app_database.steps.dart';

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
  RealColumn get sectionStart => real().nullable()();
  RealColumn get sectionFinish => real().nullable()();
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

// Packages table
@DataClassName('PackageRecord')
class Packages extends Table with SyncableTable {
  IntColumn get id => integer().autoIncrement()(); // Primary key - Server ID
  TextColumn get uid => text()(); // Business UUID
  TextColumn get name => text()();
  TextColumn get description => text().nullable()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  List<Set<Column>> get uniqueKeys => [
    {uid}, // UID must be unique for public lookup
  ];
}

// Package Roads junction table
@DataClassName('PackageRoadRecord')
class PackageRoads extends Table with SyncableTable {
  IntColumn get id => integer().autoIncrement()(); // Primary key
  TextColumn get uid => text()(); // Business UUID
  TextColumn get roadUID => text()(); // Foreign key to Roads (via UID)
  RealColumn get sectionStart => real().nullable()();
  RealColumn get sectionFinish => real().nullable()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  List<Set<Column>> get uniqueKeys => [
    {uid}, // UID must be unique for public lookup
  ];
}

// Image Sync Queue table - tracks image uploads for any module (daily reports, inspections, etc.)
@DataClassName('ImageSyncQueueRecord')
class ImageSyncQueue extends Table {
  IntColumn get id => integer().autoIncrement()();

  // Generic entity reference (matches SyncQueue pattern)
  TextColumn get entityType =>
      text()(); // 'daily_report', 'inspection', 'disaster', etc.
  TextColumn get entityUID =>
      text()(); // UID of the entity (can be temp or server UID)

  // Image metadata
  TextColumn get contextField => text()(); // WORKERS_IMAGE, BEFORE_IMAGE, etc.
  IntColumn get sequence => integer()(); // Order within context field
  TextColumn get localFilePath => text()(); // Local storage path
  TextColumn get fileName => text()(); // Original filename
  TextColumn get mimeType => text()(); // image/jpeg, image/png
  IntColumn get fileSize => integer()(); // Size in bytes

  // Required context for API call
  TextColumn get companyUID => text()(); // For looking up companyID
  TextColumn get uploadedByUID => text()(); // Admin UID for uploadedByID

  // Sync status
  TextColumn get syncStatus =>
      text()(); // pending_entity_sync, pending_upload, uploading, synced, failed
  IntColumn get retryCount => integer().withDefault(const Constant(0))();
  IntColumn get maxRetries => integer().withDefault(const Constant(5))();

  // Backend response data (populated after successful upload)
  TextColumn get fileUID => text().nullable()(); // Backend File.uid
  TextColumn get s3Key => text().nullable()(); // Backend File.s3Key
  TextColumn get s3Url => text().nullable()(); // Backend File.s3Url

  // Error tracking
  TextColumn get error => text().nullable()();

  // Timestamps
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get lastAttemptAt => dateTime().nullable()();

  @override
  List<Set<Column>> get uniqueKeys => [];
}

// Files table - stores file metadata from backend
@DataClassName('FileRecord')
class Files extends Table with SyncableTable {
  IntColumn get id => integer().autoIncrement()(); // Primary key - Server ID
  TextColumn get uid => text()(); // Business UUID - unique for public lookup

  // File metadata
  TextColumn get fileName => text()();
  TextColumn get s3Url => text()();
  TextColumn get mimeType => text()();
  IntColumn get size => integer()();
  IntColumn get sequence => integer().nullable()();

  // Multi-tenant & context fields
  IntColumn get companyID => integer()();
  TextColumn get contextType => text()(); // 'daily_report', 'disaster', etc.
  TextColumn get contextField => text().nullable()(); // 'before_image', 'after_image', etc.
  IntColumn get dailyReportID => integer().nullable()(); // FK to DailyReports

  // Metadata
  IntColumn get uploadedByID => integer()();

  // Timestamps
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  // Indexes for query performance
  @override
  List<Set<Column>> get uniqueKeys => [
    {uid}, // uid must be unique
  ];
}

// Daily Reports table
@DataClassName('DailyReportRecord')
class DailyReports extends Table with SyncableTable {
  IntColumn get id => integer().autoIncrement()(); // Primary key - Server ID
  TextColumn get uid => text()(); // Business UUID
  TextColumn get name => text()();
  TextColumn get notes => text().nullable()();
  TextColumn get weatherCondition =>
      text()(); // 'SUNNY', 'RAINY', 'CLOUDY', etc.
  BoolColumn get workPerformed =>
      boolean().withDefault(const Constant(false))();

  // Location coordinates
  RealColumn get longitude =>
      real().nullable()(); // Using REAL for decimal precision
  RealColumn get latitude => real().nullable()();

  // Primary ownership - the company this report belongs to
  IntColumn get companyID => integer()(); // Foreign key to Companies

  // Optional contract relationship (null for in-house work)
  IntColumn get contractRelationID => integer().nullable()();

  // Report status for workflow management
  TextColumn get status => text().withDefault(
    const Constant('SUBMITTED'),
  )(); // 'SUBMITTED', 'APPROVED', 'REJECTED', 'REVISION_REQUESTED'

  // Optional approval tracking
  IntColumn get approvedByID => integer().nullable()(); // Foreign key to Admins
  DateTimeColumn get approvedAt => dateTime().nullable()();
  TextColumn get rejectionReason =>
      text().nullable()(); // Reason if rejected or revision requested

  // Work scope from the company
  IntColumn get workScopeID => integer()(); // Foreign key to WorkScopes

  IntColumn get roadID => integer()(); // Foreign key to Roads
  IntColumn get totalWorkers => integer().nullable()();
  RealColumn get fromSection =>
      real().nullable()(); // Using REAL for decimal precision
  RealColumn get toSection => real().nullable()();

  // Admin who created this report
  IntColumn get createdByID => integer()(); // Foreign key to Admins

  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  TextColumn get workScopeData => text().nullable()();
  TextColumn get roadData => text().nullable()();
  TextColumn get createdByData => text().nullable()();
  TextColumn get companyData => text().nullable()();
  TextColumn get equipmentsData => text().nullable()();
  TextColumn get reportQuantitiesData => text().nullable()();

  @override
  List<Set<Column>> get uniqueKeys => [
    {uid}, // UID must be unique for public lookup
  ];
}

// Generic report equipment table (used by daily reports, future: inspections)
@DataClassName('ReportEquipmentRecord')
class ReportEquipments extends Table with SyncableTable {
  IntColumn get id => integer().autoIncrement()(); // Primary key - Server ID
  TextColumn get reportType =>
      text()(); // 'DAILY_REPORT' (future: 'INSPECTION')
  IntColumn get dailyReportID => integer()
      .nullable()(); // Reference to DailyReports if reportType is DAILY_REPORT
  // Future: inspectionID for inspection module
  IntColumn get workEquipmentID =>
      integer()(); // Foreign key to WorkScopeEquipments
  IntColumn get addedByID => integer()(); // Admin who added this equipment
  DateTimeColumn get createdAt => dateTime()();

  @override
  List<Set<Column>> get uniqueKeys => [
    {dailyReportID, workEquipmentID}, // Prevent duplicate equipment per report
  ];
}

// Generic report quantity entries (used by daily reports, future: inspections)
@DataClassName('ReportQuantityRecord')
class ReportQuantities extends Table with SyncableTable {
  IntColumn get id => integer().autoIncrement()(); // Primary key - Server ID
  TextColumn get reportType =>
      text()(); // 'DAILY_REPORT' (future: 'INSPECTION')
  IntColumn get dailyReportID => integer()
      .nullable()(); // Reference to DailyReports if reportType is DAILY_REPORT
  // Future: inspectionID for inspection module
  IntColumn get quantityTypeID =>
      integer()(); // Foreign key to WorkQuantityTypes
  IntColumn get sequenceNo => integer().withDefault(
    const Constant(1),
  )(); // For multiple entries of same type
  RealColumn get totalLength =>
      real().nullable()(); // For R02: total measurement entered by user
  TextColumn get notes => text().nullable()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  List<Set<Column>> get uniqueKeys => [
    {
      dailyReportID,
      quantityTypeID,
      sequenceNo,
    }, // Prevent duplicate quantity entries
  ];
}

// Generic field values for quantity entries or segments
@DataClassName('ReportQuantityValueRecord')
class ReportQuantityValues extends Table with SyncableTable {
  IntColumn get id => integer().autoIncrement()(); // Primary key - Server ID
  IntColumn get reportQuantityID =>
      integer().nullable()(); // For regular quantity entries
  IntColumn get segmentID =>
      integer().nullable()(); // For segment entries (R02)
  IntColumn get quantityFieldID =>
      integer()(); // Foreign key to WorkQuantityFields
  TextColumn get value =>
      text()(); // Store all values as string, parse based on fieldType
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  List<Set<Column>> get uniqueKeys => [
    {
      reportQuantityID,
      quantityFieldID,
    }, // One value per field per quantity entry
    {segmentID, quantityFieldID}, // One value per field per segment
  ];
}

// Generic segment breakdowns (for R02 road shoulder)
@DataClassName('ReportSegmentRecord')
class ReportSegments extends Table with SyncableTable {
  IntColumn get id => integer().autoIncrement()(); // Primary key - Server ID
  IntColumn get reportQuantityID =>
      integer()(); // Foreign key to ReportQuantities
  IntColumn get segmentNumber => integer()(); // 1, 2, 3... (segment sequence)
  RealColumn get startDistance => real()(); // 0, 25, 50...
  RealColumn get endDistance => real()(); // 25, 50, 75...
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  List<Set<Column>> get uniqueKeys => [
    {reportQuantityID, segmentNumber}, // One segment per number per quantity
  ];
}

@DriftDatabase(
  tables: [
    Admins,
    SyncQueue,
    ImageSyncQueue,
    Files,
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
    Packages,
    PackageRoads,
    DailyReports,
    ReportEquipments,
    ReportQuantities,
    ReportQuantityValues,
    ReportSegments,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? e]) : super(e ?? _openConnection());

  @override
  int get schemaVersion => 17; // Added companyData to DailyReports table

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        // Called when installing the app for the first time
        await m.createAll();
      },
      onUpgrade: stepByStep(
        from1To2: (m, schema) async {
          // Migration from version 1 to 2: Initial migration
          // This would be handled by the generated schema
        },
        from2To3: (m, schema) async {
          // Migration from version 2 to 3: Drop avatarUrl column
          // SQLite doesn't support DROP COLUMN, so we need to recreate the table

          // Disable foreign keys temporarily
          await customStatement('PRAGMA foreign_keys = OFF');

          // Rename existing table
          await customStatement('ALTER TABLE admins RENAME TO admins_old');

          // Create new table with new schema (without avatarUrl)
          await m.createTable(schema.admins);

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
        },
        from3To4: (m, schema) async {
          // Migration from version 3 to 4: Add Roles and Permissions tables
          await m.createTable(schema.roles);
          await m.createTable(schema.permissions);
        },
        from4To5: (m, schema) async {
          // Migration from version 4 to 5: Add Companies tables
          await m.createTable(schema.companies);
        },
        from5To6: (m, schema) async {
          // Migration from version 5 to 6: Add new columns to Companies table
          // Check which columns exist before adding them
          final result = await customSelect(
            "PRAGMA table_info('companies')",
          ).get();

          final existingColumns = result
              .map((row) => row.data['name'] as String)
              .toSet();

          if (!existingColumns.contains('bumiputera')) {
            await m.addColumn(schema.companies, schema.companies.bumiputera);
          }
          if (!existingColumns.contains('einvoice_tin_no')) {
            await m.addColumn(schema.companies, schema.companies.einvoiceTinNo);
          }
          if (!existingColumns.contains('registration_date')) {
            await m.addColumn(
              schema.companies,
              schema.companies.registrationDate,
            );
          }
          if (!existingColumns.contains('admin_role_uid')) {
            await m.addColumn(schema.companies, schema.companies.adminRoleUid);
          }
          if (!existingColumns.contains('admin_role_name')) {
            await m.addColumn(schema.companies, schema.companies.adminRoleName);
          }
        },
        from6To7: (m, schema) async {
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
        },
        from7To8: (m, schema) async {
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
        },
        from8To9: (m, schema) async {
          // Migration from version 8 to 9: Add Countries and Provinces tables
          await m.createTable(schema.countries);
          await m.createTable(schema.provinces);
          await m.createTable(schema.districts);
          await m.createTable(schema.roadCategories);
          await m.createTable(schema.roads);
        },
        from9To10: (m, schema) async {
          // Migration from version 9 to 10: Add Daily Report tables
          await m.createTable(schema.dailyReports);
          await m.createTable(schema.reportEquipments);
          await m.createTable(schema.reportQuantities);
          await m.createTable(schema.reportQuantityValues);
          await m.createTable(schema.reportSegments);
        },
        from10To11: (m, schema) async {
          // Migration from version 10 to 11: Add into Daily Report tables
          await m.addColumn(
            schema.dailyReports,
            schema.dailyReports.workScopeData,
          );
          await m.addColumn(schema.dailyReports, schema.dailyReports.roadData);
          await m.addColumn(
            schema.dailyReports,
            schema.dailyReports.equipmentsData,
          );
          await m.addColumn(
            schema.dailyReports,
            schema.dailyReports.reportQuantitiesData,
          );
        },
        from11To12: (m, schema) async {
          // Migration from version 11 to 12: Add ImageSyncQueue table for image upload tracking
          await m.createTable(schema.imageSyncQueue);
        },
        from12To13: (m, schema) async {
          // 1. Add Packages and PackageRoads tables
          await m.createTable(schema.packages);
          await m.createTable(schema.packageRoads);

          // 2. Alter Roads table to change sectionStart and sectionFinish from TEXT to REAL
          await customStatement('''
            CREATE TABLE IF NOT EXISTS roads_new (
              id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
              uid TEXT NOT NULL,
              name TEXT NOT NULL,
              road_no TEXT,
              section_start REAL,
              section_finish REAL,
              main_category_id INTEGER,
              secondary_category_id INTEGER,
              district_id INTEGER NOT NULL,
              created_at INTEGER NOT NULL,
              updated_at INTEGER NOT NULL,
              is_synced INTEGER NOT NULL DEFAULT 0,
              deleted_at INTEGER,
              sync_action TEXT,
              sync_retry_count INTEGER NOT NULL DEFAULT 0,
              sync_error TEXT,
              last_sync_attempt INTEGER,
              UNIQUE(uid)
            )
          ''');

          // Copy data from old table to new table, converting TEXT to REAL
          await customStatement('''
              INSERT INTO roads_new (
                id, uid, name, road_no, section_start, section_finish,
                main_category_id, secondary_category_id, district_id,
                created_at, updated_at, is_synced, deleted_at, sync_action,
                sync_retry_count, sync_error, last_sync_attempt
              )
              SELECT 
                id, uid, name, road_no,
                CAST(section_start AS REAL),
                CAST(section_finish AS REAL),
                main_category_id, secondary_category_id, district_id,
                created_at, updated_at, is_synced, deleted_at, sync_action,
                sync_retry_count, sync_error, last_sync_attempt
              FROM roads
            ''');

          // Drop old table
          await customStatement('DROP TABLE roads');

          // Rename new table to roads
          await customStatement('ALTER TABLE roads_new RENAME TO roads');
        },
        from13To14: (m, schema) async {
          // Migration from version 13 to 14: Add Files table
          await m.createTable(schema.files);
        },
        from14To15: (m, schema) async {
          // Migration from version 14 to 15: Add dailyReportID to Files table
          await m.addColumn(schema.files, schema.files.dailyReportID);
        },
        from15To16: (m, schema) async {
          // Migration from version 15 to 16: Add createdByData to DailyReports table
          await m.addColumn(schema.dailyReports, schema.dailyReports.createdByData);
        },
        from16To17: (m, schema) async {
          // Migration from version 16 to 17: Add companyData to DailyReports table
          await m.addColumn(schema.dailyReports, schema.dailyReports.companyData);
        },
      ),
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
