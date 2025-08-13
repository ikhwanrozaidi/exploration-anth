// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:connectivity_plus/connectivity_plus.dart' as _i895;
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/admin/data/datasources/admin_local_data_source.dart'
    as _i691;
import '../../features/admin/data/datasources/admin_remote_data_source.dart'
    as _i517;
import '../../features/admin/data/repositories/admin_repository_impl.dart'
    as _i335;
import '../../features/admin/domain/repositories/admin_repository.dart'
    as _i583;
import '../../features/auth/data/datasources/auth_api_service.dart' as _i156;
import '../../features/auth/data/datasources/auth_local_data_source.dart'
    as _i852;
import '../../features/auth/data/datasources/auth_remote_data_source.dart'
    as _i107;
import '../../features/auth/data/repositories/auth_repository_impl.dart'
    as _i153;
import '../../features/auth/domain/repositories/auth_repository.dart' as _i787;
import '../../features/auth/domain/usecases/send_otp_usecase.dart' as _i663;
import '../../features/auth/domain/usecases/signup_usecase.dart' as _i57;
import '../../features/auth/presentation/bloc/auth_bloc.dart' as _i797;
import '../../features/auth/presentation/bloc/signup_bloc.dart' as _i593;
import '../../features/dashboard/data/datasources/dashboard_api_service.dart'
    as _i828;
import '../../features/dashboard/data/datasources/dashboard_local_datasource.dart'
    as _i806;
import '../../features/dashboard/data/datasources/dashboard_remote_datasource.dart'
    as _i817;
import '../../features/dashboard/data/repositories/dashboard_repository_impl.dart'
    as _i509;
import '../../features/dashboard/domain/repositories/dashboard_repository.dart'
    as _i665;
import '../../features/dashboard/domain/usecases/get_onhold_balance_usecase.dart'
    as _i792;
import '../../features/dashboard/domain/usecases/get_onhold_transactions_usecase.dart'
    as _i451;
import '../../features/dashboard/domain/usecases/get_user_detail_usecase.dart'
    as _i381;
import '../../features/dashboard/presentation/bloc/dashboard_bloc.dart'
    as _i652;
import '../../features/inbox/presentation/bloc/inbox_bloc.dart' as _i923;
import '../../features/locale/presentation/bloc/locale_bloc.dart' as _i458;
import '../../features/login/data/datasources/login_api_service.dart' as _i743;
import '../../features/login/data/datasources/login_local_datasource.dart'
    as _i301;
import '../../features/login/data/datasources/login_remote_datasource.dart'
    as _i1033;
import '../../features/login/data/repositories/login_repository_impl.dart'
    as _i1066;
import '../../features/login/domain/repositories/login_repository.dart'
    as _i902;
import '../../features/login/domain/usecases/credential_usecase.dart' as _i443;
import '../../features/login/domain/usecases/login_usecase.dart' as _i420;
import '../../features/login/presentation/bloc/login_bloc.dart' as _i664;
import '../../features/onboarding/presentation/bloc/onboarding_bloc.dart'
    as _i792;
import '../../features/pay_boarding/features/escrow_pay/presentation/bloc/escrow_pay_bloc.dart'
    as _i571;
import '../../features/pay_boarding/features/qr_pay/presentation/bloc/qrpay_bloc.dart'
    as _i99;
import '../../features/pay_boarding/presentation/bloc/pay_boarding_bloc.dart'
    as _i463;
import '../../features/profile/presentation/bloc/profile_bloc.dart' as _i469;
import '../../features/transactionboard/features/ongoing/presentation/bloc/ongoing_bloc.dart'
    as _i269;
import '../../features/transactionboard/presentation/bloc/transaction_bloc.dart'
    as _i448;
