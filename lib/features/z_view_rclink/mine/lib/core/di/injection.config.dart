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

import '../../features/admin/data/datasources/admin_api_service.dart' as _i472;
import '../../features/admin/data/datasources/admin_local_data_source.dart'
    as _i691;
import '../../features/admin/data/datasources/admin_remote_data_source.dart'
    as _i517;
import '../../features/admin/data/repositories/admin_repository_impl.dart'
    as _i335;
import '../../features/admin/domain/repositories/admin_repository.dart'
    as _i583;
import '../../features/admin/domain/usecases/get_current_admin_usecase.dart'
    as _i257;
import '../../features/auth/data/datasources/auth_api_service.dart' as _i156;
import '../../features/auth/data/datasources/auth_local_data_source.dart'
    as _i852;
import '../../features/auth/data/datasources/auth_remote_data_source.dart'
    as _i107;
import '../../features/auth/data/repositories/auth_repository_impl.dart'
    as _i153;
import '../../features/auth/domain/repositories/auth_repository.dart' as _i787;
import '../../features/auth/domain/usecases/clear_auth_cache_usecase.dart'
    as _i871;
import '../../features/auth/domain/usecases/get_tokens_usecase.dart' as _i625;
import '../../features/auth/domain/usecases/refresh_token_usecase.dart'
    as _i157;
import '../../features/auth/domain/usecases/request_otp_usecase.dart' as _i29;
import '../../features/auth/domain/usecases/store_tokens_usecase.dart' as _i388;
import '../../features/auth/domain/usecases/verify_otp_usecase.dart' as _i503;
import '../../features/auth/presentation/bloc/auth_bloc.dart' as _i797;
import '../../features/company/data/datasources/company_api_service.dart'
    as _i178;
import '../../features/company/data/datasources/company_local_datasource.dart'
    as _i594;
import '../../features/company/data/datasources/company_remote_datasource.dart'
    as _i469;
import '../../features/company/data/repositories/company_repository_impl.dart'
    as _i726;
import '../../features/company/domain/repositories/company_repository.dart'
    as _i752;
import '../../features/company/domain/usecases/company_clear_cache_usecase.dart'
    as _i29;
import '../../features/company/domain/usecases/get_my_companies_usecase.dart'
    as _i825;
import '../../features/company/domain/usecases/get_selected_company_usecase.dart'
    as _i385;
import '../../features/company/domain/usecases/select_company_usecase.dart'
    as _i876;
import '../../features/company/domain/usecases/update_company_usecase.dart'
    as _i8;
import '../../features/company/presentation/bloc/company_bloc.dart' as _i426;
import '../../features/locale/presentation/bloc/locale_bloc.dart' as _i458;
import '../../features/location/data/datasources/location_api_service.dart'
    as _i903;
import '../../features/location/data/datasources/location_local_datasource.dart'
    as _i981;
import '../../features/location/data/datasources/location_remote_datasource.dart'
    as _i700;
import '../../features/location/data/repository/district_repository_impl.dart'
    as _i530;
import '../../features/location/data/repository/location_repository_impl.dart'
    as _i206;
import '../../features/location/data/repository/province_repository_impl.dart'
    as _i236;
import '../../features/location/data/repository/road_repository_impl.dart'
    as _i766;
import '../../features/location/domain/repository/district_repository.dart'
    as _i969;
import '../../features/location/domain/repository/location_repository.dart'
    as _i626;
import '../../features/location/domain/repository/province_repository.dart'
    as _i858;
import '../../features/location/domain/repository/road_repository.dart'
    as _i244;
import '../../features/location/domain/usecases/clear_all_location_cache_usecase.dart'
    as _i992;
import '../../features/location/domain/usecases/clear_district_cache_usecase.dart'
    as _i1047;
import '../../features/location/domain/usecases/clear_province_cache_usecase.dart'
    as _i886;
import '../../features/location/domain/usecases/clear_road_cache_usecase.dart'
    as _i957;
import '../../features/location/domain/usecases/get_districts_usecase.dart'
    as _i626;
