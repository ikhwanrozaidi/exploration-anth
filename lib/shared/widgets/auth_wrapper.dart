// lib/shared/widgets/auth_wrapper.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/dashboard/presentation/pages/dashboard_page.dart';
import '../../features/login/presentation/bloc/login_bloc.dart';
import '../../features/login/presentation/bloc/login_event.dart';
import '../../features/login/presentation/bloc/login_state.dart';
import '../../features/login/presentation/pages/login_page.dart';
import '../../features/onboarding/presentation/pages/onboarding_pages.dart';
import '../pages/root_page.dart';

/// AuthWrapper decides what to show based on authentication state
class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return state.when(
          initial: () {
            // Check auth status on initial load
            context.read<LoginBloc>().add(const LoginCheckAuthStatus());
            return const _SplashScreen();
          },
          credentialsLoaded: (email, password) {
            // Handle credentials loaded - usually just show login page
            return const LoginPage(); // or whatever you want to show
          },
          loading: () => const _LoadingScreen(),
          otpRequired: (email, message) => const LoginPage(),
          authenticated: (authResult, admin) => const RootPage(),
          success: (admin) => const RootPage(),
          unauthenticated: () => const DashboardPage(),
          loggedOut: () => const OnboardingPage(),
          failure: (message) => const OnboardingPage(),
          forgotPasswordOtpRequired: (email, message) => const LoginPage(),
          changePasswordRequired: (email, message) => const LoginPage(),
          passwordChanged: (message) => const LoginPage(),
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

/// Loading screen during authentication
class _LoadingScreen extends StatelessWidget {
  const _LoadingScreen();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 16),
            Text('Authenticating...'),
          ],
        ),
      ),
    );
  }
}
