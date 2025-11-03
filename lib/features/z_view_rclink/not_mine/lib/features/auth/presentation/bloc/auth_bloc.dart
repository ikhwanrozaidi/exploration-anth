import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:rclink_app/core/errors/failures.dart';

import 'package:rclink_app/features/auth/domain/usecases/request_otp_usecase.dart';
import '../../../../core/di/injection.dart';
import '../../../admin/domain/usecases/get_current_admin_usecase.dart';
import '../../../company/domain/usecases/company_clear_cache_usecase.dart';
import '../../../contractor_relation/domain/usecases/clear_contractor_relation_usecase.dart';
import '../../../rbac/domain/usecases/clear_role_usecase.dart';
import '../../../rbac/presentation/bloc/rbac_bloc.dart';
import '../../../rbac/presentation/bloc/rbac_event.dart';
import '../../../road/domain/usecases/clear_road_cache_usecase.dart';
import '../../../work_scope/domain/usecases/clear_work_scopes_cache_usecase.dart';
import '../../domain/usecases/verify_otp_usecase.dart';
import '../../domain/usecases/store_tokens_usecase.dart';
import '../../domain/usecases/get_tokens_usecase.dart';
import '../../domain/usecases/clear_auth_cache_usecase.dart';
import 'auth_event.dart';
import 'auth_state.dart';

