// lib/routes/app_router.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../core/constants/route_constants.dart';
import '../features/onboarding/presentation/pages/onboarding_pages.dart';
import '../features/login/presentation/pages/login_page.dart';
import '../features/login/presentation/bloc/login_bloc.dart';
import '../features/login/presentation/bloc/login_event.dart';
import '../features/login/presentation/bloc/login_state.dart';
import '../shared/pages/root_page.dart';
import '../shared/widgets/auth_wrapper.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: AppRoutePath.root,
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return AuthWrapper(child: child);
      },
      routes: [
        GoRoute(
          path: AppRoutePath.root,
          name: AppRouteName.root,
          builder: (context, state) {
            return BlocBuilder<LoginBloc, LoginState>(
              builder: (context, loginState) {
                if (loginState is LoginInitial) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    print('🔷 Root Route: Triggering CheckAuthStatus');
                    context.read<LoginBloc>().add(const LoginCheckAuthStatus());
                  });
                }
                return const Scaffold(
                  body: Center(child: CircularProgressIndicator()),
                );
              },
            );
          },
        ),
        GoRoute(
          path: AppRoutePath.onboarding,
          name: AppRouteName.onboarding,
          builder: (context, state) => const OnboardingPage(),
        ),
        GoRoute(
          path: AppRoutePath.login,
          name: AppRouteName.login,
          builder: (context, state) => const LoginPage(),
        ),
        GoRoute(
          path: AppRoutePath.main,
          name: AppRouteName.main,
          builder: (context, state) => const RootPage(),
        ),
        GoRoute(
          path: AppRoutePath.register,
          name: AppRouteName.register,
          builder: (context, state) => const Scaffold(
            body: Center(child: Text('Sign Up Page - Coming Soon')),
          ),
        ),
      ],
    ),
  ],
);
