// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:uuid/uuid.dart';
import '../../../../core/database/app_database.dart';
import '../models/create_warning_model.dart';
import '../models/warning_daily_report_model.dart';
import '../models/warning_model.dart';
import '../models/warning_item_model.dart';
import '../../../../core/domain/models/file_model.dart';
import '../../../daily_report/data/models/company_response_model.dart';
import '../../../daily_report/data/models/road_response_model.dart';
import '../../../daily_report/data/models/work_scope_response_model.dart';
import '../../../daily_report/data/models/created_by_response_model.dart';
import '../../../daily_report/data/models/daily_report_model.dart';

abstract class WarningsLocalDataSource {
  Future<List<WarningModel>?> getCachedWarnings(String companyUID);
  Future<WarningModel?> getCachedWarningByUid(String uid);
  Future<void> cacheWarnings(List<WarningModel> warnings);
  Future<void> cacheSingleWarning(WarningModel warning);
  Future<void> clearCache();

  Future<WarningModel> createDraftWarningLocal({
    required String companyUID,
    required String roadUID,
    required String workScopeUID,
    required double fromSection,
    double? toSection,
  });
  Future<void> updateDraftWarningLocal(
    String draftUID,
    CreateWarningModel data,
  );
  Future<void> deleteDraftWarning(String draftUID);
  Future<List<WarningModel>?> getDraftWarnings(String companyUID);
}

@LazySingleton(as: WarningsLocalDataSource)
class WarningsLocalDataSourceImpl implements WarningsLocalDataSource {
  final DatabaseService _databaseService;

  WarningsLocalDataSourceImpl(this._databaseService);

  AppDatabase get _database => _databaseService.database;

  @override
  Future<List<WarningModel>?> getCachedWarnings(String companyUID) async {
    try {
      final query = _database.select(_database.warnings)
        ..where((tbl) => tbl.deletedAt.isNull());

      final records = await query.get();

      if (records.isEmpty) {
        return null;
      }

      final warnings = await Future.wait(
        records.map((record) => _convertRecordToModel(record)),
      );

      return warnings.isEmpty ? null : warnings;
    } catch (e) {
      print('Error getting cached warnings: $e');
      return null;
    }
  }

  // Existing
  @override
  Future<WarningModel?> getCachedWarningByUid(String uid) async {
    try {
      final record =
          await (_database.select(_database.warnings)
                ..where((tbl) => tbl.uid.equals(uid) & tbl.deletedAt.isNull()))
              .getSingleOrNull();

      if (record == null) {
        return null;
      }

      return await _convertRecordToModel(record);
    } catch (e) {
      print('Error getting cached warning by UID: $e');
      return null;
    }
  }

  @override
  Future<void> cacheWarnings(List<WarningModel> warnings) async {
    try {
      for (final warning in warnings) {
        await _saveWarningRecord(warning);
      }
    } catch (e) {
      print('Error caching warnings: $e');
    }
  }

  @override
  Future<void> cacheSingleWarning(WarningModel warning) async {
    try {
      await _saveWarningRecord(warning);
    } catch (e) {
      print('Error caching single warning: $e');
    }
  }

