import 'dart:convert';
import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:rclink_app/features/daily_report/data/models/daily_report_equipment_model.dart';
import 'package:rclink_app/features/daily_report/data/models/daily_report_model.dart';
import 'package:rclink_app/features/daily_report/data/models/road_response_model.dart';
import 'package:rclink_app/features/daily_report/data/models/work_scope_response_model.dart';
import 'package:rclink_app/features/daily_report/data/models/report_quantities_model.dart';
import 'package:rclink_app/core/domain/models/file_model.dart';
import 'package:uuid/uuid.dart';
import '../../../../core/database/app_database.dart';
import '../../../road/domain/entities/road_edit_entity.dart';
import '../models/create_daily_report_model.dart';
import '../models/create_daily_report_equipment_model.dart';
import '../models/create_daily_report_quantity_model.dart';

abstract class DailyReportLocalDataSource {
  Future<List<DailyReportModel>?> getCachedDailyReports(
    String companyUID,
    String? search,
  );
  Future<DailyReportModel?> getCachedDailyReportByUid(String uid);
  Future<void> cacheDailyReports(List<DailyReportModel> reports);
  Future<void> cacheSingleDailyReport(DailyReportModel report);
  Future<void> clearCache();

  Future<DailyReportModel> createDailyReportLocal(
    CreateDailyReportModel data,
    String companyUID,
  );
  Future<void> updateReportWithServerData(
    String tempUID,
    DailyReportModel serverModel,
  );
  Future<void> markReportAsSynced(String uid);

  Future<({CreateDailyReportModel model, String companyUID})?>
  getUnsyncedReportData(String uid);

  // Future<List<RoadEdit>?> getCachedRoadsByDistrictName(String districtName);
  // Future<void> cacheRoads(List<RoadEdit> roads, String districtName);
  // Future<void> clearRoadEditCache();
}

@LazySingleton(as: DailyReportLocalDataSource)
class DailyReportLocalDataSourceImpl implements DailyReportLocalDataSource {
  final DatabaseService _databaseService;

  DailyReportLocalDataSourceImpl(this._databaseService);

  AppDatabase get _database => _databaseService.database;

  @override
  Future<List<DailyReportModel>?> getCachedDailyReports(
    String companyUID,
    String? search,
  ) async {
    try {
      final query = _database.select(_database.dailyReports)
        ..where((tbl) => tbl.deletedAt.isNull());

      // Add search filter if provided
      if (search != null && search.trim().isNotEmpty) {
        query.where(
          (tbl) => tbl.name.like('%${search.trim()}%'),
        );
      }

      final records = await query.get();

      if (records.isEmpty) {
        return null;
      }

      // Use helper method to convert records to models
      final reports = await Future.wait(
        records.map((record) => _convertRecordToModel(record)),
      );

      return reports.isEmpty ? null : reports;
    } catch (e) {
      // Error already logged in helper method if needed
      return null;
    }
  }

  @override
  Future<DailyReportModel?> getCachedDailyReportByUid(String uid) async {
    try {
      final record = await (_database.select(_database.dailyReports)
            ..where((tbl) => tbl.uid.equals(uid) & tbl.deletedAt.isNull()))
          .getSingleOrNull();

      if (record == null) {
        return null;
      }

      return await _convertRecordToModel(record);
    } catch (e) {
      print('Error getting cached daily report by UID: $e');
      return null;
    }
  }

