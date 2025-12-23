import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/database/app_database.dart';
import '../../../../core/errors/failures.dart';
import '../../../login/domain/entities/user.dart';
import '../../../login/domain/entities/user_detail.dart';
import '../../../login/domain/entities/user_settings.dart';

abstract class ProfileLocalDataSource {
  Future<Either<Failure, User?>> getUserProfile();

  Future<Either<Failure, void>> storeUser(User user);
}

@LazySingleton(as: ProfileLocalDataSource)
class ProfileLocalDataSourceImpl implements ProfileLocalDataSource {
  final DatabaseService _databaseService;

  ProfileLocalDataSourceImpl(this._databaseService);

  AppDatabase get _database => _databaseService.database;

  @override
  Future<Either<Failure, User?>> getUserProfile() async {
    try {
      print('🔍 [ProfileLocalDataSource] Fetching user from database...');

      // 💾 USING LOCAL DATA: Query from Drift database
      final query = _database.select(_database.users)
        ..where((u) => u.deletedAt.isNull())
        ..limit(1);

      final record = await query.getSingleOrNull();

      if (record == null) {
        print('❌ [ProfileLocalDataSource] No user found in database');
        return const Right(null);
      }

      print(
        '✅ [ProfileLocalDataSource] User found - ID: ${record.id}, Email: ${record.email}',
      );

      // Parse nested JSON objects
      UserDetail? userDetail;
      UserSettings? userSettings;

      if (record.userDetail != null && record.userDetail!.isNotEmpty) {
        try {
          userDetail = UserDetail.fromJson(jsonDecode(record.userDetail!));
          print(
            '✅ [ProfileLocalDataSource] Parsed userDetail - fullName: ${userDetail.fullName}',
          );
        } catch (e) {
          print('⚠️ [ProfileLocalDataSource] Failed to parse userDetail: $e');
        }
      }

      if (record.userSettings != null && record.userSettings!.isNotEmpty) {
        try {
          userSettings = UserSettings.fromJson(
            jsonDecode(record.userSettings!),
          );
          print('✅ [ProfileLocalDataSource] Parsed userSettings');
        } catch (e) {
          print('⚠️ [ProfileLocalDataSource] Failed to parse userSettings: $e');
        }
      }

      final user = User(
        id: record.id,
        email: record.email,
        role: record.role,
        phone: record.phone,
        status: record.status,
        balance: record.balance,
        merchantId: record.merchantId,
        country: record.country,
        createdAt: record.createdAt,
        userDetail: userDetail,
        userSettings: userSettings,
      );

      return Right(user);
    } catch (e, stackTrace) {
      print('❌ [ProfileLocalDataSource] Error: $e');
      print('❌ [ProfileLocalDataSource] StackTrace: $stackTrace');
      return Left(CacheFailure('Failed to get user profile: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, void>> storeUser(User user) async {
    //QUESTION: Why storeUser here? data comes from where?
    try {
      print('💾 [ProfileLocalDataSource] Storing user to database...');

      await _database
          .into(_database.users)
          .insertOnConflictUpdate(
            UsersCompanion.insert(
              id: Value(user.id),
              email: user.email,
              role: user.role,
              phone: user.phone,
              status: user.status,
              balance: user.balance,
              merchantId: Value(user.merchantId),
              country: Value(user.country),
              createdAt: user.createdAt,
              userDetail: Value(
                user.userDetail != null
                    ? jsonEncode(user.userDetail!.toJson())
                    : null,
              ),
              userSettings: Value(
                user.userSettings != null
                    ? jsonEncode(user.userSettings!.toJson())
                    : null,
              ),
            ),
          );

      print('✅ [ProfileLocalDataSource] User stored successfully');
      return const Right(null);
    } catch (e, stackTrace) {
      print('❌ [ProfileLocalDataSource] Store error: $e');
      print('❌ StackTrace: $stackTrace');
      return Left(CacheFailure('Failed to store user: ${e.toString()}'));
    }
  }
}
