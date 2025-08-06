# Clean Architecture Implementation - Auth & Admin Features

This document explains the complete restructuring of the Flutter app following Clean Architecture principles, with proper separation between **Auth** and **Admin** features.

## 🏗️ Architecture Overview

### Why Separate Auth and Admin Features?

**Auth Feature**: Handles authentication flow (OTP login, token management, session handling)
**Admin Feature**: Handles admin profile management (CRUD operations, offline-first data handling)

This separation provides:

- **Single Responsibility**: Each feature has distinct concerns
- **Better Maintainability**: Changes to profile management don't affect auth flow
- **Scalability**: Easy to add more features (users, products, etc.)
- **Team Development**: Different teams can work on different features

## 📁 Project Structure

```
lib/
├── core/                           # Shared infrastructure
│   ├── database/
│   │   └── app_database.dart       # Drift database schema only
│   ├── network/
│   │   ├── network_info.dart       # Network connectivity interface
│   │   └── connectivity_service.dart
│   ├── sync/
│   │   └── sync_service.dart       # Background sync coordination
│   └── di/
│       └── injection.dart          # Dependency injection setup
├── features/
│   ├── auth/                       # Authentication Feature
│   │   ├── domain/
│   │   │   ├── entities/
│   │   │   │   ├── admin.dart      # Auth-specific admin entity
│   │   │   │   └── auth_result.dart
│   │   │   └── repositories/
│   │   │       └── auth_repository.dart
│   │   └── data/
│   │       ├── datasources/
│   │       │   ├── auth_local_data_source.dart    # Token & session storage
│   │       │   ├── auth_remote_data_source.dart   # OTP & auth API calls
│   │       │   └── auth_api_service.dart
│   │       └── repositories/
│   │           └── auth_repository_impl.dart
│   └── admin/                      # Admin Profile Feature
│       ├── domain/
│       │   ├── entities/
│       │   │   └── admin.dart      # Admin profile entity
│       │   └── repositories/
│       │       └── admin_repository.dart
│       └── data/
│           ├── datasources/
│           │   ├── admin_local_data_source.dart   # Database operations
│           │   └── admin_remote_data_source.dart  # Profile API calls
│           ├── models/
│           │   └── admin_model.dart               # JSON serialization
│           └── repositories/
│               └── admin_repository_impl.dart    # Offline-first logic
└── shared/
    └── models/
        └── api_response.dart       # Common response wrapper
```

## 🔄 Data Flow Architecture

### Auth Feature Flow (Online-Only)

```
OTP Request → AuthRemoteDataSource → API → Response
     ↓
AuthLocalDataSource (cache tokens) → Start SyncService
```

### Admin Feature Flow (Offline-First)

```
Profile Update → AdminLocalDataSource (immediate) → UI Update
     ↓
If Online: AdminRemoteDataSource → Server → Mark as Synced
If Offline: Add to SyncQueue → Background Sync Later
```

## 🔧 Implementation Details

### 1. Auth Feature - Online-Only Operations

**AuthLocalDataSource** (`lib/features/auth/data/datasources/auth_local_data_source.dart`):

```dart
abstract class AuthLocalDataSource {
  Future<void> cacheAuthResult({
    required Admin admin,
    required String accessToken,
    required String refreshToken,
  });
  Future<Admin?> getCachedAdmin();
  Future<String?> getAccessToken();
  Future<String?> getRefreshToken();
  Future<void> clearCache();
}
```

**Responsibilities:**

- Store/retrieve authentication tokens securely
- Cache user session data
- Clear authentication data on logout

**AuthRemoteDataSource** (`lib/features/auth/data/datasources/auth_remote_data_source.dart`):

```dart
abstract class AuthRemoteDataSource {
  Future<Map<String, dynamic>> sendOtp(String phone);
  Future<AuthResult> verifyOtp(String phone, String otp);
  Future<AuthResult> refreshToken(String refreshToken);
  Future<void> logout();
}
```

**Responsibilities:**

- Handle all authentication API calls
- OTP generation and verification
- Token refresh operations

### 2. Admin Feature - Offline-First Operations

**AdminLocalDataSource** (`lib/features/admin/data/datasources/admin_local_data_source.dart`):

```dart
abstract class AdminLocalDataSource {
  Future<Admin?> getAdminByUID(String uid);
  Future<Admin?> getCachedAdmin();
  Future<Admin> upsertAdmin(Admin admin, {bool markAsSynced = false});
  Future<void> deleteAdmin(String uid);
  Future<List<Admin>> getUnsyncedAdmins();
  Future<void> addToSyncQueue({
    required String entityUID,
    required String action,
    int priority = 0,
  });
}
```

**Responsibilities:**

- All database CRUD operations
- Sync queue management
- Offline data handling

**AdminRemoteDataSource** (`lib/features/admin/data/datasources/admin_remote_data_source.dart`):