  /// Helper method to save a single warning record
  Future<void> _saveWarningRecord(WarningModel warning) async {
    // Serialize warningItems to JSON
    String? warningItemsJson;
    if (warning.warningItems.isNotEmpty) {
      warningItemsJson = jsonEncode(
        warning.warningItems.map((item) => item.toJson()).toList(),
      );
    }

    // Serialize company to JSON
    String? companyData;
    if (warning.company != null) {
      companyData = jsonEncode(warning.company!.toJson());
    }

    // Serialize road to JSON (includes district, state, country)
    String? roadData;
    if (warning.road != null) {
      roadData = jsonEncode(warning.road!.toJson());
    }

    // Serialize workScope to JSON
    String? workScopeData;
    if (warning.workScope != null) {
      workScopeData = jsonEncode(warning.workScope!.toJson());
    }

    // Serialize createdBy to JSON
    String? createdByData;
    if (warning.createdBy != null) {
      createdByData = jsonEncode(warning.createdBy!.toJson());
    }

    // Serialize resolvedBy to JSON
    String? resolvedByData;
    if (warning.resolvedBy != null) {
      resolvedByData = jsonEncode(warning.resolvedBy!.toJson());
    }

    // Serialize files to JSON
    String? filesData;
    if (warning.files != null && warning.files!.isNotEmpty) {
      filesData = jsonEncode(
        warning.files!.map((file) => file.toJson()).toList(),
      );
    }

    // Serialize dailyReport to JSON
    String? dailyReportData;
    if (warning.dailyReport != null) {
      dailyReportData = jsonEncode(warning.dailyReport!.toJson());
    }

    // Check if record already exists to avoid ID conflicts
    final existingRecord = await (_database.select(
      _database.warnings,
    )..where((tbl) => tbl.uid.equals(warning.uid))).getSingleOrNull();

    final idValue = (existingRecord == null || existingRecord.id == null)
        ? Value<int?>(warning.id)
        : const Value<int?>.absent();

    final companion = WarningsCompanion(
      id: idValue,
      uid: Value(warning.uid),
      warningType: Value(warning.warningType),
      dailyReportID: Value(warning.dailyReportID),
      companyID: Value(warning.companyID),
      roadID: Value(warning.roadID),
      workScopeID: Value(warning.workScopeID),
      contractRelationID: Value(warning.contractRelationID),
      fromSection: Value(warning.fromSection),
      toSection: Value(warning.toSection),
      requiresAction: Value(warning.requiresAction),
      isResolved: Value(warning.isResolved),
      resolvedByID: Value(warning.resolvedByID),
      resolvedAt: Value(warning.resolvedAt),
      resolutionNotes: Value(warning.resolutionNotes),
      longitude: Value(warning.longitude),
      latitude: Value(warning.latitude),
      description: Value(warning.description),
      createdByID: Value(warning.createdByID),
      createdAt: Value(warning.createdAt),
      updatedAt: Value(warning.updatedAt),
      deletedAt: Value(warning.deletedAt),
      warningItemsData: Value(warningItemsJson),
      companyData: Value(companyData),
      roadData: Value(roadData),
      workScopeData: Value(workScopeData),
      createdByData: Value(createdByData),
      resolvedByData: Value(resolvedByData),
      filesData: Value(filesData),
      dailyReportData: Value(dailyReportData),
      isSynced: const Value(true),
    );

    await _database
        .into(_database.warnings)
        .insert(
          companion,
          mode: InsertMode.insertOrReplace,
          onConflict: DoUpdate(
            (_) => companion,
            target: [_database.warnings.uid],
          ),
        );
  }

