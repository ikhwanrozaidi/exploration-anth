import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/role.dart';
import 'permission_model.dart';

part 'role_model.g.dart';

@JsonSerializable()
class RoleModel {
  final int id;
  final String uid;
  final String name;
  final String? description;
  final int companyID;
  final bool isSystemRole;
  final bool isActive;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  @JsonKey(defaultValue: <PermissionModel>[])
  final List<PermissionModel>? permissions;

  const RoleModel({
    required this.id,
    required this.uid,
    required this.name,
    this.description,
    required this.companyID,
    required this.isSystemRole,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.permissions,
  });

  // Helper methods
  bool hasPermission(String permissionCode) {
    return permissions?.any((p) => p.code == permissionCode) ?? false;
  }

  bool hasAnyPermission(List<String> codes) {
    return codes.any((code) => hasPermission(code));
  }

  bool hasAllPermissions(List<String> codes) {
    return codes.every((code) => hasPermission(code));
  }

  List<PermissionModel> getPermissionsByCategory(String category) {
    return permissions?.where((p) => p.category == category).toList() ?? [];
  }

  factory RoleModel.fromJson(Map<String, dynamic> json) =>
      _$RoleModelFromJson(json);

  Map<String, dynamic> toJson() => _$RoleModelToJson(this);

  // Convert to domain entity
  Role toEntity() => Role(
    id: id,
    uid: uid,
    name: name,
    description: description,
    companyID: companyID,
    isSystemRole: isSystemRole,
    isActive: isActive,
    createdAt: createdAt,
    updatedAt: updatedAt,
    deletedAt: deletedAt,
    permissions: permissions?.map((p) => p.toEntity()).toList() ?? [],
  );

  // Create from domain entity
  factory RoleModel.fromEntity(Role entity) => RoleModel(
    id: entity.id,
    uid: entity.uid,
    name: entity.name,
    description: entity.description,
    companyID: entity.companyID,
    isSystemRole: entity.isSystemRole,
    isActive: entity.isActive,
    createdAt: entity.createdAt,
    updatedAt: entity.updatedAt,
    deletedAt: entity.deletedAt,
    permissions: entity.permissions
        .map((p) => PermissionModel.fromEntity(p))
        .toList(),
  );
}
