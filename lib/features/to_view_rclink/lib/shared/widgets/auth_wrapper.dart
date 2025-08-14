import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rclink_app/features/auth/presentation/bloc/auth_event.dart';
import 'package:rclink_app/features/dashboard/presentation/pages/dashboard_page.dart';
import '../../features/auth/presentation/bloc/auth_bloc.dart';
import '../../features/auth/presentation/bloc/auth_state.dart';
import '../../features/auth/presentation/pages/login_page.dart';
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
      builder: (context, state) {
        return state.when(
          initial: () {
            context.read<AuthBloc>().add(CheckAuthStatus());
            return const _SplashScreen();
          },
          loading: () {
            // During auth operations, stay on the same LoginPage instance
            return _loginPage;
          },
          otpSent: (_) {
            // Stay on the same LoginPage instance - it will handle the OTP screen internally
            return _loginPage;
          },
          authenticated: (_, _) => const RootPage(), // Main app with navigation
          unauthenticated: () => _loginPage, // Use the same LoginPage instance
          failure: (_) => _loginPage, // Use the same LoginPage instance
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
