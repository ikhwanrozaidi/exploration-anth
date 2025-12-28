import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/user_profile.dart';
import '../../domain/repositories/profile_repository.dart';
import '../datasources/profile_local_datasource.dart';
import '../datasources/profile_remote_datasource.dart';
import '../models/update_profile_request_model.dart';

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
  Future<Either<Failure, UserProfile?>> getProfile() async {
    try {
      print('📦 [ProfileRepository] Fetching profile from local datasource...');
      return await _localDataSource.getProfile();
    } catch (e) {
      print('❌ [ProfileRepository] Error: $e');
      return Left(CacheFailure('Failed to get profile: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, UserProfile>> updateProfile({
    String? email,
    String? phone,
    String? country,
    String? firstName,
    String? lastName,
    String? fullName,
    String? address,
    String? birthDate,
    String? profilePicture,
  }) async {
    final isConnected = await _networkInfo.isConnected;
    if (!isConnected) {
      return const Left(ConnectionFailure());
    }

    try {
      print('📦 [ProfileRepository] Updating profile...');

      final request = UpdateProfileRequestModel(
        email: email,
        phone: phone,
        country: country,
        firstName: firstName,
        lastName: lastName,
        fullName: fullName,
        address: address,
        birthDate: birthDate,
        profilePicture: profilePicture,
      );

      // Call remote API
      final result = await _remoteDataSource.updateProfile(request);

      return result.fold((failure) => Left(failure), (updatedProfile) async {
        // Store updated profile to local database
        await _localDataSource.updateProfile(updatedProfile);
        print('✅ [ProfileRepository] Profile updated and saved locally');
        return Right(updatedProfile);
      });
    } catch (e) {
      print('❌ [ProfileRepository] Error: $e');
      return Left(ServerFailure('Failed to update profile: ${e.toString()}'));
    }
  }
}
