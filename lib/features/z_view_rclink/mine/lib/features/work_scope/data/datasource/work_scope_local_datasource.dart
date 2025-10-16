import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/database/app_database.dart';
import '../../domain/entities/work_scope.dart';

abstract class WorkScopeLocalDataSource {
  Future<List<WorkScope>?> getLocal();
  Future<void> saveLocal(List<WorkScope> scopeOfWorks);

  Future<void> clearCache();
}

@LazySingleton(as: WorkScopeLocalDataSource)
class WorkScopeLocalDataSourceImpl implements WorkScopeLocalDataSource {
  final DatabaseService _databaseService;

  WorkScopeLocalDataSourceImpl(this._databaseService);

  AppDatabase get _database => _databaseService.database;

  @override
  Future<List<WorkScope>?> getLocal() async {
    try {
      final scopeRecords = await _database.select(_database.workScopes).get();

      if (scopeRecords.isEmpty) {
        return null;
      }

      final List<WorkScope> scopeOfWorks = [];

      for (final record in scopeRecords) {
        scopeOfWorks.add(
          WorkScope(
            id: record.id,
            uid: record.uid,
            name: record.name,
            code: record.code,
            description: record.description,
            allowMultipleQuantities: record.allowMultipleQuantities,
            createdAt: record.createdAt,
            updatedAt: record.updatedAt,
            deletedAt: record.deletedAt,
            companyID: record.companyID,
          ),
        );
      }

      return scopeOfWorks.isEmpty ? null : scopeOfWorks;
    } catch (e) {
      print('Error loading cached scope of works: $e');
      return null;
    }
  }

  @override
  Future<void> saveLocal(List<WorkScope> scopeOfWorks) async {
    try {
      await _database.transaction(() async {
        await _database.delete(_database.workScopes).go();

        for (final scopeOfWork in scopeOfWorks) {
          await _database
              .into(_database.workScopes)
              .insertOnConflictUpdate(
                WorkScopesCompanion(
                  id: Value(scopeOfWork.id),
                  uid: Value(scopeOfWork.uid),
                  name: Value(scopeOfWork.name),
                  code: Value(scopeOfWork.code),
                  description: Value(scopeOfWork.description),
                  allowMultipleQuantities: Value(
                    scopeOfWork.allowMultipleQuantities,
                  ),
                  createdAt: Value(scopeOfWork.createdAt),
                  updatedAt: Value(scopeOfWork.updatedAt),
                  deletedAt: Value(scopeOfWork.deletedAt),
                  companyID: Value(scopeOfWork.companyID),
                  isSynced: const Value(true),
                ),
              );
        }
      });
    } catch (e) {
      print('Error caching scope of works: $e');
    }
  }

  @override
  Future<void> clearCache() async {
    try {
      await _database.delete(_database.workScopes).go();
      print('✅ Road cache cleared from database');
    } catch (e) {
      print('❌ Error clearing road cache: $e');
    }
  }
}
