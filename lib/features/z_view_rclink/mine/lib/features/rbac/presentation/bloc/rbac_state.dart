import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/permission.dart';
import '../../domain/entities/role.dart';

part 'rbac_state.freezed.dart';

@freezed
class RbacState with _$RbacState {
  const factory RbacState.initial() = RbacInitial;
  
  const factory RbacState.loading() = RbacLoading;
  
  const factory RbacState.loaded({
    required Role role,
    required List<Permission> permissions,
  }) = RbacLoaded;
  
  const factory RbacState.noPermissions() = RbacNoPermissions;
  
  const factory RbacState.error(String message) = RbacError;
}

// Extension for easier permission checking
extension RbacStateX on RbacState {
  bool hasPermission(String permissionCode) {
    return maybeWhen(
      loaded: (role, permissions) => 
        permissions.any((p) => p.code == permissionCode),
      orElse: () => false,
    );
  }

  bool hasAnyPermission(List<String> permissionCodes) {
    return maybeWhen(
      loaded: (role, permissions) => 
        permissionCodes.any((code) => 
          permissions.any((p) => p.code == code)),
      orElse: () => false,
    );
  }

  bool hasAllPermissions(List<String> permissionCodes) {
    return maybeWhen(
      loaded: (role, permissions) => 
        permissionCodes.every((code) => 
          permissions.any((p) => p.code == code)),
      orElse: () => false,
    );
  }

  bool hasModuleAccess(String category) {
    return maybeWhen(
      loaded: (role, permissions) => 
        permissions.any((p) => p.category == category),
      orElse: () => false,
    );
  }

  bool canPerformAnyActionInModule(String category) {
    return maybeWhen(
      loaded: (role, permissions) => 
        permissions.any((p) => 
          p.category == category && (
            p.code.endsWith('_CREATE') || 
            p.code.endsWith('_UPDATE') || 
            p.code.endsWith('_DELETE')
          )),
      orElse: () => false,
    );
  }

  Role? get currentRole {
    return maybeWhen(
      loaded: (role, permissions) => role,
      orElse: () => null,
    );
  }

  List<Permission> get currentPermissions {
    return maybeWhen(
      loaded: (role, permissions) => permissions,
      orElse: () => [],
    );
  }
}