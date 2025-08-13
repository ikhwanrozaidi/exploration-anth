// lib/core/di/injection.dart - Updated with login use cases
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import '../config/flavor_config.dart';
import '../network/error_interceptor.dart';
import '../network/auth_interceptor.dart';
import '../constants/app_constants.dart';

import '../../features/auth/domain/repositories/auth_repository.dart';
import '../../features/auth/domain/usecases/send_otp_usecase.dart';

import '../../features/login/domain/repositories/login_repository.dart';
import '../../features/login/domain/usecases/login_usecase.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../features/onboarding/presentation/bloc/onboarding_bloc.dart';
import '../../features/transactionboard/features/ongoing/presentation/bloc/ongoing_bloc.dart';
import '../../features/transactionboard/presentation/bloc/transaction_bloc.dart';
import '../../features/inbox/presentation/bloc/inbox_bloc.dart';
import '../../features/profile/presentation/bloc/profile_bloc.dart';
import '../../features/pay_boarding/presentation/bloc/pay_boarding_bloc.dart';
import '../../features/pay_boarding/features/escrow_pay/presentation/bloc/escrow_pay_bloc.dart';
import '../../features/pay_boarding/features/qr_pay/presentation/bloc/qrpay_bloc.dart';

// import '../../features/login/domain/usecases/credential_usecase.dart';

// dashboard
import '../../features/dashboard/domain/repositories/dashboard_repository.dart';
import '../../features/dashboard/domain/usecases/get_user_detail_usecase.dart';
import '../../features/dashboard/domain/usecases/get_onhold_transactions_usecase.dart';
import '../../features/dashboard/domain/usecases/get_onhold_balance_usecase.dart';
import '../../features/dashboard/data/repositories/dashboard_repository_impl.dart';
import '../../features/dashboard/data/datasources/dashboard_remote_datasource.dart';
import '../../features/dashboard/data/datasources/dashboard_local_datasource.dart';
import '../../features/dashboard/presentation/bloc/dashboard_bloc.dart';


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

    await getIt.init();
    _configureDioInterceptors();
    _isInitialized = true;

    print('✅ Dependency injection configured successfully');
  } catch (e) {
    print('❌ Error configuring dependencies: $e');

    // If there's an error, try to reset and retry once
    if (!_isInitialized) {
      try {
        await getIt.reset();
        await getIt.init();
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

  // Auth use cases
  @lazySingleton
  SendOtpUseCase sendOtpUseCase(AuthRepository repository) =>
      SendOtpUseCase(repository);

  // Login use cases
  @lazySingleton
  LoginUseCase loginUseCase(LoginRepository repository) =>
      LoginUseCase(repository);

  @lazySingleton
  VerifyOtpUseCase verifyOtpUseCase(LoginRepository repository) =>
      VerifyOtpUseCase(repository);

  @lazySingleton
  LogoutUseCase logoutUseCase(LoginRepository repository) =>
      LogoutUseCase(repository);

  @lazySingleton
  GetStoredAdminUseCase getStoredAdminUseCase(LoginRepository repository) =>
      GetStoredAdminUseCase(repository);

  @lazySingleton
  RefreshTokenUseCase refreshTokenUseCase(LoginRepository repository) =>
      RefreshTokenUseCase(repository);

  @lazySingleton
  ForgotPasswordUseCase forgotPasswordUseCase(LoginRepository repository) =>
      ForgotPasswordUseCase(repository);

  @lazySingleton
  VerifyOtpForgotUseCase verifyOtpForgotUseCase(LoginRepository repository) =>
      VerifyOtpForgotUseCase(repository);

  @lazySingleton
  ChangePasswordUseCase changePasswordUseCase(LoginRepository repository) =>
      ChangePasswordUseCase(repository);

  @lazySingleton
  StoreLoginCredentialsUseCase storeLoginCredentialsUseCase(LoginRepository repository) =>
      StoreLoginCredentialsUseCase(repository);

  @lazySingleton
  GetStoredCredentialsUseCase getStoredCredentialsUseCase(LoginRepository repository) =>
      GetStoredCredentialsUseCase(repository);

  // Signup use cases (if needed)
  // @lazySingleton
  // SignUpUseCase signUpUseCase(AuthRepository repository) =>
  //     SignUpUseCase(repository);

  // @lazySingleton
  // CheckEmailExistsUseCase checkEmailExistsUseCase(AuthRepository repository) =>
  //     CheckEmailExistsUseCase(repository);

  //  @lazySingleton
  // GetUserDetailUseCase getUserDetailUseCase(DashboardRepository repository) =>
  //     GetUserDetailUseCase(repository);

  // @lazySingleton
  // GetOnholdTransactionsUseCase getOnholdTransactionsUseCase(DashboardRepository repository) =>
  //     GetOnholdTransactionsUseCase(repository);

  // @lazySingleton
  // GetOnholdBalanceUseCase getOnholdBalanceUseCase(DashboardRepository repository) =>
  //     GetOnholdBalanceUseCase(repository);
}