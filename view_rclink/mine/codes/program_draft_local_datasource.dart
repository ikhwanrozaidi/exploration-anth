import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/database/app_database.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/entities/program_draft_data_entity.dart';
import '../../../road/domain/entities/road_entity.dart';
import '../../../contractor_relation/domain/entities/contractor_relation_entity.dart';

abstract class ProgramDraftLocalDataSource {
  // Draft operations
  Future<Either<Failure, ProgramDraftData>> createDraftLocal({
    required String companyUID,
    required int workScopeID,
    required String workScopeUID,
    required String workScopeName,
    required String workScopeCode,
    Road? road,
    String? calculationType,
    String? fromSection,
    String? toSection,
    String? dividerValue,
  });

  Future<Either<Failure, void>> updateDraftLocal(
    String draftUID,
    ProgramDraftData draftData,
  );

  Future<Either<Failure, ProgramDraftData?>> getDraftByUID(String draftUID);

  Future<Either<Failure, List<ProgramRecord>>> getDraftList(String companyUID);

  Future<Either<Failure, void>> deleteDraftByUID(String draftUID);

  // Cache operations (for API responses)
  Future<Either<Failure, void>> cacheProgramsFromAPI(
    List<ProgramRecord> programs,
  );

  Future<Either<Failure, List<ProgramRecord>>> getCachedPrograms(
    String companyUID,
  );

  Future<Either<Failure, void>> clearCache();

  Future<Either<Failure, ProgramDraftData>> createDraftMultiRoadLocal({
    required String companyUID,
    required int workScopeID,
    required String workScopeUID,
    required String workScopeName,
    required String workScopeCode,
    required List<Road> roads,
    required ContractorRelation contractor,
  });
}

@LazySingleton(as: ProgramDraftLocalDataSource)
class ProgramDraftLocalDataSourceImpl implements ProgramDraftLocalDataSource {
  final DatabaseService _databaseService;
  final Uuid _uuid = const Uuid();

  ProgramDraftLocalDataSourceImpl(this._databaseService);

  AppDatabase get _database => _databaseService.database;

  // ===============================================
  // DRAFT OPERATIONS
  // ===============================================

