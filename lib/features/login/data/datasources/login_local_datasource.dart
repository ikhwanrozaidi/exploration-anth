import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/database/app_database.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/network/auth_interceptor.dart';
import '../../../../core/service/secure_storage_service.dart';
import '../../../auth/domain/entities/auth_result.dart';
import '../../../admin/domain/entities/admin.dart';

abstract class LoginLocalDataSource {
  Future<Either<Failure, void>> storeAuthResult(
    AuthResult authResult,
    Admin admin,
  );
  Future<Either<Failure, String?>> getAccessToken();
  Future<Either<Failure, String?>> getRefreshToken();
  Future<Either<Failure, Admin?>> getStoredAdmin();
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
    Admin admin,
  ) async {
    try {
      // Store tokens securely
      await _secureStorage.storeTokens(
        accessToken: authResult.accessToken,
        refreshToken: authResult.refreshToken,
      );

      // Also store tokens in auth interceptor for immediate use
      await _authInterceptor.storeTokens(
        accessToken: authResult.accessToken,
        refreshToken: authResult.refreshToken,
      );

      // Store admin in database
      await _database
          .into(_database.admins)
          .insertOnConflictUpdate(admin.toCompanion(isSynced: true));

      return const Right(null);
    } catch (e) {
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
  Future<Either<Failure, Admin?>> getStoredAdmin() async {
    try {
      final query = _database.select(_database.admins)
        ..where((a) => a.deletedAt.isNull())
        ..limit(1);

      final result = await query.getSingleOrNull();
      return Right(result?.toEntity());
    } catch (e) {
      return Left(CacheFailure('Failed to get stored admin: ${e.toString()}'));
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

      // Clear admin data from database
      await _database.delete(_database.admins).go();

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
