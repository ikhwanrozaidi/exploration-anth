import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/repositories/base_sync_repository.dart';
import '../../domain/entities/role.dart';
import '../../domain/repositories/permission_repository.dart';
import '../datasources/permission_local_datasource.dart';
import '../datasources/permission_remote_datasource.dart';
import '../models/role_model.dart';

@LazySingleton(as: PermissionRepository)
class PermissionRepositoryImpl extends BaseOfflineSyncRepository<Role, RoleModel>
    implements PermissionRepository {
  final PermissionRemoteDataSource _remoteDataSource;
  final PermissionLocalDataSource _localDataSource;

  PermissionRepositoryImpl(
    this._remoteDataSource,
    this._localDataSource,
  );

  @override
  Future<Either<Failure, Role?>> getRole({
    required String roleUID,
    bool forceRefresh = false,
    Duration? cacheTimeout = const Duration(hours: 1),
  }) async {
    final result = await getOfflineFirst(
      getLocal: () => _localDataSource.getCachedRole(),
      getRemote: () => _remoteDataSource.getRole(roleUID),
      saveLocal: (role, {bool markForSync = false}) => 
          _localDataSource.cacheRole(role),
      toEntity: (model) => model.toEntity(),
      forceRefresh: forceRefresh,
      cacheTimeout: cacheTimeout,
    );

    // Convert Either<Failure, Role> to Either<Failure, Role?>
    return result.fold(
      (failure) => Left(failure),
      (role) => Right(role),
    );
  }

  @override
  Future<Either<Failure, void>> clearCache() async {
    try {
      await _localDataSource.clearCache();
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure('Failed to clear cache: $e'));
    }
  }

  @override
  Future<Either<Failure, bool>> hasPermission(String permissionCode) async {
    try {
      final role = await _localDataSource.getCachedRole();
      final hasPermission = role?.hasPermission(permissionCode) ?? false;
      return Right(hasPermission);
    } catch (e) {
      return Left(CacheFailure('Failed to check permission: $e'));
    }
  }

  @override
  Future<Either<Failure, bool>> hasAnyPermission(List<String> permissionCodes) async {
    try {
      final role = await _localDataSource.getCachedRole();
      final hasPermission = role?.hasAnyPermission(permissionCodes) ?? false;
      return Right(hasPermission);
    } catch (e) {
      return Left(CacheFailure('Failed to check permissions: $e'));
    }
  }

  @override
  Future<Either<Failure, bool>> hasAllPermissions(List<String> permissionCodes) async {
    try {
      final role = await _localDataSource.getCachedRole();
      final hasPermission = role?.hasAllPermissions(permissionCodes) ?? false;
      return Right(hasPermission);
    } catch (e) {
      return Left(CacheFailure('Failed to check permissions: $e'));
    }
  }
}