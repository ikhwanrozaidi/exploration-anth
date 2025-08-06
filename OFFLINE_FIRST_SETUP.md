# Offline-First Sync System with Drift + SQLite

This document explains the complete offline-first authentication and sync system implemented for your Flutter app using Drift + SQLite.

## Architecture Overview

The system follows your specified data flow:

1. **App starts**: If online, fetches/creates/updates/deletes data from API and stores in Drift database. If offline, fetches/creates/updates/deletes from Drift database.
2. **Data contains `isSynced` flag**: Tracks whether local changes have been synchronized with the server.
3. **New data**: If online, updates database and server simultaneously; if offline, updates database with `isSynced` as false.
4. **Editing**: Same behavior as new data creation.
5. **Deletion**: Sets `deleted_at` flag in database. Once online, updates server and removes from database.
6. **Efficient sync**: Background sync service processes sync queue for scalable synchronization.

## Key Components

### 1. Database Schema (`lib/core/database/app_database.dart`)

**Tables:**

- `Admins`: User authentication data with sync fields
- `Devices`: Device registration for push notifications
- `PendingUploads`: File uploads waiting for internet connection
- `SyncQueue`: Queue of operations waiting to be synchronized

**SyncableTable Mixin:**

```dart
mixin SyncableTable on Table {
  BoolColumn get isSynced => boolean().withDefault(const Constant(false))();
  DateTimeColumn get deletedAt => dateTime().nullable()();
  TextColumn get syncAction => text().nullable()(); // 'create', 'update', 'delete'
  IntColumn get syncRetryCount => integer().withDefault(const Constant(0))();
  TextColumn get syncError => text().nullable()();
  DateTimeColumn get lastSyncAttempt => dateTime().nullable()();
}
```

**Key Features:**

- `id`: Primary key (auto-increment server ID)
- `uid`: Unique UUID for public lookup
- Soft deletion with `deletedAt` timestamp
- Comprehensive sync metadata

### 2. Auth Repository (`lib/features/auth/data/repositories/auth_repository_impl.dart`)

**Offline-First Implementation:**

- **OTP Operations**: Online-only (as per your requirement)
- **Profile Updates**: Update local first, then sync to server
- **Profile Retrieval**: Try local cache first, fallback to server
- **Token Management**: Online-only with local caching

**Key Methods:**

```dart
// Always online (OTP requirement)
Future<ApiResponse<AuthResult>> verifyOtp(String phone, String otp)

// Offline-first approach
Future<ApiResponse<Admin>> updateProfile(Admin admin)
Future<ApiResponse<Admin>> getProfile({bool forceRefresh = false})
```

### 3. Sync Service (`lib/core/sync/sync_service.dart`)

**Background Synchronization:**

- Periodic sync every 5 minutes (configurable)
- Processes sync queue items by priority
- Handles create, update, delete operations
- Retry mechanism for failed operations

**Usage:**

```dart
// Start sync after login
_syncService.startPeriodicSync();

// Force immediate sync
await _syncService.syncNow();

// Stop sync on logout
_syncService.stopPeriodicSync();
```

### 4. Connectivity Service (`lib/core/network/connectivity_service.dart`)

**Network Monitoring:**

- Real-time connectivity status
- Actual internet access verification (not just device connectivity)
- Stream-based updates for reactive UI

## Usage Examples

### 1. Phone Authentication (Online-Only)

```dart
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;

  // Send OTP
  Future<void> _sendOtp(String phone) async {
    final result = await _authRepository.sendOtp(phone);
    // Handle result...
  }

  // Verify OTP and login
  Future<void> _verifyOtp(String phone, String otp) async {
    final result = await _authRepository.verifyOtp(phone, otp);
    if (result.isSuccess) {
      // Sync service automatically starts after successful login
      // Navigate to home screen
    }
  }
}
```

### 2. Profile Management (Offline-First)

```dart
// Update profile - works offline and online
Future<void> updateUserProfile(Admin updatedAdmin) async {
  final result = await _authRepository.updateProfile(updatedAdmin);

  if (result.isSuccess) {
    // UI updated immediately with local data
    // Sync happens automatically in background
    emit(ProfileUpdated(result.data));
  }
}

// Get profile - offline-first with server fallback
Future<void> loadProfile({bool forceRefresh = false}) async {
  final result = await _authRepository.getProfile(forceRefresh: forceRefresh);

  if (result.isSuccess) {
    emit(ProfileLoaded(result.data));
  }
}
```