  @override
  Future<Either<Failure, ProgramDraftData>> createDraftLocal({
    required String companyUID,
    required int workScopeID,
    required String workScopeUID,
    required String workScopeName,
    required String workScopeCode,
    Road? road,
    String? calculationType,
    String? fromSection,
    String? toSection,
    String? dividerValue,
  }) async {
    try {
      final draftUID = _uuid.v4();
      final now = DateTime.now();

      print('💾 Creating program draft: $draftUID');

      // Encode road data if present
      String? roadJson;
      if (road != null) {
        roadJson = json.encode({
          'id': road.id,
          'uid': road.uid,
          'name': road.name,
          'roadNo': road.roadNo,
          'sectionStart': road.sectionStart,
          'sectionFinish': road.sectionFinish,
          'district': road.district != null
              ? {
                  'id': road.district!.id,
                  'uid': road.district!.uid,
                  'name': road.district!.name,
                }
              : null,
        });
      }

      final workScopeJson = json.encode({
        'id': workScopeID,
        'uid': workScopeUID,
        'name': workScopeName,
        'code': workScopeCode,
      });

      await _database
          .into(_database.programs)
          .insert(
            ProgramsCompanion(
              uid: Value(draftUID),
              companyID: Value(int.tryParse(companyUID) ?? 0),
              workScopeID: Value(workScopeID),
              workScopeData: Value(workScopeJson),
              roadID: Value(road?.id),
              roadData: Value(roadJson),
              name: Value(
                'Draft - $workScopeCode - ${DateFormat('MMM yyyy').format(now)}',
              ),
              status: Value('DRAFT'),
              periodStart: Value(now),
              periodEnd: Value(now.add(const Duration(days: 30))),
              calculationType: Value(calculationType ?? 'SECTION_BASED'),
              fromSection: Value(fromSection),
              toSection: Value(toSection),
              dividerValue: Value(dividerValue),
              createdAt: Value(now),
              updatedAt: Value(now),
            ),
          );

      final draftData = ProgramDraftData(
        uid: draftUID,
        isDraftMode: true,
        companyUID: companyUID,
        workScopeID: workScopeID,
        workScopeUID: workScopeUID,
        workScopeName: workScopeName,
        workScopeCode: workScopeCode,
        road: road,
        calculationType: calculationType,
        fromSection: fromSection,
        toSection: toSection,
        dividerValue: dividerValue,
        status: 'DRAFT',
      );

      print('✅ Program draft created successfully');
      return Right(draftData);
    } catch (e) {
      print('❌ Error creating program draft: $e');
      return Left(CacheFailure('Failed to create draft: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> updateDraftLocal(
    String draftUID,
    ProgramDraftData draftData,
  ) async {
    try {
      print('💾 Updating program draft: $draftUID');

      // Encode contractor data if present
      String? contractorJson;
      if (draftData.contractor != null) {
        contractorJson = json.encode({
          'id': draftData.contractor!.id,
          'uid': draftData.contractor!.uid,
          'contractRelationUID': draftData.contractor!.contractRelationUID,
          'name': draftData.contractor!.name,
          'regNo': draftData.contractor!.regNo,
        });
      }

      // Encode roads if present
      // Encode road data - handle both single road (R02) and multiple roads (non-R02)
      String? roadDataJson;

      if (draftData.road != null) {
        // Single road (R02)
        roadDataJson = json.encode({
          'id': draftData.road!.id,
          'uid': draftData.road!.uid,
          'name': draftData.road!.name,
          'roadNo': draftData.road!.roadNo,
          'sectionStart': draftData.road!.sectionStart,
          'sectionFinish': draftData.road!.sectionFinish,
          'district': draftData.road!.district != null
              ? {
                  'id': draftData.road!.district!.id,
                  'uid': draftData.road!.district!.uid,
                  'name': draftData.road!.district!.name,
                }
              : null,
        });
        print('💾 Encoding single road: ${draftData.road!.name}');
      } else if (draftData.roads != null && draftData.roads!.isNotEmpty) {
        // Multiple roads (non-R02)
        roadDataJson = json.encode(
          draftData.roads!
              .map(
                (road) => {
                  'id': road.id,
                  'uid': road.uid,
                  'name': road.name,
                  'roadNo': road.roadNo,
                  'sectionStart': road.sectionStart,
                  'sectionFinish': road.sectionFinish,
                  'district': road.district != null
                      ? {
                          'id': road.district!.id,
                          'uid': road.district!.uid,
                          'name': road.district!.name,
                        }
                      : null,
                },
              )
              .toList(),
        );
        print('💾 Encoding ${draftData.roads!.length} roads');
      }

      // Encode work scope data if present
      String? workScopeJson;
      if (draftData.workScopeUID != null &&
          draftData.workScopeUID!.isNotEmpty) {
        workScopeJson = json.encode({
          'id': draftData.workScopeID,
          'uid': draftData.workScopeUID,
          'name': draftData.workScopeName,
          'code': draftData.workScopeCode,
        });
      }

      // Encode roadInputData
      String? roadInputDataJson;
      if (draftData.roadInputData != null &&
          draftData.roadInputData!.isNotEmpty) {
        roadInputDataJson = json.encode(draftData.roadInputData);
      }

      // Encode quantities data
      final quantitiesJson = draftData.quantityFieldData.isNotEmpty
          ? json.encode(draftData.quantityFieldData)
          : null;

      await (_database.update(
        _database.programs,
      )..where((tbl) => tbl.uid.equals(draftUID))).write(
        ProgramsCompanion(
          contractRelationID: Value(draftData.contractor?.id),
          contractRelationData: Value(contractorJson),
          name: Value(draftData.name ?? ''),
          roadData: Value(roadDataJson),
          inputValue: Value(roadInputDataJson),
          description: Value(draftData.description),
          periodStart: Value(draftData.periodStart ?? DateTime.now()),
          periodEnd: Value(
            draftData.periodEnd ?? DateTime.now().add(const Duration(days: 30)),
          ),
          latitude: Value(draftData.latitude),
          longitude: Value(draftData.longitude),
          quantitiesData: Value(quantitiesJson),
          workScopeData: Value(workScopeJson),
          updatedAt: Value(DateTime.now()),
        ),
      );

      print('✅ Program draft updated successfully');
      return const Right(null);
    } catch (e) {
      print('❌ Error updating program draft: $e');
      return Left(CacheFailure('Failed to update draft: $e'));
    }
  }

  @override
  Future<Either<Failure, ProgramDraftData?>> getDraftByUID(
    String draftUID,
  ) async {
    try {
      print('📂 Loading program draft: $draftUID');

      final draft =
          await (_database.select(_database.programs)
                ..where((tbl) => tbl.uid.equals(draftUID))
                ..where((tbl) => tbl.status.equals('DRAFT')))
              .getSingleOrNull();

      if (draft == null) {
        print('⚠️ Draft not found: $draftUID');
        return const Right(null);
      }

      print('✅ Draft loaded: $draftUID');

      // Reconstruct Road entity from JSON (SINGLE road or LIST of roads)
      Road? road;
      List<Road>? roads;

      if (draft.roadData != null && draft.roadData!.isNotEmpty) {
        try {
          final roadDataDecoded = json.decode(draft.roadData!);

          if (roadDataDecoded is List) {
            // It's a list of roads (multi-road draft)
            print('📍 Parsing roads list (${roadDataDecoded.length} roads)');
            roads = roadDataDecoded.map((roadJson) {
              return Road(
                id: roadJson['id'],
                uid: roadJson['uid'],
                name: roadJson['name'],
                roadNo: roadJson['roadNo'],
                sectionStart: roadJson['sectionStart'] != null
                    ? (roadJson['sectionStart'] as num).toDouble()
                    : null,
                sectionFinish: roadJson['sectionFinish'] != null
                    ? (roadJson['sectionFinish'] as num).toDouble()
                    : null,
              );
            }).toList();
          } else if (roadDataDecoded is Map) {
            // It's a single road (R02 draft)
            print('📍 Parsing single road');
            road = Road(
              id: roadDataDecoded['id'],
              uid: roadDataDecoded['uid'],
              name: roadDataDecoded['name'],
              roadNo: roadDataDecoded['roadNo'],
              sectionStart: roadDataDecoded['sectionStart'] != null
                  ? (roadDataDecoded['sectionStart'] as num).toDouble()
                  : null,
              sectionFinish: roadDataDecoded['sectionFinish'] != null
                  ? (roadDataDecoded['sectionFinish'] as num).toDouble()
                  : null,
            );
          }
        } catch (e) {
          print('⚠️ Could not parse roadData: $e');
        }
      }

      // Reconstruct Contractor entity from JSON
      ContractorRelation? contractor;
      if (draft.contractRelationData != null &&
          draft.contractRelationData!.isNotEmpty) {
        final contractorJson = json.decode(draft.contractRelationData!);
        contractor = ContractorRelation(
          id: contractorJson['id'],
          uid: contractorJson['uid'],
          contractRelationUID: contractorJson['contractRelationUID'],
          name: contractorJson['name'] ?? '',
          regNo: contractorJson['regNo'],
        );
      }

      // Parse quantities
      Map<String, Map<String, dynamic>> quantityFieldData = {};
      if (draft.quantitiesData != null && draft.quantitiesData!.isNotEmpty) {
        final Map<String, dynamic> quantitiesJson = json.decode(
          draft.quantitiesData!,
        );
        quantityFieldData = quantitiesJson.map(
          (key, value) => MapEntry(key, Map<String, dynamic>.from(value)),
        );
      }

      // Parse roadInputData
      Map<String, Map<String, dynamic>>? roadInputData;
      if (draft.inputValue != null && draft.inputValue!.isNotEmpty) {
        try {
          final Map<String, dynamic> inputDataJson = json.decode(
            draft.inputValue!,
          );
          roadInputData = inputDataJson.map(
            (key, value) => MapEntry(key, Map<String, dynamic>.from(value)),
          );
        } catch (e) {
          print('⚠️ Could not parse roadInputData: $e');
        }
      }

      // Parse work scope data
      String workScopeUID = '';
      String workScopeName = '';
      String workScopeCode = '';
      if (draft.workScopeData != null && draft.workScopeData!.isNotEmpty) {
        try {
          final workScopeJson =
              json.decode(draft.workScopeData!) as Map<String, dynamic>;
          workScopeUID = workScopeJson['uid'] ?? '';
          workScopeName = workScopeJson['name'] ?? '';
          workScopeCode = workScopeJson['code'] ?? '';
        } catch (e) {
          print('⚠️ Could not parse workScopeData: $e');
        }
      }

      final draftData = ProgramDraftData(
        uid: draft.uid,
        isDraftMode: true,
        companyUID: draft.companyID.toString(),
        workScopeID: draft.workScopeID,
        workScopeUID: workScopeUID,
        workScopeName: workScopeName,
        workScopeCode: workScopeCode,
        road: road,
        roads: roads,
        roadInputData: roadInputData,
        contractor: contractor,
        name: draft.name,
        description: draft.description,
        periodStart: draft.periodStart,
        periodEnd: draft.periodEnd,
        calculationType: draft.calculationType,
        fromSection: draft.fromSection,
        toSection: draft.toSection,
        dividerValue: draft.dividerValue,
        inputValue: draft.inputValue,
        latitude: draft.latitude,
        longitude: draft.longitude,
        quantityFieldData: quantityFieldData,
        programImages: [], // Images loaded separately via ImageLocalDataSource
        status: draft.status,
      );

      return Right(draftData);
    } catch (e) {
      print('❌ Error loading draft: $e');
      return Left(CacheFailure('Failed to load draft: $e'));
    }
  }

  @override
  Future<Either<Failure, List<ProgramRecord>>> getDraftList(
    String companyUID,
  ) async {
    try {
      print('📂 Loading program draft list for company: $companyUID');

      final companyId = int.tryParse(companyUID) ?? 0;

      final drafts =
          await (_database.select(_database.programs)
                ..where((tbl) => tbl.companyID.equals(companyId))
                ..where((tbl) => tbl.status.equals('DRAFT'))
                ..orderBy([(tbl) => OrderingTerm.desc(tbl.updatedAt)]))
              .get();

      print('✅ Loaded ${drafts.length} program drafts');
      return Right(drafts);
    } catch (e) {
      print('❌ Error loading draft list: $e');
      return Left(CacheFailure('Failed to load drafts: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> deleteDraftByUID(String draftUID) async {
    try {
      print('🗑️ Deleting program draft: $draftUID');

      await (_database.delete(_database.programs)
            ..where((tbl) => tbl.uid.equals(draftUID))
            ..where((tbl) => tbl.status.equals('DRAFT')))
          .go();

      print('✅ Draft deleted successfully');
      return const Right(null);
    } catch (e) {
      print('❌ Error deleting draft: $e');
      return Left(CacheFailure('Failed to delete draft: $e'));
    }
  }

  // ===============================================
  // CACHE OPERATIONS (for API responses)
  // ===============================================

  @override
  Future<Either<Failure, void>> cacheProgramsFromAPI(
    List<ProgramRecord> programs,
  ) async {
    try {
      print('💾 Caching ${programs.length} programs from API');

      await _database.transaction(() async {
        // Delete only non-draft programs before inserting new ones
        await (_database.delete(
          _database.programs,
        )..where((tbl) => tbl.status.isNotValue('DRAFT'))).go();

        // Insert new programs from API
        for (final program in programs) {
          await _database
              .into(_database.programs)
              .insert(program, mode: InsertMode.insertOrReplace);
        }
      });

      print('✅ Programs cached successfully');
      return const Right(null);
    } catch (e) {
      print('❌ Error caching programs: $e');
      return Left(CacheFailure('Failed to cache programs: $e'));
    }
  }

  @override
  Future<Either<Failure, List<ProgramRecord>>> getCachedPrograms(
    String companyUID,
  ) async {
    try {
      print('📂 Loading cached programs for company: $companyUID');

      final companyId = int.tryParse(companyUID) ?? 0;

      final programs =
          await (_database.select(_database.programs)
                ..where((tbl) => tbl.companyID.equals(companyId))
                ..where((tbl) => tbl.status.isNotValue('DRAFT'))
                ..orderBy([(tbl) => OrderingTerm.desc(tbl.updatedAt)]))
              .get();

      print('✅ Loaded ${programs.length} cached programs');
      return Right(programs);
    } catch (e) {
      print('❌ Error loading cached programs: $e');
      return Left(CacheFailure('Failed to load programs: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> clearCache() async {
    try {
      print('🗑️ Clearing program cache (keeping drafts)');

      // Delete only non-draft programs
      await (_database.delete(
        _database.programs,
      )..where((tbl) => tbl.status.isNotValue('DRAFT'))).go();

      print('✅ Cache cleared successfully');
      return const Right(null);
    } catch (e) {
      print('❌ Error clearing cache: $e');
      return Left(CacheFailure('Failed to clear cache: $e'));
    }
  }

  @override
  Future<Either<Failure, ProgramDraftData>> createDraftMultiRoadLocal({
    required String companyUID,
    required int workScopeID,
    required String workScopeUID,
    required String workScopeName,
    required String workScopeCode,
    required List<Road> roads,
    required ContractorRelation contractor,
  }) async {
    try {
      final draftUID = _uuid.v4();
      final now = DateTime.now();

      print('💾 Creating multi-road program draft: $draftUID');

      // Encode contractor data
      final contractorJson = json.encode({
        'id': contractor.id,
        'uid': contractor.uid,
        'contractRelationUID': contractor.contractRelationUID,
        'name': contractor.name,
        'regNo': contractor.regNo,
      });

      // Encode roads data
      final roadsJson = json.encode(
        roads
            .map(
              (road) => {
                'id': road.id,
                'uid': road.uid,
                'name': road.name,
                'roadNo': road.roadNo,
                'sectionStart': road.sectionStart,
                'sectionFinish': road.sectionFinish,
                'district': road.district != null
                    ? {
                        'id': road.district!.id,
                        'uid': road.district!.uid,
                        'name': road.district!.name,
                      }
                    : null,
              },
            )
            .toList(),
      );

      // Encode work scope data
      final workScopeJson = json.encode({
        'id': workScopeID,
        'uid': workScopeUID,
        'name': workScopeName,
        'code': workScopeCode,
      });

      await _database
          .into(_database.programs)
          .insert(
            ProgramsCompanion(
              uid: Value(draftUID),
              companyID: Value(int.tryParse(companyUID) ?? 0),
              workScopeID: Value(workScopeID),
              workScopeData: Value(workScopeJson),
              contractRelationData: Value(contractorJson),
              roadData: Value(roadsJson),
              name: Value(
                'Draft - $workScopeCode - ${DateFormat('MMM yyyy').format(now)}',
              ),
              status: Value('DRAFT'),
              periodStart: Value(now),
              periodEnd: Value(now.add(const Duration(days: 30))),
              createdAt: Value(now),
              updatedAt: Value(now),
            ),
          );

      final draftData = ProgramDraftData(
        uid: draftUID,
        isDraftMode: true,
        companyUID: companyUID,
        workScopeID: workScopeID,
        workScopeUID: workScopeUID,
        workScopeName: workScopeName,
        workScopeCode: workScopeCode,
        roads: roads,
        roadInputData: {},
        contractor: contractor,
        status: 'DRAFT',
      );

      print('✅ Multi-road program draft created successfully');
      return Right(draftData);
    } catch (e) {
      print('❌ Error creating multi-road program draft: $e');
      return Left(CacheFailure('Failed to create draft: $e'));
    }
  }
}