  /// Helper method to convert WarningRecord to WarningModel
  Future<WarningModel> _convertRecordToModel(WarningRecord record) async {
    // Parse warningItems JSON
    List<WarningItemModel> warningItems = [];
    if (record.warningItemsData != null &&
        record.warningItemsData!.isNotEmpty) {
      try {
        final itemsData = jsonDecode(record.warningItemsData!) as List;
        warningItems = itemsData
            .map(
              (item) => WarningItemModel.fromJson(item as Map<String, dynamic>),
            )
            .toList();
      } catch (e) {
        print('Error parsing warningItems: $e');
      }
    }

    // Parse company JSON
    CompanyResponseModel? company;
    if (record.companyData != null && record.companyData!.isNotEmpty) {
      try {
        final data = jsonDecode(record.companyData!);
        company = CompanyResponseModel.fromJson(data);
      } catch (e) {
        print('Error parsing company: $e');
      }
    }

    // Parse road JSON (includes district, state, country)
    RoadResponseModel? road;
    if (record.roadData != null && record.roadData!.isNotEmpty) {
      try {
        final data = jsonDecode(record.roadData!);
        road = RoadResponseModel.fromJson(data);
      } catch (e) {
        print('Error parsing road: $e');
      }
    }

    // Parse workScope JSON
    WorkScopeResponseModel? workScope;
    if (record.workScopeData != null && record.workScopeData!.isNotEmpty) {
      try {
        final data = jsonDecode(record.workScopeData!);
        workScope = WorkScopeResponseModel.fromJson(data);
      } catch (e) {
        print('Error parsing workScope: $e');
      }
    }

    // Parse createdBy JSON
    CreatedByResponseModel? createdBy;
    if (record.createdByData != null && record.createdByData!.isNotEmpty) {
      try {
        final data = jsonDecode(record.createdByData!);
        createdBy = CreatedByResponseModel.fromJson(data);
      } catch (e) {
        print('Error parsing createdBy: $e');
      }
    }

    // Parse resolvedBy JSON
    CreatedByResponseModel? resolvedBy;
    if (record.resolvedByData != null && record.resolvedByData!.isNotEmpty) {
      try {
        final data = jsonDecode(record.resolvedByData!);
        resolvedBy = CreatedByResponseModel.fromJson(data);
      } catch (e) {
        print('Error parsing resolvedBy: $e');
      }
    }

    // Parse files JSON
    List<FileModel>? files;

    /// Database not ready yet
    // if (record.filesData != null && record.filesData!.isNotEmpty) {
    //   try {
    //     final filesDataList = jsonDecode(record.filesData!) as List;
    //     files = filesDataList
    //         .map((file) => FileModel.fromJson(file as Map<String, dynamic>))
    //         .toList();
    //   } catch (e) {
    //     print('Error parsing files: $e');
    //   }
    // }

    // Parse dailyReport JSON
    WarningDailyReportModel? dailyReport;
    if (record.dailyReportData != null && record.dailyReportData!.isNotEmpty) {
      try {
        final data = jsonDecode(record.dailyReportData!);
        dailyReport = WarningDailyReportModel.fromJson(data);
      } catch (e) {
        print('Error parsing dailyReport: $e');
      }
    }

    return WarningModel(
      id: record.id,
      uid: record.uid,
      warningType: record.warningType,
      dailyReportID: record.dailyReportID,
      companyID: record.companyID,
      roadID: record.roadID,
      workScopeID: record.workScopeID,
      contractRelationID: record.contractRelationID,
      fromSection: record.fromSection,
      toSection: record.toSection,
      warningItems: warningItems,
      requiresAction: record.requiresAction,
      isResolved: record.isResolved,
      resolvedByID: record.resolvedByID,
      resolvedAt: record.resolvedAt,
      resolutionNotes: record.resolutionNotes,
      longitude: record.longitude,
      latitude: record.latitude,
      description: record.description,
      createdByID: record.createdByID,
      createdAt: record.createdAt,
      updatedAt: record.updatedAt,
      deletedAt: record.deletedAt,
      company: company,
      road: road,
      workScope: workScope,
      createdBy: createdBy,
      resolvedBy: resolvedBy,
      files: files,
      dailyReport: dailyReport,
    );
  }

  @override
  Future<void> clearCache() async {
    try {
      await _database.delete(_database.warnings).go();
    } catch (e) {
      print('Error clearing warnings cache: $e');
    }
  }

