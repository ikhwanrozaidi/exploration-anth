import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:rclink_app/features/rbac/data/models/permission_model.dart';
import 'package:rclink_app/features/rbac/data/models/role_model.dart';

import '../../../../core/database/app_database.dart';

abstract class PermissionLocalDataSource {
  Future<RoleModel?> getCachedRole();
  Future<void> cacheRole(RoleModel role);
  Future<void> clearCache();
}

@LazySingleton(as: PermissionLocalDataSource)
class PermissionLocalDataSourceImpl implements PermissionLocalDataSource {
  final DatabaseService _databaseService;

  PermissionLocalDataSourceImpl(this._databaseService);

  AppDatabase get _database => _databaseService.database;

  @override
  Future<RoleModel?> getCachedRole() async {
    // Get the cached role (should only be one)
    final roleRecords = await _database.select(_database.roles).get();

    if (roleRecords.isEmpty) {
      return null;
    }

    final roleRecord = roleRecords.first;

    // Get permissions for this role
    final permissionRecords = await (_database.select(
      _database.permissions,
    )..where((p) => p.roleID.equals(roleRecord.id))).get();

    // Convert to domain entities
    final permissions = permissionRecords
        .map(
          (p) => PermissionModel(
            id: p.id,
            uid: p.uid,
            code: p.code,
            name: p.name,
            description: p.description,
            category: p.category,
            scope: p.scope,
          ),
        )
        .toList();

    return RoleModel(
      id: roleRecord.id,
      uid: roleRecord.uid,
      name: roleRecord.name,
      description: roleRecord.description,
      companyID: roleRecord.companyID,
      isSystemRole: roleRecord.isSystemRole,
      isActive: roleRecord.isActive,
      createdAt: roleRecord.createdAt,
      updatedAt: roleRecord.updatedAt,
      deletedAt: roleRecord.deletedAt,
      permissions: permissions,
    );
  }

  @override
  Future<void> cacheRole(RoleModel role) async {
    // Clear existing role and permissions
    await clearCache();

    // Insert new role
    await _database
        .into(_database.roles)
        .insert(
          RolesCompanion(
            uid: Value(role.uid),
            name: Value(role.name),
            description: Value(role.description),
            companyID: Value(role.companyID),
            isSystemRole: Value(role.isSystemRole),
            isActive: Value(role.isActive),
            createdAt: Value(role.createdAt),
            updatedAt: Value(role.updatedAt),
            isSynced: const Value(true),
          ),
        );

    // Get the inserted role ID
    final insertedRole = await (_database.select(
      _database.roles,
    )..where((r) => r.uid.equals(role.uid))).getSingle();

    // Insert permissions
    for (final permission in role.permissions!) {
      await _database
          .into(_database.permissions)
          .insert(
            PermissionsCompanion(
              uid: Value(permission.uid),
              code: Value(permission.code),
              name: Value(permission.name),
              description: Value(permission.description),
              category: Value(permission.category),
              scope: Value(permission.scope),
              roleID: Value(insertedRole.id),
              isSynced: const Value(true),
            ),
          );
    }
  }

  @override
  Future<void> clearCache() async {
    // Delete all permissions first (due to foreign key)
    await _database.delete(_database.permissions).go();
    // Then delete roles
    await _database.delete(_database.roles).go();
  }
}
