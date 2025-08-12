// lib/features/login/data/datasources/login_local_datasource.dart
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/database/app_database.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/network/auth_interceptor.dart';
import '../../../auth/domain/entities/auth_result.dart';
import '../../../admin/domain/entities/admin.dart';

abstract class LoginLocalDataSource {
  Future<Either<Failure, void>> storeAuthResult(AuthResult authResult, Admin admin);
  Future<Either<Failure, String?>> getAccessToken();
  Future<Either<Failure, String?>> getRefreshToken();
  Future<Either<Failure, Admin?>> getStoredAdmin();
  Future<Either<Failure, void>> clearAuthData();
  Future<Either<Failure, void>> storeLoginCredentials(String email, String password);
  Future<Either<Failure, Map<String, String>?>> getStoredCredentials();
}

@LazySingleton(as: LoginLocalDataSource)
class LoginLocalDataSourceImpl implements LoginLocalDataSource {
  final DatabaseService _databaseService;
  final AuthInterceptor _authInterceptor;

  LoginLocalDataSourceImpl(
    this._databaseService,
    this._authInterceptor,
  );

  AppDatabase get _database => _databaseService.database;

  @override
  Future<Either<Failure, void>> storeAuthResult(AuthResult authResult, Admin admin) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      
      // Store tokens securely
      await prefs.setString('access_token', authResult.accessToken);
      await prefs.setString('refresh_token', authResult.refreshToken);
      
      // Also store tokens in auth interceptor for immediate use
      await _authInterceptor.storeTokens(
        accessToken: authResult.accessToken,
        refreshToken: authResult.refreshToken,
      );
      
      // Store admin in database
      await _database.into(_database.admins).insertOnConflictUpdate(
        admin.toCompanion(isSynced: true),
      );

      return const Right(null);
    } catch (e) {
      return Left(CacheFailure('Failed to store auth result: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, String?>> getAccessToken() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('access_token');
      return Right(token);
    } catch (e) {
      return Left(CacheFailure('Failed to get access token: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, String?>> getRefreshToken() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('refresh_token');
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
      final prefs = await SharedPreferences.getInstance();
      
      // Clear tokens from SharedPreferences
      await prefs.remove('access_token');
      await prefs.remove('refresh_token');
      await prefs.remove('saved_email');
      await prefs.remove('saved_password');
      
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
  Future<Either<Failure, void>> storeLoginCredentials(String email, String password) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('saved_email', email);
      await prefs.setString('saved_password', password);
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure('Failed to store credentials: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, Map<String, String>?>> getStoredCredentials() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final email = prefs.getString('saved_email');
      final password = prefs.getString('saved_password');
      
      if (email != null && password != null) {
        return Right({'email': email, 'password': password});
      }
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure('Failed to get stored credentials: ${e.toString()}'));
    }
  }
}