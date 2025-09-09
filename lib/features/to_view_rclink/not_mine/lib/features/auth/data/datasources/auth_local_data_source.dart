import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../../../core/database/app_database.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/entities/tokens.dart';

abstract class AuthLocalDataSource {
  Future<Either<Failure, void>> storeTokens(Tokens tokens);
  Future<Either<Failure, String?>> getAccessToken();
  Future<Either<Failure, String?>> getRefreshToken();
  Future<Either<Failure, DateTime?>> getAccessTokenExpiresAt();
  Future<Either<Failure, DateTime?>> getRefreshTokenExpiresAt();
  Future<Either<Failure, Tokens?>> getTokens();
  Future<Either<Failure, void>> clearCache();
}

@LazySingleton(as: AuthLocalDataSource)
class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final DatabaseService _databaseService;
  final FlutterSecureStorage _secureStorage;

  AuthLocalDataSourceImpl(this._databaseService)
    : _secureStorage = const FlutterSecureStorage(
        aOptions: AndroidOptions(encryptedSharedPreferences: true),
        iOptions: IOSOptions(
          accessibility: KeychainAccessibility.first_unlock_this_device,
        ),
      );

  AppDatabase get _database => _databaseService.database;

  @override
  Future<Either<Failure, void>> storeTokens(Tokens tokens) async {
    try {
      // First, clear any existing tokens to avoid conflicts
      await _deleteToken('access_token');
      await _deleteToken('refresh_token');
      await _deleteToken('access_token_expires_at');
      await _deleteToken('refresh_token_expires_at');

      // Add a small delay to ensure deletion is complete
      await Future.delayed(const Duration(milliseconds: 100));

      // Store sensitive tokens in secure storage
      await _storeToken('access_token', tokens.accessToken);
      await _storeToken('refresh_token', tokens.refreshToken);
      await _storeToken(
        'access_token_expires_at',
        tokens.accessTokenExpiresAt.toIso8601String(),
      );
      await _storeToken(
        'refresh_token_expires_at',
        tokens.refreshTokenExpiresAt.toIso8601String(),
      );

      return const Right(null);
    } catch (e) {
      return Left(CacheFailure('Failed to cache tokens: ${e.toString()}'));
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
  Future<Either<Failure, DateTime?>> getAccessTokenExpiresAt() async {
    try {
      final token = await _getToken('access_token_expires_at');
      if (token == null) return const Right(null);
      return Right(DateTime.parse(token));
    } catch (e) {
      return Left(
        CacheFailure('Failed to get access token expiration: ${e.toString()}'),
      );
    }
  }

  @override
  Future<Either<Failure, DateTime?>> getRefreshTokenExpiresAt() async {
    try {
      final token = await _getToken('refresh_token_expires_at');
      if (token == null) return const Right(null);
      return Right(DateTime.parse(token));
    } catch (e) {
      return Left(
        CacheFailure('Failed to get refresh token expiration: ${e.toString()}'),
      );
    }
  }

  @override
  Future<Either<Failure, Tokens?>> getTokens() async {
    try {
      final accessToken = await _getToken('access_token');
      final refreshToken = await _getToken('refresh_token');
      final accessTokenExpiresAtStr = await _getToken(
        'access_token_expires_at',
      );
      final refreshTokenExpiresAtStr = await _getToken(
        'refresh_token_expires_at',
      );

      if (accessToken == null ||
          refreshToken == null ||
          accessTokenExpiresAtStr == null ||
          refreshTokenExpiresAtStr == null) {
        return const Right(null);
      }

      final tokens = Tokens(
        accessToken: accessToken,
        refreshToken: refreshToken,
        accessTokenExpiresAt: DateTime.parse(accessTokenExpiresAtStr),
        refreshTokenExpiresAt: DateTime.parse(refreshTokenExpiresAtStr),
      );

      return Right(tokens);
    } catch (e) {
      return Left(CacheFailure('Failed to get tokens: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, void>> clearCache() async {
    try {
      await _database.transaction(() async {
        // Clear all admins
        await _database.delete(_database.admins).go();
      });

      // Clear tokens from secure storage with error handling
      try {
        await _deleteToken('access_token');
        await _deleteToken('refresh_token');
        await _deleteToken('access_token_expires_at');
        await _deleteToken('refresh_token_expires_at');

        // Add delay to ensure deletion is complete
        await Future.delayed(const Duration(milliseconds: 100));
      } catch (e) {
        // Log but don't fail the entire operation if secure storage has issues
        print('Warning: Failed to clear some tokens from secure storage: $e');
      }

      return const Right(null);
    } catch (e) {
      return Left(CacheFailure('Failed to clear cache: ${e.toString()}'));
    }
  }

  // Helper methods for secure token storage
  Future<void> _storeToken(String key, String value) async {
    await _secureStorage.write(key: key, value: value);
  }

  Future<String?> _getToken(String key) async {
    return await _secureStorage.read(key: key);
  }

  Future<void> _deleteToken(String key) async {
    await _secureStorage.delete(key: key);
  }
}