  @override
  Future<void> cacheDailyReports(List<DailyReportModel> reports) async {
    try {
      await _database.delete(_database.dailyReports).go();

      for (final report in reports) {
        // Convert workScope to JSON
        String? workScopeData;
        if (report.workScope != null) {
          workScopeData = jsonEncode({
            'name': report.workScope!.name,
            'code': report.workScope!.code,
            'uid': report.workScope!.uid,
          });
        }

        // Convert road to JSON (includes district, state, and country data)
        String? roadData;
        if (report.road != null) {
          roadData = jsonEncode(report.road!.toJson());
        }

        // Convert equipments to JSON
        String? equipmentsJson;
        if (report.equipments!.isNotEmpty) {
          equipmentsJson = jsonEncode(
            report.equipments!
                .map((e) => {'name': e.name, 'uid': e.uid})
                .toList(),
          );
        }

        // Convert reportQuantities to JSON using model's toJson()
        String? reportQuantitiesJson;
        if (report.reportQuantities != null &&
            report.reportQuantities!.isNotEmpty) {
          reportQuantitiesJson = jsonEncode(
            report.reportQuantities!.map((q) => q.toJson()).toList(),
          );
        }

        await _database
            .into(_database.dailyReports)
            .insert(
              DailyReportsCompanion(
                id: Value(report.id),
                uid: Value(report.uid),
                name: Value(report.name),
                notes: Value(report.notes),
                weatherCondition: Value(report.weatherCondition),
                workPerformed: Value(report.workPerformed),
                longitude: report.longitude != null
                    ? Value(double.tryParse(report.longitude!))
                    : const Value.absent(),
                latitude: report.latitude != null
                    ? Value(double.tryParse(report.latitude!))
                    : const Value.absent(),
                companyID: Value(report.companyID),
                contractRelationID: Value(report.contractRelationID),
                status: Value(report.status),
                approvedByID: Value(report.approvedByID),
                approvedAt: Value(report.approvedAt),
                rejectionReason: Value(report.rejectionReason),
                workScopeID: Value(report.workScopeID),
                roadID: Value(report.roadID),
                totalWorkers: Value(report.totalWorkers),
                fromSection: report.fromSection != null
                    ? Value(double.tryParse(report.fromSection!))
                    : const Value.absent(),
                toSection: report.toSection != null
                    ? Value(double.tryParse(report.toSection!))
                    : const Value.absent(),
                createdByID: Value(report.createdByID),
                createdAt: Value(report.createdAt),
                updatedAt: Value(report.updatedAt),
                workScopeData: Value(workScopeData),
                roadData: Value(roadData),
                equipmentsData: Value(equipmentsJson),
                reportQuantitiesData: Value(reportQuantitiesJson),
              ),
            );

        // Save files if any
        if (report.files != null && report.files!.isNotEmpty) {
          for (final file in report.files!) {
            await _database.into(_database.files).insertOnConflictUpdate(
                  FilesCompanion(
                    id: Value(file.id),
                    uid: Value(file.uid),
                    fileName: Value(file.fileName),
                    s3Url: Value(file.s3Url),
                    mimeType: Value(file.mimeType),
                    size: Value(file.size),
                    sequence: Value(file.sequence),
                    companyID: Value(file.companyID),
                    contextType: Value(file.contextType),
                    contextField: Value(file.contextField),
                    uploadedByID: Value(file.uploadedByID),
                    dailyReportID: Value(report.id), // Link to daily report
                    createdAt: Value(file.createdAt ?? DateTime.now()),
                    updatedAt: Value(file.updatedAt ?? DateTime.now()),
                    isSynced: Value(file.isSynced),
                  ),
                );
          }
        }
      }
    } catch (e) {
      print('Error caching daily reports: $e');
    }
  }

