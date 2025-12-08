import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/database/app_database.dart';
import '../../../../core/errors/failures.dart';
import '../models/user_settings_response_model.dart';

abstract class ProfileLocalDataSource {
  Future<Either<Failure, UserSettingsResponseModel?>> getCachedUserSettings();
  Future<Either<Failure, void>> cacheUserSettings(
    UserSettingsResponseModel userSettings,
  );
  Future<Either<Failure, void>> clearCachedUserSettings();
}

@LazySingleton(as: ProfileLocalDataSource)
class ProfileLocalDataSourceImpl implements ProfileLocalDataSource {
  final DatabaseService _databaseService;

  const ProfileLocalDataSourceImpl(this._databaseService);

  AppDatabase get _database => _databaseService.database;

  @override
  Future<Either<Failure, UserSettingsResponseModel?>>
  getCachedUserSettings() async {
    try {
      // TODO: Implement database storage for user settings
      // For now, return null to indicate no cached data
      print('📱 Using local data: Getting cached user settings');
      return const Right(null);
    } catch (e) {
      return Left(
        CacheFailure('Failed to get cached user settings: ${e.toString()}'),
      );
    }
  }

  @override
  Future<Either<Failure, void>> cacheUserSettings(
    UserSettingsResponseModel userSettings,
  ) async {
    try {
      // TODO: Implement database storage for user settings
      // You can add a user_settings table to your database schema
      print('📱 Using local data: Caching user settings locally');
      return const Right(null);
    } catch (e) {
      return Left(
        CacheFailure('Failed to cache user settings: ${e.toString()}'),
      );
    }
  }

  @override
  Future<Either<Failure, void>> clearCachedUserSettings() async {
    try {
      // TODO: Implement cache clearing
      print('📱 Using local data: Clearing cached user settings');
      return const Right(null);
    } catch (e) {
      return Left(
        CacheFailure('Failed to clear cached user settings: ${e.toString()}'),
      );
    }
  }
}