  @override
  Future<WarningModel> createDraftWarningLocal({
    required String companyUID,
    required String roadUID,
    required String workScopeUID,
    required double fromSection,
    double? toSection,
  }) async {
    try {
      final uuid = const Uuid().v4();
      print('📝 Creating draft warning with UID: $uuid');

      // Get company record
      final companyRecord = await (_database.select(
        _database.companies,
      )..where((tbl) => tbl.uid.equals(companyUID))).getSingle();

      print('✅ Company found: ${companyRecord.name} (ID: ${companyRecord.id})');

      // Get road ID from roadUID - MUST exist
      final roadRecord = await (_database.select(
        _database.roads,
      )..where((tbl) => tbl.uid.equals(roadUID))).getSingleOrNull();

      if (roadRecord == null) {
        throw Exception('Road not found: $roadUID');
      }
      print('✅ Road found: ${roadRecord.name} (ID: ${roadRecord.id})');

      // Get work scope ID from workScopeUID - MUST exist
      final workScopeRecord = await (_database.select(
        _database.workScopes,
      )..where((tbl) => tbl.uid.equals(workScopeUID))).getSingleOrNull();

      if (workScopeRecord == null) {
        throw Exception('Work scope not found: $workScopeUID');
      }
      print(
        '✅ Work scope found: ${workScopeRecord.name} (ID: ${workScopeRecord.id})',
      );

      final now = DateTime.now();

      // Prepare JSON data for storage
      final workScopeDataJson = jsonEncode({
        'uid': workScopeUID,
        'name': workScopeRecord.name,
        'code': workScopeRecord.code,
      });

      final roadDataJson = jsonEncode({
        'uid': roadUID,
        'name': roadRecord.name,
        'roadNo': roadRecord.roadNo,
      });

      final companyDataJson = jsonEncode({
        'uid': companyRecord.uid,
        'name': companyRecord.name,
      });

      await _database
          .into(_database.warnings)
          .insert(
            WarningsCompanion(
              id: const Value.absent(), // NULL for draft
              uid: Value(uuid),
              warningType: const Value('SITE_WARNING'),
              status: const Value('DRAFT'),
              dailyReportID: const Value.absent(),
              companyID: Value(companyRecord.id),
              roadID: Value(roadRecord.id),
              workScopeID: Value(workScopeRecord.id),
              contractRelationID: const Value.absent(),
              fromSection: Value(
                fromSection.toString(),
              ), // ✅ Set from parameter
              toSection: Value(
                toSection?.toString(),
              ), // ✅ Set from parameter (nullable)
              requiresAction: const Value(true),
              isResolved: const Value(false),
              resolvedByID: const Value.absent(),
              resolvedAt: const Value.absent(),
              resolutionNotes: const Value.absent(),
              longitude: const Value.absent(),
              latitude: const Value.absent(),
              description: const Value.absent(),
              createdByID: const Value.absent(),
              createdAt: Value(now),
              updatedAt: Value(now),
              isSynced: const Value(false),
              workScopeData: Value(workScopeDataJson),
              roadData: Value(roadDataJson),
              companyData: Value(companyDataJson),
            ),
          );

      print('✅ Draft warning created in database: $uuid');

      // Fetch the created record and convert to model
      final createdRecord = await (_database.select(
        _database.warnings,
      )..where((tbl) => tbl.uid.equals(uuid))).getSingle();

      final warningModel = await _convertRecordToModel(createdRecord);

      print('✅ Draft warning model returned: ${warningModel.uid}');

      return warningModel;
    } catch (e) {
      print('❌ Error creating draft warning: $e');
      rethrow;
    }
  }

  @override
  Future<void> updateDraftWarningLocal(
    String draftUID,
    CreateWarningModel data,
  ) async {
    try {
      print('💾 Updating draft warning: $draftUID');
      print('   Road UID: ${data.roadUID}');
      print('   Work Scope UID: ${data.workScopeUID}');

      // Get road ID from roadUID - MUST exist
      final roadRecord = await (_database.select(
        _database.roads,
      )..where((tbl) => tbl.uid.equals(data.roadUID))).getSingleOrNull();

      if (roadRecord == null) {
        throw Exception('Road not found: ${data.roadUID}');
      }
      print('✅ Road found: ${roadRecord.name} (ID: ${roadRecord.id})');

      // Get work scope ID from workScopeUID - MUST exist
      final workScopeRecord = await (_database.select(
        _database.workScopes,
      )..where((tbl) => tbl.uid.equals(data.workScopeUID))).getSingleOrNull();

      if (workScopeRecord == null) {
        throw Exception('Work scope not found: ${data.workScopeUID}');
      }
      print(
        '✅ Work scope found: ${workScopeRecord.name} (ID: ${workScopeRecord.id})',
      );

      // Get contractor relation ID if provided (optional)
      int? contractRelationID;
      if (data.contractRelationUID != null) {
        final contractRelationRecord =
            await (_database.select(_database.contractorRelations)
                  ..where((tbl) => tbl.uid.equals(data.contractRelationUID!)))
                .getSingleOrNull();
        contractRelationID = contractRelationRecord?.id;
        if (contractRelationID != null) {
          print('✅ Contractor relation found (ID: $contractRelationID)');
        } else {
          print(
            '⚠️ Contractor relation not found in cache: ${data.contractRelationUID}',
          );
        }
      }

      // Convert warning reason UIDs to warning items JSON
      String? warningItemsData;
      if (data.warningReasonUIDs.isNotEmpty) {
        final warningItems = data.warningReasonUIDs.map((reasonUID) {
          return {
            'uid': const Uuid().v4(),
            'warningReasonUID': reasonUID,
            'isCompleted': false,
            'completedAt': null,
            'notes': null,
          };
        }).toList();
        warningItemsData = jsonEncode(warningItems);
      }

      // Get company record for storing company data
      final draftWarning = await (_database.select(
        _database.warnings,
      )..where((tbl) => tbl.uid.equals(draftUID))).getSingle();
      final companyRecord = await (_database.select(
        _database.companies,
      )..where((tbl) => tbl.id.equals(draftWarning.companyID))).getSingle();

      // Prepare JSON data for storage
      final workScopeDataJson = jsonEncode({
        'uid': data.workScopeUID,
        'name': workScopeRecord.name,
        'code': workScopeRecord.code,
      });

      final roadDataJson = jsonEncode({
        'uid': data.roadUID,
        'name': roadRecord.name,
        'roadNo': roadRecord.roadNo,
      });

      final companyDataJson = jsonEncode({
        'uid': companyRecord.uid,
        'name': companyRecord.name,
      });

      // Update draft warning with all data
      await (_database.update(
        _database.warnings,
      )..where((tbl) => tbl.uid.equals(draftUID))).write(
        WarningsCompanion(
          roadID: Value(roadRecord.id),
          workScopeID: Value(workScopeRecord.id),
          contractRelationID: Value(contractRelationID),
          fromSection: Value(data.fromSection.toString()),
          toSection: Value(data.toSection.toString()),
          latitude: Value(data.latitude?.toString()),
          longitude: Value(data.longitude?.toString()),
          description: Value(data.description),
          warningItemsData: Value(warningItemsData),
          requiresAction: Value(
            data.warningReasonUIDs.isNotEmpty ? true : false,
          ),
          updatedAt: Value(DateTime.now()),
          status: const Value('DRAFT'),
          workScopeData: Value(workScopeDataJson),
          roadData: Value(roadDataJson),
          companyData: Value(companyDataJson),
        ),
      );

      print('✅ Draft warning updated: $draftUID');
    } catch (e) {
      print('❌ Error updating draft warning: $e');
      rethrow;
    }
  }

