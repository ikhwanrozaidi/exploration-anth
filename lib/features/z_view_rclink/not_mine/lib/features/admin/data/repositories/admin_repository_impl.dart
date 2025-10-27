import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:rclink_app/features/admin/data/models/admin_model.dart';
import '../../../../core/database/app_database.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/repositories/base_sync_repository.dart';
import '../../../../core/sync/sync_constants.dart';
import '../../domain/entities/admin.dart';
import '../../domain/repositories/admin_repository.dart';
import '../datasources/admin_local_data_source.dart';
import '../datasources/admin_remote_data_source.dart';

@LazySingleton(as: AdminRepository)
class AdminRepositoryImpl extends BaseOfflineSyncRepository<Admin, AdminModel>
    implements AdminRepository {
  final AdminLocalDataSource _localDataSource;
  final AdminRemoteDataSource _remoteDataSource;

  AdminRepositoryImpl(
    this._localDataSource,
    this._remoteDataSource,
    DatabaseService databaseService,
  ) : super(databaseService: databaseService);

  @override
  Future<Either<Failure, Admin>> getCurrentAdmin({
    bool forceRefresh = false,
    Duration? cacheTimeout = const Duration(hours: 1),
  }) async {
    return getOfflineFirst(
      getLocal: () => _localDataSource.getCurrentAdmin(),
      getRemote: () => _remoteDataSource.getCurrentAdmin(),
      saveLocal: (admin, {bool markForSync = false}) => 
          _localDataSource.saveAdmin(admin, markForSync: markForSync),
      toEntity: (model) => model.toEntity(),
      forceRefresh: forceRefresh,
      cacheTimeout: cacheTimeout,
    );
  }

  @override
  Future<Either<Failure, Admin>> updateAdmin(Admin admin) async {
    final adminModel = AdminModel.fromEntity(admin);

    return executeOptimistic<Admin, AdminModel>(
      // Update locally (marks for sync automatically)
      local: () async {
        final updated = await _localDataSource.updateAdmin(adminModel);
        return updated.toEntity();
      },

      // Remote update - will run in background
      remote: () async {
        // TODO: When admin API update endpoint is ready, uncomment:
        // return _remoteDataSource.updateAdmin(adminModel);

        // For now, simulate success after delay
        await Future.delayed(const Duration(seconds: 2));
        return Right(adminModel);
      },

      // Handle successful sync
      onSyncSuccess: (adminModel, entityUID) async {
        await _localDataSource.markAdminAsSynced(entityUID);
      },

      entity: admin,
      entityType: SyncEntityType.admin,
      action: SyncAction.update,
      payload: adminModel.toJson(),
      priority: 5,
      attemptImmediateSync: true, // Try to sync immediately if online
    );
  }
}
