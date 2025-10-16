// lib/core/network/auth_interceptor.dart
import 'dart:async';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:synchronized/synchronized.dart';
import '../../features/auth/data/datasources/auth_local_data_source.dart';
import '../../features/auth/domain/usecases/refresh_token_usecase.dart';
import '../di/injection.dart';
import '../services/token_expiry_monitor_service.dart';

@lazySingleton
class AuthInterceptor extends Interceptor {
  final AuthLocalDataSource _localDataSource;
  final Lock _lock = Lock();

  // Token refresh state
  bool _isRefreshing = false;
  Completer<void>? _refreshCompleter;

  // Skip auth paths
  static const _skipAuthPaths = [
    '/auth/request-otp',
    '/auth/verify-otp',
    '/auth/refresh',
    '/public',
  ];

  AuthInterceptor(this._localDataSource);

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // Skip auth for public endpoints
    if (_shouldSkipAuth(options.path)) {
      return handler.next(options);
    }

    try {
      // Check if token refresh is in progress
      if (_isRefreshing && !_isRefreshRequest(options.path)) {
        // Wait for refresh to complete
        await _refreshCompleter?.future;
      }

      // Get tokens
      final tokensResult = await _localDataSource.getTokens();

      tokensResult.fold(
        (failure) => handler.next(options), // Continue without auth
        (tokens) async {
          if (tokens == null) {
            return handler.next(options);
          }

          // Check if access token is expired
          if (_isTokenExpired(tokens.accessTokenExpiresAt)) {
            // Refresh token if not already refreshing
            if (!_isRefreshing) {
              await _refreshToken();

              // Get updated tokens
              final updatedTokensResult = await _localDataSource.getTokens();
              updatedTokensResult.fold((failure) => handler.next(options), (
                updatedTokens,
              ) {
                if (updatedTokens != null) {
                  options.headers['Authorization'] =
                      'Bearer ${updatedTokens.accessToken}';
                }
                handler.next(options);
              });
              return;
            }
          }

          // Add authorization header
          options.headers['Authorization'] = 'Bearer ${tokens.accessToken}';
          handler.next(options);
        },
      );
    } catch (e) {
      handler.next(options);
    }
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    // Handle 401 Unauthorized
    if (err.response?.statusCode == 401 &&
        !_shouldSkipAuth(err.requestOptions.path)) {
      return await _lock.synchronized(() async {
        // Check if we already handled this
        if (_isRefreshing) {
          // Wait for refresh to complete and retry
          await _refreshCompleter?.future;
          return _retryRequest(err, handler);
        }

        // Try to refresh token
        final refreshSuccess = await _refreshToken();

        if (refreshSuccess) {
          // Retry the original request
          return _retryRequest(err, handler);
        } else {
          // Clear auth data and pass the error
          await _clearAuthData();
          handler.next(err);
        }
      });
    }

    handler.next(err);
  }

  Future<bool> _refreshToken() async {
    if (_isRefreshing) {
      await _refreshCompleter?.future;
      return _refreshCompleter?.isCompleted ?? false;
    }

    _isRefreshing = true;
    _refreshCompleter = Completer<void>();

    try {
      // Get current refresh token
      final refreshTokenResult = await _localDataSource.getRefreshToken();

      return await refreshTokenResult.fold(
        (failure) async {
          _refreshCompleter?.completeError(failure);
          return false;
        },
        (refreshToken) async {
          if (refreshToken == null) {
            _refreshCompleter?.completeError('No refresh token');
            return false;
          }

          // Check if refresh token is expired
          final expiresAtResult = await _localDataSource
              .getRefreshTokenExpiresAt();
          final isExpired = await expiresAtResult.fold(
            (failure) => true,
            (expiresAt) => expiresAt == null || _isTokenExpired(expiresAt),
          );

          if (isExpired) {
            _refreshCompleter?.completeError('Refresh token expired');
            return false;
          }

          // Call refresh token use case
          try {
            final refreshUseCase = getIt<RefreshTokenUseCase>();
            final result = await refreshUseCase(
              RefreshTokenParams(refreshToken),
            );

            return await result.fold(
              (failure) async {
                _refreshCompleter?.completeError(failure);
                return false;
              },
              (tokens) async {
                // Store new tokens
                await _localDataSource.storeTokens(tokens);
                _refreshCompleter?.complete();

                // Restart monitoring with new tokens
                try {
                  final tokenMonitor = getIt<TokenExpiryMonitor>();
                  await tokenMonitor.startMonitoring();
                  print(
                    '✅ AuthInterceptor: Token monitoring restarted after refresh',
                  );
                } catch (e) {
                  print(
                    '⚠️ AuthInterceptor: Failed to restart token monitoring: $e',
                  );
                }

                return true;
              },
            );
          } catch (e) {
            _refreshCompleter?.completeError(e);
            return false;
          }
        },
      );
    } finally {
      _isRefreshing = false;
    }
  }

  Future<void> _retryRequest(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    try {
      // Get updated tokens
      final tokensResult = await _localDataSource.getTokens();

      await tokensResult.fold((failure) async => handler.next(err), (
        tokens,
      ) async {
        if (tokens == null) {
          return handler.next(err);
        }

        // Update authorization header
        err.requestOptions.headers['Authorization'] =
            'Bearer ${tokens.accessToken}';

        // Create new dio instance to avoid interceptor loop
        final dio = Dio();

        // Copy request options
        final options = Options(
          method: err.requestOptions.method,
          headers: err.requestOptions.headers,
          responseType: err.requestOptions.responseType,
          contentType: err.requestOptions.contentType,
          validateStatus: err.requestOptions.validateStatus,
          receiveTimeout: err.requestOptions.receiveTimeout,
          sendTimeout: err.requestOptions.sendTimeout,
        );

        // Retry the request
        final response = await dio.request(
          err.requestOptions.uri.toString(),
          data: err.requestOptions.data,
          queryParameters: err.requestOptions.queryParameters,
          options: options,
        );

        handler.resolve(
          Response(
            requestOptions: err.requestOptions,
            data: response.data,
            statusCode: response.statusCode,
            statusMessage: response.statusMessage,
            headers: response.headers,
          ),
        );
      });
    } catch (e) {
      handler.next(err);
    }
  }

  Future<void> _clearAuthData() async {
    await _localDataSource.clearCache();

    // Stop monitoring when clearing auth data
    try {
      final tokenMonitor = getIt<TokenExpiryMonitor>();
      await tokenMonitor.stopMonitoring();
      print('✅ AuthInterceptor: Token monitoring stopped after clearing auth');
    } catch (e) {
      print('⚠️ AuthInterceptor: Failed to stop token monitoring: $e');
    }
  }

  bool _shouldSkipAuth(String path) {
    return _skipAuthPaths.any((skipPath) => path.contains(skipPath));
  }

  bool _isRefreshRequest(String path) {
    return path.contains('/auth/refresh');
  }

  bool _isTokenExpired(DateTime expiresAt) {
    // Add 5 minute buffer to refresh before actual expiry
    return DateTime.now().isAfter(
      expiresAt.subtract(const Duration(minutes: 5)),
    );
  }
}

// Extension to add auth interceptor to Dio
extension DioAuthExtension on Dio {
  void addAuthInterceptor(AuthInterceptor interceptor) {
    interceptors.add(interceptor);
  }
}
