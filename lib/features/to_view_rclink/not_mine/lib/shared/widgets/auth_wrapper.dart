import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rclink_app/features/auth/presentation/bloc/auth_event.dart';
import 'package:rclink_app/features/auth/presentation/pages/login_page.dart';
import '../../features/auth/presentation/bloc/auth_bloc.dart';
import '../../features/auth/presentation/bloc/auth_state.dart';
import '../../features/company/presentation/bloc/company_bloc.dart';
import '../../features/company/presentation/bloc/company_event.dart';
import '../../features/company/presentation/bloc/company_state.dart';
import '../../features/rbac/presentation/bloc/rbac_bloc.dart';
import '../../features/rbac/presentation/bloc/rbac_state.dart';
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
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, authState) {
        return authState.when(
          initial: () {
            // Trigger auth check on initial state
            context.read<AuthBloc>().add(CheckAuthStatus());
            return const _SplashScreen();
          },
          loading: () => _loginPage,
          otpSent: (_) => _loginPage,
          authenticated: (tokens, currentAdmin) => _buildAuthenticatedView(),
          unauthenticated: () => _loginPage,
          failure: (_) => _loginPage,
        );
      },
    );
  }

  /// Builds the view when user is authenticated
  /// Checks CompanyBloc and RbacBloc states to determine what to show
  Widget _buildAuthenticatedView() {
    return BlocBuilder<CompanyBloc, CompanyState>(
      builder: (context, companyState) {
        // Load companies if not loaded yet
        if (companyState is CompanyInitial) {
          context.read<CompanyBloc>().add(const LoadCompanies());
        }

        return companyState.when(
          initial: () => _loginPage,
          loading: () => _loginPage,
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
          failure: (_) => _loginPage,
        );
      },
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
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 16),
            Text('Loading permissions...'),
          ],
        ),
      ),
    );
  }
}
