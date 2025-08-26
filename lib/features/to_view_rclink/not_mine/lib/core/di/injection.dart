import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import '../config/flavor_config.dart';
import '../network/error_interceptor.dart';
import '../constants/app_constants.dart';
import '../network/auth_interceptor.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'injection.config.dart';

final getIt = GetIt.instance;

// Track initialization state
bool _isInitialized = false;

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)
Future<void> configureDependencies() async {
  // Prevent multiple initializations
  if (_isInitialized) {
    return;
  }

  try {
    // In development, reset GetIt to handle hot reload
    if (FlavorConfig.instance.isDevelopment && getIt.isRegistered<Dio>()) {
      await getIt.reset();
      _isInitialized = false; // Reset the flag as well
    }

    getIt.init();
    _configureDioInterceptors();
    _isInitialized = true;

    print('✅ Dependency injection configured successfully');
  } catch (e) {
    print('❌ Error configuring dependencies: $e');

    // If there's an error, try to reset and retry once
    if (!_isInitialized) {
      try {
        await getIt.reset();
        getIt.init();
        _configureDioInterceptors();
        _isInitialized = true;
        print('✅ Dependency injection configured on retry');
      } catch (retryError) {
        print('❌ Failed to configure dependencies on retry: $retryError');
        rethrow;
      }
    } else {
      rethrow;
    }
  }
}

void _configureDioInterceptors() {
  try {
    final dio = getIt<Dio>();

    // Add interceptors in the correct order
    dio.interceptors.clear(); // Clear any existing interceptors

    // Add pretty logging (only in debug mode)
    if (FlavorConfig.instance.flavor != Flavor.production) {
      dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: false,
          error: true,
          compact: true,
          maxWidth: 90,
        ),
      );
    }

    // Add error handling interceptor
    dio.interceptors.add(getIt<ErrorInterceptor>());

    // Add auth interceptor
    dio.interceptors.add(getIt<AuthInterceptor>());

    print('✅ Dio interceptors configured successfully');
  } catch (e) {
    print('❌ Error configuring Dio interceptors: $e');
    rethrow;
  }
}

@module
abstract class RegisterModule {
  @lazySingleton
  Dio get dio {
    final dio = Dio(
      BaseOptions(
        baseUrl: FlavorConfig.instance.apiBaseUrl,
        connectTimeout: const Duration(
          milliseconds: AppConstants.connectionTimeout,
        ),
        receiveTimeout: const Duration(
          milliseconds: AppConstants.receiveTimeout,
        ),
        sendTimeout: const Duration(milliseconds: AppConstants.sendTimeout),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    return dio;
  }

  @lazySingleton
  Connectivity get connectivity => Connectivity();
}
