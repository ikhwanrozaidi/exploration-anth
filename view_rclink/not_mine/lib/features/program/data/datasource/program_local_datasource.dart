import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/database/app_database.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/entities/program_entity.dart';
import 'package:rclink_app/core/domain/entities/file_entity.dart';
import '../../domain/entities/program_settings/created_by_nested_entity.dart';
import '../../domain/entities/program_settings/work_scope_nested_entity.dart';
import '../../domain/entities/program_view/contract_relation_nested_entity.dart';
import '../../domain/entities/program_view/program_quantity_entity.dart';
import '../../domain/entities/program_view/road_nested_entity.dart';
import 'program_local_datasource.dart';

abstract class ProgramLocalDataSource {
  Future<Either<Failure, List<Program>>> getPrograms();
  Future<Either<Failure, Program?>> getProgramByUid(String uid);
  Future<Either<Failure, void>> savePrograms(List<Program> programs);
  Future<Either<Failure, void>> saveProgram(Program program);
  Future<Either<Failure, void>> clearCache();
}

@LazySingleton(as: ProgramLocalDataSource)
class ProgramLocalDataSourceImpl implements ProgramLocalDataSource {
  final DatabaseService _databaseService;

  ProgramLocalDataSourceImpl(this._databaseService);

  AppDatabase get _database => _databaseService.database;

  @override
  Future<Either<Failure, List<Program>>> getPrograms() async {
    try {
      final records = await _database.select(_database.programs).get();

      if (records.isEmpty) {
        print('💾 No cached programs found');
        return const Right([]);
      }

      final List<Program> programs = [];

      for (final record in records) {
        programs.add(_recordToEntity(record));
      }

      print('💾 Retrieved ${programs.length} programs from local database');
      return Right(programs);
    } catch (e, stackTrace) {
      print('❌ Error getting programs from local database: $e');
      print('Stack trace: $stackTrace');
      return Left(CacheFailure('Failed to get programs: $e'));
    }
  }

