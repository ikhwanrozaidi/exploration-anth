import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/constants/permission_codes.dart';
import '../bloc/rbac_bloc.dart';
import '../bloc/rbac_state.dart';
import 'access_denied_widget.dart';

class ModuleGate extends StatelessWidget {
  final Widget child;
  final String category; // From PermissionCategories
  final bool requireAnyAction; // If true, require at least one action permission
  final Widget? fallback;
  final String? accessDeniedMessage;
  final bool showAccessDenied;

  const ModuleGate({
    super.key,
    required this.child,
    required this.category,
    this.requireAnyAction = false,
    this.fallback,
    this.accessDeniedMessage,
    this.showAccessDenied = false,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RbacBloc, RbacState>(
      builder: (context, state) {
        // Check if user has access to the module
        final hasModuleAccess = state.hasModuleAccess(category);
        
        // If requiring action permissions, check if user can perform any action
        final hasActionAccess = !requireAnyAction || 
            state.canPerformAnyActionInModule(category);
        
        final hasAccess = hasModuleAccess && hasActionAccess;

        if (hasAccess) {
          return child;
        }

        // If no access, show fallback or nothing
        if (showAccessDenied) {
          return AccessDeniedWidget(
            message: accessDeniedMessage ?? 
              'You do not have permission to access the $category module',
            subtitle: 'Please contact your administrator for access',
          );
        }

        if (fallback != null) {
          return fallback!;
        }

        return const SizedBox.shrink();
      },
    );
  }

  // Factory constructors for common modules
  factory ModuleGate.company({
    required Widget child,
    bool requireAnyAction = false,
    Widget? fallback,
    bool showAccessDenied = false,
  }) {
    return ModuleGate(
      category: PermissionCategories.COMPANY,
      requireAnyAction: requireAnyAction,
      fallback: fallback,
      showAccessDenied: showAccessDenied,
      child: child,
    );
  }

  factory ModuleGate.user({
    required Widget child,
    bool requireAnyAction = false,
    Widget? fallback,
    bool showAccessDenied = false,
  }) {
    return ModuleGate(
      category: PermissionCategories.USER,
      requireAnyAction: requireAnyAction,
      fallback: fallback,
      showAccessDenied: showAccessDenied,
      child: child,
    );
  }

  factory ModuleGate.role({
    required Widget child,
    bool requireAnyAction = false,
    Widget? fallback,
    bool showAccessDenied = false,
  }) {
    return ModuleGate(
      category: PermissionCategories.ROLE,
      requireAnyAction: requireAnyAction,
      fallback: fallback,
      showAccessDenied: showAccessDenied,
      child: child,
    );
  }

  factory ModuleGate.program({
    required Widget child,
    bool requireAnyAction = false,
    Widget? fallback,
    bool showAccessDenied = false,
  }) {
    return ModuleGate(
      category: PermissionCategories.PROGRAM,
      requireAnyAction: requireAnyAction,
      fallback: fallback,
      showAccessDenied: showAccessDenied,
      child: child,
    );
  }

  factory ModuleGate.dailyReport({
    required Widget child,
    bool requireAnyAction = false,
    Widget? fallback,
    bool showAccessDenied = false,
  }) {
    return ModuleGate(
      category: PermissionCategories.DAILY_REPORT,
      requireAnyAction: requireAnyAction,
      fallback: fallback,
      showAccessDenied: showAccessDenied,
      child: child,
    );
  }

  factory ModuleGate.inspection({
    required Widget child,
    bool requireAnyAction = false,
    Widget? fallback,
    bool showAccessDenied = false,
  }) {
    return ModuleGate(
      category: PermissionCategories.INSPECTION,
      requireAnyAction: requireAnyAction,
      fallback: fallback,
      showAccessDenied: showAccessDenied,
      child: child,
    );
  }
}

// Extension for easier module-based permission checks
extension ModulePermissionExtension on Widget {
  Widget withModuleAccess(
    String category, {
    bool requireAnyAction = false,
    Widget? fallback,
  }) {
    return ModuleGate(
      category: category,
      requireAnyAction: requireAnyAction,
      fallback: fallback,
      child: this,
    );
  }

  Widget withCompanyAccess({bool requireAnyAction = false}) {
    return ModuleGate.company(
      requireAnyAction: requireAnyAction,
      child: this,
    );
  }

  Widget withUserAccess({bool requireAnyAction = false}) {
    return ModuleGate.user(
      requireAnyAction: requireAnyAction,
      child: this,
    );
  }

  Widget withRoleAccess({bool requireAnyAction = false}) {
    return ModuleGate.role(
      requireAnyAction: requireAnyAction,
      child: this,
    );
  }

  Widget withProgramAccess({bool requireAnyAction = false}) {
    return ModuleGate.program(
      requireAnyAction: requireAnyAction,
      child: this,
    );
  }

  Widget withDailyReportAccess({bool requireAnyAction = false}) {
    return ModuleGate.dailyReport(
      requireAnyAction: requireAnyAction,
      child: this,
    );
  }

  Widget withInspectionAccess({bool requireAnyAction = false}) {
    return ModuleGate.inspection(
      requireAnyAction: requireAnyAction,
      child: this,
    );
  }
}