import '../../features/location/domain/usecases/get_province_usecase.dart'
    as _i1006;
import '../../features/location/domain/usecases/get_roads_usecase.dart'
    as _i599;
import '../../features/location/presentation/bloc/location_bloc.dart' as _i845;
import '../../features/rbac/data/datasources/permission_local_datasource.dart'
    as _i267;
import '../../features/rbac/data/datasources/permission_remote_datasource.dart'
    as _i432;
import '../../features/rbac/data/datasources/role_api_service.dart' as _i1020;
import '../../features/rbac/data/repositories/permission_repository_impl.dart'
    as _i806;
import '../../features/rbac/domain/repositories/permission_repository.dart'
    as _i999;
import '../../features/rbac/domain/usecases/check_all_permissions_usecase.dart'
    as _i976;
import '../../features/rbac/domain/usecases/check_any_permission_usecase.dart'
    as _i644;
import '../../features/rbac/domain/usecases/check_permission_usecase.dart'
    as _i448;
import '../../features/rbac/domain/usecases/clear_role_usecase.dart' as _i1056;
import '../../features/rbac/domain/usecases/get_role_usecase.dart' as _i421;
import '../../features/rbac/presentation/bloc/rbac_bloc.dart' as _i167;
import '../../features/work_scope/data/datasource/work_scope_api_service.dart'
    as _i763;
import '../../features/work_scope/data/datasource/work_scope_local_datasource.dart'
    as _i591;
import '../../features/work_scope/data/datasource/work_scope_remote_datasource.dart'
    as _i788;
import '../../features/work_scope/data/repository/work_scope_repository_impl.dart'
    as _i477;
import '../../features/work_scope/domain/repository/work_scope_repository.dart'
    as _i811;
import '../../features/work_scope/domain/usecases/get_workscope_usecase.dart'
    as _i733;
import '../../features/work_scope/presentation/bloc/work_scope_bloc.dart'
    as _i248;
