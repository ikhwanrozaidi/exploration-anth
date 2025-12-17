import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../../login/domain/entities/user.dart';
import '../../domain/repositories/profile_repository.dart';
import '../datasources/profile_local_datasource.dart';
import '../datasources/profile_remote_datasource.dart';

@LazySingleton(as: ProfileRepository)
class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileLocalDataSource _localDataSource;
  final ProfileRemoteDataSource _remoteDataSource;
  final NetworkInfo _networkInfo;

  ProfileRepositoryImpl(
    this._localDataSource,
    this._remoteDataSource,
    this._networkInfo,
  );

  @override
  Future<Either<Failure, User?>> getUserProfile() async {
    return await _localDataSource.getUserProfile();
  }

  @override
  Future<Either<Failure, User>> updateUserProfile(
    Map<String, dynamic> updates,
  ) async {
    final isConnected = await _networkInfo.isConnected;
    if (!isConnected) {
      return const Left(ConnectionFailure());
    }

    print('📡 [ProfileRepository] Updating profile...');

    // Update via API
    final result = await _remoteDataSource.updateProfile(updates);

    return result.fold(
      (failure) {
        print('❌ [ProfileRepository] Update failed: ${failure.message}');
        return Left(failure);
      },
      (updatedUser) async {
        print('✅ [ProfileRepository] Profile updated, saving to database...');

        // Store updated user in database
        await _localDataSource.storeUser(updatedUser);

        return Right(updatedUser);
      },
    );
  }
}
