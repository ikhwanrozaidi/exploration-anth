import 'package:go_router/go_router.dart';
import 'package:rclink_app/features/auth/presentation/pages/login_page.dart';
import 'package:rclink_app/shared/widgets/auth_wrapper.dart';

class AppRouteName {
  static const String root = 'root';
  static const String main = 'main';
  static const String login = 'login';
}

class AppRoutePath {
  static const String root = '/';
  static const String main = '/main';
  static const String login = '/login';
}

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
