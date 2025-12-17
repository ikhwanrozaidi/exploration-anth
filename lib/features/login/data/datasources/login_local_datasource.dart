import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/database/app_database.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/network/auth_interceptor.dart';
import '../../../../core/service/secure_storage_service.dart';
import '../../../../shared/entities/auth_result.dart';
import '../../../user/domain/entities/user.dart' as user_entity;

abstract class LoginLocalDataSource {
  Future<Either<Failure, void>> storeAuthResult(
    AuthResult authResult,
    user_entity.User user,
  );
  Future<Either<Failure, String?>> getAccessToken();
  Future<Either<Failure, String?>> getRefreshToken();
  Future<Either<Failure, user_entity.User?>> getStoredUser();
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
    user_entity.User user,
  ) async {
    try {
      // Store tokens WITH expiry timestamps
      await _secureStorage.storeAuthResult(authResult);

      // Store tokens in auth interceptor
      await _authInterceptor.storeTokens(
        accessToken: authResult.accessToken,
        refreshToken: authResult.refreshToken,
      );

      // ✅ Store user in database (handle null nested objects)
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
  Future<Either<Failure, user_entity.User?>> getStoredUser() async {
    try {
      final query = _database.select(_database.users)
        ..where((u) => u.deletedAt.isNull())
        ..limit(1);

      final record = await query.getSingleOrNull();

      if (record == null) {
        return const Right(null);
      }

      user_entity.UserDetail? userDetail;
      user_entity.UserSettings? userSettings;

      if (record.userDetail != null && record.userDetail!.isNotEmpty) {
        try {
          userDetail = user_entity.UserDetail.fromJson(
            jsonDecode(record.userDetail!),
          );
        } catch (e) {
          print('⚠️ Failed to parse userDetail: $e');
        }
      }

      if (record.userSettings != null && record.userSettings!.isNotEmpty) {
        try {
          userSettings = user_entity.UserSettings.fromJson(
            jsonDecode(record.userSettings!),
          );
        } catch (e) {
          print('⚠️ Failed to parse userSettings: $e');
        }
      }

      final user = user_entity.User(
        id: record.id,
        email: record.email,
        role: record.role,
        phone: record.phone,
        status: record.status,
        balance: record.balance,
        merchantId: record.merchantId,
        country: record.country,
        createdAt: record.createdAt,
        userDetail: userDetail,
        userSettings: userSettings,
      );

      return Right(user);
    } catch (e) {
      print('❌ GetStoredUser Error: $e');
      return Left(CacheFailure('Failed to get stored user: ${e.toString()}'));
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
  Future<Either<Failure, void>> clearAuthData() async {
    try {
      await _secureStorage.clearTokens();
      await _secureStorage.clearCredentials();
      await _authInterceptor.clearAllTokens();
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