### 3. Monitoring Sync Status

```dart
class SyncStatusWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
      stream: GetIt.instance<ConnectivityService>().connectivityStream,
      builder: (context, snapshot) {
        final isOnline = snapshot.data ?? false;
        return Container(
          child: isOnline
            ? Icon(Icons.cloud_done, color: Colors.green)
            : Icon(Icons.cloud_off, color: Colors.orange),
        );
      },
    );
  }
}
```

## Data Flow Scenarios

### Scenario 1: Online Profile Update

1. User updates profile → `updateProfile()` called
2. Local database updated immediately (UI updates)
3. Server API called simultaneously
4. On success: Mark local data as `isSynced: true`
5. On failure: Add to sync queue for retry

### Scenario 2: Offline Profile Update

1. User updates profile → `updateProfile()` called
2. Local database updated with `isSynced: false`
3. UI updates immediately with local data
4. Operation added to sync queue
5. When online: Sync service processes queue
6. Server updated → Local marked as synced

### Scenario 3: App Startup

1. Check connectivity status
2. If online: Start background sync service
3. Load data from local database first (fast UI)
4. Sync with server in background
5. Update UI if server data differs

## Sync Queue Processing

The sync system processes operations in this order:

1. **Priority**: Delete operations (priority 1) before updates (priority 0)
2. **FIFO**: Within same priority, oldest operations first
3. **Retry Logic**: Failed operations retry with exponential backoff
4. **Batch Processing**: Process up to 20 items per sync cycle

## Best Practices

### 1. Always Update Local First

```dart
// ✅ Good: Update local immediately for responsive UI
await _updateAdminLocally(admin);
if (isOnline) {
  try {
    await _updateServerThenSync(admin);
  } catch (e) {
    await _addToSyncQueue(admin);
  }
}

// ❌ Bad: Wait for server response
if (isOnline) {
  await _updateServer(admin);
  await _updateLocal(admin);
}
```

### 2. Handle Conflicts Gracefully

```dart
// Server data always wins in conflicts
if (serverUpdatedAt.isAfter(localUpdatedAt)) {
  await _updateLocalWithServerData(serverAdmin);
} else {
  await _addToSyncQueue(localAdmin);
}
```

### 3. Use Soft Deletes

```dart
// Mark as deleted locally
await _database.deleteAdmin(uid); // Sets deletedAt timestamp

// Sync service will handle server deletion
// and clean up local data once confirmed
```

## Database Operations

### Core Operations Available:

```dart
// Admin operations
await database.getAdminByUID(uid);
await database.getAdminByPhone(phone);
await database.upsertAdmin(adminCompanion);
await database.deleteAdmin(uid);
await database.getUnsyncedAdmins();

// Sync queue operations
await database.addToSyncQueue(entityType: 'admin', entityUID: uid, action: 'update');
await database.getPendingSyncItems(limit: 20);
await database.markSyncInProgress(queueUID);
await database.completeSyncItem(queueUID);
await database.failSyncItem(queueUID, error);

// Utility operations
await database.getDatabaseStats();
await database.cleanupCompletedUploads();
```

## Configuration

### Sync Intervals

```dart
// Default: 5 minutes
_syncService.startPeriodicSync();

// Custom interval
_syncService.startPeriodicSync(interval: Duration(minutes: 2));
```

### Batch Sizes

```dart
// Process up to 50 items per sync cycle
final items = await database.getPendingSyncItems(limit: 50);
```

## Error Handling

The system includes comprehensive error handling:

- **Network errors**: Automatic retry with exponential backoff
- **Server errors**: Detailed error logging in sync queue
- **Data conflicts**: Server data takes precedence
- **Connectivity issues**: Graceful offline fallback

## Testing

To test the offline-first functionality:

1. Start app with internet connection
2. Login with phone + OTP
3. Turn off internet
4. Update profile → Should work instantly
5. Turn on internet → Changes sync automatically
6. Check database stats to verify sync completion

This implementation provides a robust, scalable offline-first architecture that handles the complexity of data synchronization while maintaining a responsive user experience.
