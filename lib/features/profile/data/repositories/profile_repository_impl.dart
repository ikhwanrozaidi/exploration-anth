import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/entities/user_settings_entity.dart';
import '../../domain/repositories/profile_repository.dart';
import '../datasources/profile_remote_datasource.dart';
import '../datasources/profile_local_datasource.dart';

@LazySingleton(as: ProfileRepository)
class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileRemoteDataSource _remoteDataSource;
  final ProfileLocalDataSource _localDataSource;

  ProfileRepositoryImpl(this._remoteDataSource, this._localDataSource);

  @override
  Future<Either<Failure, UserSettings>> getUserSettings() async {
    final result = await _remoteDataSource.getUserSettings();
    return result.fold(
      (failure) async {
        // If remote fails, try local data
        final localResult = await _localDataSource.getCachedUserSettings();
        return localResult.fold(
          (localFailure) => Left(failure), // Return original remote failure
          (cachedData) =>
              cachedData != null ? Right(cachedData.toEntity()) : Left(failure),
        );
      },
      (userSettings) async {
        // Cache the successful result
        await _localDataSource.cacheUserSettings(userSettings);
        return Right(userSettings.toEntity());
      },
    );
  }
}
