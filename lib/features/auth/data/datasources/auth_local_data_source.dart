// lib/features/auth/data/datasources/auth_local_data_source.dart
import 'package:dartz/dartz.dart';
import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/database/app_database.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/network/auth_interceptor.dart';
import '../../../../core/service/secure_storage_service.dart';
import '../../domain/entities/auth_result.dart';
import '../../../user/domain/entities/user.dart';

abstract class AuthLocalDataSource {
  // Token management
  Future<Either<Failure, String?>> getAccessToken();
  Future<Either<Failure, String?>> getRefreshToken();
  Future<void> storeTokens(String accessToken, String refreshToken);

  // Auth result storage
  Future<Either<Failure, void>> storeAuthResult(
    AuthResult authResult, [
    User? user,
  ]);
  Future<Either<Failure, AuthResult?>> getStoredAuthResult();

  // User storage
  Future<Either<Failure, User?>> getStoredUser();
  Future<Either<Failure, void>> storeUser(User user);

  // Credentials management (for Remember Me)
  Future<Either<Failure, void>> storeCredentials(String email, String password);
  Future<Either<Failure, Map<String, String>?>> getStoredCredentials();

  // Clear cache
  Future<Either<Failure, void>> clearAuthData();
}

@LazySingleton(as: AuthLocalDataSource)
class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final DatabaseService _databaseService;
  final AuthInterceptor _authInterceptor;
  final SecureStorageService _secureStorage;

  AuthLocalDataSourceImpl(
    this._databaseService,
    this._authInterceptor,
    this._secureStorage,
  );

  AppDatabase get _database => _databaseService.database;

  // ==================== TOKEN MANAGEMENT ====================

  @override
  Future<Either<Failure, String?>> getAccessToken() async {
    try {
      final token = await _secureStorage.getAccessToken();
      return Right(token);
    } catch (e) {
      return Left(CacheFailure('Failed to get access token: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, String?>> getRefreshToken() async {
    try {
      final token = await _secureStorage.getRefreshToken();
      return Right(token);
    } catch (e) {
      return Left(CacheFailure('Failed to get refresh token: ${e.toString()}'));
    }
  }

  @override
  Future<void> storeTokens(String accessToken, String refreshToken) async {
    try {
      // Store in secure storage
      await _secureStorage.storeTokens(
        accessToken: accessToken,
        refreshToken: refreshToken,
      );

      // Also store in auth interceptor for immediate use
      await _authInterceptor.storeTokens(
        accessToken: accessToken,
        refreshToken: refreshToken,
      );
    } catch (e) {
      throw CacheFailure('Failed to store tokens: ${e.toString()}');
    }
  }

  // ==================== AUTH RESULT STORAGE ====================

  @override
  Future<Either<Failure, void>> storeAuthResult(
    AuthResult authResult, [
    User? user,
  ]) async {
    try {
      // Store tokens in secure storage AND auth interceptor
      await storeTokens(authResult.accessToken, authResult.refreshToken);

      // Store user data in database if provided
      if (user != null) {
        await storeUser(user);
      }

      return const Right(null);
    } catch (e) {
      return Left(CacheFailure('Failed to store auth result: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, AuthResult?>> getStoredAuthResult() async {
    try {
      final accessToken = await _secureStorage.getAccessToken();
      final refreshToken = await _secureStorage.getRefreshToken();

      if (accessToken == null || refreshToken == null) {
        return const Right(null);
      }

      return Right(
        AuthResult(accessToken: accessToken, refreshToken: refreshToken),
      );
    } catch (e) {
      return Left(
        CacheFailure('Failed to get stored auth result: ${e.toString()}'),
      );
    }
  }

  // ==================== USER STORAGE ====================

  @override
  Future<Either<Failure, void>> storeUser(User user) async {
    try {
      await _database
          .into(_database.users)
          .insertOnConflictUpdate(
            UsersCompanion.insert(
              id: Value(user.id),
              uid: user.uid,
              phone: user.phone,
              firstName: Value(user.firstName),
              lastName: Value(user.lastName),
              email: Value(user.email),
              updatedAt: user.updatedAt,
              createdAt: user.createdAt,
            ),
          );

      return const Right(null);
    } catch (e) {
      return Left(CacheFailure('Failed to store user: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, User?>> getStoredUser() async {
    try {
      final query = _database.select(_database.users)
        ..where((u) => u.deletedAt.isNull())
        ..limit(1);

      final record = await query.getSingleOrNull();

      if (record == null) {
        return const Right(null);
      }

      final user = User(
        id: record.id,
        uid: record.uid,
        phone: record.phone,
        firstName: record.firstName,
        lastName: record.lastName,
        email: record.email,
        updatedAt: record.updatedAt,
        createdAt: record.createdAt,
      );

      return Right(user);
    } catch (e) {
      return Left(CacheFailure('Failed to get stored user: ${e.toString()}'));
    }
  }

  // ==================== CREDENTIALS MANAGEMENT ====================

  @override
  Future<Either<Failure, void>> storeCredentials(
    String email,
    String password,
  ) async {
    try {
      await _secureStorage.storeCredentials(email: email, password: password);
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure('Failed to store credentials: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, Map<String, String>?>> getStoredCredentials() async {
    try {
      final credentials = await _secureStorage.getStoredCredentials();
      return Right(credentials);
    } catch (e) {
      return Left(
        CacheFailure('Failed to get stored credentials: ${e.toString()}'),
      );
    }
  }

  // ==================== CLEAR CACHE ====================

  @override
  Future<Either<Failure, void>> clearAuthData() async {
    try {
      // Clear tokens from secure storage
      await _secureStorage.clearTokens();

      // Clear credentials from secure storage
      await _secureStorage.clearCredentials();

      // Clear tokens from auth interceptor
      await _authInterceptor.clearAllTokens();

      // Clear user data from database
      await _database.delete(_database.users).go();

      return const Right(null);
    } catch (e) {
      return Left(CacheFailure('Failed to clear auth data: ${e.toString()}'));
    }
  }
}