@lazySingleton
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final RequestOtpUseCase _requestOtpUseCase;
  final VerifyOtpUseCase _verifyOtpUseCase;
  final GetCurrentAdminUseCase _getCurrentAdminUseCase;
  final StoreTokensUseCase _storeTokensUseCase;
  final GetTokensUseCase _getTokensUseCase;
  final ClearAuthCacheUseCase _clearAuthCacheUseCase;

  final ClearRoadCacheUseCase _clearRoadCacheUseCase;
  final ClearCompanyCacheUseCase _clearCompanyCacheUseCase;
  final ClearContractorRelationCacheUseCase
  _clearContractorRelationCacheUseCase;
  final ClearRoleUseCase _clearRoleUseCase;
  final ClearWorkScopesCacheUseCase _clearWorkScopesCacheUseCase;

  AuthBloc(
    this._requestOtpUseCase,
    this._verifyOtpUseCase,
    this._getCurrentAdminUseCase,
    this._storeTokensUseCase,
    this._getTokensUseCase,
    this._clearAuthCacheUseCase,

    this._clearRoadCacheUseCase,
    this._clearCompanyCacheUseCase,
    this._clearContractorRelationCacheUseCase,
    this._clearRoleUseCase,
    this._clearWorkScopesCacheUseCase,
  ) : super(const AuthInitial()) {
    on<RequestOtpRequested>(_onRequestOtpRequested);
    on<VerifyOtpRequested>(_onVerifyOtpRequested);
    on<CheckAuthStatus>(_onCheckAuthStatus);
    on<LoadCurrentAdmin>(_onLoadCurrentAdmin);
    on<CompanySelected>(_onCompanySelected);
    on<LogoutRequested>(_onLogoutRequested);
  }

  Future<void> _onRequestOtpRequested(
    RequestOtpRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoading());

    final result = await _requestOtpUseCase(RequestOtpParams(event.phone));
    print('auth_bloc:: $result');

    result.fold(
      (failure) => emit(AuthFailure(_mapFailureToMessage(failure))),
      (otpResponse) => emit(AuthOtpSent(otpResponse)),
    );
  }

  Future<void> _onVerifyOtpRequested(
    VerifyOtpRequested event,
    Emitter<AuthState> emit,
  ) async {
    print(
      '🚀 AuthBloc: VerifyOtpRequested - phone: ${event.phone}, otp: ${event.otp}',
    );

    emit(const AuthLoading());

    final result = await _verifyOtpUseCase(
      VerifyOtpParams(phone: event.phone, otp: event.otp),
    );

    print('auth_bloc verify:: $result');

    await result.fold(
      (failure) async {
        print(
          '❌ AuthBloc: Verify OTP failed: ${_mapFailureToMessage(failure)}',
        );
        emit(AuthFailure(_mapFailureToMessage(failure)));
      },
      (tokens) async {
        print('✅ AuthBloc: Verify OTP success, storing tokens');
        final storeResult = await _storeTokensUseCase(
          StoreTokensParams(tokens: tokens),
        );

        storeResult.fold(
          (failure) {
            print('❌ AuthBloc: Failed to store tokens: ${failure.message}');
            emit(AuthFailure('Failed to save authentication data'));
          },
          (_) async {
            print('✅ AuthBloc: Tokens stored successfully');
            emit(AuthState.authenticated(tokens));

            // Load admin data after successful authentication
            print('📥 AuthBloc: Loading current admin data...');
            final adminResult = await _getCurrentAdminUseCase(
              const GetCurrentAdminParams(forceRefresh: true),
            );

            adminResult.fold(
              (failure) {
                print('⚠️ AuthBloc: Failed to load admin: ${failure.message}');
                // User stays authenticated, just without admin data
              },
              (admin) {
                print('✅ AuthBloc: Admin loaded successfully: ${admin.uid}');
                if (!emit.isDone) {
                  emit(AuthState.authenticated(tokens, currentAdmin: admin));
                }
              },
            );
          },
        );
      },
    );
  }

  Future<void> _onCompanySelected(
    CompanySelected event,
    Emitter<AuthState> emit,
  ) async {
    // This event now only triggers RBAC loading
    // Company selection is handled by CompanyBloc
    if (event.roleUID != null) {
      final rbacBloc = getIt<RbacBloc>();
      rbacBloc.add(LoadPermissions(event.roleUID!));
      // print('📋 Loading permissions for role: ${event.roleUID}');
    }
  }

  Future<void> _onCheckAuthStatus(
    CheckAuthStatus event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoading());

    final tokensResult = await _getTokensUseCase();

    await tokensResult.fold(
      (failure) async {
        print('❌ AuthBloc: Failed to get stored tokens: ${failure.message}');
        emit(const Unauthenticated());
      },
      (tokens) async {
        if (tokens == null) {
          print('📝 AuthBloc: No stored tokens found');
          emit(const Unauthenticated());
        } else {
          final now = DateTime.now();
          if (tokens.accessTokenExpiresAt.isAfter(now)) {
            print(
              '✅ AuthBloc: Valid tokens found, user is fully authenticated',
            );
            // TODO: Check if company is already selected from storage
            emit(AuthState.authenticated(tokens));

            // Load admin data after restoring authentication
            print('📥 AuthBloc: Loading current admin data...');
            final adminResult = await _getCurrentAdminUseCase(
              const GetCurrentAdminParams(),
            );

            adminResult.fold(
              (failure) {
                print('⚠️ AuthBloc: Failed to load admin: ${failure.message}');
                // User stays authenticated, just without admin data
              },
              (admin) {
                print('✅ AuthBloc: Admin loaded successfully: ${admin.uid}');
                if (!emit.isDone) {
                  emit(AuthState.authenticated(tokens, currentAdmin: admin));
                }
              },
            );
          } else if (tokens.refreshTokenExpiresAt.isAfter(now)) {
            print('🔄 AuthBloc: Access token expired but refresh token valid');
            emit(AuthState.authenticated(tokens));

            // Load admin data after restoring authentication
            print('📥 AuthBloc: Loading current admin data...');
            final adminResult = await _getCurrentAdminUseCase(
              const GetCurrentAdminParams(),
            );

            adminResult.fold(
              (failure) {
                print('⚠️ AuthBloc: Failed to load admin: ${failure.message}');
                // User stays authenticated, just without admin data
              },
              (admin) {
                print('✅ AuthBloc: Admin loaded successfully: ${admin.uid}');
                if (!emit.isDone) {
                  emit(AuthState.authenticated(tokens, currentAdmin: admin));
                }
              },
            );
          } else {
            print('❌ AuthBloc: All tokens expired');
            await _clearAuthCacheUseCase();
            emit(const Unauthenticated());
          }
        }
      },
    );
  }

  Future<void> _onLoadCurrentAdmin(
    LoadCurrentAdmin event,
    Emitter<AuthState> emit,
  ) async {
    final currentState = state;
    if (currentState is! Authenticated) {
      return;
    }

    final result = await _getCurrentAdminUseCase(
      GetCurrentAdminParams(
        forceRefresh: event.forceRefresh,
        cacheTimeout: event.cacheTimeout,
      ),
    );

    result.fold((failure) => emit(AuthFailure(_mapFailureToMessage(failure))), (
      admin,
    ) {
      emit(AuthState.authenticated(currentState.tokens, currentAdmin: admin));
    });
  }

  Future<void> _onLogoutRequested(
    LogoutRequested event,
    Emitter<AuthState> emit,
  ) async {
    print('🚪 AuthBloc: Starting logout process...');
    emit(const AuthLoading());

    try {
      final roleResult = await _clearRoleUseCase();
      roleResult.fold(
        (failure) => print('⚠️ RBAC cache clear failed: ${failure.message}'),
        (_) => print('✅ RBAC cache cleared'),
      );

      final companyResult = await _clearCompanyCacheUseCase();
      companyResult.fold(
        (failure) => print('⚠️ Company cache clear failed: ${failure.message}'),
        (_) => print('✅ Company cache cleared'),
      );

      final roadResult = await _clearRoadCacheUseCase();
      roadResult.fold(
        (failure) => print('⚠️ Road cache clear failed: ${failure.message}'),
        (_) => print('✅ Road cache cleared'),
      );

      final contractorResult = await _clearContractorRelationCacheUseCase();
      contractorResult.fold(
        (failure) =>
            print('⚠️ Contractor cache clear failed: ${failure.message}'),
        (_) => print('✅ Contractor cache cleared'),
      );

      final workScopeResult = await _clearWorkScopesCacheUseCase();
      workScopeResult.fold(
        (failure) =>
            print('⚠️ WorkScope cache clear failed: ${failure.message}'),
        (_) => print('✅ WorkScope cache cleared'),
      );

      final authResult = await _clearAuthCacheUseCase();

      authResult.fold(
        (failure) {
          print('❌ AuthBloc: Logout failed: ${failure.message}');
          emit(AuthFailure('Failed to logout'));
        },
        (_) {
          print('✅ AuthBloc: Logout successful - All caches cleared');
          emit(const Unauthenticated());
        },
      );
    } catch (e) {
      print('❌ AuthBloc: Logout error: $e');
      // Still log out even if cache clearing fails

      await _clearAuthCacheUseCase();
      emit(const Unauthenticated());
    }
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ConnectionFailure:
        return 'No internet connection. Please check your network.';
      case TimeoutFailure:
        return 'Request timeout. Please try again.';
      case ValidationFailure:
        return failure.message;
      case NetworkFailure:
      case ServerFailure:
        return failure.message;
      default:
        return failure.message.isEmpty
            ? 'An unexpected error occurred. Please try again.'
            : failure.message;
    }
  }
}
