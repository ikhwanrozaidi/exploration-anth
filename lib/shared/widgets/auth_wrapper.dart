import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/login/presentation/bloc/login_bloc.dart';
import '../../features/login/presentation/bloc/login_event.dart';
import '../../features/login/presentation/bloc/login_state.dart';
import '../../features/onboarding/presentation/pages/onboarding_pages.dart';
import '../pages/root_page.dart';

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
            // Show loading while credentials are being processed
            return const _LoadingScreen();
          },
          loading: () => const _LoadingScreen(),
          otpRequired: (email, message) {
            // Stay on current page - OTP dialog will show
            return const _LoadingScreen();
          },
          authenticated: (authResult, admin) => const RootPage(),
          success: (admin) => const RootPage(),
          unauthenticated: () =>
              const OnboardingPage(), // ✅ FIXED: Show onboarding, not RootPage
          loggedOut: () =>
              const OnboardingPage(), // ✅ User logged out - show onboarding
          failure: (message) => const OnboardingPage(),
          forgotPasswordOtpRequired: (email, message) {
            // Stay on current page - forgot password flow
            return const _LoadingScreen();
          },
          changePasswordRequired: (email, message) {
            // Stay on current page - change password flow
            return const _LoadingScreen();
          },
          passwordChanged: (message) => const OnboardingPage(),
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
