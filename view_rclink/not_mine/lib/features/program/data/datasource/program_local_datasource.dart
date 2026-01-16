import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/database/app_database.dart';
import '../../../../core/domain/entities/file_entity.dart';
import '../../../../core/errors/failures.dart';
import '../../../contractor_relation/domain/entities/contractor_relation_entity.dart';
import '../../../road/domain/entities/road_entity.dart';
import '../../domain/entities/created_by_nested_entity.dart';
import '../../domain/entities/program_setting_entity.dart';
import '../../domain/entities/program_view/program_detail_entity.dart';
import '../../domain/entities/program_view/program_list_item_entity.dart';
import '../../domain/entities/program_view/program_quantity_entity.dart';
import '../../domain/entities/work_scope_nested_entity.dart';
import '../models/created_by_nested_model.dart';
import '../models/program_setting_model.dart';
import '../models/quantity_type_nested_model.dart';
import '../models/work_scope_nested_model.dart';

abstract class ProgramLocalDataSource {
  Future<Either<Failure, List<ProgramSetting>>> getLocal();
  Future<Either<Failure, void>> saveLocal(List<ProgramSetting> settings);

  // Program View
  Future<Either<Failure, List<ProgramListItem>>> getCachedProgramList(
    String companyUID,
  );
  Future<Either<Failure, ProgramDetail>> getCachedProgramDetail(
    String programUID,
  );
  Future<Either<Failure, void>> cacheProgramList(
    List<ProgramListItem> programs,
  );
  Future<Either<Failure, void>> cacheProgramDetail(ProgramDetail program);

  // Clear Cache
  Future<Either<Failure, void>> clearCache();
}

@LazySingleton(as: ProgramLocalDataSource)
class ProgramLocalDataSourceImpl implements ProgramLocalDataSource {
  final DatabaseService _databaseService;

  ProgramLocalDataSourceImpl(this._databaseService);

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
  Future<Either<Failure, List<ProgramListItem>>> getCachedProgramList(
    String companyUID,
  ) async {
    try {
      final records = await (_database.select(
        _database.programs,
      )..where((tbl) => tbl.deletedAt.isNull())).get();

      if (records.isEmpty) {
        print('💾 No cached programs found');
        return const Right([]);
      }

      final List<ProgramListItem> programs = [];

      for (final record in records) {
        programs.add(_mapRecordToListItem(record));
      }

      print('💾 Retrieved ${programs.length} cached programs');
      return Right(programs);
    } catch (e) {
      print('❌ Error loading cached programs: $e');
      return Left(CacheFailure('Failed to load cached programs: $e'));
    }
  }

