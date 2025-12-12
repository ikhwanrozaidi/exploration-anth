// lib/core/service/secure_storage_service.dart
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class SecureStorageService {
  static const String _accessTokenKey = 'access_token';
  static const String _refreshTokenKey = 'refresh_token';
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

  /// Clear all tokens
  Future<void> clearTokens() async {
    try {
      await Future.wait([
        _storage.delete(key: _accessTokenKey),
        _storage.delete(key: _refreshTokenKey),
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