import '../constants/api_query_params.dart' as _i286;
import '../database/app_database.dart' as _i982;
import '../network/auth_interceptor.dart' as _i908;
import '../network/connectivity_service.dart' as _i491;
import '../network/error_interceptor.dart' as _i1004;
import '../network/network_info.dart' as _i932;
import '../repositories/post_sync_helper.dart' as _i739;
import '../services/post_sync_service.dart' as _i126;
import '../services/sync_service.dart' as _i979;
import '../services/token_expiry_monitor_service.dart' as _i334;
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
    gh.lazySingleton<_i361.Dio>(() => registerModule.dio);
    gh.lazySingleton<_i895.Connectivity>(() => registerModule.connectivity);
    gh.lazySingleton<_i1004.ErrorInterceptor>(() => _i1004.ErrorInterceptor());
    gh.lazySingleton<_i458.LocaleBloc>(() => _i458.LocaleBloc());
    gh.lazySingleton<_i739.PostSyncHelper>(
      () => _i739.PostSyncHelper(gh<_i982.DatabaseService>()),
    );
    gh.lazySingleton<_i594.CompanyLocalDataSource>(
      () => _i594.CompanyLocalDataSourceImpl(gh<_i982.DatabaseService>()),
    );
    gh.lazySingleton<_i691.AdminLocalDataSource>(
      () => _i691.AdminLocalDataSourceImpl(gh<_i982.DatabaseService>()),
    );
    gh.lazySingleton<_i852.AuthLocalDataSource>(
      () => _i852.AuthLocalDataSourceImpl(gh<_i982.DatabaseService>()),
    );
    gh.lazySingleton<_i932.NetworkInfo>(
      () => _i932.NetworkInfoImpl(gh<_i895.Connectivity>()),
    );
    gh.lazySingleton<_i267.PermissionLocalDataSource>(
      () => _i267.PermissionLocalDataSourceImpl(gh<_i982.DatabaseService>()),
    );
    gh.factory<_i733.GetWorkScopesParams>(
      () => _i733.GetWorkScopesParams(
        queryParams: gh<_i286.ApiQueryParams>(),
        companyUID: gh<String>(),
        search: gh<String>(),
        code: gh<String>(),
        allowMultipleQuantities: gh<bool>(),
        expand: gh<List<String>>(),
        forceRefresh: gh<bool>(),
        cacheTimeout: gh<Duration>(),
      ),
    );
    gh.lazySingleton<_i126.PostSyncService>(
      () => _i126.PostSyncService(
        gh<_i982.DatabaseService>(),
        gh<_i491.ConnectivityService>(),
        gh<_i361.Dio>(),
      ),
    );
    gh.factory<_i1020.RoleApiService>(
      () => _i1020.RoleApiService.new(gh<_i361.Dio>()),
    );
    gh.factory<_i763.WorkScopeApiService>(
      () => _i763.WorkScopeApiService.new(gh<_i361.Dio>()),
    );
    gh.factory<_i156.AuthApiService>(
      () => _i156.AuthApiService.new(gh<_i361.Dio>()),
    );
    gh.factory<_i903.LocationApiService>(
      () => _i903.LocationApiService.new(gh<_i361.Dio>()),
    );
    gh.factory<_i472.AdminApiService>(
      () => _i472.AdminApiService.new(gh<_i361.Dio>()),
    );
    gh.factory<_i178.CompanyApiService>(
      () => _i178.CompanyApiService.new(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i432.PermissionRemoteDataSource>(
      () => _i432.PermissionRemoteDataSourceImpl(gh<_i1020.RoleApiService>()),
    );
    gh.lazySingleton<_i999.PermissionRepository>(
      () => _i806.PermissionRepositoryImpl(
        gh<_i432.PermissionRemoteDataSource>(),
        gh<_i267.PermissionLocalDataSource>(),
      ),
    );
    gh.lazySingleton<_i981.LocationLocalDataSource>(
      () => _i981.LocationLocalDataSourceImpl(gh<_i982.DatabaseService>()),
    );
    gh.lazySingleton<_i517.AdminRemoteDataSource>(
      () => _i517.AdminRemoteDataSourceImpl(gh<_i472.AdminApiService>()),
    );
    gh.lazySingleton<_i591.WorkScopeLocalDataSource>(
      () => _i591.WorkScopeLocalDataSourceImpl(gh<_i982.DatabaseService>()),
    );
    gh.lazySingleton<_i700.LocationRemoteDataSource>(
      () => _i700.LocationRemoteDataSourceImpl(gh<_i903.LocationApiService>()),
    );
    gh.factory<_i448.CheckPermissionUseCase>(
      () => _i448.CheckPermissionUseCase(gh<_i999.PermissionRepository>()),
    );
    gh.factory<_i644.CheckAnyPermissionUseCase>(
      () => _i644.CheckAnyPermissionUseCase(gh<_i999.PermissionRepository>()),
    );
    gh.factory<_i1056.ClearRoleUseCase>(
      () => _i1056.ClearRoleUseCase(gh<_i999.PermissionRepository>()),
    );
    gh.factory<_i976.CheckAllPermissionsUseCase>(
      () => _i976.CheckAllPermissionsUseCase(gh<_i999.PermissionRepository>()),
    );
    gh.factory<_i421.GetRoleUseCase>(
      () => _i421.GetRoleUseCase(gh<_i999.PermissionRepository>()),
    );
    gh.lazySingleton<_i469.CompanyRemoteDataSource>(
      () => _i469.CompanyRemoteDataSourceImpl(gh<_i178.CompanyApiService>()),
    );
    gh.lazySingleton<_i969.DistrictRepository>(
      () => _i530.DistrictRepositoryImpl(
        gh<_i700.LocationRemoteDataSource>(),
        gh<_i981.LocationLocalDataSource>(),
      ),
    );
    gh.lazySingleton<_i626.LocationRepository>(
      () => _i206.LocationRepositoryImpl(gh<_i981.LocationLocalDataSource>()),
    );
    gh.lazySingleton<_i979.SyncService>(
      () => _i979.SyncService(
        gh<_i982.DatabaseService>(),
        gh<_i517.AdminRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i107.AuthRemoteDataSource>(
      () => _i107.AuthRemoteDataSourceImpl(gh<_i156.AuthApiService>()),
    );
    gh.lazySingleton<_i788.WorkScopeRemoteDataSource>(
      () =>
          _i788.WorkScopeRemoteDataSourceImpl(gh<_i763.WorkScopeApiService>()),
    );
    gh.lazySingleton<_i908.AuthInterceptor>(
      () => _i908.AuthInterceptor(gh<_i852.AuthLocalDataSource>()),
    );
    gh.lazySingleton<_i334.TokenExpiryMonitor>(
      () => _i334.TokenExpiryMonitor(gh<_i852.AuthLocalDataSource>()),
    );
    gh.lazySingleton<_i491.NetworkInfo>(
      () => _i491.EnhancedNetworkInfo(gh<_i491.ConnectivityService>()),
    );
    gh.lazySingleton<_i992.ClearAllLocationCacheUseCase>(
      () => _i992.ClearAllLocationCacheUseCase(gh<_i626.LocationRepository>()),
    );
    gh.lazySingleton<_i167.RbacBloc>(
      () => _i167.RbacBloc(
        gh<_i421.GetRoleUseCase>(),
        gh<_i1056.ClearRoleUseCase>(),
        gh<_i448.CheckPermissionUseCase>(),
        gh<_i644.CheckAnyPermissionUseCase>(),
        gh<_i976.CheckAllPermissionsUseCase>(),
      ),
    );
    gh.lazySingleton<_i583.AdminRepository>(
      () => _i335.AdminRepositoryImpl(
        gh<_i691.AdminLocalDataSource>(),
        gh<_i517.AdminRemoteDataSource>(),
      ),
    );
    gh.factory<_i752.CompanyRepository>(
      () => _i726.CompanyRepositoryImpl(
        gh<_i469.CompanyRemoteDataSource>(),
        gh<_i594.CompanyLocalDataSource>(),
      ),
    );
    gh.lazySingleton<_i8.UpdateCompanyFieldUseCase>(
      () => _i8.UpdateCompanyFieldUseCase(gh<_i752.CompanyRepository>()),
    );
    gh.lazySingleton<_i1047.ClearDistrictCacheUseCase>(
      () => _i1047.ClearDistrictCacheUseCase(gh<_i969.DistrictRepository>()),
    );
    gh.lazySingleton<_i626.GetDistrictsUseCase>(
      () => _i626.GetDistrictsUseCase(gh<_i969.DistrictRepository>()),
    );
    gh.lazySingleton<_i858.ProvinceRepository>(
      () => _i236.ProvinceRepositoryImpl(
        gh<_i700.LocationRemoteDataSource>(),
        gh<_i981.LocationLocalDataSource>(),
      ),
    );
    gh.lazySingleton<_i244.RoadRepository>(
      () => _i766.RoadRepositoryImpl(
        gh<_i700.LocationRemoteDataSource>(),
        gh<_i981.LocationLocalDataSource>(),
      ),
    );
    gh.lazySingleton<_i257.GetCurrentAdminUseCase>(
      () => _i257.GetCurrentAdminUseCase(gh<_i583.AdminRepository>()),
    );
    gh.factory<_i876.SelectCompanyUseCase>(
      () => _i876.SelectCompanyUseCase(gh<_i752.CompanyRepository>()),
    );
    gh.factory<_i385.GetSelectedCompanyUseCase>(
      () => _i385.GetSelectedCompanyUseCase(gh<_i752.CompanyRepository>()),
    );
    gh.factory<_i825.GetMyCompaniesUseCase>(
      () => _i825.GetMyCompaniesUseCase(gh<_i752.CompanyRepository>()),
    );
    gh.factory<_i29.ClearCompanyCacheUseCase>(
      () => _i29.ClearCompanyCacheUseCase(gh<_i752.CompanyRepository>()),
    );
    gh.lazySingleton<_i787.AuthRepository>(
      () => _i153.AuthRepositoryImpl(
        gh<_i107.AuthRemoteDataSource>(),
        gh<_i852.AuthLocalDataSource>(),
        gh<_i932.NetworkInfo>(),
      ),
    );
    gh.lazySingleton<_i871.ClearAuthCacheUseCase>(
      () => _i871.ClearAuthCacheUseCase(gh<_i787.AuthRepository>()),
    );
    gh.lazySingleton<_i388.StoreTokensUseCase>(
      () => _i388.StoreTokensUseCase(gh<_i787.AuthRepository>()),
    );
    gh.lazySingleton<_i29.RequestOtpUseCase>(
      () => _i29.RequestOtpUseCase(gh<_i787.AuthRepository>()),
    );
    gh.lazySingleton<_i625.GetTokensUseCase>(
      () => _i625.GetTokensUseCase(gh<_i787.AuthRepository>()),
    );
    gh.lazySingleton<_i503.VerifyOtpUseCase>(
      () => _i503.VerifyOtpUseCase(gh<_i787.AuthRepository>()),
    );
    gh.lazySingleton<_i426.CompanyBloc>(
      () => _i426.CompanyBloc(
        gh<_i825.GetMyCompaniesUseCase>(),
        gh<_i876.SelectCompanyUseCase>(),
        gh<_i385.GetSelectedCompanyUseCase>(),
        gh<_i29.ClearCompanyCacheUseCase>(),
        gh<_i8.UpdateCompanyFieldUseCase>(),
      ),
    );
    gh.lazySingleton<_i1006.GetProvincesUseCase>(
      () => _i1006.GetProvincesUseCase(gh<_i858.ProvinceRepository>()),
    );
    gh.lazySingleton<_i886.ClearProvinceCacheUseCase>(
      () => _i886.ClearProvinceCacheUseCase(gh<_i858.ProvinceRepository>()),
    );
    gh.lazySingleton<_i599.GetRoadsUseCase>(
      () => _i599.GetRoadsUseCase(gh<_i244.RoadRepository>()),
    );
    gh.lazySingleton<_i957.ClearRoadCacheUseCase>(
      () => _i957.ClearRoadCacheUseCase(gh<_i244.RoadRepository>()),
    );
    gh.lazySingleton<_i157.RefreshTokenUseCase>(
      () => _i157.RefreshTokenUseCase(gh<_i787.AuthRepository>()),
    );
    gh.factory<_i845.LocationBloc>(
      () => _i845.LocationBloc(
        gh<_i1006.GetProvincesUseCase>(),
        gh<_i626.GetDistrictsUseCase>(),
        gh<_i599.GetRoadsUseCase>(),
        gh<_i886.ClearProvinceCacheUseCase>(),
        gh<_i1047.ClearDistrictCacheUseCase>(),
        gh<_i957.ClearRoadCacheUseCase>(),
        gh<_i992.ClearAllLocationCacheUseCase>(),
      ),
    );
    gh.lazySingleton<_i797.AuthBloc>(
      () => _i797.AuthBloc(
        gh<_i29.RequestOtpUseCase>(),
        gh<_i503.VerifyOtpUseCase>(),
        gh<_i257.GetCurrentAdminUseCase>(),
        gh<_i388.StoreTokensUseCase>(),
        gh<_i625.GetTokensUseCase>(),
        gh<_i871.ClearAuthCacheUseCase>(),
        gh<_i334.TokenExpiryMonitor>(),
      ),
    );
    gh.factory<_i811.WorkScopesRepository>(
      () => _i477.WorkScopesRepositoryImpl(
        gh<_i788.WorkScopeRemoteDataSource>(),
        gh<_i591.WorkScopeLocalDataSource>(),
        gh<_i426.CompanyBloc>(),
      ),
    );
    gh.factory<_i733.GetWorkScopesUseCase>(
      () => _i733.GetWorkScopesUseCase(gh<_i811.WorkScopesRepository>()),
    );
    gh.factory<_i248.WorkScopeBloc>(
      () => _i248.WorkScopeBloc(
        gh<_i733.GetWorkScopesUseCase>(),
        gh<_i426.CompanyBloc>(),
      ),
    );
    return this;
  }
}

class _$RegisterModule extends _i464.RegisterModule {}