  @override
  Future<Either<Failure, ProgramDetail>> getCachedProgramDetail(
    String programUID,
  ) async {
    try {
      final record = await (_database.select(
        _database.programs,
      )..where((tbl) => tbl.uid.equals(programUID))).getSingleOrNull();

      if (record == null) {
        print('💾 No cached program detail found for UID: $programUID');
        return Left(CacheFailure('Program not found in cache'));
      }

      final programDetail = _mapRecordToDetail(record);
      print('💾 Retrieved cached program detail: ${programDetail.name}');
      return Right(programDetail);
    } catch (e) {
      print('❌ Error loading cached program detail: $e');
      return Left(CacheFailure('Failed to load cached program detail: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> cacheProgramList(
    List<ProgramListItem> programs,
  ) async {
    try {
      await _database.transaction(() async {
        for (final program in programs) {
          await _database
              .into(_database.programs)
              .insertOnConflictUpdate(_mapListItemToCompanion(program));
        }
      });

      print('💾 Cached ${programs.length} programs');
      return const Right(null);
    } catch (e) {
      print('❌ Error caching programs: $e');
      return Left(CacheFailure('Failed to cache programs: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> cacheProgramDetail(
    ProgramDetail program,
  ) async {
    try {
      await _database
          .into(_database.programs)
          .insertOnConflictUpdate(_mapDetailToCompanion(program));

      print('💾 Cached program detail: ${program.name}');
      return const Right(null);
    } catch (e) {
      print('❌ Error caching program detail: $e');
      return Left(CacheFailure('Failed to cache program detail: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> clearCache() async {
    try {
      await _database.delete(_database.programs).go();
      print('💾 Cleared program cache');
      return const Right(null);
    } catch (e) {
      print('❌ Error clearing program cache: $e');
      return Left(CacheFailure('Failed to clear program cache: $e'));
    }
  }

  // Helper: Map database record to ProgramListItem entity
  ProgramListItem _mapRecordToListItem(ProgramRecord record) {
    return ProgramListItem(
      id: record.id,
      uid: record.uid,
      name: record.name,
      description: record.description,
      companyID: record.companyID,
      workScopeID: record.workScopeID,
      roadID: record.roadID,
      periodStart: record.periodStart?.toIso8601String(),
      periodEnd: record.periodEnd?.toIso8601String(),
      contractRelationID: record.contractRelationID,
      requiredReportsCount: record.requiredReportsCount,
      totalReports: record.totalReports,
      calculationType: record.calculationType,
      fromSection: record.fromSection,
      toSection: record.toSection,
      dividerValue: record.dividerValue,
      inputValue: record.inputValue,
      longitude: record.longitude,
      latitude: record.latitude,
      status: record.status,
      createdByID: record.createdByID,
      createdAt: record.createdAt.toIso8601String(),
      updatedAt: record.updatedAt.toIso8601String(),
      deletedAt: record.deletedAt?.toIso8601String(),
      workScope: record.workScopeData != null
          ? WorkScopeNested.fromJson(json.decode(record.workScopeData!))
          : null,
      road: record.roadData != null
          ? Road.fromJson(json.decode(record.roadData!))
          : null,
      contractRelation: record.contractRelationData != null
          ? ContractorRelation.fromJson(
              json.decode(record.contractRelationData!),
            )
          : null,
      createdBy: record.createdByData != null
          ? CreatedByNested.fromJson(json.decode(record.createdByData!))
          : null,
      count: ProgramCount(dailyReports: record.totalReports),
    );
  }

  // Helper: Map database record to ProgramDetail entity
  ProgramDetail _mapRecordToDetail(ProgramRecord record) {
    return ProgramDetail(
      id: record.id,
      uid: record.uid,
      name: record.name,
      description: record.description,
      companyID: record.companyID,
      workScopeID: record.workScopeID,
      roadID: record.roadID,
      periodStart: record.periodStart?.toIso8601String(),
      periodEnd: record.periodEnd?.toIso8601String(),
      contractRelationID: record.contractRelationID,
      requiredReportsCount: record.requiredReportsCount,
      totalReports: record.totalReports,
      calculationType: record.calculationType,
      fromSection: record.fromSection,
      toSection: record.toSection,
      dividerValue: record.dividerValue,
      inputValue: record.inputValue,
      longitude: record.longitude,
      latitude: record.latitude,
      status: record.status,
      createdByID: record.createdByID,
      createdAt: record.createdAt.toIso8601String(),
      updatedAt: record.updatedAt.toIso8601String(),
      deletedAt: record.deletedAt?.toIso8601String(),
      workScope: record.workScopeData != null
          ? WorkScopeNested.fromJson(json.decode(record.workScopeData!))
          : null,
      road: record.roadData != null
          ? Road.fromJson(json.decode(record.roadData!))
          : null,
      contractRelation: record.contractRelationData != null
          ? ContractorRelation.fromJson(
              json.decode(record.contractRelationData!),
            )
          : null,
      createdBy: record.createdByData != null
          ? CreatedByNested.fromJson(json.decode(record.createdByData!))
          : null,
      quantities: record.quantitiesData != null
          ? (json.decode(record.quantitiesData!) as List)
                .map((q) => ProgramQuantity.fromJson(q))
                .toList()
          : null,
      files: record.filesData != null
          ? (json.decode(record.filesData!) as List)
                .map((f) => FileEntity.fromJson(f))
                .toList()
          : null,
      dailyReports: null, // dailyReports stored separately
      count: ProgramCount(dailyReports: record.totalReports),
    );
  }

  // Helper: Map ProgramListItem to database companion
  ProgramsCompanion _mapListItemToCompanion(ProgramListItem program) {
    return ProgramsCompanion(
      id: program.id != null ? Value(program.id!) : const Value.absent(),
      uid: Value(program.uid!),
      companyID: Value(program.companyID!),
      workScopeID: Value(program.workScopeID!),
      workScopeData: program.workScope != null
          ? Value(json.encode(program.workScope!.toJson()))
          : const Value(null),
      roadID: Value(program.roadID),
      roadData: program.road != null
          ? Value(json.encode(program.road!.toJson()))
          : const Value(null),
      contractRelationID: Value(program.contractRelationID),
      contractRelationData: program.contractRelation != null
          ? Value(json.encode(program.contractRelation!.toJson()))
          : const Value(null),
      name: Value(program.name),
      description: Value(program.description),
      periodStart: program.periodStart != null
          ? Value(DateTime.parse(program.periodStart!))
          : const Value(null),
      periodEnd: program.periodEnd != null
          ? Value(DateTime.parse(program.periodEnd!))
          : const Value(null),
      calculationType: Value(program.calculationType),
      fromSection: Value(program.fromSection),
      toSection: Value(program.toSection),
      dividerValue: Value(program.dividerValue),
      inputValue: Value(program.inputValue),
      requiredReportsCount: Value(program.requiredReportsCount),
      totalReports: Value(program.totalReports ?? 0),
      status: Value(program.status!),
      latitude: Value(program.latitude),
      longitude: Value(program.longitude),
      quantitiesData: const Value(null), // Not in list response
      filesData: const Value(null), // Not in list response
      createdByID: Value(program.createdByID),
      createdByData: program.createdBy != null
          ? Value(json.encode(program.createdBy!.toJson()))
          : const Value(null),
      createdAt: Value(DateTime.parse(program.createdAt!)),
      updatedAt: Value(DateTime.parse(program.updatedAt!)),
      deletedAt: program.deletedAt != null
          ? Value(DateTime.parse(program.deletedAt!))
          : const Value(null),
    );
  }

  // Helper: Map ProgramDetail to database companion
  ProgramsCompanion _mapDetailToCompanion(ProgramDetail program) {
    return ProgramsCompanion(
      id: program.id != null ? Value(program.id!) : const Value.absent(),
      uid: Value(program.uid!),
      companyID: Value(program.companyID!),
      workScopeID: Value(program.workScopeID!),
      workScopeData: program.workScope != null
          ? Value(json.encode(program.workScope!.toJson()))
          : const Value(null),
      roadID: Value(program.roadID),
      roadData: program.road != null
          ? Value(json.encode(program.road!.toJson()))
          : const Value(null),
      contractRelationID: Value(program.contractRelationID),
      contractRelationData: program.contractRelation != null
          ? Value(json.encode(program.contractRelation!.toJson()))
          : const Value(null),
      name: Value(program.name),
      description: Value(program.description),
      periodStart: program.periodStart != null
          ? Value(DateTime.parse(program.periodStart!))
          : const Value(null),
      periodEnd: program.periodEnd != null
          ? Value(DateTime.parse(program.periodEnd!))
          : const Value(null),
      calculationType: Value(program.calculationType),
      fromSection: Value(program.fromSection),
      toSection: Value(program.toSection),
      dividerValue: Value(program.dividerValue),
      inputValue: Value(program.inputValue),
      requiredReportsCount: Value(program.requiredReportsCount),
      totalReports: Value(program.totalReports ?? 0),
      status: Value(program.status!),
      latitude: Value(program.latitude),
      longitude: Value(program.longitude),
      quantitiesData: program.quantities != null
          ? Value(
              json.encode(program.quantities!.map((q) => q.toJson()).toList()),
            )
          : const Value(null),
      filesData: program.files != null
          ? Value(json.encode(program.files!.map((f) => f.toJson()).toList()))
          : const Value(null),
      createdByID: Value(program.createdByID),
      createdByData: program.createdBy != null
          ? Value(json.encode(program.createdBy!.toJson()))
          : const Value(null),
      createdAt: Value(DateTime.parse(program.createdAt!)),
      updatedAt: Value(DateTime.parse(program.updatedAt!)),
      deletedAt: program.deletedAt != null
          ? Value(DateTime.parse(program.deletedAt!))
          : const Value(null),
    );
  }

  // @override
  // Future<Either<Failure, void>> clearCache() async {
  //   try {
  //     await _database.delete(_database.programSettings).go();
  //     print('🗑️ Cleared program settings cache');
  //     return const Right(null);
  //   } catch (e) {
  //     print('❌ Error clearing program settings cache: $e');
  //     return Left(CacheFailure('Failed to clear program settings cache: $e'));
  //   }
  // }
}
