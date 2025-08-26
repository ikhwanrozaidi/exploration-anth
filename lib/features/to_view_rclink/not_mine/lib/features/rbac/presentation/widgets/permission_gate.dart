import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/rbac_bloc.dart';
import '../bloc/rbac_state.dart';
import 'access_denied_widget.dart';

enum PermissionBehavior {
  hide, // Don't show the widget at all
  disable, // Show but disable interaction
  showAccessDenied, // Show access denied message
  custom, // Use custom fallback widget
}

class PermissionGate extends StatelessWidget {
  final Widget child;
  final String? permission;
  final List<String>? permissions;
  final bool requireAll; // If true, require all permissions. If false, require any
  final PermissionBehavior behavior;
  final Widget? fallback; // Custom widget to show when permission denied
  final String? accessDeniedMessage;
  final VoidCallback? onAccessDenied; // Callback when access is denied

  const PermissionGate({
    super.key,
    required this.child,
    this.permission,
    this.permissions,
    this.requireAll = true,
    this.behavior = PermissionBehavior.hide,
    this.fallback,
    this.accessDeniedMessage,
    this.onAccessDenied,
  }) : assert(
          permission != null || permissions != null,
          'Either permission or permissions must be provided',
        );

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RbacBloc, RbacState>(
      builder: (context, state) {
        // Check permissions
        final hasAccess = _checkPermissions(state);

        if (hasAccess) {
          return child;
        }

        // Handle access denied based on behavior
        switch (behavior) {
          case PermissionBehavior.hide:
            return const SizedBox.shrink();
            
          case PermissionBehavior.disable:
            return AbsorbPointer(
              absorbing: true,
              child: Opacity(
                opacity: 0.5,
                child: child,
              ),
            );
            
          case PermissionBehavior.showAccessDenied:
            if (onAccessDenied != null) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                onAccessDenied!();
              });
            }
            return AccessDeniedWidget(
              message: accessDeniedMessage ?? 
                'You do not have permission to access this feature',
            );
            
          case PermissionBehavior.custom:
            if (fallback != null) {
              return fallback!;
            }
            return const SizedBox.shrink();
        }
      },
    );
  }

  bool _checkPermissions(RbacState state) {
    if (permission != null) {
      return state.hasPermission(permission!);
    }

    if (permissions != null && permissions!.isNotEmpty) {
      if (requireAll) {
        return state.hasAllPermissions(permissions!);
      } else {
        return state.hasAnyPermission(permissions!);
      }
    }

    return false;
  }
}

// Extension to make permission checks easier on widgets
extension PermissionExtension on Widget {
  Widget withPermission(
    String permission, {
    PermissionBehavior behavior = PermissionBehavior.hide,
    Widget? fallback,
  }) {
    return PermissionGate(
      permission: permission,
      behavior: behavior,
      fallback: fallback,
      child: this,
    );
  }

  Widget withAnyPermission(
    List<String> permissions, {
    PermissionBehavior behavior = PermissionBehavior.hide,
    Widget? fallback,
  }) {
    return PermissionGate(
      permissions: permissions,
      requireAll: false,
      behavior: behavior,
      fallback: fallback,
      child: this,
    );
  }

  Widget withAllPermissions(
    List<String> permissions, {
    PermissionBehavior behavior = PermissionBehavior.hide,
    Widget? fallback,
  }) {
    return PermissionGate(
      permissions: permissions,
      requireAll: true,
      behavior: behavior,
      fallback: fallback,
      child: this,
    );
  }
}