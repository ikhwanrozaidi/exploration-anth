import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:drift/drift.dart';
import '../../../../core/database/app_database.dart';
import '../../../../core/errors/failures.dart';
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

  AuthLocalDataSourceImpl(this._databaseService);

  AppDatabase get _database => _databaseService.database;

  @override
  Future<Either<Failure, void>> storeAuthResult(AuthResult authResult) async {
    try {
      await _database.transaction(() async {
        // Store tokens (you might want to encrypt these)
        // For now, storing in a simple key-value format in the database
        // In production, consider using flutter_secure_storage
        await _storeToken('access_token', authResult.accessToken);
        await _storeToken('refresh_token', authResult.refreshToken);
      });

      return const Right(null);
    } catch (e) {
      return Left(CacheFailure('Failed to cache auth result: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, String?>> getAccessToken() async {
    try {
      final token = await _getToken('access_token');
      return Right(token);
    } catch (e) {
      return Left(CacheFailure('Failed to get access token: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, String?>> getRefreshToken() async {
    try {
      final token = await _getToken('refresh_token');
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
        await _deleteToken('access_token');
        await _deleteToken('refresh_token');
      });

      return const Right(null);
    } catch (e) {
      return Left(CacheFailure('Failed to clear cache: ${e.toString()}'));
    }
  }

  // Helper methods for token storage
  // Note: In production, consider using flutter_secure_storage for sensitive data
  Future<void> _storeToken(String key, String value) async {
    // Simple key-value storage using a table or shared preferences
    // For this example, I'll use a simple approach
    // You should implement proper secure storage
  }

  Future<String?> _getToken(String key) async {
    // Retrieve token from secure storage
    // For this example, return null as placeholder
    return null;
  }

  Future<void> _deleteToken(String key) async {
    // Delete token from secure storage
    // Placeholder implementation
  }
}
