// lib/core/services/secure_storage_service.dart
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class SecureStorageService {
  static const _storage = FlutterSecureStorage(
    aOptions: AndroidOptions(
      encryptedSharedPreferences: true,
    ),
    iOptions: IOSOptions(
      accessibility: KeychainAccessibility.first_unlock_this_device,
    ),
  );

  // Token keys
  static const String accessTokenKey = 'access_token';
  static const String refreshTokenKey = 'refresh_token';

  static const String savedEmailKey = 'saved_email';
  static const String savedPasswordKey = 'saved_password';

  Future<void> storeTokens({
    required String accessToken,
    required String refreshToken,
  }) async {
    await Future.wait([
      _storage.write(key: accessTokenKey, value: accessToken),
      _storage.write(key: refreshTokenKey, value: refreshToken),
    ]);
  }

  Future<String?> getAccessToken() async {
    return await _storage.read(key: accessTokenKey);
  }

  Future<String?> getRefreshToken() async {
    return await _storage.read(key: refreshTokenKey);
  }

  Future<void> clearTokens() async {
    await Future.wait([
      _storage.delete(key: accessTokenKey),
      _storage.delete(key: refreshTokenKey),
    ]);
  }

  Future<void> clearAll() async {
    await _storage.deleteAll();
  }

   Future<void> storeCredentials({required String email, required String password}) async {
    await Future.wait([
      _storage.write(key: savedEmailKey, value: email),
      _storage.write(key: savedPasswordKey, value: password),
    ]);
  }

  Future<Map<String, String>?> getStoredCredentials() async {
    final email = await _storage.read(key: savedEmailKey);
    final password = await _storage.read(key: savedPasswordKey);
    
    if (email != null && password != null) {
      return {'email': email, 'password': password};
    }
    return null;
  }

  Future<void> clearCredentials() async {
  await Future.wait([
    _storage.delete(key: savedEmailKey),
    _storage.delete(key: savedPasswordKey),
  ]);
}
}