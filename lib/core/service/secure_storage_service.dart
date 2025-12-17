// lib/core/service/secure_storage_service.dart
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import '../../features/auth/domain/entities/auth_result.dart';

@lazySingleton
class SecureStorageService {
  static const String _accessTokenKey = 'access_token';
  static const String _refreshTokenKey = 'refresh_token';
  static const String _accessTokenExpiresAtKey = 'access_token_expires_at';
  static const String _refreshTokenExpiresAtKey = 'refresh_token_expires_at';
  static const String _emailKey = 'stored_email';
  static const String _passwordKey = 'stored_password';

  final FlutterSecureStorage _storage = const FlutterSecureStorage(
    aOptions: AndroidOptions(encryptedSharedPreferences: true),
    iOptions: IOSOptions(accessibility: KeychainAccessibility.first_unlock),
  );

  // ==================== TOKEN MANAGEMENT ====================

  /// Store both access and refresh tokens
  Future<void> storeTokens({
    required String accessToken,
    required String refreshToken,
  }) async {
    try {
      await Future.wait([
        _storage.write(key: _accessTokenKey, value: accessToken),
        _storage.write(key: _refreshTokenKey, value: refreshToken),
      ]);
    } catch (e) {
      throw Exception('Failed to store tokens: $e');
    }
  }

  /// Get access token
  Future<String?> getAccessToken() async {
    try {
      return await _storage.read(key: _accessTokenKey);
    } catch (e) {
      throw Exception('Failed to get access token: $e');
    }
  }

  /// Get refresh token
  Future<String?> getRefreshToken() async {
    try {
      return await _storage.read(key: _refreshTokenKey);
    } catch (e) {
      throw Exception('Failed to get refresh token: $e');
    }
  }

  // ==================== NEW: EXPIRY TIMESTAMP MANAGEMENT ====================

  /// Store access token expiry timestamp
  Future<void> storeAccessTokenExpiresAt(DateTime expiresAt) async {
    try {
      await _storage.write(
        key: _accessTokenExpiresAtKey,
        value: expiresAt.toIso8601String(),
      );
    } catch (e) {
      throw Exception('Failed to store access token expiry: $e');
    }
  }

  /// Store refresh token expiry timestamp
  Future<void> storeRefreshTokenExpiresAt(DateTime expiresAt) async {
    try {
      await _storage.write(
        key: _refreshTokenExpiresAtKey,
        value: expiresAt.toIso8601String(),
      );
    } catch (e) {
      throw Exception('Failed to store refresh token expiry: $e');
    }
  }

  /// Get access token expiry timestamp
  Future<DateTime?> getAccessTokenExpiresAt() async {
    try {
      final expiresAtString = await _storage.read(
        key: _accessTokenExpiresAtKey,
      );
      if (expiresAtString == null) return null;

      return DateTime.parse(expiresAtString);
    } catch (e) {
      return null;
    }
  }

  /// Get refresh token expiry timestamp
  Future<DateTime?> getRefreshTokenExpiresAt() async {
    try {
      final expiresAtString = await _storage.read(
        key: _refreshTokenExpiresAtKey,
      );
      if (expiresAtString == null) return null;

      return DateTime.parse(expiresAtString);
    } catch (e) {
      return null;
    }
  }

  // ==================== NEW: AUTH RESULT MANAGEMENT ====================

  /// Store complete auth result with tokens AND expiry timestamps
  Future<void> storeAuthResult(AuthResult authResult) async {
    try {
      await Future.wait([
        _storage.write(key: _accessTokenKey, value: authResult.accessToken),
        _storage.write(key: _refreshTokenKey, value: authResult.refreshToken),
        _storage.write(
          key: _accessTokenExpiresAtKey,
          value: authResult.accessTokenExpiresAt.toIso8601String(),
        ),
        _storage.write(
          key: _refreshTokenExpiresAtKey,
          value: authResult.refreshTokenExpiresAt.toIso8601String(),
        ),
      ]);
    } catch (e) {
      throw Exception('Failed to store auth result: $e');
    }
  }

  /// Get complete auth result with tokens AND expiry timestamps
  Future<AuthResult?> getAuthResult() async {
    try {
      final accessToken = await _storage.read(key: _accessTokenKey);
      final refreshToken = await _storage.read(key: _refreshTokenKey);
      final accessTokenExpiresAtString = await _storage.read(
        key: _accessTokenExpiresAtKey,
      );
      final refreshTokenExpiresAtString = await _storage.read(
        key: _refreshTokenExpiresAtKey,
      );

      // Return null if any required field is missing
      if (accessToken == null ||
          refreshToken == null ||
          accessTokenExpiresAtString == null ||
          refreshTokenExpiresAtString == null) {
        return null;
      }

      // Parse expiry timestamps
      final accessTokenExpiresAt = DateTime.parse(accessTokenExpiresAtString);
      final refreshTokenExpiresAt = DateTime.parse(refreshTokenExpiresAtString);

      return AuthResult(
        accessToken: accessToken,
        refreshToken: refreshToken,
        accessTokenExpiresAt: accessTokenExpiresAt,
        refreshTokenExpiresAt: refreshTokenExpiresAt,
      );
    } catch (e) {
      return null;
    }
  }

  // ==================== TOKEN CLEARING ====================

  /// Clear all tokens and expiry timestamps
  Future<void> clearTokens() async {
    try {
      await Future.wait([
        _storage.delete(key: _accessTokenKey),
        _storage.delete(key: _refreshTokenKey),
        _storage.delete(key: _accessTokenExpiresAtKey),
        _storage.delete(key: _refreshTokenExpiresAtKey),
      ]);
    } catch (e) {
      throw Exception('Failed to clear tokens: $e');
    }
  }

  /// Check if tokens exist
  Future<bool> hasTokens() async {
    try {
      final accessToken = await getAccessToken();
      final refreshToken = await getRefreshToken();
      return accessToken != null && refreshToken != null;
    } catch (e) {
      return false;
    }
  }

  // ==================== CREDENTIALS MANAGEMENT (for Remember Me) ====================

  /// Store login credentials (for "Remember Me" feature)
  Future<void> storeCredentials({
    required String email,
    required String password,
  }) async {
    try {
      await Future.wait([
        _storage.write(key: _emailKey, value: email),
        _storage.write(key: _passwordKey, value: password),
      ]);
    } catch (e) {
      throw Exception('Failed to store credentials: $e');
    }
  }

  /// Get stored credentials
  Future<Map<String, String>?> getStoredCredentials() async {
    try {
      final email = await _storage.read(key: _emailKey);
      final password = await _storage.read(key: _passwordKey);

      if (email != null && password != null) {
        return {'email': email, 'password': password};
      }

      return null;
    } catch (e) {
      throw Exception('Failed to get stored credentials: $e');
    }
  }

  /// Clear stored credentials
  Future<void> clearCredentials() async {
    try {
      await Future.wait([
        _storage.delete(key: _emailKey),
        _storage.delete(key: _passwordKey),
      ]);
    } catch (e) {
      throw Exception('Failed to clear credentials: $e');
    }
  }

  // ==================== CLEAR ALL ====================

  /// Clear all data from secure storage
  Future<void> clearAll() async {
    try {
      await _storage.deleteAll();
    } catch (e) {
      throw Exception('Failed to clear all data: $e');
    }
  }
}