  @override
  Future<void> cacheSingleDailyReport(DailyReportModel report) async {
    try {
      // Insert or update the single report (reuse logic from cacheDailyReports)
      await _database.into(_database.dailyReports).insertOnConflictUpdate(
            DailyReportsCompanion(
              id: Value(report.id),
              uid: Value(report.uid),
              name: Value(report.name),
              notes: Value(report.notes),
              weatherCondition: Value(report.weatherCondition),
              workPerformed: Value(report.workPerformed),
              companyID: Value(report.companyID),
              status: Value(report.status),
              contractRelationID: Value(report.contractRelationID),
              approvedByID: Value(report.approvedByID),
              approvedAt: Value(report.approvedAt),
              rejectionReason: Value(report.rejectionReason),
              workScopeID: Value(report.workScopeID),
              roadID: Value(report.roadID),
              totalWorkers: Value(report.totalWorkers),
              fromSection: Value(report.fromSection != null ? double.tryParse(report.fromSection!) : null),
              toSection: Value(report.toSection != null ? double.tryParse(report.toSection!) : null),
              longitude: Value(report.longitude != null ? double.tryParse(report.longitude!) : null),
              latitude: Value(report.latitude != null ? double.tryParse(report.latitude!) : null),
              createdByID: Value(report.createdByID),
              createdAt: Value(report.createdAt),
              updatedAt: Value(report.updatedAt),
              workScopeData: Value(report.workScope != null
                  ? jsonEncode({
                      'name': report.workScope!.name,
                      'code': report.workScope!.code,
                      'uid': report.workScope!.uid,
                    })
                  : null),
              roadData: Value(report.road != null
                  ? jsonEncode(report.road!.toJson())
                  : null),
              equipmentsData: Value(report.equipments!.isNotEmpty
                  ? jsonEncode(
                      report.equipments!
                          .map((e) => {'name': e.name, 'uid': e.uid})
                          .toList(),
                    )
                  : null),
              reportQuantitiesData:
                  Value(report.reportQuantities != null &&
                          report.reportQuantities!.isNotEmpty
                      ? jsonEncode(
                          report.reportQuantities!.map((q) => q.toJson()).toList(),
                        )
                      : null),
            ),
          );

      // Cache files if any
      if (report.files != null && report.files!.isNotEmpty) {
        for (final file in report.files!) {
          await _database.into(_database.files).insertOnConflictUpdate(
                FilesCompanion(
                  id: Value(file.id),
                  uid: Value(file.uid),
                  fileName: Value(file.fileName),
                  s3Url: Value(file.s3Url),
                  mimeType: Value(file.mimeType),
                  size: Value(file.size),
                  sequence: Value(file.sequence),
                  companyID: Value(file.companyID),
                  contextType: Value(file.contextType),
                  contextField: Value(file.contextField),
                  uploadedByID: Value(file.uploadedByID),
                  dailyReportID: Value(report.id),
                  createdAt: Value(file.createdAt ?? DateTime.now()),
                  updatedAt: Value(file.updatedAt ?? DateTime.now()),
                  isSynced: Value(file.isSynced),
                ),
              );
        }
      }
    } catch (e) {
      print('Error caching single daily report: $e');
    }
  }

  @override
  Future<void> clearCache() async {
    try {
      await _database.delete(_database.dailyReports).go();
    } catch (e) {
      print('Error clearing daily reports cache: $e');
    }
  }

  @override
  Future<DailyReportModel> createDailyReportLocal(
    CreateDailyReportModel data,
    String companyUID,
  ) async {
    return await _database.transaction(() async {
      try {
        // Generate temp UID
        final tempUID = const Uuid().v4();
        final now = DateTime.now();

        // Validate company exists
        final company = await (_database.select(
          _database.companies,
        )..where((tbl) => tbl.uid.equals(companyUID))).getSingleOrNull();

        if (company == null) {
          throw Exception('Company not found: $companyUID');
        }

        // Serialize data for future sync using model's toJson()
        final workScopeJson = jsonEncode({'uid': data.workScopeUID});
        final roadJson = jsonEncode({'uid': data.roadUID});
        final equipmentsJson = data.equipments != null
            ? jsonEncode(data.equipments!.map((e) => e.toJson()).toList())
            : null;
        final quantitiesJson = data.quantities != null
            ? jsonEncode(data.quantities!.map((q) => q.toJson()).toList())
            : null;

        // Insert into database with temp UID and sync flags
        await _database
            .into(_database.dailyReports)
            .insert(
              DailyReportsCompanion(
                uid: Value(tempUID),
                name: Value(data.name),
                notes: Value(data.notes),
                weatherCondition: Value(
                  data.weatherCondition.name.toUpperCase(),
                ),
                workPerformed: Value(data.workPerformed),
                longitude: data.longitude != null
                    ? Value(data.longitude)
                    : const Value.absent(),
                latitude: data.latitude != null
                    ? Value(data.latitude)
                    : const Value.absent(),
                companyID: Value(company.id),
                workScopeID: Value(0), // Will be updated from server
                roadID: Value(0), // Will be updated from server
                totalWorkers: Value(data.totalWorkers),
                fromSection: data.fromSection != null
                    ? Value(data.fromSection)
                    : const Value.absent(),
                toSection: data.toSection != null
                    ? Value(data.toSection)
                    : const Value.absent(),
                createdByID: Value(0), // Will be updated from server
                createdAt: Value(now),
                updatedAt: Value(now),
                isSynced: const Value(false),
                syncAction: const Value('CREATE'),
                workScopeData: Value(workScopeJson),
                roadData: Value(roadJson),
                equipmentsData: Value(equipmentsJson),
                reportQuantitiesData: Value(quantitiesJson),
              ),
            );

        // Read back the created record from database
        final createdRecord = await (_database.select(
          _database.dailyReports,
        )..where((tbl) => tbl.uid.equals(tempUID))).getSingle();

        // Convert to model using same logic as getCachedDailyReports
        return await _convertRecordToModel(createdRecord);
      } catch (e) {
        // Let transaction auto-rollback on error
        rethrow;
      }
    });
  }

