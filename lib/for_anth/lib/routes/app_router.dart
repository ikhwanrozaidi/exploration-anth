import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../core/constants/route_constants.dart';
import '../features/onboarding/presentation/pages/onboarding_pages.dart';
import '../shared/pages/root_page.dart';
import '../shared/widgets/auth_wrapper.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: AppRoutePath.root,
  routes: [
    GoRoute(
      path: AppRoutePath.root,
      name: AppRouteName.root,
      builder: (context, state) => const AuthWrapper(),
    ),

    GoRoute(
      path: AppRoutePath.onboarding,
      name: AppRouteName.onboarding,
      builder: (context, state) => const OnboardingPage(),
    ),

    // GoRoute(
    //   path: AppRoutePath.login,
    //   name: AppRouteName.login,
    //   builder: (context, state) => const LoginPage(),
    // ),

    // GoRoute(
    //   path: AppRoutePath.register,
    //   name: AppRouteName.register,
    //   builder: (context, state) => SignUpPage(),
    // ),

    GoRoute(
      path: '/main',
      name: 'main',
      builder: (context, state) => const RootPage(),
    ),

    
    // GoRoute(
    //   path: AppRoutePath.register,
    //   name: AppRouteName.register,
    //   builder: (context, state) => const Scaffold(
    //     body: Center(
    //       child: Text('Sign Up Page - Coming Soon'),
    //     ),
    //   ),
    // ),
  ],
);