// lib/core/network/auth_interceptor.dart
import 'dart:async';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:synchronized/synchronized.dart';
import '../service/secure_storage_service.dart';

@lazySingleton
class AuthInterceptor extends Interceptor {
  final Dio _dio;
  final SecureStorageService _secureStorage;
  final Lock _lock = Lock();

  // Token refresh state
  bool _isRefreshing = false;
  Completer<void>? _refreshCompleter;

  AuthInterceptor(this._dio, this._secureStorage);

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // Skip authentication for public endpoints
    if (_shouldSkipAuth(options.path)) {
      return handler.next(options);
    }

    // Get access token
    final accessToken = await _getAccessToken();

    if (accessToken != null) {
      options.headers['Authorization'] = 'Bearer $accessToken';
    }

    handler.next(options);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    // Handle 401 Unauthorized - token expired
    if (err.response?.statusCode == 401) {
      // Don't retry if it's already a refresh token request
      if (err.requestOptions.path.contains('/auth/refresh-token')) {
        await _clearTokens();
        return handler.next(err);
      }

      // Try to refresh token
      final newAccessToken = await _refreshTokenWithLock();

      if (newAccessToken != null) {
        // Retry the original request with new token
        try {
          final options = err.requestOptions;
          options.headers['Authorization'] = 'Bearer $newAccessToken';

          final response = await _dio.fetch(options);
          return handler.resolve(response);
        } catch (e) {
          return handler.next(err);
        }
      } else {
        // Refresh failed - clear tokens
        await _clearTokens();
        return handler.next(err);
      }
    }

    handler.next(err);
  }

  /// Refresh token with lock to prevent multiple simultaneous refresh attempts
  Future<String?> _refreshTokenWithLock() async {
    return await _lock.synchronized(() async {
      // If already refreshing, wait for it to complete
      if (_isRefreshing && _refreshCompleter != null) {
        await _refreshCompleter!.future;
        return await _getAccessToken();
      }

      // Start refreshing
      _isRefreshing = true;
      _refreshCompleter = Completer<void>();

      try {
        final newToken = await _refreshToken();
        _refreshCompleter?.complete();
        return newToken;
      } catch (e) {
        _refreshCompleter?.completeError(e);
        return null;
      } finally {
        _isRefreshing = false;
        _refreshCompleter = null;
      }
    });
  }

  /// Get stored access token
  Future<String?> _getAccessToken() async {
    try {
      return await _secureStorage.getAccessToken();
    } catch (e) {
      print('Error getting access token: $e');
      return null;
    }
  }

  /// Get stored refresh token
  Future<String?> _getRefreshToken() async {
    try {
      return await _secureStorage.getRefreshToken();
    } catch (e) {
      print('Error getting refresh token: $e');
      return null;
    }
  }

  /// Store new access token
  Future<void> _storeAccessToken(String token) async {
    try {
      final refreshToken = await _getRefreshToken();

      if (refreshToken != null) {
        await _secureStorage.storeTokens(
          accessToken: token,
          refreshToken: refreshToken,
        );
      }
    } catch (e) {
      print('Error storing access token: $e');
    }
  }

  /// Store new refresh token
  Future<void> _storeRefreshToken(String token) async {
    try {
      final accessToken = await _getAccessToken();

      if (accessToken != null) {
        await _secureStorage.storeTokens(
          accessToken: accessToken,
          refreshToken: token,
        );
      }
    } catch (e) {
      print('Error storing refresh token: $e');
    }
  }

  /// Clear all stored tokens
  Future<void> _clearTokens() async {
    try {
      await _secureStorage.clearTokens();
    } catch (e) {
      print('Error clearing tokens: $e');
    }
  }

  /// Refresh access token using refresh token
  Future<String?> _refreshToken() async {
    try {
      final refreshToken = await _getRefreshToken();
      if (refreshToken == null) {
        return null;
      }

      // Create a new Dio instance without interceptors to avoid infinite loop
      final refreshDio = Dio();
      refreshDio.options.baseUrl = _dio.options.baseUrl;

      final response = await refreshDio.post(
        '/auth/refresh-token',
        data: {'refreshToken': refreshToken},
        options: Options(headers: {'Content-Type': 'application/json'}),
      );

      if (response.statusCode == 200 && response.data != null) {
        final data = response.data;

        // Handle different possible response structures
        String? newAccessToken;
        String? newRefreshToken;

        if (data is Map<String, dynamic>) {
          // Check if response is wrapped in ApiResponse structure
          if (data.containsKey('data') &&
              data['data'] is Map<String, dynamic>) {
            final responseData = data['data'] as Map<String, dynamic>;
            newAccessToken =
                responseData['accessToken'] ?? responseData['access_token'];
            newRefreshToken =
                responseData['refreshToken'] ?? responseData['refresh_token'];
          } else {
            // Direct response structure
            newAccessToken = data['accessToken'] ?? data['access_token'];
            newRefreshToken = data['refreshToken'] ?? data['refresh_token'];
          }
        }

        if (newAccessToken != null) {
          await _storeAccessToken(newAccessToken);

          // Store new refresh token if provided
          if (newRefreshToken != null) {
            await _storeRefreshToken(newRefreshToken);
          }

          return newAccessToken;
        }
      }

      return null;
    } catch (e) {
      print('Error refreshing token: $e');
      return null;
    }
  }

  /// Check if the request should skip authentication
  bool _shouldSkipAuth(String path) {
    final publicEndpoints = [
      '/auth/login',
      '/auth/signup',
      '/auth/send-otp',
      '/auth/verify-otp',
      '/auth/forgot-password',
      '/auth/verify-otp-forgot',
      '/auth/change-password',
      '/auth/refresh-token',
      '/auth/check-email',
    ];

    return publicEndpoints.any((endpoint) => path.contains(endpoint));
  }
}

// Extension to provide convenient token management methods
extension AuthInterceptorExtension on AuthInterceptor {
  /// Manually store tokens (useful after login)
  Future<void> storeTokens({
    required String accessToken,
    required String refreshToken,
  }) async {
    await _secureStorage.storeTokens(
      accessToken: accessToken,
      refreshToken: refreshToken,
    );
  }

  /// Manually clear tokens (useful for logout)
  Future<void> clearAllTokens() async {
    await _clearTokens();
  }

  /// Check if user has valid tokens
  Future<bool> hasValidTokens() async {
    final accessToken = await _getAccessToken();
    final refreshToken = await _getRefreshToken();
    return accessToken != null && refreshToken != null;
  }
}