```dart
abstract class AdminRemoteDataSource {
  Future<Admin> getProfile();
  Future<Admin> updateProfile(Admin admin);
}
```

**Responsibilities:**

- Profile-related API calls only
- Data transformation between API and domain

### 3. Repository Pattern Implementation

**AuthRepositoryImpl** - Focuses on authentication flow:

```dart
@override
Future<ApiResponse<AuthResult>> verifyOtp(String phone, String otp) async {
  // 1. Call remote API (online-only)
  final authResult = await _remoteDataSource.verifyOtp(phone, otp);

  // 2. Cache locally
  await _localDataSource.cacheAuthResult(
    admin: authResult.admin,
    accessToken: authResult.accessToken,
    refreshToken: authResult.refreshToken,
  );

  // 3. Start sync service
  _syncService.startPeriodicSync();

  return ApiResponse.success(authResult);
}
```

**AdminRepositoryImpl** - Implements offline-first strategy:

```dart
@override
Future<ApiResponse<Admin>> updateProfile(Admin admin) async {
  try {
    // 1. Update local first (immediate UI response)
    final localAdmin = await _localDataSource.upsertAdmin(admin, markAsSynced: false);

    final isConnected = await _networkInfo.isConnected;
    if (isConnected) {
      try {
        // 2. Try server sync immediately
        final updatedAdmin = await _remoteDataSource.updateProfile(admin);
        final syncedAdmin = await _localDataSource.upsertAdmin(updatedAdmin, markAsSynced: true);
        return ApiResponse.success(syncedAdmin);
      } catch (e) {
        // 3. Server failed, queue for later sync
        await _localDataSource.addToSyncQueue(entityUID: admin.uid, action: 'update');
        return ApiResponse.success(localAdmin);
      }
    } else {
      // 4. Offline, queue for sync
      await _localDataSource.addToSyncQueue(entityUID: admin.uid, action: 'update');
      return ApiResponse.success(localAdmin);
    }
  } catch (e) {
    return ApiResponse.failure('Failed to update profile: ${e.toString()}');
  }
}
```

## 🔄 Sync Service Integration

The `SyncService` coordinates between features but doesn't contain business logic:

```dart
// Processes sync queue items by delegating to appropriate datasources
Future<void> _processSyncQueue() async {
  final pendingItems = await _syncQueueDataSource.getPendingSyncItems(limit: 20);

  for (final item in pendingItems) {
    switch (item.entityType) {
      case 'admin':
        await _adminSyncHandler.syncAdminEntity(item);
        break;
      case 'device':
        await _deviceSyncHandler.syncDeviceEntity(item);
        break;
    }
  }
}
```

## 🎯 Benefits of This Architecture

### 1. **Proper Separation of Concerns**

- Auth feature: Authentication, tokens, sessions
- Admin feature: Profile management, offline sync
- Core: Shared infrastructure (database, network, sync coordination)

### 2. **Clean Data Sources**

- **Local DataSources**: Handle all database operations
- **Remote DataSources**: Handle all API operations
- **Database**: Just schema definition, no business logic

### 3. **Offline-First Implementation**

- Update local data immediately (responsive UI)
- Sync to server in background
- Handle conflicts gracefully
- Queue failed operations for retry

### 4. **Testability**

- Each datasource can be mocked independently
- Repository tests don't need actual database/network
- Clear interfaces make unit testing straightforward

### 5. **Scalability**

- Easy to add new features (products, orders, etc.)
- Each feature has its own datasources and repositories
- Shared sync service coordinates across features

## 🔧 Usage Examples

### Auth Feature Usage:

```dart
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;

  Future<void> _onVerifyOtp(VerifyOtpEvent event, Emitter<AuthState> emit) async {
    final result = await _authRepository.verifyOtp(event.phone, event.otp);

    if (result.isSuccess) {
      emit(AuthenticatedState(result.data!));
    } else {
      emit(AuthErrorState(result.error!));
    }
  }
}
```

### Admin Feature Usage:

```dart
class AdminBloc extends Bloc<AdminEvent, AdminState> {
  final AdminRepository _adminRepository;

  Future<void> _onUpdateProfile(UpdateProfileEvent event, Emitter<AdminState> emit) async {
    final result = await _adminRepository.updateProfile(event.admin);

    if (result.isSuccess) {
      // UI updates immediately with local data
      // Sync happens automatically in background
      emit(ProfileUpdatedState(result.data!));
    } else {
      emit(ProfileErrorState(result.error!));
    }
  }
}
```

## 🚀 Next Steps

1. **Add More Features**: Products, Orders, etc., following the same pattern
2. **Enhanced Sync**: Add conflict resolution strategies
3. **Security**: Implement proper token encryption
4. **Caching**: Add more sophisticated caching strategies
5. **Error Handling**: Add retry policies and error categorization

This architecture provides a solid foundation that's maintainable, testable, and scalable while properly separating authentication concerns from business logic.