  /// Helper method to convert DailyReportRecord to DailyReportModel
  /// Shared logic between getCachedDailyReports and createDailyReportLocal
  Future<DailyReportModel> _convertRecordToModel(DailyReportRecord record) async {
    // Parse workScope JSON
    WorkScopeResponseModel? workScope;
    if (record.workScopeData != null && record.workScopeData!.isNotEmpty) {
      try {
        final data = jsonDecode(record.workScopeData!);
        workScope = WorkScopeResponseModel(
          name: data['name'] as String,
          code: data['code'] as String,
          uid: data['uid'] as String,
        );
      } catch (e) {
        // Silently skip parsing errors for optional fields
      }
    }

    // Parse road JSON (includes district, state, and country data)
    RoadResponseModel? road;
    if (record.roadData != null && record.roadData!.isNotEmpty) {
      try {
        final data = jsonDecode(record.roadData!);
        road = RoadResponseModel.fromJson(data);
      } catch (e) {
        // Silently skip parsing errors for optional fields
      }
    }

    // Parse equipments JSON
    List<DailyReportEquipmentModel> equipments = [];
    if (record.equipmentsData != null && record.equipmentsData!.isNotEmpty) {
      try {
        final List<dynamic> equipmentsData = jsonDecode(record.equipmentsData!);
        equipments = equipmentsData
            .map(
              (e) => DailyReportEquipmentModel(
                name: e['name'] as String,
                uid: e['uid'] as String,
              ),
            )
            .toList();
      } catch (e) {
        // Silently skip parsing errors for optional fields
      }
    }

    // Parse reportQuantities JSON using models
    List<ReportQuantitiesModel> reportQuantities = [];
    if (record.reportQuantitiesData != null &&
        record.reportQuantitiesData!.isNotEmpty) {
      try {
        final List<dynamic> quantitiesData = jsonDecode(
          record.reportQuantitiesData!,
        );
        reportQuantities = quantitiesData
            .map((q) => ReportQuantitiesModel.fromJson(q))
            .toList();
      } catch (e) {
        // Silently skip parsing errors for optional fields
      }
    }

    // Parse files from Files table
    List<FileModel> files = [];
    try {
      final fileRecords = await (_database.select(_database.files)
            ..where(
                (tbl) => tbl.dailyReportID.equals(record.id) & tbl.deletedAt.isNull()))
          .get();

      files = fileRecords.map((f) => FileModel.fromDatabaseRecord(f)).toList();
    } catch (e) {
      // Silently skip parsing errors for optional fields
    }

    return DailyReportModel(
      id: record.id,
      uid: record.uid,
      name: record.name,
      notes: record.notes,
      weatherCondition: record.weatherCondition,
      workPerformed: record.workPerformed,
      companyID: record.companyID,
      status: record.status,
      contractRelationID: record.contractRelationID,
      approvedByID: record.approvedByID,
      approvedAt: record.approvedAt,
      rejectionReason: record.rejectionReason,
      workScopeID: record.workScopeID,
      roadID: record.roadID,
      totalWorkers: record.totalWorkers,
      fromSection: record.fromSection?.toString(),
      toSection: record.toSection?.toString(),
      longitude: record.longitude?.toString(),
      latitude: record.latitude?.toString(),
      createdByID: record.createdByID,
      createdAt: record.createdAt,
      updatedAt: record.updatedAt,
      company: null,
      workScope: workScope,
      road: road,
      equipments: equipments,
      reportQuantities: reportQuantities,
      files: files,
    );
  }

