import 'package:go_router/go_router.dart';
import 'package:rclink_app/features/auth/presentation/pages/login_page.dart';
import 'package:rclink_app/shared/widgets/auth_wrapper.dart';

import '../features/program/presentation/pages/program_details_page.dart';
import '../features/program/presentation/pages/view_report_program_page.dart';
import '../features/warnings/presentation/pages/warning_details_page.dart';

class AppRouteName {
  static const String root = 'root';
  static const String main = 'main';
  static const String login = 'login';

  static const String programDetail = 'programDetail';
  static const String warningDetail = 'warningDetail';
  static const String viewReportProgram = 'viewReportProgram';
}

class AppRoutePath {
  static const String root = '/';
  static const String main = '/main';
  static const String login = '/login';

  static const String programDetail = '/program/:programId';
  static const String warningDetail = '/warning/:warningId';
  static const String viewReportProgram = '/program/:programId/report';
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
      path: AppRoutePath.programDetail,
      name: AppRouteName.programDetail,
      builder: (context, state) {
        final programId = state.pathParameters['programId']!;
        final from = state.uri.queryParameters['from'];
        return ProgramDetailsPage(programId: programId, from: from);
      },
    ),
    GoRoute(
      path: AppRoutePath.warningDetail,
      name: AppRouteName.warningDetail,
      builder: (context, state) {
        final warningId = state.pathParameters['warningId']!;
        final from = state.uri.queryParameters['from'];
        final relatedProgramId = state.uri.queryParameters['programId'];
        final relatedProgramName = state.uri.queryParameters['programName'];
        return WarningDetailsPage(
          warningId: warningId,
          from: from,
          relatedProgramId: relatedProgramId,
          relatedProgramName: relatedProgramName,
        );
      },
    ),
    GoRoute(
      path: AppRoutePath.viewReportProgram,
      name: AppRouteName.viewReportProgram,
      builder: (context, state) {
        final programId = state.pathParameters['programId']!;
        return const ViewReportProgramPage();
      },
    ),
  ],
);