  @override
  Future<void> deleteDraftWarning(String draftUID) async {
    try {
      print('🗑️ Deleting draft warning: $draftUID');

      await (_database.delete(
        _database.warnings,
      )..where((tbl) => tbl.uid.equals(draftUID))).go();

      print('✅ Draft warning deleted: $draftUID');
    } catch (e) {
      print('❌ Error deleting draft warning: $e');
      rethrow;
    }
  }

  @override
  Future<List<WarningModel>?> getDraftWarnings(String companyUID) async {
    try {
      print('📂 Loading draft warnings for company: $companyUID');

      // Get company record
      final companyRecord = await (_database.select(
        _database.companies,
      )..where((tbl) => tbl.uid.equals(companyUID))).getSingleOrNull();

      if (companyRecord == null) {
        print('❌ Company not found: $companyUID');
        return null;
      }

      print('✅ Company found: ${companyRecord.name} (ID: ${companyRecord.id})');

      // Debug: Query ALL warnings for this company to see what's in the database
      final allRecords =
          await (_database.select(_database.warnings)
                ..where((tbl) => tbl.companyID.equals(companyRecord.id))
                ..orderBy([(tbl) => OrderingTerm.desc(tbl.updatedAt)]))
              .get();

      print(
        '🔍 [DEBUG] Total warnings for company ${companyRecord.id}: ${allRecords.length}',
      );
      for (final record in allRecords) {
        print(
          '  - UID: ${record.uid}, status: ${record.status}, id: ${record.id}, deletedAt: ${record.deletedAt}',
        );
      }

      // Query for draft warnings only (status = 'DRAFT' and id is NULL)
      // Query for draft warnings only (status = 'DRAFT')
      final query = _database.select(_database.warnings)
        ..where(
          (tbl) =>
              tbl.companyID.equals(companyRecord.id) &
              tbl.status.equals('DRAFT') &
              tbl.deletedAt.isNull(),
        )
        ..orderBy([(tbl) => OrderingTerm.desc(tbl.updatedAt)]);

      final records = await query.get();

      print('📊 Found ${records.length} draft warnings');
      for (final record in records) {
        print(
          '  - Draft: ${record.uid}, status: ${record.status}, id: ${record.id}',
        );
      }

      if (records.isEmpty) {
        print('📭 No draft warnings found');
        return null;
      }

      print('✅ Found ${records.length} draft warnings');

      final warnings = await Future.wait(
        records.map((record) => _convertRecordToModel(record)),
      );

      return warnings;
    } catch (e) {
      print('❌ Error getting draft warnings: $e');
      return null;
    }
  }
}
