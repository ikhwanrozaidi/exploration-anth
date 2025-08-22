import 'package:go_router/go_router.dart';
import 'package:rclink_app/core/constants/route_constants.dart';
import 'package:rclink_app/features/auth/presentation/pages/login_page.dart';
import 'package:rclink_app/shared/widgets/auth_wrapper.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: AppRoutePath.root,
  routes: [
    GoRoute(
      path: AppRoutePath.root,
      name: AppRouteName.root,
      builder: (context, state) => const AuthWrapper(),
    ),
    GoRoute(
      path: AppRoutePath.login,
      name: AppRouteName.login,
      builder: (context, state) => const LoginPage(),
    ),
  ],
);
