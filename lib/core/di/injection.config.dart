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
import '../../features/escrowpay/data/datasources/escrowpay_api_service.dart'
    as _i605;
import '../../features/escrowpay/data/datasources/escrowpay_local_datasource.dart'
    as _i589;
import '../../features/escrowpay/data/datasources/escrowpay_remote_datasource.dart'
    as _i150;
import '../../features/escrowpay/data/repositories/escrowpay_repository_impl.dart'
    as _i437;
import '../../features/escrowpay/domain/repository/escrowpay_repository.dart'
    as _i601;
import '../../features/escrowpay/domain/usecases/create_payment_usecase.dart'
    as _i155;
import '../../features/escrowpay/domain/usecases/search_phone_usecase.dart'
    as _i59;
import '../../features/escrowpay/domain/usecases/search_username_usecase.dart'
    as _i446;
import '../../features/escrowpay/presentation/bloc/escrowpay_bloc.dart'
    as _i429;
import '../../features/inbox/data/datasources/inbox_api_service.dart' as _i748;
import '../../features/inbox/data/datasources/inbox_local_datasource.dart'
    as _i765;
import '../../features/inbox/data/datasources/inbox_remote_datasource.dart'
    as _i94;
import '../../features/inbox/data/repositories/inbox_repository_impl.dart'
    as _i987;
import '../../features/inbox/domain/repositories/inbox_repository.dart'
    as _i717;
import '../../features/inbox/domain/usecases/get_mailbox_usecase.dart' as _i586;
import '../../features/inbox/domain/usecases/get_marketing_usecase.dart'
    as _i791;
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
import '../../features/login/domain/usecases/get_store_credential_usecase.dart'
    as _i547;
import '../../features/login/domain/usecases/get_stored_user_usecase.dart'
    as _i489;
import '../../features/login/domain/usecases/login_usecase.dart' as _i420;
import '../../features/login/domain/usecases/logout_usecase.dart' as _i611;
import '../../features/login/domain/usecases/refresh_token_usecase.dart'
    as _i1051;
import '../../features/login/domain/usecases/store_login_usecase.dart' as _i320;
import '../../features/login/domain/usecases/verify_otp_usecase.dart' as _i285;
import '../../features/login/presentation/bloc/login_bloc.dart' as _i664;
import '../../features/onboarding/presentation/bloc/onboarding_bloc.dart'
    as _i792;
import '../../features/profile/data/datasources/profile_api_service.dart'
    as _i1041;
import '../../features/profile/data/datasources/profile_local_datasource.dart'
    as _i1046;
import '../../features/profile/data/datasources/profile_remote_datasource.dart'
    as _i327;
import '../../features/profile/data/repositories/profile_repository_impl.dart'
    as _i334;
import '../../features/profile/domain/repositories/profile_repository.dart'
    as _i894;
import '../../features/profile/domain/usecases/get_user_settings_usecase.dart'
    as _i1016;
import '../../features/profile/presentation/bloc/profile_bloc.dart' as _i469;
import '../../features/transactionboard/data/datasources/transactionboard_api_service.dart'
    as _i375;
import '../../features/transactionboard/data/datasources/transactionboard_local_datasource.dart'
    as _i490;
import '../../features/transactionboard/data/datasources/transactionboard_remote_datasource.dart'
    as _i802;
import '../../features/transactionboard/data/repositories/transactionboard_repository_impl.dart'
    as _i571;
import '../../features/transactionboard/domain/repositories/transactionboard_repository.dart'
    as _i113;
import '../../features/transactionboard/domain/usecases/get_onhold_balance_usecase.dart'
    as _i292;
import '../../features/transactionboard/domain/usecases/get_onhold_transactions_usecase.dart'
    as _i813;
import '../../features/transactionboard/domain/usecases/get_request_transactions_usecase.dart'
    as _i1043;
import '../../features/transactionboard/domain/usecases/get_user_detail_usecase.dart'
    as _i742;
import '../../features/transactionboard/features/ongoing/presentation/bloc/ongoing_bloc.dart'
    as _i269;
import '../../features/transactionboard/presentation/bloc/transaction_bloc.dart'
    as _i448;
import '../../features/user/data/datasources/user_api_service.dart' as _i761;
import '../../features/user/data/datasources/user_local_datasource.dart'
    as _i798;
import '../../features/user/data/datasources/user_remote_datasource.dart'
    as _i708;
import '../../features/user/data/repositories/user_repository_impl.dart'
    as _i664;
