import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/role.dart';

abstract class PermissionRepository {
  // Fetch role with permissions (offline-first pattern)
  Future<Either<Failure, Role?>> getRole({
    required String roleUID,
    bool forceRefresh = false,
    Duration? cacheTimeout = const Duration(hours: 1),
  });

  // Clear cached role and permissions
  Future<Either<Failure, void>> clearCache();

  // Check if user has specific permission (from cached role)
  Future<Either<Failure, bool>> hasPermission(String permissionCode);

  // Check if user has any of the specified permissions (from cached role)
  Future<Either<Failure, bool>> hasAnyPermission(List<String> permissionCodes);

  // Check if user has all specified permissions (from cached role)
  Future<Either<Failure, bool>> hasAllPermissions(List<String> permissionCodes);
}
