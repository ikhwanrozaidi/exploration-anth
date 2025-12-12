// lib/features/user/data/datasources/user_local_datasource.dart
import 'package:dartz/dartz.dart';
import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/database/app_database.dart';
import '../../../../core/errors/failures.dart';
import '../models/user_model.dart';

abstract class UserLocalDataSource {
  Future<UserModel?> getCurrentUser();
  Future<void> saveUser(UserModel user, {bool markForSync = false});
  Future<UserModel> updateUser(UserModel user);
  Future<void> markUserAsSynced(String uid);
  Future<void> clearCache();
}

@LazySingleton(as: UserLocalDataSource)
class UserLocalDataSourceImpl implements UserLocalDataSource {
  final DatabaseService _databaseService;

  UserLocalDataSourceImpl(this._databaseService);

  @override
  Future<UserModel?> getCurrentUser() async {
    try {
      final db = _databaseService.database;
      final record = await (db.select(db.users)..limit(1)).getSingleOrNull();

      if (record == null) return null;

      return UserModel(
        id: record.id,
        uid: record.uid,
        phone: record.phone,
        firstName: record.firstName,
        lastName: record.lastName,
        email: record.email,
        updatedAt: record.updatedAt,
        createdAt: record.createdAt,
      );
    } catch (e) {
      throw CacheFailure('Failed to get current user: ${e.toString()}');
    }
  }

  @override
  Future<void> saveUser(UserModel user, {bool markForSync = false}) async {
    try {
      final db = _databaseService.database;

      await db
          .into(db.users)
          .insertOnConflictUpdate(
            UsersCompanion.insert(
              id: Value(user.id),
              uid: user.uid,
              phone: user.phone,
              firstName: Value(user.firstName),
              lastName: Value(user.lastName),
              email: Value(user.email),
              updatedAt: user.updatedAt,
              createdAt: user.createdAt,
              isSynced: Value(!markForSync),
            ),
          );
    } catch (e) {
      throw CacheFailure('Failed to save user: ${e.toString()}');
    }
  }

  @override
  Future<UserModel> updateUser(UserModel user) async {
    try {
      await saveUser(user, markForSync: true);
      return user;
    } catch (e) {
      throw CacheFailure('Failed to update user: ${e.toString()}');
    }
  }

  @override
  Future<void> markUserAsSynced(String uid) async {
    try {
      final db = _databaseService.database;
      await (db.update(db.users)..where((tbl) => tbl.uid.equals(uid))).write(
        const UsersCompanion(isSynced: Value(true)),
      );
    } catch (e) {
      throw CacheFailure('Failed to mark user as synced: ${e.toString()}');
    }
  }

  @override
  Future<void> clearCache() async {
    try {
      final db = _databaseService.database;
      await db.delete(db.users).go();
    } catch (e) {
      throw CacheFailure('Failed to clear user cache: ${e.toString()}');
    }
  }
}
