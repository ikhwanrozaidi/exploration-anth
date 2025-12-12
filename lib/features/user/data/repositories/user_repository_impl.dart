// lib/features/user/data/repositories/user_repository_impl.dart
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/repositories/base_sync_repository.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/user_repository.dart';
import '../datasources/user_local_datasource.dart';
import '../datasources/user_remote_datasource.dart';
import '../models/user_model.dart';

@LazySingleton(as: UserRepository)
class UserRepositoryImpl extends BaseOfflineSyncRepository<User, UserModel>
    implements UserRepository {
  final UserLocalDataSource _localDataSource;
  final UserRemoteDataSource _remoteDataSource;

  UserRepositoryImpl(this._localDataSource, this._remoteDataSource);

  @override
  Future<Either<Failure, User>> getCurrentUser({
    bool forceRefresh = false,
    Duration? cacheTimeout = const Duration(hours: 1),
  }) async {
    return getOfflineFirst(
      getLocal: () => _localDataSource.getCurrentUser(),
      getRemote: () => _remoteDataSource.getCurrentUser(),
      saveLocal: (user, {bool markForSync = false}) =>
          _localDataSource.saveUser(user, markForSync: markForSync),
      toEntity: (model) => model.toEntity(),
      forceRefresh: forceRefresh,
      cacheTimeout: cacheTimeout,
    );
  }

  @override
  Future<Either<Failure, User>> updateUser(User user) async {
    try {
      final userModel = UserModel.fromEntity(user);

      // Update locally first
      final updatedModel = await _localDataSource.updateUser(userModel);

      // Try to update remotely
      final remoteResult = await _remoteDataSource.updateUser(updatedModel);

      return remoteResult.fold(
        (failure) {
          // Remote update failed, but local is already updated
          return Right(updatedModel.toEntity());
        },
        (remoteModel) async {
          // Remote update succeeded, mark as synced
          await _localDataSource.markUserAsSynced(remoteModel.uid);
          return Right(remoteModel.toEntity());
        },
      );
    } catch (e) {
      return Left(CacheFailure('Failed to update user: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, void>> clearCache() async {
    try {
      await _localDataSource.clearCache();
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure('Failed to clear cache: ${e.toString()}'));
    }
  }
}
