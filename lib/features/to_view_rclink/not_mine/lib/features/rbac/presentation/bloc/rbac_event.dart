import 'package:freezed_annotation/freezed_annotation.dart';

part 'rbac_event.freezed.dart';

@freezed
class RbacEvent with _$RbacEvent {
  const factory RbacEvent.loadPermissions(String roleUID) = LoadPermissions;
  const factory RbacEvent.clearPermissions() = ClearPermissions;
  const factory RbacEvent.checkPermission(String permissionCode) = CheckPermission;
  const factory RbacEvent.checkAnyPermission(List<String> permissionCodes) = CheckAnyPermission;
  const factory RbacEvent.checkAllPermissions(List<String> permissionCodes) = CheckAllPermissions;
  const factory RbacEvent.checkModuleAccess(String category) = CheckModuleAccess;
}