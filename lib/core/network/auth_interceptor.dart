// import 'package:dio/dio.dart';
// import 'package:injectable/injectable.dart';
// import '../../features/auth/data/datasources/auth_local_data_source.dart';
// import '../../features/auth/data/datasources/auth_remote_data_source.dart';

// @lazySingleton
// class AuthInterceptor extends Interceptor {
//   final AuthLocalDataSource _localDataSource;
//   final AuthRemoteDataSource _authRemoteDataSource;

//   AuthInterceptor(this._localDataSource, this._authRemoteDataSource);

//   bool _isRefreshing = false;
//   final List<RequestOptions> _pendingRequests = [];

//   @override
//   void onRequest(
//     RequestOptions options,
//     RequestInterceptorHandler handler,
//   ) async {
//     if (_shouldSkipAuth(options.path)) {
//       return handler.next(options);
//     }

//     // Get access token from local storage
//     final accessToken = await _localDataSource.getStoredAccessToken();
//     final refreshToken = await _localDataSource.getStoredRefreshToken();
//     if (accessToken != null && accessToken.isNotEmpty) {
//       options.headers['Authorization'] = 'Bearer $accessToken';
//     }
//     if (_isRefreshToken(options.path) &&
//         refreshToken != null &&
//         refreshToken.isNotEmpty) {
//       options.headers['Authorization'] = 'Bearer $refreshToken';
//     }

//     return handler.next(options);
//   }

//   @override
//   void onError(DioException err, ErrorInterceptorHandler handler) async {
//     if (err.response?.statusCode == 401 && !_isRefreshing) {
//       _isRefreshing = true;

//       try {
//         // Get refresh token from local storage
//         final refreshToken = await _localDataSource.getStoredRefreshToken();
//         if (refreshToken == null || refreshToken.isEmpty) {
//           await _clearAuthData();
//           return handler.next(err);
//         }

//         // Try to refresh token using remote data source
//         final refreshResult = await _authRemoteDataSource.refreshToken();

//         if (refreshResult.isRight()) {
//           final newTokens = refreshResult.fold((l) => null, (r) => r);
//           // Save new tokens
//           await _localDataSource.storeTokens(
//             accessToken: newTokens!.accessToken,
//             refreshToken: newTokens.refreshToken,
//           );

//           // Retry all pending requests
//           for (final requestOptions in _pendingRequests) {
//             requestOptions.headers['Authorization'] =
//                 'Bearer ${newTokens.accessToken}';
//             await Dio().fetch(requestOptions);
//           }

//           // Retry the original request
//           err.requestOptions.headers['Authorization'] =
//               'Bearer ${newTokens.accessToken}';
//           final response = await Dio().fetch(err.requestOptions);
//           return handler.resolve(response);
//         } else {
//           await _clearAuthData();
//         }
//       } catch (e) {
//         await _clearAuthData();
//       } finally {
//         _isRefreshing = false;
//         _pendingRequests.clear();
//       }
//     } else if (err.response?.statusCode == 401 && _isRefreshing) {
//       _pendingRequests.add(err.requestOptions);
//     }

//     return handler.next(err);
//   }

//   Future<void> _clearAuthData() async {
//     await _localDataSource.clearStoredTokens();
//     await _localDataSource.clearStoredAdmin();
//   }

//   bool _shouldSkipAuth(String path) {
//     final skipPaths = [
//       '/auth/login',
//       '/auth/register',
//       '/auth/forgot-password',
//       '/auth/reset-password',
//     ];
//     return skipPaths.any((skipPath) => path.contains(skipPath));
//   }

//   bool _isRefreshToken(String path) {
//     return path.contains('/admins/refresh-token');
//   }
// }
