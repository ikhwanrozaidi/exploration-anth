# Drift Migration Guide (2025 Edition)

## Using `make-migrations` Command

### Initial Setup (One-time)

1. **Configure build.yaml**:
```yaml
targets:
  $default:
    builders:
      drift_dev:
        options:
          databases:
            app_database: lib/core/database/app_database.dart
          schema_dir: lib/core/database/drift_schemas/
```

2. **Update Database Constructor**:
```dart
// Change from:
AppDatabase() : super(_openConnection());
// To:
AppDatabase([QueryExecutor? e]) : super(e ?? _openConnection());
```

### Migration Workflow

#### Step 1: Create Initial Schema (Version 1)
```bash
# Export initial schema
dart run drift_dev schema dump lib/core/database/app_database.dart lib/core/database/drift_schemas/

# Generate initial migration files
dart run drift_dev make-migrations
```

#### Step 2: Make Database Changes
```dart
// 1. Add new column to table
TextColumn get avatarUrl => text().nullable()();

// 2. Increment version
int get schemaVersion => 2; // was 1
```

#### Step 3: Generate Migration Code
```bash
# Run build_runner first
flutter pub run build_runner build --delete-conflicting-outputs

# Generate migration helpers
dart run drift_dev make-migrations
```

This generates:
- `app_database.steps.dart` - Step-by-step migration helper
- `test/drift/app_database/migration_test.dart` - Migration tests
- Schema files in `drift_schemas/app_database/`

#### Step 4: Use Generated Migration
```dart
import 'app_database.steps.dart';

@override
MigrationStrategy get migration {
  return MigrationStrategy(
    onCreate: (Migrator m) async {
      await m.createAll();
    },
    onUpgrade: stepByStep(
      from1To2: (m, schema) async {
        // Use schema-aware migration
        await m.addColumn(schema.admins, schema.admins.avatarUrl);
      },
      // Future migrations
      // from2To3: (m, schema) async { ... },
    ),
  );
}
```

### Benefits of `make-migrations`

1. **Type-safe migrations** - Access to schema at each version
2. **Automatic test generation** - Validates migrations work correctly
3. **Step-by-step approach** - Each migration is isolated
4. **Schema tracking** - Automatic schema file generation

### Testing Migrations

Run the generated tests:
```bash
flutter test test/drift/app_database/migration_test.dart
```

### Common Migration Operations

```dart
// Add column
await m.addColumn(schema.users, schema.users.newColumn);

// Create table
await m.createTable(schema.newTable);

// Add index
await m.createIndex(Index('idx_name', 'CREATE INDEX ...'));

// Custom SQL
await m.issueCustomQuery('ALTER TABLE ...');
```

### Files Generated

```
lib/core/database/
├── app_database.dart          # Your database
├── app_database.steps.dart    # Generated migration helper
└── drift_schemas/
    └── app_database/
        ├── drift_schema_v1.json
        └── drift_schema_v2.json

test/drift/app_database/
├── migration_test.dart        # Generated tests
└── generated/
    ├── schema.dart
    ├── schema_v1.dart
    └── schema_v2.dart
```