import '../../features/user/domain/repositories/user_repository.dart' as _i237;
import '../../features/user/domain/usecases/get_current_user_usecase.dart'
    as _i6;
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
    gh.singleton<_i982.DatabaseService>(() => _i982.DatabaseService());
    gh.singleton<_i491.ConnectivityService>(() => _i491.ConnectivityService());
    gh.lazySingleton<_i1004.ErrorInterceptor>(() => _i1004.ErrorInterceptor());
    gh.lazySingleton<_i142.SecureStorageService>(
      () => _i142.SecureStorageService(),
    );
    gh.lazySingleton<_i458.LocaleBloc>(() => _i458.LocaleBloc());
    gh.lazySingleton<_i269.OngoingBloc>(() => _i269.OngoingBloc());
    gh.lazySingleton<_i792.OnboardingBloc>(() => _i792.OnboardingBloc());
    gh.lazySingleton<_i361.Dio>(() => registerModule.dio);
    gh.lazySingleton<_i895.Connectivity>(() => registerModule.connectivity);
    gh.lazySingleton<_i806.DashboardLocalDataSource>(
      () => _i806.DashboardLocalDataSourceImpl(gh<_i982.DatabaseService>()),
    );
    gh.lazySingleton<_i491.NetworkInfo>(
      () => _i491.EnhancedNetworkInfo(gh<_i491.ConnectivityService>()),
    );
    gh.lazySingleton<_i748.InboxApiService>(
      () => _i748.InboxApiService(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i1041.ProfileApiService>(
      () => _i1041.ProfileApiService(gh<_i361.Dio>()),
    );
    gh.factory<_i156.AuthApiService>(
      () => _i156.AuthApiService(gh<_i361.Dio>()),
    );
    gh.factory<_i828.DashboardApiService>(
      () => _i828.DashboardApiService(gh<_i361.Dio>()),
    );
    gh.factory<_i375.TransactionBoardApiService>(
      () => _i375.TransactionBoardApiService(gh<_i361.Dio>()),
    );
    gh.factory<_i743.LoginApiService>(
      () => _i743.LoginApiService(gh<_i361.Dio>()),
    );
    gh.factory<_i605.EscrowpayApiService>(
      () => _i605.EscrowpayApiService(gh<_i361.Dio>()),
    );
    gh.factory<_i761.UserApiService>(
      () => _i761.UserApiService(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i589.EscrowpayLocalDataSource>(
      () => _i589.EscrowpayLocalDataSourceImpl(gh<_i982.DatabaseService>()),
    );
    gh.lazySingleton<_i708.UserRemoteDataSource>(
      () => _i708.UserRemoteDataSourceImpl(gh<_i761.UserApiService>()),
    );
    gh.lazySingleton<_i1046.ProfileLocalDataSource>(
      () => _i1046.ProfileLocalDataSourceImpl(gh<_i982.DatabaseService>()),
    );
    gh.lazySingleton<_i798.UserLocalDataSource>(
      () => _i798.UserLocalDataSourceImpl(gh<_i982.DatabaseService>()),
    );
    gh.lazySingleton<_i490.TransactionBoardLocalDataSource>(
      () => _i490.TransactionBoardLocalDataSourceImpl(),
    );
    gh.lazySingleton<_i765.InboxLocalDataSource>(
      () => _i765.InboxLocalDataSourceImpl(gh<_i982.DatabaseService>()),
    );
    gh.lazySingleton<_i908.AuthInterceptor>(
      () => _i908.AuthInterceptor(
        gh<_i361.Dio>(),
        gh<_i142.SecureStorageService>(),
      ),
    );
    gh.lazySingleton<_i327.ProfileRemoteDataSource>(
      () => _i327.ProfileRemoteDataSourceImpl(gh<_i1041.ProfileApiService>()),
    );
    gh.lazySingleton<_i932.NetworkInfo>(
      () => _i932.NetworkInfoImpl(gh<_i895.Connectivity>()),
    );
    gh.lazySingleton<_i817.DashboardRemoteDataSource>(
      () => _i817.DashboardRemoteDataSourceImpl(
        gh<_i828.DashboardApiService>(),
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
    gh.lazySingleton<_i852.AuthLocalDataSource>(
      () => _i852.AuthLocalDataSourceImpl(
        gh<_i982.DatabaseService>(),
        gh<_i908.AuthInterceptor>(),
        gh<_i142.SecureStorageService>(),
      ),
    );
    gh.lazySingleton<_i150.EscrowpayRemoteDataSource>(
      () =>
          _i150.EscrowpayRemoteDataSourceImpl(gh<_i605.EscrowpayApiService>()),
    );
    gh.lazySingleton<_i237.UserRepository>(
      () => _i664.UserRepositoryImpl(
        gh<_i798.UserLocalDataSource>(),
        gh<_i708.UserRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i107.AuthRemoteDataSource>(
      () => _i107.AuthRemoteDataSourceImpl(gh<_i156.AuthApiService>()),
    );
    gh.lazySingleton<_i802.TransactionBoardRemoteDataSource>(
      () => _i802.TransactionBoardRemoteDataSourceImpl(
        gh<_i375.TransactionBoardApiService>(),
      ),
    );
    gh.lazySingleton<_i94.InboxRemoteDataSource>(
      () => _i94.InboxRemoteDataSourceImpl(gh<_i748.InboxApiService>()),
    );
    gh.lazySingleton<_i301.LoginLocalDataSource>(
      () => _i301.LoginLocalDataSourceImpl(
        gh<_i982.DatabaseService>(),
        gh<_i908.AuthInterceptor>(),
        gh<_i142.SecureStorageService>(),
      ),
    );
    gh.lazySingleton<_i1033.LoginRemoteDataSource>(
      () => _i1033.LoginRemoteDataSourceImpl(gh<_i743.LoginApiService>()),
    );
    gh.lazySingleton<_i6.GetCurrentUserUseCase>(
      () => _i6.GetCurrentUserUseCase(gh<_i237.UserRepository>()),
    );
    gh.lazySingleton<_i902.LoginRepository>(
      () => _i1066.LoginRepositoryImpl(
        gh<_i1033.LoginRemoteDataSource>(),
        gh<_i301.LoginLocalDataSource>(),
        gh<_i932.NetworkInfo>(),
        gh<_i142.SecureStorageService>(),
      ),
    );
    gh.lazySingleton<_i894.ProfileRepository>(
      () => _i334.ProfileRepositoryImpl(
        gh<_i327.ProfileRemoteDataSource>(),
        gh<_i1046.ProfileLocalDataSource>(),
      ),
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
    gh.lazySingleton<_i787.AuthRepository>(
      () => _i153.AuthRepositoryImpl(
        gh<_i107.AuthRemoteDataSource>(),
        gh<_i852.AuthLocalDataSource>(),
        gh<_i932.NetworkInfo>(),
      ),
    );
    gh.lazySingleton<_i113.TransactionBoardRepository>(
      () => _i571.TransactionBoardRepositoryImpl(
        gh<_i802.TransactionBoardRemoteDataSource>(),
        gh<_i490.TransactionBoardLocalDataSource>(),
      ),
    );
    gh.lazySingleton<_i717.InboxRepository>(
      () => _i987.InboxRepositoryImpl(
        gh<_i94.InboxRemoteDataSource>(),
        gh<_i765.InboxLocalDataSource>(),
      ),
    );
    gh.lazySingleton<_i285.VerifyOtpUseCase>(
      () => _i285.VerifyOtpUseCase(gh<_i902.LoginRepository>()),
    );
    gh.factory<_i420.LoginUseCase>(
      () => _i420.LoginUseCase(gh<_i902.LoginRepository>()),
    );
    gh.factory<_i443.StoreLoginCredentialsUseCase>(
      () => _i443.StoreLoginCredentialsUseCase(gh<_i902.LoginRepository>()),
    );
    gh.factory<_i443.GetStoredCredentialsUseCase>(
      () => _i443.GetStoredCredentialsUseCase(gh<_i902.LoginRepository>()),
    );
    gh.factory<_i1051.RefreshTokenUseCase>(
      () => _i1051.RefreshTokenUseCase(gh<_i902.LoginRepository>()),
    );
    gh.factory<_i547.GetStoredCredentialsUseCase>(
      () => _i547.GetStoredCredentialsUseCase(gh<_i902.LoginRepository>()),
    );
    gh.factory<_i611.LogoutUseCase>(
      () => _i611.LogoutUseCase(gh<_i902.LoginRepository>()),
    );
    gh.factory<_i489.GetStoredUserUseCase>(
      () => _i489.GetStoredUserUseCase(gh<_i902.LoginRepository>()),
    );
    gh.factory<_i320.StoreLoginCredentialsUseCase>(
      () => _i320.StoreLoginCredentialsUseCase(gh<_i902.LoginRepository>()),
    );
    gh.factory<_i57.SignUpUseCase>(
      () => _i57.SignUpUseCase(gh<_i787.AuthRepository>()),
    );
    gh.factory<_i57.CheckEmailExistsUseCase>(
      () => _i57.CheckEmailExistsUseCase(gh<_i787.AuthRepository>()),
    );
    gh.factory<_i663.SendOtpUseCase>(
      () => _i663.SendOtpUseCase(gh<_i787.AuthRepository>()),
    );
    gh.lazySingleton<_i1016.GetUserSettingsUseCase>(
      () => _i1016.GetUserSettingsUseCase(gh<_i894.ProfileRepository>()),
    );
    gh.lazySingleton<_i601.EscrowpayRepository>(
      () => _i437.EscrowpayRepositoryImpl(
        gh<_i150.EscrowpayRemoteDataSource>(),
        gh<_i589.EscrowpayLocalDataSource>(),
        gh<_i932.NetworkInfo>(),
      ),
    );
    gh.factory<_i469.ProfileBloc>(
      () => _i469.ProfileBloc(gh<_i1016.GetUserSettingsUseCase>()),
    );
    gh.lazySingleton<_i664.LoginBloc>(
      () => _i664.LoginBloc(
        gh<_i420.LoginUseCase>(),
        gh<_i285.VerifyOtpUseCase>(),
        gh<_i611.LogoutUseCase>(),
        gh<_i489.GetStoredUserUseCase>(),
        gh<_i1051.RefreshTokenUseCase>(),
        gh<_i420.StoreLoginCredentialsUseCase>(),
        gh<_i420.GetStoredCredentialsUseCase>(),
      ),
    );
    gh.factory<_i59.SearchPhoneUseCase>(
      () => _i59.SearchPhoneUseCase(gh<_i601.EscrowpayRepository>()),
    );
    gh.factory<_i446.SearchUsernameUseCase>(
      () => _i446.SearchUsernameUseCase(gh<_i601.EscrowpayRepository>()),
    );
    gh.factory<_i155.CreatePaymentUseCase>(
      () => _i155.CreatePaymentUseCase(gh<_i601.EscrowpayRepository>()),
    );
    gh.factory<_i742.GetUserDetailTransactionBoardUseCase>(
      () => _i742.GetUserDetailTransactionBoardUseCase(
        gh<_i113.TransactionBoardRepository>(),
      ),
    );
    gh.factory<_i813.GetOnholdTransactionsWithParamsUseCase>(
      () => _i813.GetOnholdTransactionsWithParamsUseCase(
        gh<_i113.TransactionBoardRepository>(),
      ),
    );
    gh.factory<_i292.GetOnholdBalanceTransactionBoardUseCase>(
      () => _i292.GetOnholdBalanceTransactionBoardUseCase(
        gh<_i113.TransactionBoardRepository>(),
      ),
    );
    gh.factory<_i1043.GetRequestTransactionsUseCase>(
      () => _i1043.GetRequestTransactionsUseCase(
        gh<_i113.TransactionBoardRepository>(),
      ),
    );
    gh.lazySingleton<_i791.GetMarketingUseCase>(
      () => _i791.GetMarketingUseCase(gh<_i717.InboxRepository>()),
    );
    gh.lazySingleton<_i586.GetMailboxUseCase>(
      () => _i586.GetMailboxUseCase(gh<_i717.InboxRepository>()),
    );
    gh.lazySingleton<_i797.AuthBloc>(
      () => _i797.AuthBloc(gh<_i663.SendOtpUseCase>()),
    );
    gh.factory<_i429.EscrowpayBloc>(
      () => _i429.EscrowpayBloc(
        gh<_i446.SearchUsernameUseCase>(),
        gh<_i59.SearchPhoneUseCase>(),
        gh<_i155.CreatePaymentUseCase>(),
      ),
    );
    gh.lazySingleton<_i593.SignUpBloc>(
      () => _i593.SignUpBloc(
        gh<_i57.CheckEmailExistsUseCase>(),
        gh<_i57.SignUpUseCase>(),
      ),
    );
    gh.factory<_i448.TransactionBoardBloc>(
      () => _i448.TransactionBoardBloc(
        gh<_i742.GetUserDetailTransactionBoardUseCase>(),
        gh<_i813.GetOnholdTransactionsWithParamsUseCase>(),
        gh<_i292.GetOnholdBalanceTransactionBoardUseCase>(),
        gh<_i1043.GetRequestTransactionsUseCase>(),
      ),
    );
    gh.factory<_i923.InboxBloc>(
      () => _i923.InboxBloc(
        gh<_i791.GetMarketingUseCase>(),
        gh<_i586.GetMailboxUseCase>(),
      ),
    );
    return this;
  }
}

class _$RegisterModule extends _i464.RegisterModule {}
