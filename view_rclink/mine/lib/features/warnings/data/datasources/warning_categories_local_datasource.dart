import 'dart:convert';
import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/database/app_database.dart';
import '../../../daily_report/data/models/work_scope_response_model.dart';
import '../models/warning_category_with_reasons_model.dart';
import '../models/warning_reason_with_work_scope_model.dart';

abstract class WarningCategoriesLocalDataSource {
  Future<void> clearCache();

  Future<List<WarningCategoryWithReasonsModel>?> getCachedCategories({
    String? warningType,
    String? workScopeUID,
  });

  Future<void> cacheCategories(
    List<WarningCategoryWithReasonsModel> categories,
  );
}

@LazySingleton(as: WarningCategoriesLocalDataSource)
class WarningCategoriesLocalDataSourceImpl
    implements WarningCategoriesLocalDataSource {
  final DatabaseService _databaseService;

  WarningCategoriesLocalDataSourceImpl(this._databaseService);

  AppDatabase get _database => _databaseService.database;

  @override
  Future<List<WarningCategoryWithReasonsModel>?> getCachedCategories({
    String? warningType,
    String? workScopeUID,
  }) async {
    try {
      // Build category query
      var categoryQuery = _database.select(_database.warningCategories);

      if (warningType != null) {
        categoryQuery = categoryQuery
          ..where((tbl) => tbl.warningType.equals(warningType));
      }

      final categoryRecords = await categoryQuery.get();

      if (categoryRecords.isEmpty) {
        return null;
      }

      // Build result list
      final List<WarningCategoryWithReasonsModel> categories = [];

      for (final categoryRecord in categoryRecords) {
        // Get reasons for this category
        var reasonQuery = _database.select(_database.warningReasons)
          ..where((tbl) => tbl.categoryID.equals(categoryRecord.id));

        // Filter by workScopeUID if provided
        if (workScopeUID != null) {
          // First find the work scope by UID
          final workScopeRecords = await (_database
                  .select(_database.workScopes)
                ..where((tbl) => tbl.uid.equals(workScopeUID)))
              .get();

          if (workScopeRecords.isNotEmpty) {
            final workScopeID = workScopeRecords.first.id;
            reasonQuery = reasonQuery
              ..where((tbl) => tbl.workScopeID.equals(workScopeID));
          }
        }

        final reasonRecords = await reasonQuery.get();

        // Convert reason records to models
        final List<WarningReasonWithWorkScopeModel> reasons = [];

        for (final reasonRecord in reasonRecords) {
          // Parse cached work scope data if available
          WorkScopeResponseModel? workScope;
          if (reasonRecord.categoryData != null) {
            try {
              final json = jsonDecode(reasonRecord.categoryData!);
              workScope = WorkScopeResponseModel.fromJson(json);
            } catch (e) {
              print('Error parsing work scope data: $e');
            }
          }

          reasons.add(
            WarningReasonWithWorkScopeModel(
              id: reasonRecord.id,
              uid: reasonRecord.uid,
              name: reasonRecord.name,
              warningType: reasonRecord.warningType,
              categoryID: reasonRecord.categoryID,
              workScopeID: reasonRecord.workScopeID,
              requiresAction: reasonRecord.requiresAction,
              isActive: reasonRecord.isActive,
              displayOrder: reasonRecord.displayOrder,
              createdAt: reasonRecord.createdAt,
              updatedAt: reasonRecord.updatedAt,
              workScope: workScope,
            ),
          );
        }

        categories.add(
          WarningCategoryWithReasonsModel(
            id: categoryRecord.id,
            uid: categoryRecord.uid,
            name: categoryRecord.name,
            warningType: categoryRecord.warningType,
            createdAt: categoryRecord.createdAt,
            updatedAt: categoryRecord.updatedAt,
            reasons: reasons,
          ),
        );
      }

      return categories.isEmpty ? null : categories;
    } catch (e) {
      print('Error loading cached warning categories: $e');
      return null;
    }
  }

  @override
  Future<void> cacheCategories(
    List<WarningCategoryWithReasonsModel> categories,
  ) async {
    try {
      await _database.transaction(() async {
        // Clear existing data
        await _database.delete(_database.warningReasons).go();
        await _database.delete(_database.warningCategories).go();

        // Insert new categories and reasons
        for (final category in categories) {
          // Insert category
          await _database
              .into(_database.warningCategories)
              .insertOnConflictUpdate(
                WarningCategoriesCompanion(
                  id: Value(category.id),
                  uid: Value(category.uid),
                  name: Value(category.name),
                  warningType: Value(category.warningType),
                  createdAt: Value(category.createdAt ?? DateTime.now()),
                  updatedAt: Value(category.updatedAt ?? DateTime.now()),
                  isSynced: const Value(true),
                ),
              );

          // Insert reasons for this category
          for (final reason in category.reasons) {
            // Serialize work scope data to JSON if present
            String? workScopeJson;
            if (reason.workScope != null) {
              try {
                workScopeJson = jsonEncode(reason.workScope!.toJson());
              } catch (e) {
                print('Error serializing work scope data: $e');
              }
            }

            await _database
                .into(_database.warningReasons)
                .insertOnConflictUpdate(
                  WarningReasonsCompanion(
                    id: Value(reason.id),
                    uid: Value(reason.uid),
                    name: Value(reason.name),
                    warningType: Value(reason.warningType),
                    categoryID: Value(reason.categoryID),
                    workScopeID: Value(reason.workScopeID),
                    requiresAction: Value(reason.requiresAction),
                    isActive: Value(reason.isActive),
                    displayOrder: Value(reason.displayOrder),
                    createdAt: Value(reason.createdAt ?? DateTime.now()),
                    updatedAt: Value(reason.updatedAt ?? DateTime.now()),
                    categoryData: Value(workScopeJson),
                    isSynced: const Value(true),
                  ),
                );
          }
        }
      });
    } catch (e) {
      print('Error caching warning categories: $e');
    }
  }

  @override
  Future<void> clearCache() async {
    try {
      await _database.transaction(() async {
        // Delete in proper order (foreign key constraints)
        await _database.delete(_database.warningReasons).go();
        await _database.delete(_database.warningCategories).go();
      });
    } catch (e) {
      print('Error clearing warning categories cache: $e');
    }
  }
}
