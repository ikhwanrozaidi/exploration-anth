import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gatepay_app/features/onboarding/presentation/pages/onboarding_pages.dart';
import '../../features/auth/presentation/bloc/login_bloc.dart';
import '../../features/auth/presentation/bloc/login_event.dart';
import '../../features/auth/presentation/bloc/login_state.dart';
import '../../features/auth/presentation/pages/login_page.dart';
import '../pages/root_page.dart';

/// AuthWrapper decides what to show based on authentication state
class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        if (state is LoginInitial) {
          // Check auth status on initial load
          context.read<LoginBloc>().add(const LoginCheckAuthStatus());
          return const _SplashScreen();
        } else if (state is LoginLoading) {
          return const _LoadingScreen();
        } else if (state is LoginAuthenticated || state is LoginSuccess) {
          // User is authenticated, show main app
          return const RootPage();
        } else if (state is LoginUnauthenticated || 
                   state is LoginLoggedOut || 
                   state is LoginFailure) {
          // User is not authenticated, show login
          return const OnboardingPage();
        }

        // Default case
        return const _SplashScreen();
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