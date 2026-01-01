import 'package:dartz/dartz.dart';
import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/database/app_database.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/network/auth_interceptor.dart';
import '../../../../core/service/secure_storage_service.dart';
import '../../../../shared/entities/auth_result.dart';
import '../../domain/entities/user.dart' as user_entity;
import '../../domain/entities/user.dart';
import '../../domain/entities/user_detail.dart';
import '../../domain/entities/user_settings.dart';

abstract class LoginLocalDataSource {
  Future<Either<Failure, void>> storeAuthResult(
    AuthResult authResult,
    User user,
  );
  Future<Either<Failure, String?>> getAccessToken();
  Future<Either<Failure, String?>> getRefreshToken();
  Future<Either<Failure, User?>> getStoredUser();
  Future<Either<Failure, void>> clearAuthData();
  Future<Either<Failure, void>> storeLoginCredentials(
    String email,
    String password,
  );
  Future<Either<Failure, Map<String, String>?>> getStoredCredentials();
}

@LazySingleton(as: LoginLocalDataSource)
class LoginLocalDataSourceImpl implements LoginLocalDataSource {
  final DatabaseService _databaseService;
  final AuthInterceptor _authInterceptor;
  final SecureStorageService _secureStorage;

  LoginLocalDataSourceImpl(
    this._databaseService,
    this._authInterceptor,
    this._secureStorage,
  );

  AppDatabase get _database => _databaseService.database;

