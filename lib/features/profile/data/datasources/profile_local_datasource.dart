import 'package:dartz/dartz.dart';
import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/database/app_database.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/entities/user_profile.dart';
import '../../domain/entities/user_profile_user.dart';
import '../../domain/entities/user_profile_detail.dart';
import '../../domain/entities/user_profile_settings.dart';

abstract class ProfileLocalDataSource {
  Future<Either<Failure, UserProfile?>> getProfile();

  Future<Either<Failure, void>> updateProfile(UserProfile profile);
}

@LazySingleton(as: ProfileLocalDataSource)
class ProfileLocalDataSourceImpl implements ProfileLocalDataSource {
  final DatabaseService _databaseService;

  ProfileLocalDataSourceImpl(this._databaseService);

  AppDatabase get _database => _databaseService.database;

  @override
  Future<Either<Failure, UserProfile?>> getProfile() async {
    try {
      print(
        '🔍 [ProfileLocalDataSource] Fetching user profile from database...',
      );

      // 💾 USING LOCAL DATA: Query main user record
      final userQuery = _database.select(_database.users)
        ..where((u) => u.deletedAt.isNull())
        ..limit(1);

      final userRecord = await userQuery.getSingleOrNull();

      if (userRecord == null) {
        print('❌ [ProfileLocalDataSource] No user found in database');
        return const Right(null);
      }

      print(
        '✅ [ProfileLocalDataSource] User found - ID: ${userRecord.id}, Email: ${userRecord.email}',
      );

      // Create user entity
      final user = UserProfileUser(
        id: userRecord.id,
        email: userRecord.email,
        role: userRecord.role,
        phone: userRecord.phone,
        status: userRecord.status,
        balance: userRecord.balance,
        merchantId: userRecord.merchantId,
        country: userRecord.country,
        createdAt: userRecord.createdAt,
      );

      // 💾 USING LOCAL DATA: Fetch user detail
      UserProfileDetail? detail;
      final detailQuery = _database.select(_database.userDetails)
        ..where((d) => d.userId.equals(userRecord.id));
      final detailRecord = await detailQuery.getSingleOrNull();

      if (detailRecord != null) {
        detail = UserProfileDetail(
          firstName: detailRecord.firstName,
          lastName: detailRecord.lastName,
          fullName: detailRecord.fullName,
          address: detailRecord.address,
          birthDate: detailRecord.birthDate,
          profilePicture: detailRecord.profilePicture,
          gatePoint: detailRecord.gatePoint,
          verify: detailRecord.verify,
          vaccount: detailRecord.vaccount,
        );
        print(
          '✅ [ProfileLocalDataSource] User detail found - ${detail.fullName}',
        );
      }

      // 💾 USING LOCAL DATA: Fetch user settings
      UserProfileSettings? settings;
      final settingsQuery = _database.select(_database.userSettingsDetails)
        ..where((s) => s.userId.equals(userRecord.id));
      final settingsRecord = await settingsQuery.getSingleOrNull();

      if (settingsRecord != null) {
        settings = UserProfileSettings(
          marketing: settingsRecord.marketing,
          notifications: settingsRecord.notifications,
          twoFA: settingsRecord.twoFA,
        );
        print('✅ [ProfileLocalDataSource] User settings found');
      }

      final profile = UserProfile(
        user: user,
        detail: detail,
        settings: settings,
      );

      print('✅ [ProfileLocalDataSource] Profile loaded successfully');
      return Right(profile);
    } catch (e, stackTrace) {
      print('❌ [ProfileLocalDataSource] Error: $e');
      print('❌ [ProfileLocalDataSource] StackTrace: $stackTrace');
      return Left(CacheFailure('Failed to get profile: ${e.toString()}'));
    }
  }

  /// Store updated profile to database
  Future<Either<Failure, void>> updateProfile(UserProfile profile) async {
    try {
      print('💾 [ProfileLocalDataSource] Updating profile in database...');

      // Update user record
      await _database
          .update(_database.users)
          .replace(
            UsersCompanion(
              id: Value(profile.user.id),
              email: Value(profile.user.email),
              phone: Value(profile.user.phone),
              country: Value(profile.user.country),
              updatedAt: Value(DateTime.now()),
            ),
          );
      print('✅ [ProfileLocalDataSource] User record updated');

      // Update user detail if available
      if (profile.detail != null) {
        await _database
            .update(_database.userDetails)
            .replace(
              UserDetailsCompanion(
                userId: Value(profile.user.id),
                firstName: Value(profile.detail!.firstName),
                lastName: Value(profile.detail!.lastName),
                fullName: Value(profile.detail!.fullName),
                address: Value(profile.detail!.address),
                birthDate: Value(profile.detail!.birthDate),
                profilePicture: Value(profile.detail!.profilePicture),
                updatedAt: Value(DateTime.now()),
              ),
            );
        print('✅ [ProfileLocalDataSource] User detail updated');
      }

      print(
        '✅ [ProfileLocalDataSource] Profile updated successfully in database',
      );
      return const Right(null);
    } catch (e, stackTrace) {
      print('❌ [ProfileLocalDataSource] Update error: $e');
      print('❌ [ProfileLocalDataSource] StackTrace: $stackTrace');
      return Left(CacheFailure('Failed to update profile: ${e.toString()}'));
    }
  }
}
