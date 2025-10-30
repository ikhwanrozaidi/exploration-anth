import 'package:go_router/go_router.dart';
import 'package:rclink_app/features/auth/presentation/pages/login_page.dart';
import 'package:rclink_app/shared/widgets/auth_wrapper.dart';
import 'package:rclink_app/shared/pages/root_page.dart';
import '../features/program/presentation/pages/program_details_page.dart';
import '../features/warnings/presentation/pages/warning_details_page.dart';

class AppRouteName {
  static const String root = 'root';
  static const String login = 'login';
  static const String programDetail = 'programDetail';
  static const String warningDetail = 'warningDetail';
}

class AppRoutePath {
  static const String root = '/';
  static const String login = '/login';
  static const String programDetail = '/program/:programId';
  static const String warningDetail = '/warning/:warningId';
}

final GoRouter appRouter = GoRouter(
  initialLocation: AppRoutePath.root,
  routes: [
    // Root route - this shows AuthWrapper which decides between Login or RootPage
    GoRoute(
      path: AppRoutePath.root,
      name: AppRouteName.root,
      builder: (context, state) {
        // Get tab query parameter for RootPage
        final tab = state.uri.queryParameters['tab'];
        // Pass tab to AuthWrapper so it can pass it to RootPage when authenticated
        return AuthWrapper(initialTab: tab);
      },
    ),

    GoRoute(
      path: AppRoutePath.login,
      name: AppRouteName.login,
      builder: (context, state) => const LoginPage(),
    ),

    // Program Detail Page
    GoRoute(
      path: '/program/:programId',
      name: AppRouteName.programDetail,
      builder: (context, state) {
        final programId = state.pathParameters['programId']!;
        final from = state.uri.queryParameters['from'];
        return ProgramDetailsPage(programId: programId, from: from);
      },
    ),

    // Warning Detail Page
    GoRoute(
      path: '/warning/:warningId',
      name: AppRouteName.warningDetail,
      builder: (context, state) {
        final warningId = state.pathParameters['warningId']!;
        final from = state.uri.queryParameters['from'];
        final programId = state.uri.queryParameters['programId'];
        final programName = state.uri.queryParameters['programName'];

        return WarningDetailsPage(
          warningId: warningId,
          from: from,
          relatedProgramId: programId,
          relatedProgramName: programName,
        );
      },
    ),
  ],
);
