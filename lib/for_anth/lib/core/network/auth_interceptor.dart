import 'dart:io';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@injectable
class AuthInterceptor extends Interceptor {
  static const String _accessTokenKey = 'access_token';
  static const String _refreshTokenKey = 'refresh_token';
  
  final Dio _dio;
  
  AuthInterceptor(this._dio);

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // Skip auth for certain endpoints
    if (_shouldSkipAuth(options.path)) {
      return handler.next(options);
    }

    try {
      final accessToken = await _getAccessToken();
      if (accessToken != null) {
        options.headers['Authorization'] = 'Bearer $accessToken';
      }
    } catch (e) {
      // Continue without token if there's an error getting it
      print('Error getting access token: $e');
    }

    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    // Handle 401 Unauthorized errors
    if (err.response?.statusCode == 401) {
      try {
        final newAccessToken = await _refreshToken();
        if (newAccessToken != null) {
          // Retry the original request with new token
          final requestOptions = err.requestOptions;
          requestOptions.headers['Authorization'] = 'Bearer $newAccessToken';
          
          try {
            final response = await _dio.fetch(requestOptions);
            return handler.resolve(response);
          } catch (e) {
            // If retry fails, continue with original error
            return handler.next(err);
          }
        } else {
          // No refresh token or refresh failed, clear tokens and continue with error
          await _clearTokens();
          return handler.next(err);
        }
      } catch (e) {
        // Refresh token process failed, clear tokens and continue with error
        await _clearTokens();
        return handler.next(err);
      }
    }

    handler.next(err);
  }

  /// Get stored access token
  Future<String?> _getAccessToken() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getString(_accessTokenKey);
    } catch (e) {
      print('Error getting access token: $e');
      return null;
    }
  }

  /// Get stored refresh token
  Future<String?> _getRefreshToken() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getString(_refreshTokenKey);
    } catch (e) {
      print('Error getting refresh token: $e');
      return null;
    }
  }

  /// Store new access token
  Future<void> _storeAccessToken(String token) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_accessTokenKey, token);
    } catch (e) {
      print('Error storing access token: $e');
    }
  }

  /// Store new refresh token
  Future<void> _storeRefreshToken(String token) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_refreshTokenKey, token);
    } catch (e) {
      print('Error storing refresh token: $e');
    }
  }

  /// Clear all stored tokens
  Future<void> _clearTokens() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(_accessTokenKey);
      await prefs.remove(_refreshTokenKey);
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
        data: {
          'refreshToken': refreshToken,
        },
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200 && response.data != null) {
        final data = response.data;
        
        // Handle different possible response structures
        String? newAccessToken;
        String? newRefreshToken;

        if (data is Map<String, dynamic>) {
          // Check if response is wrapped in ApiResponse structure
          if (data.containsKey('data') && data['data'] is Map<String, dynamic>) {
            final responseData = data['data'] as Map<String, dynamic>;
            newAccessToken = responseData['accessToken'] ?? responseData['access_token'];
            newRefreshToken = responseData['refreshToken'] ?? responseData['refresh_token'];
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
    await _storeAccessToken(accessToken);
    await _storeRefreshToken(refreshToken);
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