  @override
  Future<void> updateReportWithServerData(
    String tempUID,
    DailyReportModel serverModel,
  ) async {
    try {
      await (_database.update(
        _database.dailyReports,
      )..where((tbl) => tbl.uid.equals(tempUID))).write(
        DailyReportsCompanion(
          id: Value(serverModel.id),
          uid: Value(serverModel.uid), // Replace temp UID with server UID
          name: Value(serverModel.name),
          notes: Value(serverModel.notes),
          weatherCondition: Value(serverModel.weatherCondition),
          workPerformed: Value(serverModel.workPerformed),
          companyID: Value(serverModel.companyID),
          workScopeID: Value(serverModel.workScopeID),
          roadID: Value(serverModel.roadID),
          totalWorkers: Value(serverModel.totalWorkers),
          createdByID: Value(serverModel.createdByID),
          updatedAt: Value(DateTime.now()),
          isSynced: const Value(true),
          syncAction: const Value.absent(), // Clear sync action
        ),
      );

      print('✅ Updated report: $tempUID → ${serverModel.uid}');
    } catch (e) {
      print('❌ Error updating report with server data: $e');
      rethrow;
    }
  }

  @override
  Future<void> markReportAsSynced(String uid) async {
    try {
      await (_database.update(
        _database.dailyReports,
      )..where((tbl) => tbl.uid.equals(uid))).write(
        DailyReportsCompanion(
          isSynced: const Value(true),
          syncAction: const Value.absent(),
          updatedAt: Value(DateTime.now()),
        ),
      );

      print('✅ Marked report as synced: $uid');
    } catch (e) {
      print('❌ Error marking report as synced: $e');
      rethrow;
    }
  }

  @override
  Future<({CreateDailyReportModel model, String companyUID})?>
  getUnsyncedReportData(String uid) async {
    try {
      final record =
          await (_database.select(_database.dailyReports)..where(
                (tbl) => tbl.uid.equals(uid) & tbl.isSynced.equals(false),
              ))
              .getSingleOrNull();

      if (record == null) {
        return null;
      }

      // Get company UID from companies table
      final company = await (_database.select(
        _database.companies,
      )..where((tbl) => tbl.id.equals(record.companyID))).getSingleOrNull();

      if (company == null) {
        print('⚠️ Company not found for ID ${record.companyID}');
        return null;
      }

      // Reconstruct workScopeUID from JSON
      String? workScopeUID;
      if (record.workScopeData != null && record.workScopeData!.isNotEmpty) {
        final data = jsonDecode(record.workScopeData!);
        workScopeUID = data['uid'] as String?;
      }

      // Reconstruct roadUID from JSON
      String? roadUID;
      if (record.roadData != null && record.roadData!.isNotEmpty) {
        final data = jsonDecode(record.roadData!);
        roadUID = data['uid'] as String?;
      }

      if (workScopeUID == null || roadUID == null) {
        print('⚠️ Missing required UIDs for report $uid');
        return null;
      }

      // Reconstruct equipments
      List<CreateDailyReportEquipmentModel>? equipments;
      if (record.equipmentsData != null && record.equipmentsData!.isNotEmpty) {
        final List<dynamic> data = jsonDecode(record.equipmentsData!);
        equipments = data
            .map((e) => CreateDailyReportEquipmentModel.fromJson(e))
            .toList();
      }

      // Reconstruct quantities
      List<CreateDailyReportQuantityModel>? quantities;
      if (record.reportQuantitiesData != null &&
          record.reportQuantitiesData!.isNotEmpty) {
        final List<dynamic> data = jsonDecode(record.reportQuantitiesData!);
        quantities = data
            .map((q) => CreateDailyReportQuantityModel.fromJson(q))
            .toList();
      }

      // Reconstruct weather enum
      final weatherCondition = WeatherCondition.values.firstWhere(
        (e) => e.name.toUpperCase() == record.weatherCondition,
        orElse: () => WeatherCondition.sunny,
      );

      final createModel = CreateDailyReportModel(
        name: record.name,
        notes: record.notes,
        weatherCondition: weatherCondition,
        workPerformed: record.workPerformed,
        workScopeUID: workScopeUID,
        roadUID: roadUID,
        totalWorkers: record.totalWorkers,
        fromSection: record.fromSection,
        toSection: record.toSection,
        longitude: record.longitude,
        latitude: record.latitude,
        equipments: equipments,
        quantities: quantities,
      );

      return (model: createModel, companyUID: company.uid);
    } catch (e) {
      print('❌ Error getting unsynced report data: $e');
      return null;
    }
  }

