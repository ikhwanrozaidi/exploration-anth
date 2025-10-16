import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:rclink_app/features/admin/data/models/admin_model.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/repositories/base_sync_repository.dart';
import '../../domain/entities/admin.dart';
import '../../domain/repositories/admin_repository.dart';
import '../datasources/admin_local_data_source.dart';
import '../datasources/admin_remote_data_source.dart';

@LazySingleton(as: AdminRepository)
class AdminRepositoryImpl extends BaseOfflineSyncRepository<Admin, AdminModel> 
    implements AdminRepository {
  final AdminLocalDataSource _localDataSource;
  final AdminRemoteDataSource _remoteDataSource;

  AdminRepositoryImpl(this._localDataSource, this._remoteDataSource);

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
    return updateOptimistic(
      // Update locally (marks for sync automatically)
      updateLocal: () => _localDataSource.updateAdmin(admin),
      
      // Remote update - will run in background
      updateRemote: () async {
        // TODO: When admin API update endpoint is ready, uncomment:
        // return _remoteDataSource.updateAdmin(admin.toModel());
        
        // For now, simulate success after delay
        await Future.delayed(const Duration(seconds: 2));
        return Right(AdminModel.fromEntity(admin));
      },
      
      // Mark as synced after successful remote update
      markAsSynced: (uid) => _localDataSource.markAdminAsSynced(uid),
      
      entity: admin,
      attemptImmediateSync: true, // Try to sync immediately if online
    );
  }
}
