import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:rclink_app/features/auth/presentation/bloc/auth_event.dart';
import 'package:rclink_app/features/auth/presentation/pages/login_page.dart';
import '../../features/auth/presentation/bloc/auth_bloc.dart';
import '../../features/auth/presentation/bloc/auth_state.dart';
import '../../features/company/presentation/bloc/company_bloc.dart';
import '../../features/company/presentation/bloc/company_event.dart';
import '../../features/company/presentation/bloc/company_state.dart';
import '../../features/contractor_relation/presentation/bloc/contractor_relation_bloc.dart';
import '../../features/contractor_relation/presentation/bloc/contractor_relation_event.dart';
import '../../features/contractor_relation/presentation/bloc/contractor_relation_state.dart';
import '../../features/rbac/presentation/bloc/rbac_bloc.dart';
import '../../features/rbac/presentation/bloc/rbac_state.dart';
import '../../features/road/presentation/bloc/road_bloc.dart';
import '../../features/road/presentation/bloc/road_event.dart';
import '../../features/warnings/presentation/bloc/warning_categories/warning_categories_bloc.dart';
import '../../features/warnings/presentation/bloc/warning_categories/warning_categories_event.dart';
import '../../features/work_scope/presentation/bloc/work_scope_bloc.dart';
import '../../features/work_scope/presentation/bloc/work_scope_event.dart';
import '../pages/root_page.dart';

/// AuthWrapper decides what to show based on authentication state
class AuthWrapper extends StatefulWidget {
  const AuthWrapper({super.key});

  @override
  State<AuthWrapper> createState() => _AuthWrapperState();
}

class _AuthWrapperState extends State<AuthWrapper> {
  // Keep a single LoginPage instance to preserve its internal state
  final LoginPage _loginPage = const LoginPage();