  // @override
  // Future<List<RoadEdit>?> getCachedRoadsByDistrictName(
  //   String districtName,
  // ) async {
  //   try {
  //     // Query roads from database joined with districts to filter by name
  //     final query = _database.select(_database.roads).join([
  //       leftOuterJoin(
  //         _database.districts,
  //         _database.districts.id.equalsExp(_database.roads.districtId),
  //       ),
  //     ])..where(_database.districts.name.equals(districtName));

  //     final results = await query.get();

  //     if (results.isEmpty) {
  //       print('💾 No cached roads found for district: $districtName');
  //       return null;
  //     }

  //     final roadEntities = results.map((row) {
  //       final road = row.readTable(_database.roads);
  //       final district = row.readTableOrNull(_database.districts);

  //       return RoadEdit(
  //         id: road.id,
  //         uid: road.uid,
  //         name: road.name,
  //         roadNo: road.roadNo,
  //         sectionStart: road.sectionStart?.toString(),
  //         sectionFinish: road.sectionFinish?.toString(),
  //         districtId: road.districtId,
  //         districtName: district?.name,
  //       );
  //     }).toList();

  //     print(
  //       '✅ Retrieved ${roadEntities.length} cached roads for district: $districtName',
  //     );
  //     return roadEntities;
  //   } catch (e) {
  //     print('❌ Error getting cached roads: $e');
  //     return null;
  //   }
  // }

  // @override
  // Future<void> cacheRoads(List<RoadEdit> roads, String districtName) async {
  //   try {
  //     await _database.transaction(() async {
  //       for (final road in roads) {
  //         if (road.id != null && road.uid != null) {
  //           await _database
  //               .into(_database.roads)
  //               .insertOnConflictUpdate(
  //                 RoadsCompanion(
  //                   id: Value(road.id!),
  //                   uid: Value(road.uid!),
  //                   name: Value(road.name ?? ''),
  //                   roadNo: Value(road.roadNo ?? ''),
  //                   sectionStart: road.sectionStart != null
  //                       ? Value(road.sectionStart!)
  //                       : const Value.absent(),
  //                   sectionFinish: road.sectionFinish != null
  //                       ? Value(road.sectionFinish!)
  //                       : const Value.absent(),
  //                   districtId: road.districtId != null
  //                       ? Value(road.districtId!)
  //                       : const Value.absent(),
  //                   createdAt: Value(DateTime.now()),
  //                   updatedAt: Value(DateTime.now()),
  //                   isSynced: const Value(true),
  //                 ),
  //               );
  //         }
  //       }
  //     });

  //     print('💾 Cached ${roads.length} roads for district: $districtName');
  //   } catch (e) {
  //     print('❌ Error caching roads: $e');
  //   }
  // }

  // @override
  // Future<void> clearRoadEditCache() async {
  //   try {
  //     await _database.delete(_database.roads).go();
  //     print('✅ Road edit cache cleared from database');
  //   } catch (e) {
  //     print('❌ Error clearing road edit cache: $e');
  //   }
  // }
}
