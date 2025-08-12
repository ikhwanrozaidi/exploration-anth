// import 'package:dio/dio.dart';
// import 'package:injectable/injectable.dart';
// import '../../features/auth/data/datasources/login_local_data_source.dart';
// import '../../features/auth/data/datasources/login_remote_data_source.dart';

// @lazySingleton
// class AuthInterceptor extends Interceptor {
//   final LoginLocalDataSource _localDataSource;
//   final LoginRemoteDataSource _remoteDataSource;

//   AuthInterceptor(this._localDataSource, this._remoteDataSource);

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
//     final accessTokenResult = await _localDataSource.getAccessToken();
//     final refreshTokenResult = await _localDataSource.getRefreshToken();
    
//     accessTokenResult.fold(
//       (failure) => null,
//       (accessToken) {
//         if (accessToken != null && accessToken.isNotEmpty) {
//           options.headers['Authorization'] = 'Bearer $accessToken';
//         }
//       },
//     );

//     if (_isRefreshToken(options.path)) {
//       refreshTokenResult.fold(
//         (failure) => null,
//         (refreshToken) {
//           if (refreshToken != null && refreshToken.isNotEmpty) {
//             options.headers['Authorization'] = 'Bearer $refreshToken';
//           }
//         },
//       );
//     }

//     return handler.next(options);
//   }

//   @override
//   void onError(DioException err, ErrorInterceptorHandler handler) async {
//     if (err.response?.statusCode == 401 && !_isRefreshing) {
//       _isRefreshing = true;

//       try {
//         // Get refresh token from local storage
//         final refreshTokenResult = await _localDataSource.getRefreshToken();
        
//         final refreshToken = refreshTokenResult.fold(
//           (failure) => null,
//           (token) => token,
//         );

//         if (refreshToken == null || refreshToken.isEmpty) {
//           await _clearAuthData();
//           return handler.next(err);
//         }

//         // Try to refresh token using remote data source
//         final refreshResult = await _remoteDataSource.refreshToken();

//         refreshResult.fold(
//           (failure) async {
//             await _clearAuthData();
//             return handler.next(err);
//           },
//           (authData) async {
//             final (authResult, admin) = authData;
            
//             // Save new tokens
//             await _localDataSource.storeAuthResult(authResult, admin);

//             // Retry all pending requests
//             for (final requestOptions in _pendingRequests) {
//               requestOptions.headers['Authorization'] =
//                   'Bearer ${authResult.accessToken}';
//               await Dio().fetch(requestOptions);
//             }

//             // Retry the original request
//             err.requestOptions.headers['Authorization'] =
//                 'Bearer ${authResult.accessToken}';
//             final response = await Dio().fetch(err.requestOptions);
//             return handler.resolve(response);
//           },
//         );
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
//     await _localDataSource.clearAuthData();
//   }

//   bool _shouldSkipAuth(String path) {
//     final skipPaths = [
//       '/auth/login',
//       '/auth/register',
//       '/auth/send-otp',
//       '/auth/verify-otp',
//       '/auth/forgot-password',
//       '/auth/reset-password',
//     ];
//     return skipPaths.any((skipPath) => path.contains(skipPath));
//   }

//   bool _isRefreshToken(String path) {
//     return path.contains('/auth/refresh-token');
//   }
// }