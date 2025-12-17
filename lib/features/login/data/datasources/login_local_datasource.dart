// lib/features/login/data/datasources/login_local_datasource.dart
import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/database/app_database.dart' hide User;
import '../../../../core/errors/failures.dart';
import '../../../../core/network/auth_interceptor.dart';
import '../../../../core/service/secure_storage_service.dart';
import '../../../auth/domain/entities/auth_result.dart';
import '../../../user/domain/entities/user.dart';

abstract class LoginLocalDataSource {
  Future<Either<Failure, void>> storeAuthResult(
    AuthResult authResult,
    User user,
  );
  Future<Either<Failure, String?>> getAccessToken();
  Future<Either<Failure, String?>> getRefreshToken();
  Future<Either<Failure, User?>> getStoredUser();
  Future<Either<Failure, void>> clearAuthData();

  Future<Either<Failure, void>> storeLoginCredentials(
    String email,
    String password,
  );
  Future<Either<Failure, Map<String, String>?>> getStoredCredentials();
}

@LazySingleton(as: LoginLocalDataSource)
class LoginLocalDataSourceImpl implements LoginLocalDataSource {
  final DatabaseService _databaseService;
  final AuthInterceptor _authInterceptor;
  final SecureStorageService _secureStorage;

  LoginLocalDataSourceImpl(
    this._databaseService,
    this._authInterceptor,
    this._secureStorage,
  );

  AppDatabase get _database => _databaseService.database;

  @override
  Future<Either<Failure, void>> storeAuthResult(
    AuthResult authResult,
    User user,
  ) async {
    try {
      // ✅ Store tokens WITH expiry timestamps
      await _secureStorage.storeAuthResult(authResult);

      // Store tokens in auth interceptor for immediate use
      await _authInterceptor.storeTokens(
        accessToken: authResult.accessToken,
        refreshToken: authResult.refreshToken,
      );

      // ✅ Store user in database
      await _database
          .into(_database.users)
          .insertOnConflictUpdate(
            UsersCompanion.insert(
              id: Value(user.id),
              email: user.email,
              role: user.role,
              phone: user.phone,
              status: user.status,
              balance: user.balance,
              merchantId: Value(user.merchantId),
              country: Value(user.country),
              createdAt: user.createdAt,
              // Store JSON strings for nested objects
              userDetail: Value(
                user.userDetail != null
                    ? jsonEncode(user.userDetail!.toJson())
                    : null,
              ),
              userSettings: Value(
                user.userSettings != null
                    ? jsonEncode(user.userSettings!.toJson())
                    : null,
              ),
            ),
          );

      return const Right(null);
    } catch (e) {
      print('❌ StoreAuthResult Error: $e');
      return Left(CacheFailure('Failed to store auth result: ${e.toString()}'));
    }
  }

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
  Future<Either<Failure, User?>> getStoredUser() async {
    try {
      // ✅ FIXED: Changed from db.admins to db.users
      final query = _database.select(_database.users)
        ..where((u) => u.deletedAt.isNull())
        ..limit(1);

      final record = await query.getSingleOrNull();

      if (record == null) {
        return const Right(null);
      }

      // Convert database record to User entity
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

  @override
  Future<Either<Failure, void>> clearAuthData() async {
    try {
      // Clear tokens from secure storage
      await _secureStorage.clearTokens();

      // Clear credentials from secure storage
      await _secureStorage.clearCredentials();

      // Clear tokens from auth interceptor
      await _authInterceptor.clearAllTokens();

      // ✅ FIXED: Changed from db.admins to db.users
      // Clear user data from database
      await _database.delete(_database.users).go();

      return const Right(null);
    } catch (e) {
      return Left(CacheFailure('Failed to clear auth data: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, void>> storeLoginCredentials(
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
}
