import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/role.dart';
import 'permission_model.dart';

part 'role_model.freezed.dart';
part 'role_model.g.dart';

@freezed
abstract class RoleModel with _$RoleModel {
  const RoleModel._();

  const factory RoleModel({
    required int id,
    required String uid,
    required String name,
    required String description,
    required int companyID,
    required bool isSystemRole,
    required bool isActive,
    required DateTime createdAt,
    required DateTime updatedAt,
    DateTime? deletedAt,
    required List<PermissionModel> permissions,
  }) = _RoleModel;

  factory RoleModel.fromJson(Map<String, dynamic> json) =>
      _$RoleModelFromJson(json);

  // Convert model to entity
  Role toEntity() {
    return Role(
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
      permissions: permissions.map((p) => p.toEntity()).toList(),
    );
  }

  // Create model from entity
  factory RoleModel.fromEntity(Role entity) {
    return RoleModel(
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
}
