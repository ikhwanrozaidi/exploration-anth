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
import '../../features/daily_report_creation/data/datasources/daily_report_creation_api_service.dart'
    as _i691;
import '../../features/daily_report_creation/data/datasources/daily_report_creation_local_datasource.dart'
    as _i987;
import '../../features/daily_report_creation/data/datasources/daily_report_creation_remote_datasource.dart'
    as _i521;
import '../../features/daily_report_creation/data/repositories/district_repository_impl.dart'
    as _i896;
import '../../features/daily_report_creation/data/repositories/equipment_repository_impl.dart'
    as _i736;
import '../../features/daily_report_creation/data/repositories/province_repository_impl.dart'
    as _i1026;
import '../../features/daily_report_creation/data/repositories/quantity_repository_impl.dart'
    as _i695;
import '../../features/daily_report_creation/data/repositories/road_repository_impl.dart'
    as _i247;
import '../../features/daily_report_creation/data/repositories/workscopes_repository_impl.dart'
    as _i753;
import '../../features/daily_report_creation/domain/repository/district_repository.dart'
    as _i297;
import '../../features/daily_report_creation/domain/repository/equipment_repository.dart'
    as _i464;
import '../../features/daily_report_creation/domain/repository/province_repository.dart'
    as _i374;
import '../../features/daily_report_creation/domain/repository/quantity_repository.dart'
    as _i925;
import '../../features/daily_report_creation/domain/repository/road_repository.dart'
    as _i515;
import '../../features/daily_report_creation/domain/repository/workscopes_repository.dart'
    as _i836;
import '../../features/daily_report_creation/domain/usecases/clear_all_cache_usecase.dart'
    as _i96;
import '../../features/daily_report_creation/domain/usecases/clear_work_scopes_cache_usecase.dart'
    as _i389;
import '../../features/daily_report_creation/domain/usecases/get_district_usecase.dart'
    as _i762;
import '../../features/daily_report_creation/domain/usecases/get_equipment_usecase.dart'
    as _i547;
import '../../features/daily_report_creation/domain/usecases/get_quantity_usecase.dart'
    as _i580;
import '../../features/daily_report_creation/domain/usecases/get_road_usecase.dart'
    as _i383;
import '../../features/daily_report_creation/domain/usecases/get_states_usecase.dart'
    as _i681;
import '../../features/daily_report_creation/domain/usecases/get_work_scopes_usecase.dart'
    as _i169;
import '../../features/daily_report_creation/presentation/bloc/report_creation_bloc.dart'
    as _i1029;