import '../database/app_database.dart' as _i982;
import '../network/auth_interceptor.dart' as _i908;
import '../network/connectivity_service.dart' as _i491;
import '../network/error_interceptor.dart' as _i1004;
import '../network/network_info.dart' as _i932;
import '../service/secure_storage_service.dart' as _i142;
import 'injection.dart' as _i464;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    gh.factory<_i923.InboxBloc>(() => _i923.InboxBloc());
    gh.factory<_i469.ProfileBloc>(() => _i469.ProfileBloc());
    gh.factory<_i99.QrpayBloc>(() => _i99.QrpayBloc());
    gh.factory<_i571.EscrowpayBloc>(() => _i571.EscrowpayBloc());
    gh.factory<_i463.PayBoardingBloc>(() => _i463.PayBoardingBloc());
    gh.singleton<_i982.DatabaseService>(() => _i982.DatabaseService());
    gh.singleton<_i491.ConnectivityService>(() => _i491.ConnectivityService());
    gh.lazySingleton<_i1004.ErrorInterceptor>(() => _i1004.ErrorInterceptor());
    gh.lazySingleton<_i361.Dio>(() => registerModule.dio);
    gh.lazySingleton<_i895.Connectivity>(() => registerModule.connectivity);
    gh.lazySingleton<_i142.SecureStorageService>(
      () => _i142.SecureStorageService(),
    );
    gh.lazySingleton<_i458.LocaleBloc>(() => _i458.LocaleBloc());
    gh.lazySingleton<_i269.OngoingBloc>(() => _i269.OngoingBloc());
    gh.lazySingleton<_i448.TransactionboardBloc>(
      () => _i448.TransactionboardBloc(),
    );
    gh.lazySingleton<_i792.OnboardingBloc>(() => _i792.OnboardingBloc());
    gh.lazySingleton<_i852.AuthLocalDataSource>(
      () => _i852.AuthLocalDataSourceImpl(
        gh<_i982.DatabaseService>(),
        gh<_i142.SecureStorageService>(),
      ),
    );
    gh.lazySingleton<_i691.AdminLocalDataSource>(
      () => _i691.AdminLocalDataSourceImpl(gh<_i982.DatabaseService>()),
    );
    gh.lazySingleton<_i932.NetworkInfo>(
      () => _i932.NetworkInfoImpl(gh<_i895.Connectivity>()),
    );
    gh.lazySingleton<_i806.DashboardLocalDataSource>(
      () => _i806.DashboardLocalDataSourceImpl(gh<_i982.DatabaseService>()),
    );
    gh.factory<_i156.AuthApiService>(
      () => _i156.AuthApiService(gh<_i361.Dio>()),
    );
    gh.factory<_i743.LoginApiService>(
      () => _i743.LoginApiService(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i517.AdminRemoteDataSource>(
      () => _i517.AdminRemoteDataSourceImpl(gh<_i156.AuthApiService>()),
    );
    gh.lazySingleton<_i107.AuthRemoteDataSource>(
      () => _i107.AuthRemoteDataSourceImpl(gh<_i156.AuthApiService>()),
    );
    gh.factory<_i908.AuthInterceptor>(
      () => _i908.AuthInterceptor(
        gh<_i361.Dio>(),
        gh<_i142.SecureStorageService>(),
      ),
    );
    gh.lazySingleton<_i491.NetworkInfo>(
      () => _i491.EnhancedNetworkInfo(gh<_i491.ConnectivityService>()),
    );
    gh.lazySingleton<_i593.SignUpBloc>(
      () => _i593.SignUpBloc(
        gh<_i57.CheckEmailExistsUseCase>(),
        gh<_i57.SignUpUseCase>(),
      ),
    );
    gh.lazySingleton<_i583.AdminRepository>(
      () => _i335.AdminRepositoryImpl(
        gh<_i691.AdminLocalDataSource>(),
        gh<_i517.AdminRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i817.DashboardRemoteDataSource>(
      () => _i817.DashboardRemoteDataSourceImpl(
        gh<_i828.DashboardApiService>(),
        gh<_i932.NetworkInfo>(),
      ),
    );
    gh.lazySingleton<_i1033.LoginRemoteDataSource>(
      () => _i1033.LoginRemoteDataSourceImpl(gh<_i743.LoginApiService>()),
    );
    gh.lazySingleton<_i301.LoginLocalDataSource>(
      () => _i301.LoginLocalDataSourceImpl(
        gh<_i982.DatabaseService>(),
        gh<_i908.AuthInterceptor>(),
        gh<_i142.SecureStorageService>(),
      ),
    );
    gh.lazySingleton<_i902.LoginRepository>(
      () => _i1066.LoginRepositoryImpl(
        gh<_i1033.LoginRemoteDataSource>(),
        gh<_i301.LoginLocalDataSource>(),
        gh<_i932.NetworkInfo>(),
        gh<_i142.SecureStorageService>(),
      ),
    );
    gh.lazySingleton<_i420.LoginUseCase>(
      () => registerModule.loginUseCase(gh<_i902.LoginRepository>()),
    );
    gh.lazySingleton<_i420.VerifyOtpUseCase>(
      () => registerModule.verifyOtpUseCase(gh<_i902.LoginRepository>()),
    );
    gh.lazySingleton<_i420.LogoutUseCase>(
      () => registerModule.logoutUseCase(gh<_i902.LoginRepository>()),
    );
    gh.lazySingleton<_i420.GetStoredAdminUseCase>(
      () => registerModule.getStoredAdminUseCase(gh<_i902.LoginRepository>()),
    );
    gh.lazySingleton<_i420.RefreshTokenUseCase>(
      () => registerModule.refreshTokenUseCase(gh<_i902.LoginRepository>()),
    );
    gh.lazySingleton<_i420.ForgotPasswordUseCase>(
      () => registerModule.forgotPasswordUseCase(gh<_i902.LoginRepository>()),
    );
    gh.lazySingleton<_i420.VerifyOtpForgotUseCase>(
      () => registerModule.verifyOtpForgotUseCase(gh<_i902.LoginRepository>()),
    );
    gh.lazySingleton<_i420.ChangePasswordUseCase>(
      () => registerModule.changePasswordUseCase(gh<_i902.LoginRepository>()),
    );
    gh.lazySingleton<_i420.StoreLoginCredentialsUseCase>(
      () => registerModule.storeLoginCredentialsUseCase(
        gh<_i902.LoginRepository>(),
      ),
    );
    gh.lazySingleton<_i420.GetStoredCredentialsUseCase>(
      () => registerModule.getStoredCredentialsUseCase(
        gh<_i902.LoginRepository>(),
      ),
    );
    gh.factory<_i443.StoreLoginCredentialsUseCase>(
      () => _i443.StoreLoginCredentialsUseCase(gh<_i902.LoginRepository>()),
    );
    gh.factory<_i443.GetStoredCredentialsUseCase>(
      () => _i443.GetStoredCredentialsUseCase(gh<_i902.LoginRepository>()),
    );
    gh.lazySingleton<_i787.AuthRepository>(
      () => _i153.AuthRepositoryImpl(
        gh<_i107.AuthRemoteDataSource>(),
        gh<_i852.AuthLocalDataSource>(),
        gh<_i932.NetworkInfo>(),
      ),
    );
    gh.lazySingleton<_i665.DashboardRepository>(
      () => _i509.DashboardRepositoryImpl(
        gh<_i817.DashboardRemoteDataSource>(),
        gh<_i806.DashboardLocalDataSource>(),
        gh<_i932.NetworkInfo>(),
      ),
    );
    gh.lazySingleton<_i663.SendOtpUseCase>(
      () => registerModule.sendOtpUseCase(gh<_i787.AuthRepository>()),
    );
    gh.lazySingleton<_i664.LoginBloc>(
      () => _i664.LoginBloc(
        gh<_i420.LoginUseCase>(),
        gh<_i420.VerifyOtpUseCase>(),
        gh<_i420.LogoutUseCase>(),
        gh<_i420.GetStoredAdminUseCase>(),
        gh<_i420.RefreshTokenUseCase>(),
        gh<_i420.ForgotPasswordUseCase>(),
        gh<_i420.VerifyOtpForgotUseCase>(),
        gh<_i420.ChangePasswordUseCase>(),
        gh<_i420.StoreLoginCredentialsUseCase>(),
        gh<_i420.GetStoredCredentialsUseCase>(),
      ),
    );
    gh.lazySingleton<_i797.AuthBloc>(
      () => _i797.AuthBloc(gh<_i663.SendOtpUseCase>()),
    );
    gh.factory<_i381.GetUserDetailUseCase>(
      () => _i381.GetUserDetailUseCase(gh<_i665.DashboardRepository>()),
    );
    gh.factory<_i451.GetOnholdTransactionsUseCase>(
      () => _i451.GetOnholdTransactionsUseCase(gh<_i665.DashboardRepository>()),
    );
    gh.factory<_i792.GetOnholdBalanceUseCase>(
      () => _i792.GetOnholdBalanceUseCase(gh<_i665.DashboardRepository>()),
    );
    gh.factory<_i652.DashboardBloc>(
      () => _i652.DashboardBloc(
        gh<_i381.GetUserDetailUseCase>(),
        gh<_i451.GetOnholdTransactionsUseCase>(),
        gh<_i792.GetOnholdBalanceUseCase>(),
      ),
    );
    return this;
  }
}

class _$RegisterModule extends _i464.RegisterModule {}