  @override
  Future<Either<Failure, void>> storeAuthResult(
    AuthResult authResult,
    User user,
  ) async {
    try {
      print('💾 Storing auth result...');
      print('💾 User ID: ${user.id}, Email: ${user.email}');

      // Store tokens WITH expiry timestamps
      await _secureStorage.storeAuthResult(authResult);
      print('✅ Tokens stored in SecureStorage');

      // Store tokens in auth interceptor
      await _authInterceptor.storeTokens(
        accessToken: authResult.accessToken,
        refreshToken: authResult.refreshToken,
      );
      print('✅ Tokens stored in AuthInterceptor');

      // ✅ Store user in database - NORMALIZED TABLES
      // Store main user record
      await _database
          .into(_database.users)
          .insertOnConflictUpdate(
            UsersCompanion.insert(
              id: Value(user.id),
              email: user.email,
              role: user.role,
              phone: user.phone,
              status: user.status,
              balance: Value(user.balance),
              merchantId: Value(user.merchantId),
              country: Value(user.country),
              createdAt: user.createdAt,
            ),
          );
      print('✅ User record stored in database');

      // Store user detail if available
      if (user.userDetail != null) {
        await _database
            .into(_database.userDetails)
            .insertOnConflictUpdate(
              UserDetailsCompanion.insert(
                userId: Value(user.id),
                firstName: user.userDetail!.firstName,
                lastName: user.userDetail!.lastName,
                fullName: user.userDetail!.fullName,
                address: Value(user.userDetail!.address),
                birthDate: Value(user.userDetail!.birthDate),
                profilePicture: Value(user.userDetail!.profilePicture),
                gatePoint: Value(user.userDetail!.gatePoint),
                verify: user.userDetail!.verify,
                vaccount: Value(user.userDetail!.vaccount),
              ),
            );
        print('✅ User detail stored in database');
      }

      // Store user settings if available
      if (user.userSettings != null) {
        await _database
            .into(_database.userSettingsDetails)
            .insertOnConflictUpdate(
              UserSettingsDetailsCompanion.insert(
                userId: Value(user.id),
                marketing: Value(user.userSettings!.marketing),
                notifications: Value(user.userSettings!.notifications),
                twoFA: Value(user.userSettings!.twoFA),
              ),
            );
        print('✅ User settings stored in database');
      }

      print('✅ User stored in database - ID: ${user.id}, Email: ${user.email}');

      // ✅ VERIFY IT WAS STORED
      final storedUser = await getStoredUser();
      storedUser.fold(
        (failure) =>
            print('❌ Failed to verify stored user: ${failure.message}'),
        (retrievedUser) =>
            print('✅ Verified stored user: ${retrievedUser?.email}'),
      );

      return const Right(null);
    } catch (e, stackTrace) {
      print('❌ StoreAuthResult Error: $e');
      print('❌ StackTrace: $stackTrace');
      return Left(CacheFailure('Failed to store auth result: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, User?>> getStoredUser() async {
    try {
      print('🔍 Getting stored user from database...');

      // 💾 USING LOCAL DATA: Query from normalized tables
      final query = _database.select(_database.users)
        ..where((u) => u.deletedAt.isNull())
        ..limit(1);

      final userRecord = await query.getSingleOrNull();

      if (userRecord == null) {
        print('❌ No user found in database');
        return const Right(null);
      }

      print(
        '✅ Found user in database - ID: ${userRecord.id}, Email: ${userRecord.email}',
      );

      // Fetch related data from normalized tables
      UserDetail? userDetail;
      UserSettings? userSettings;

      // Get user detail
      final detailQuery = _database.select(_database.userDetails)
        ..where((d) => d.userId.equals(userRecord.id));
      final detailRecord = await detailQuery.getSingleOrNull();

      if (detailRecord != null) {
        userDetail = UserDetail(
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
        print('✅ User detail fetched from database');
      }

      // Get user settings
      final settingsQuery = _database.select(_database.userSettingsDetails)
        ..where((s) => s.userId.equals(userRecord.id));
      final settingsRecord = await settingsQuery.getSingleOrNull();

      if (settingsRecord != null) {
        userSettings = UserSettings(
          marketing: settingsRecord.marketing,
          notifications: settingsRecord.notifications,
          twoFA: settingsRecord.twoFA,
        );
        print('✅ User settings fetched from database');
      }

      final user = User(
        id: userRecord.id,
        email: userRecord.email,
        role: userRecord.role,
        phone: userRecord.phone,
        status: userRecord.status,
        balance: userRecord.balance,
        merchantId: userRecord.merchantId,
        country: userRecord.country,
        createdAt: userRecord.createdAt,
        userDetail: userDetail,
        userSettings: userSettings,
      );

      print('✅ User entity created: ${user.email}');
      return Right(user);
    } catch (e, stackTrace) {
      print('❌ GetStoredUser Error: $e');
      print('❌ StackTrace: $stackTrace');
      return Left(CacheFailure('Failed to get stored user: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, String?>> getAccessToken() async {
    try {
      final token = await _secureStorage.getAccessToken();
      return Right(token);
    } catch (e) {
      return Left(CacheFailure('Failed to get access token: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, String?>> getRefreshToken() async {
    try {
      final token = await _secureStorage.getRefreshToken();
      return Right(token);
    } catch (e) {
      return Left(CacheFailure('Failed to get refresh token: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, void>> clearAuthData() async {
    try {
      await _secureStorage.clearTokens();
      await _secureStorage.clearCredentials();
      await _authInterceptor.clearAllTokens();

      // ✅ Clear all user-related tables
      await _database.delete(_database.users).go();
      await _database.delete(_database.userDetails).go();
      await _database.delete(_database.userSettingsDetails).go();

      return const Right(null);
    } catch (e) {
      return Left(CacheFailure('Failed to clear auth data: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, void>> storeLoginCredentials(
    String email,
    String password,
  ) async {
    try {
      await _secureStorage.storeCredentials(email: email, password: password);
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure('Failed to store credentials: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, Map<String, String>?>> getStoredCredentials() async {
    try {
      final credentials = await _secureStorage.getStoredCredentials();
      return Right(credentials);
    } catch (e) {
      return Left(
        CacheFailure('Failed to get stored credentials: ${e.toString()}'),
      );
    }
  }
}