  @override
  Future<Either<Failure, Program?>> getProgramByUid(String uid) async {
    try {
      final record = await (_database.select(
        _database.programs,
      )..where((tbl) => tbl.uid.equals(uid))).getSingleOrNull();

      if (record == null) {
        print('💾 Program not found in cache: $uid');
        return const Right(null);
      }

      final program = _recordToEntity(record);
      print('💾 Retrieved program from cache: ${program.name}');
      return Right(program);
    } catch (e, stackTrace) {
      print('❌ Error getting program by UID: $e');
      print('Stack trace: $stackTrace');
      return Left(CacheFailure('Failed to get program: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> savePrograms(List<Program> programs) async {
    try {
      await _database.transaction(() async {
        for (final program in programs) {
          await _saveProgram(program);
        }
      });

      print('💾 Saved ${programs.length} programs to local database');
      return const Right(null);
    } catch (e, stackTrace) {
      print('❌ Error saving programs to local database: $e');
      print('Stack trace: $stackTrace');
      return Left(CacheFailure('Failed to save programs: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> saveProgram(Program program) async {
    try {
      await _database.transaction(() async {
        await _saveProgram(program);
      });

      print('💾 Saved program to local database: ${program.name}');
      return const Right(null);
    } catch (e, stackTrace) {
      print('❌ Error saving program to local database: $e');
      print('Stack trace: $stackTrace');
      return Left(CacheFailure('Failed to save program: $e'));
    }
  }

  Future<void> _saveProgram(Program program) async {
    final companion = ProgramsCompanion(
      uid: Value(program.uid ?? ''),
      companyID: Value(program.companyID ?? 0),
      workScopeID: Value(program.workScopeID ?? 0),
      workScopeData: Value(
        program.workScope != null
            ? json.encode(program.workScope!.toJson())
            : null,
      ),
      roadID: Value(program.roadID),
      roadData: Value(
        program.road != null ? json.encode(program.road!.toJson()) : null,
      ),
      contractRelationID: Value(program.contractRelationID),
      contractRelationData: Value(
        program.contractRelation != null
            ? json.encode(program.contractRelation!.toJson())
            : null,
      ),
      name: Value(program.name),
      description: Value(program.description),
      periodStart: Value(
        program.periodStart != null
            ? DateTime.parse(program.periodStart!)
            : null,
      ),
      periodEnd: Value(
        program.periodEnd != null ? DateTime.parse(program.periodEnd!) : null,
      ),
      calculationType: Value(program.calculationType),
      fromSection: Value(program.fromSection),
      toSection: Value(program.toSection),
      dividerValue: Value(program.dividerValue),
      inputValue: Value(program.inputValue),
      requiredReportsCount: Value(program.requiredReportsCount),
      totalReports: Value(program.totalReports ?? 0),
      status: Value(program.status ?? 'DRAFT'),
      latitude: Value(
        program.latitude != null ? double.tryParse(program.latitude!) : null,
      ),
      longitude: Value(
        program.longitude != null ? double.tryParse(program.longitude!) : null,
      ),
      quantitiesData: Value(
        program.quantities != null
            ? json.encode(program.quantities!.map((q) => q.toJson()).toList())
            : null,
      ),
      filesData: Value(
        program.files != null
            ? json.encode(
                program.files!
                    .map(
                      (f) => {
                        'id': f.id,
                        'uid': f.uid,
                        'fileName': f.fileName,
                        's3Url': f.s3Url,
                        'mimeType': f.mimeType,
                        'size': f.size,
                      },
                    )
                    .toList(),
              )
            : null,
      ),
      createdByID: Value(program.createdByID),
      createdByData: Value(
        program.createdBy != null
            ? json.encode(program.createdBy!.toJson())
            : null,
      ),
      createdAt: Value(
        program.createdAt != null
            ? DateTime.parse(program.createdAt!)
            : DateTime.now(),
      ),
      updatedAt: Value(
        program.updatedAt != null
            ? DateTime.parse(program.updatedAt!)
            : DateTime.now(),
      ),
      deletedAt: Value(
        program.deletedAt != null ? DateTime.parse(program.deletedAt!) : null,
      ),
    );

    await _database.into(_database.programs).insertOnConflictUpdate(companion);
  }

  Program _recordToEntity(ProgramRecord record) {
    // Decode JSON data
    WorkScopeNested? workScope;
    if (record.workScopeData != null && record.workScopeData!.isNotEmpty) {
      workScope = WorkScopeNested.fromJson(json.decode(record.workScopeData!));
    }

    RoadNested? road;
    if (record.roadData != null && record.roadData!.isNotEmpty) {
      road = RoadNested.fromJson(json.decode(record.roadData!));
    }

    ContractRelationNested? contractRelation;
    if (record.contractRelationData != null &&
        record.contractRelationData!.isNotEmpty) {
      contractRelation = ContractRelationNested.fromJson(
        json.decode(record.contractRelationData!),
      );
    }

    CreatedByNested? createdBy;
    if (record.createdByData != null && record.createdByData!.isNotEmpty) {
      createdBy = CreatedByNested.fromJson(json.decode(record.createdByData!));
    }

    List<ProgramQuantity>? quantities;
    if (record.quantitiesData != null && record.quantitiesData!.isNotEmpty) {
      final List<dynamic> jsonList = json.decode(record.quantitiesData!);
      quantities = jsonList
          .map((item) => ProgramQuantity.fromJson(item as Map<String, dynamic>))
          .toList();
    }

    List<FileEntity>? files;
    if (record.filesData != null && record.filesData!.isNotEmpty) {
      final List<dynamic> jsonList = json.decode(record.filesData!);
      files = jsonList
          .map(
            (item) => FileEntity(
              id: item['id'] as int,
              uid: item['uid'] as String,
              fileName: item['fileName'] as String,
              s3Url: item['s3Url'] as String,
              mimeType: item['mimeType'] as String,
              size: item['size'] as int,
              companyID: record.companyID,
              contextType: 'program',
              uploadedByID: record.createdByID ?? 0,
            ),
          )
          .toList();
    }

    return Program(
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
      longitude: record.longitude?.toString(),
      latitude: record.latitude?.toString(),
      status: record.status,
      createdByID: record.createdByID,
      createdAt: record.createdAt.toIso8601String(),
      updatedAt: record.updatedAt.toIso8601String(),
      deletedAt: record.deletedAt?.toIso8601String(),
      workScope: workScope,
      road: road,
      contractRelation: contractRelation,
      createdBy: createdBy,
      quantities: quantities,
      files: files,
      dailyReports: null, // Daily reports not stored in program cache
    );
  }

  @override
  Future<Either<Failure, void>> clearCache() async {
    try {
      await _database.delete(_database.programs).go();
      print('💾 Cleared program cache');
      return const Right(null);
    } catch (e, stackTrace) {
      print('❌ Error clearing program cache: $e');
      print('Stack trace: $stackTrace');
      return Left(CacheFailure('Failed to clear cache: $e'));
    }
  }
}
