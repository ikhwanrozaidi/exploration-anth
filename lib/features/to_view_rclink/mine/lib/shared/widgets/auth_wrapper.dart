import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rclink_app/features/auth/presentation/bloc/auth_event.dart';
import 'package:rclink_app/features/auth/presentation/pages/login_page.dart';
import '../../features/auth/presentation/bloc/auth_bloc.dart';
import '../../features/auth/presentation/bloc/auth_state.dart';
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
            return _loginPage;
          },
          otpSent: (_) {
            return _loginPage;
          },
          authenticatedNeedsCompany: (_, _) {
            return _loginPage;
          },
          authenticated: (_, _, _) => const RootPage(),
          unauthenticated: () => _loginPage,
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