  @override
  Widget build(BuildContext context) {
    print('🎨 AuthWrapper: build() called');
    final authBloc = context.read<AuthBloc>();
    print('🎨 AuthWrapper: AuthBloc instance hashCode: ${authBloc.hashCode}');
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        print('🎨 AuthWrapper: Listener received state: $state');
        // Listener ensures widget responds to state changes
        // No side effects - just logging for diagnostics
      },
      buildWhen: (previous, current) {
        print(
          '🎨 AuthWrapper: buildWhen called - previous: $previous, current: $current',
        );
        return true; // Always rebuild (same as default behavior)
      },
      builder: (context, authState) {
        print('🎨 AuthWrapper: Builder received state: $authState');
        return authState.when(
          initial: () {
            print('🎨 AuthWrapper: Handling initial state');
            // Trigger auth check after the widget tree is built
            WidgetsBinding.instance.addPostFrameCallback((_) {
              print(
                '🎨 AuthWrapper: PostFrameCallback executing - triggering CheckAuthStatus',
              );
              context.read<AuthBloc>().add(CheckAuthStatus());
            });
            print('🎨 AuthWrapper: Returning _SplashScreen');
            return const _SplashScreen();
          },
          loading: () {
            print('🎨 AuthWrapper: Handling loading state');
            print('🎨 AuthWrapper: Returning LoginPage');
            return _loginPage;
          },
          otpSent: (_) {
            print('🎨 AuthWrapper: Handling otpSent state');
            print('🎨 AuthWrapper: Returning LoginPage');
            return _loginPage;
          },
          // authenticated: (tokens, currentAdmin) => RootPage(),
          authenticated: (tokens, currentAdmin) {
            print('🎨 AuthWrapper: Handling authenticated state');
            print('🎨 AuthWrapper: Returning _buildAuthenticatedView');
            return _buildAuthenticatedView();
          },
          unauthenticated: () {
            print('🎨 AuthWrapper: Handling unauthenticated state');
            print('🎨 AuthWrapper: Returning LoginPage');
            return _loginPage;
          },
          failure: (_) {
            print('🎨 AuthWrapper: Handling failure state');
            print('🎨 AuthWrapper: Returning LoginPage');
            return _loginPage;
          },
        );
      },
    );
  }

  /// Builds the view when user is authenticated
  /// Checks CompanyBloc and RbacBloc states to determine what to show
  Widget _buildAuthenticatedView() {
    return BlocListener<RbacBloc, RbacState>(
      listener: (context, rbacState) {
        // When RBAC is loaded, load ContractorRelation
        rbacState.whenOrNull(
          loaded: (role, permissions) {
            context.read<ContractorRelationBloc>().add(
              const LoadContractorRelation(),
            );
          },
        );
      },
      child: BlocListener<ContractorRelationBloc, ContractorRelationState>(
        listener: (context, contractorState) {
          // When ContractorRelation is loaded OR failure, load WorkScopes and Roads in parallel
          if (contractorState is ContractorRelationLoaded ||
              contractorState is ContractorRelationFailure) {
            // Load WorkScopes with fresh data
            context.read<WorkScopeBloc>().add(
              const WorkScopeEvent.loadWorkScopes(forceRefresh: true),
            );

            // Load Roads with fresh data
            context.read<RoadBloc>().add(
              const RoadEvent.loadProvinces(forceRefresh: true),
            );

            // Load Warning Categories with fresh data
            context.read<WarningCategoriesBloc>().add(
              const WarningCategoriesEvent.loadCategories(forceRefresh: true),
            );
          }
        },
        child: BlocBuilder<CompanyBloc, CompanyState>(
          builder: (context, companyState) {
            // Load companies if not loaded yet
            if (companyState is CompanyInitial) {
              context.read<CompanyBloc>().add(const LoadCompanies());
            }

            return companyState.when(
              initial: () => _loginPage,
              loading: () => _loginPage,
              updating: () => _loginPage,
              loaded: (companies, selectedCompany) {
                // Check if a company is selected
                if (selectedCompany == null) {
                  return _loginPage;
                }

                // Company is selected, now check RBAC state
                return BlocBuilder<RbacBloc, RbacState>(
                  builder: (context, rbacState) {
                    print('rbacState: $rbacState');
                    return rbacState.when(
                      initial: () => const _PermissionLoadingScreen(),
                      loading: () => const _PermissionLoadingScreen(),
                      loaded: (role, permissions) => const RootPage(),
                      noPermissions: () => const RootPage(),
                      error: (message) => _loginPage, // Could show error dialog
                    );
                  },
                );
              },
              fieldUpdateFailure: (companies, errorMessage, selectedCompany) {
                // Handle field update failure - still allow user to proceed to RootPage
                // since this is just a field update error, not a critical app error
                if (selectedCompany == null) {
                  return _loginPage;
                }

                // Company is still selected, proceed with RBAC check
                return BlocBuilder<RbacBloc, RbacState>(
                  builder: (context, rbacState) {
                    print('rbacState: $rbacState');
                    return rbacState.when(
                      initial: () => const _PermissionLoadingScreen(),
                      loading: () => const _PermissionLoadingScreen(),
                      loaded: (role, permissions) => const RootPage(),
                      noPermissions: () => const RootPage(),
                      error: (message) => _loginPage,
                    );
                  },
                );
              },
              failure: (_) => _loginPage,
            );
          },
        ),
      ),
    );
  }
}

/// Simple splash screen while checking auth state
class _SplashScreen extends StatelessWidget {
  const _SplashScreen();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 16),
            Text('Loading...'),
          ],
        ),
      ),
    );
  }
}

/// Loading screen while permissions are being loaded
class _PermissionLoadingScreen extends StatelessWidget {
  const _PermissionLoadingScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // CircularProgressIndicator(),
            SizedBox(height: 16),
            Lottie.asset(
              'assets/lottie/road_repair_loading.json',
              width: 200,
              height: 200,
              fit: BoxFit.contain,
            ),
          ],
        ),
      ),
    );
  }
}
