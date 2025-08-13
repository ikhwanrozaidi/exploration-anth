import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:drift/drift.dart';
import '../../../../core/database/app_database.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/service/secure_storage_service.dart';
import '../../domain/entities/auth_result.dart';
import '../../domain/entities/admin.dart';

abstract class AuthLocalDataSource {
  Future<Either<Failure, void>> storeAuthResult(AuthResult authResult);
  Future<Either<Failure, String?>> getAccessToken();
  Future<Either<Failure, String?>> getRefreshToken();
  Future<Either<Failure, void>> clearCache();
}

@LazySingleton(as: AuthLocalDataSource)
class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final DatabaseService _databaseService;
  final SecureStorageService _secureStorage;

  AuthLocalDataSourceImpl(this._databaseService, this._secureStorage);

  AppDatabase get _database => _databaseService.database;

  @override
  Future<Either<Failure, void>> storeAuthResult(AuthResult authResult) async {
    try {
      await _database.transaction(() async {
        // Store tokens securely
        await _secureStorage.storeTokens(
          accessToken: authResult.accessToken,
          refreshToken: authResult.refreshToken,
        );
      });

      return const Right(null);
    } catch (e) {
      return Left(CacheFailure('Failed to cache auth result: ${e.toString()}'));
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
  Future<Either<Failure, void>> clearCache() async {
    try {
      await _database.transaction(() async {
        // Clear all admins
        await _database.delete(_database.admins).go();

        // Clear tokens
        await _secureStorage.clearTokens();
      });

      return const Right(null);
    } catch (e) {
      return Left(CacheFailure('Failed to clear cache: ${e.toString()}'));
    }
  }
}