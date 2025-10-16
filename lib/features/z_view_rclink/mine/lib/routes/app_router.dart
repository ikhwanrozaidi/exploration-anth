import 'package:go_router/go_router.dart';
import 'package:rclink_app/features/auth/presentation/pages/login_page.dart';
import 'package:rclink_app/shared/widgets/auth_wrapper.dart';

import '../features/daily_report_view/presentation/pages/daily_report_view.dart';

class AppRouteName {
  static const String root = 'root';
  static const String main = 'main';
  static const String login = 'login';
  static const String dailyReport = 'dailyReport';
}

class AppRoutePath {
  static const String root = '/';
  static const String main = '/main';
  static const String login = '/login';
  static const String dailyReport = '/daily-report';
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
    GoRoute(
      path: AppRoutePath.dailyReport,
      name: AppRouteName.dailyReport,
      builder: (context, state) => const DailyReportView(),
    ),
  ],
);