import '../../features/locale/presentation/bloc/locale_bloc.dart' as _i458;
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
import '../database/app_database.dart' as _i982;
import '../network/auth_interceptor.dart' as _i908;
import '../network/connectivity_service.dart' as _i491;
import '../network/error_interceptor.dart' as _i1004;
import '../network/network_info.dart' as _i932;
import '../services/sync_service.dart' as _i979;
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
    gh.lazySingleton<_i987.DailyReportCreationLocalDatasource>(
      () => _i987.DailyReportCreationLocalDatasourceImpl(
        gh<_i982.DatabaseService>(),
      ),
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
    gh.factory<_i1020.RoleApiService>(
      () => _i1020.RoleApiService.new(gh<_i361.Dio>()),
    );
    gh.factory<_i156.AuthApiService>(
      () => _i156.AuthApiService.new(gh<_i361.Dio>()),
    );
    gh.factory<_i472.AdminApiService>(
      () => _i472.AdminApiService.new(gh<_i361.Dio>()),
    );
    gh.factory<_i691.DailyReportCreationApiService>(
      () => _i691.DailyReportCreationApiService.new(gh<_i361.Dio>()),
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
    gh.factory<_i383.GetRoadsParams>(
      () => _i383.GetRoadsParams(
        forceRefresh: gh<bool>(),
        districtID: gh<int>(),
        page: gh<int>(),
        limit: gh<int>(),
        sortOrder: gh<String>(),
        sortBy: gh<String>(),
        mainCategoryID: gh<int>(),
        secondaryCategoryID: gh<int>(),
        search: gh<String>(),
        sectionStartMin: gh<double>(),
        sectionFinishMax: gh<double>(),
      ),
    );
    gh.lazySingleton<_i517.AdminRemoteDataSource>(
      () => _i517.AdminRemoteDataSourceImpl(gh<_i472.AdminApiService>()),
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
    gh.factory<_i762.GetDistrictsParams>(
      () => _i762.GetDistrictsParams(
        forceRefresh: gh<bool>(),
        stateID: gh<int>(),
        page: gh<int>(),
        limit: gh<int>(),
        sortOrder: gh<String>(),
        sortBy: gh<String>(),
        search: gh<String>(),
      ),
    );
    gh.lazySingleton<_i979.SyncService>(
      () => _i979.SyncService(
        gh<_i982.DatabaseService>(),
        gh<_i517.AdminRemoteDataSource>(),
      ),
    );
    gh.factory<_i547.GetEquipmentParams>(
      () => _i547.GetEquipmentParams(
        forceRefresh: gh<bool>(),
        companyUID: gh<String>(),
        workScopeUID: gh<String>(),
      ),
    );
    gh.factory<_i580.GetQuantityParams>(
      () => _i580.GetQuantityParams(
        forceRefresh: gh<bool>(),
        companyUID: gh<String>(),
        workScopeUID: gh<String>(),
      ),
    );
    gh.lazySingleton<_i107.AuthRemoteDataSource>(
      () => _i107.AuthRemoteDataSourceImpl(gh<_i156.AuthApiService>()),
    );
    gh.factory<_i681.GetStatesParams>(
      () => _i681.GetStatesParams(
        forceRefresh: gh<bool>(),
        page: gh<int>(),
        limit: gh<int>(),
        sortOrder: gh<String>(),
        sortBy: gh<String>(),
        countryID: gh<int>(),
        search: gh<String>(),
      ),
    );
    gh.lazySingleton<_i908.AuthInterceptor>(
      () => _i908.AuthInterceptor(gh<_i852.AuthLocalDataSource>()),
    );
    gh.lazySingleton<_i491.NetworkInfo>(
      () => _i491.EnhancedNetworkInfo(gh<_i491.ConnectivityService>()),
    );
    gh.factory<_i169.GetWorkScopesParams>(
      () => _i169.GetWorkScopesParams(
        forceRefresh: gh<bool>(),
        cacheTimeout: gh<Duration>(),
      ),
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
    gh.lazySingleton<_i521.DailyReportCreationRemoteDataSource>(
      () => _i521.DailyReportCreationRemoteDataSourceImpl(
        gh<_i691.DailyReportCreationApiService>(),
      ),
    );
    gh.lazySingleton<_i8.UpdateCompanyFieldUseCase>(
      () => _i8.UpdateCompanyFieldUseCase(gh<_i752.CompanyRepository>()),
    );
    gh.factory<_i374.ProvinceRepository>(
      () => _i1026.ProvinceRepositoryImpl(
        gh<_i521.DailyReportCreationRemoteDataSource>(),
        gh<_i987.DailyReportCreationLocalDatasource>(),
      ),
    );
    gh.factory<_i681.GetStatesUseCase>(
      () => _i681.GetStatesUseCase(gh<_i374.ProvinceRepository>()),
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
    gh.factory<_i515.RoadRepository>(
      () => _i247.RoadRepositoryImpl(
        gh<_i521.DailyReportCreationRemoteDataSource>(),
        gh<_i987.DailyReportCreationLocalDatasource>(),
      ),
    );
    gh.factory<_i383.GetRoadsUseCase>(
      () => _i383.GetRoadsUseCase(gh<_i515.RoadRepository>()),
    );
    gh.factory<_i297.DistrictRepository>(
      () => _i896.DistrictRepositoryImpl(
        gh<_i521.DailyReportCreationRemoteDataSource>(),
        gh<_i987.DailyReportCreationLocalDatasource>(),
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
    gh.factory<_i925.QuantityRepository>(
      () => _i695.QuantityRepositoryImpl(
        gh<_i521.DailyReportCreationRemoteDataSource>(),
        gh<_i987.DailyReportCreationLocalDatasource>(),
        gh<_i426.CompanyBloc>(),
      ),
    );
    gh.lazySingleton<_i157.RefreshTokenUseCase>(
      () => _i157.RefreshTokenUseCase(gh<_i787.AuthRepository>()),
    );
    gh.factory<_i762.GetDistrictsUseCase>(
      () => _i762.GetDistrictsUseCase(gh<_i297.DistrictRepository>()),
    );
    gh.lazySingleton<_i797.AuthBloc>(
      () => _i797.AuthBloc(
        gh<_i29.RequestOtpUseCase>(),
        gh<_i503.VerifyOtpUseCase>(),
        gh<_i257.GetCurrentAdminUseCase>(),
        gh<_i388.StoreTokensUseCase>(),
        gh<_i625.GetTokensUseCase>(),
        gh<_i871.ClearAuthCacheUseCase>(),
      ),
    );
    gh.factory<_i836.WorkScopesRepository>(
      () => _i753.WorkScopesRepositoryImpl(
        gh<_i521.DailyReportCreationRemoteDataSource>(),
        gh<_i987.DailyReportCreationLocalDatasource>(),
        gh<_i426.CompanyBloc>(),
      ),
    );
    gh.factory<_i464.EquipmentRepository>(
      () => _i736.EquipmentRepositoryImpl(
        gh<_i521.DailyReportCreationRemoteDataSource>(),
        gh<_i987.DailyReportCreationLocalDatasource>(),
        gh<_i426.CompanyBloc>(),
      ),
    );
    gh.factory<_i96.ClearAllCacheUseCase>(
      () => _i96.ClearAllCacheUseCase(
        gh<_i836.WorkScopesRepository>(),
        gh<_i374.ProvinceRepository>(),
        gh<_i297.DistrictRepository>(),
        gh<_i515.RoadRepository>(),
        gh<_i925.QuantityRepository>(),
        gh<_i464.EquipmentRepository>(),
      ),
    );
    gh.factory<_i580.GetQuantityUseCase>(
      () => _i580.GetQuantityUseCase(gh<_i925.QuantityRepository>()),
    );
    gh.factory<_i547.GetEquipmentUseCase>(
      () => _i547.GetEquipmentUseCase(gh<_i464.EquipmentRepository>()),
    );
    gh.factory<_i169.GetWorkScopesUseCase>(
      () => _i169.GetWorkScopesUseCase(gh<_i836.WorkScopesRepository>()),
    );
    gh.factory<_i389.ClearWorkScopesCacheUseCase>(
      () => _i389.ClearWorkScopesCacheUseCase(gh<_i836.WorkScopesRepository>()),
    );
    gh.lazySingleton<_i1029.ReportCreationBloc>(
      () => _i1029.ReportCreationBloc(
        gh<_i169.GetWorkScopesUseCase>(),
        gh<_i389.ClearWorkScopesCacheUseCase>(),
        gh<_i681.GetStatesUseCase>(),
        gh<_i762.GetDistrictsUseCase>(),
        gh<_i383.GetRoadsUseCase>(),
        gh<_i580.GetQuantityUseCase>(),
        gh<_i547.GetEquipmentUseCase>(),
        gh<_i96.ClearAllCacheUseCase>(),
      ),
    );
    return this;
  }
}

class _$RegisterModule extends _i464.RegisterModule {}
