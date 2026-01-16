import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/database/app_database.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/entities/program_settings/program_setting_entity.dart';
import '../models/program_settings/created_by_nested_model.dart';
import '../models/program_settings/program_setting_model.dart';
import '../models/program_settings/quantity_type_nested_model.dart';
import '../models/program_settings/work_scope_nested_model.dart';

abstract class ProgramSettingsLocalDataSource {
  Future<Either<Failure, List<ProgramSetting>>> getLocal();
  Future<Either<Failure, void>> saveLocal(List<ProgramSetting> settings);
  Future<Either<Failure, void>> clearCache();
}

@LazySingleton(as: ProgramSettingsLocalDataSource)
class ProgramSettingsLocalDataSourceImpl
    implements ProgramSettingsLocalDataSource {
  final DatabaseService _databaseService;

  ProgramSettingsLocalDataSourceImpl(this._databaseService);

  AppDatabase get _database => _databaseService.database;

  @override
  Future<Either<Failure, List<ProgramSetting>>> getLocal() async {
    try {
      final records = await _database.select(_database.programSettings).get();

      if (records.isEmpty) {
        print('💾 No cached program settings found');
        return const Right([]);
      }

      final List<ProgramSetting> settings = [];

      for (final record in records) {
        // Decode JSON data
        WorkScopeNestedModel? workScope;
        if (record.workScopeData != null && record.workScopeData!.isNotEmpty) {
          workScope = WorkScopeNestedModel.fromJson(
            json.decode(record.workScopeData!),
          );
        }

        CreatedByNestedModel? createdBy;
        if (record.createdByData != null && record.createdByData!.isNotEmpty) {
          createdBy = CreatedByNestedModel.fromJson(
            json.decode(record.createdByData!),
          );
        }

        List<QuantityTypeNestedModel>? quantityTypes;
        if (record.quantityTypesData != null &&
            record.quantityTypesData!.isNotEmpty) {
          final List<dynamic> jsonList = json.decode(record.quantityTypesData!);
          quantityTypes = jsonList
              .map((qt) => QuantityTypeNestedModel.fromJson(qt))
              .toList();
        }

        final model = ProgramSettingModel(
          id: record.id,
          uid: record.uid,
          companyID: record.companyID,
          workScopeID: record.workScopeID,
          calculationType: record.calculationType,
          inputLabel: record.inputLabel,
          inputValue: record.inputValue,
          dividerValue: record.dividerValue,
          dividerLabel: record.dividerLabel,
          unitMeasurement: record.unitMeasurement,
          photoRequired: record.photoRequired,
          isActive: record.isActive,
          createdByID: record.createdByID,
          createdAt: record.createdAt.toIso8601String(),
          updatedAt: record.updatedAt.toIso8601String(),
          deletedAt: record.deletedAt?.toIso8601String(),
          workScope: workScope,
          createdBy: createdBy,
          quantityTypes: quantityTypes,
        );

        settings.add(model.toEntity());
      }

      print('💾 Retrieved ${settings.length} cached program settings');
      return Right(settings);
    } catch (e) {
      print('❌ Error loading cached program settings: $e');
      return Left(CacheFailure('Failed to load cached program settings: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> saveLocal(List<ProgramSetting> settings) async {
    try {
      await _database.transaction(() async {
        // Clear existing data
        await _database.delete(_database.programSettings).go();

        // Insert new data
        for (final setting in settings) {
          final model = ProgramSettingModelX.fromEntity(setting);

          // Encode nested data to JSON
          final workScopeJson = model.workScope != null
              ? json.encode(model.workScope!.toJson())
              : null;

          final createdByJson = model.createdBy != null
              ? json.encode(model.createdBy!.toJson())
              : null;

          final quantityTypesJson = model.quantityTypes != null
              ? json.encode(
                  model.quantityTypes!.map((qt) => qt.toJson()).toList(),
                )
              : null;

          await _database
              .into(_database.programSettings)
              .insert(
                ProgramSettingsCompanion(
                  id: model.id != null
                      ? Value(model.id!)
                      : const Value.absent(),
                  uid: Value(model.uid ?? ''),
                  companyID: Value(model.companyID ?? 0),
                  workScopeID: Value(model.workScopeID ?? 0),
                  calculationType: Value(model.calculationType ?? ''),
                  inputLabel: Value(model.inputLabel),
                  inputValue: Value(model.inputValue),
                  dividerValue: Value(model.dividerValue),
                  dividerLabel: Value(model.dividerLabel),
                  unitMeasurement: Value(model.unitMeasurement),
                  photoRequired: Value(model.photoRequired ?? false),
                  isActive: Value(model.isActive ?? true),
                  createdByID: Value(model.createdByID ?? 0),
                  createdAt: Value(
                    model.createdAt != null
                        ? DateTime.parse(model.createdAt!)
                        : DateTime.now(),
                  ),
                  updatedAt: Value(
                    model.updatedAt != null
                        ? DateTime.parse(model.updatedAt!)
                        : DateTime.now(),
                  ),
                  deletedAt: Value(
                    model.deletedAt != null
                        ? DateTime.parse(model.deletedAt!)
                        : null,
                  ),
                  workScopeData: Value(workScopeJson),
                  createdByData: Value(createdByJson),
                  quantityTypesData: Value(quantityTypesJson),
                  isSynced: const Value(true),
                ),
                mode: InsertMode.insertOrReplace,
              );
        }
      });

      print('💾 Saved ${settings.length} program settings to database');
      return const Right(null);
    } catch (e) {
      print('❌ Error saving program settings: $e');
      return Left(CacheFailure('Failed to save program settings: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> clearCache() async {
    try {
      await _database.delete(_database.programSettings).go();
      print('🗑️ Cleared program settings cache');
      return const Right(null);
    } catch (e) {
      print('❌ Error clearing program settings cache: $e');
      return Left(CacheFailure('Failed to clear program settings cache: $e'));
    }
  }
}
