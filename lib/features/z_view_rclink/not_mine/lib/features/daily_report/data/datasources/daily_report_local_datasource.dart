import 'dart:convert';
import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:uuid/uuid.dart';
import '../../../../core/database/app_database.dart';
import '../../../road/domain/entities/road_edit_entity.dart';
import '../../domain/entities/daily_report.dart';
import '../../domain/entities/daily_report_equipment_response.dart';
import '../../domain/entities/quantity_value_response.dart';
import '../../domain/entities/report_quantity_response.dart';
import '../../domain/entities/work_scope_response.dart';
import '../../domain/entities/road_response.dart';
import '../models/create_daily_report_model.dart';
import '../models/create_daily_report_equipment_model.dart';
import '../models/create_daily_report_quantity_model.dart';

abstract class DailyReportLocalDataSource {
  Future<List<DailyReport>?> getCachedDailyReports(String companyUID);
  Future<void> cacheDailyReports(List<DailyReport> reports);
  Future<void> clearCache();

  Future<DailyReport> createDailyReportLocal(
    CreateDailyReportModel data,
    String companyUID,
  );
  Future<void> updateReportWithServerData(
    String tempUID,
    Map<String, dynamic> serverData,
  );
  Future<void> markReportAsSynced(String uid);

  Future<({CreateDailyReportModel model, String companyUID})?>
  getUnsyncedReportData(String uid);

  Future<List<RoadEdit>?> getCachedRoadsByDistrictName(String districtName);
  Future<void> cacheRoads(List<RoadEdit> roads, String districtName);
  Future<void> clearRoadEditCache();
}

@LazySingleton(as: DailyReportLocalDataSource)
class DailyReportLocalDataSourceImpl implements DailyReportLocalDataSource {
  final DatabaseService _databaseService;

  DailyReportLocalDataSourceImpl(this._databaseService);

  AppDatabase get _database => _databaseService.database;

  @override
  Future<List<DailyReport>?> getCachedDailyReports(String companyUID) async {
    try {
      final records = await (_database.select(
        _database.dailyReports,
      )..where((tbl) => tbl.deletedAt.isNull())).get();

      if (records.isEmpty) {
        return null;
      }

      final reports = records.map((record) {
        // Parse workScope JSON
        WorkScopeResponse? workScope;
        if (record.workScopeData != null && record.workScopeData!.isNotEmpty) {
          try {
            final data = jsonDecode(record.workScopeData!);
            workScope = WorkScopeResponse(
              name: data['name'] as String,
              code: data['code'] as String,
              uid: data['uid'] as String,
            );
          } catch (e) {
            print('Error parsing workScope JSON: $e');
          }
        }

        // Parse road JSON
        RoadResponse? road;
        if (record.roadData != null && record.roadData!.isNotEmpty) {
          try {
            final data = jsonDecode(record.roadData!);
            road = RoadResponse(
              name: data['name'] as String,
              roadNo: data['roadNo'] as String,
              uid: data['uid'] as String,
            );
          } catch (e) {
            print('Error parsing road JSON: $e');
          }
        }

        // Parse equipments JSON
        List<DailyReportEquipmentResponse> equipments = [];
        if (record.equipmentsData != null &&
            record.equipmentsData!.isNotEmpty) {
          try {
            final List<dynamic> equipmentsData = jsonDecode(
              record.equipmentsData!,
            );
            equipments = equipmentsData
                .map(
                  (e) => DailyReportEquipmentResponse(
                    name: e['name'] as String,
                    uid: e['uid'] as String,
                  ),
                )
                .toList();
          } catch (e) {
            print('Error parsing equipments JSON: $e');
          }
        }

        // Parse reportQuantities JSON
        List<ReportQuantityResponse> reportQuantities = [];
        if (record.reportQuantitiesData != null &&
            record.reportQuantitiesData!.isNotEmpty) {
          try {
            final List<dynamic> quantitiesData = jsonDecode(
              record.reportQuantitiesData!,
            );
            reportQuantities = quantitiesData.map((q) {
              final quantityType = QuantityTypeResponse(
                name: q['quantityType']['name'] as String,
                code: q['quantityType']['code'] as String,
                uid: q['quantityType']['uid'] as String,
              );

              final quantityValues = (q['quantityValues'] as List).map((v) {
                final quantityField = QuantityFieldResponse(
                  name: v['quantityField']['name'] as String,
                  fieldType: v['quantityField']['fieldType'] as String,
                  unit: v['quantityField']['unit'] as String?,
                  uid: v['quantityField']['uid'] as String,
                );

                return QuantityValueResponse(
                  value: v['value'] as String,
                  quantityField: quantityField,
                );
              }).toList();

              return ReportQuantityResponse(
                quantityType: quantityType,
                quantityValues: quantityValues,
              );
            }).toList();
          } catch (e) {
            print('Error parsing reportQuantities JSON: $e');
          }
        }

        return DailyReport(
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
        );
      }).toList();

      return reports.isEmpty ? null : reports;
    } catch (e) {
      print('Error loading cached daily reports: $e');
      return null;
    }
  }

  @override
  Future<void> cacheDailyReports(List<DailyReport> reports) async {
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

        // Convert road to JSON
        String? roadData;
        if (report.road != null) {
          roadData = jsonEncode({
            'name': report.road!.name,
            'roadNo': report.road!.roadNo,
            'uid': report.road!.uid,
          });
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

        // Convert reportQuantities to JSON
        String? reportQuantitiesJson;
        if (report.reportQuantities!.isNotEmpty) {
          reportQuantitiesJson = jsonEncode(
            report.reportQuantities!
                .map(
                  (q) => {
                    'quantityType': {
                      'name': q.quantityType.name,
                      'code': q.quantityType.code,
                      'uid': q.quantityType.uid,
                    },
                    'quantityValues': q.quantityValues
                        .map(
                          (v) => {
                            'value': v.value,
                            'quantityField': {
                              'name': v.quantityField.name,
                              'fieldType': v.quantityField.fieldType,
                              'unit': v.quantityField.unit,
                              'uid': v.quantityField.uid,
                            },
                          },
                        )
                        .toList(),
                  },
                )
                .toList(),
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
              ),
            );
      }
    } catch (e) {
      print('Error caching daily reports: $e');
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
  Future<DailyReport> createDailyReportLocal(
    CreateDailyReportModel data,
    String companyUID,
  ) async {
    try {
      // Generate temp UID
      final tempUID = const Uuid().v4();
      final now = DateTime.now();

      // Get actual company ID from companies table
      final company = await (_database.select(
        _database.companies,
      )..where((tbl) => tbl.uid.equals(companyUID))).getSingleOrNull();

      final actualCompanyID = company?.id ?? 0;

      // Serialize data for future sync
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
              weatherCondition: Value(data.weatherCondition.name.toUpperCase()),
              workPerformed: Value(data.workPerformed),
              longitude: data.longitude != null
                  ? Value(data.longitude)
                  : const Value.absent(),
              latitude: data.latitude != null
                  ? Value(data.latitude)
                  : const Value.absent(),
              companyID: Value(actualCompanyID),
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

      print('✅ Created local report with temp UID: $tempUID');

      // Return created entity
      return DailyReport(
        id: 0, // Temp ID
        uid: tempUID,
        name: data.name,
        notes: data.notes,
        weatherCondition: data.weatherCondition.name.toUpperCase(),
        workPerformed: data.workPerformed,
        companyID: actualCompanyID,
        workScopeID: 0,
        roadID: 0,
        totalWorkers: data.totalWorkers,
        fromSection: data.fromSection?.toString(),
        toSection: data.toSection?.toString(),
        longitude: data.longitude?.toString(),
        latitude: data.latitude?.toString(),
        createdByID: 0,
        createdAt: now,
        updatedAt: now,
        status: 'DRAFT',
        company: null,
        reportQuantities: const [],
      );
    } catch (e) {
      print('❌ Error creating local report: $e');
      rethrow;
    }
  }

  @override
  Future<void> updateReportWithServerData(
    String tempUID,
    Map<String, dynamic> serverData,
  ) async {
    try {
      await (_database.update(
        _database.dailyReports,
      )..where((tbl) => tbl.uid.equals(tempUID))).write(
        DailyReportsCompanion(
          id: Value(serverData['id'] as int),
          uid: Value(
            serverData['uid'] as String,
          ), // Replace temp UID with server UID
          name: Value(serverData['name'] as String),
          notes: Value(serverData['notes'] as String?),
          weatherCondition: Value(serverData['weatherCondition'] as String),
          workPerformed: Value(serverData['workPerformed'] as bool? ?? true),
          companyID: Value(serverData['companyID'] as int),
          workScopeID: Value(serverData['workScopeID'] as int),
          roadID: Value(serverData['roadID'] as int),
          totalWorkers: Value(serverData['totalWorkers'] as int?),
          createdByID: Value(serverData['createdByID'] as int),
          updatedAt: Value(DateTime.now()),
          isSynced: const Value(true),
          syncAction: const Value.absent(), // Clear sync action
        ),
      );

      print('✅ Updated report: $tempUID → ${serverData['uid']}');
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

  @override
  Future<List<RoadEdit>?> getCachedRoadsByDistrictName(
    String districtName,
  ) async {
    try {
      // Query roads from database joined with districts to filter by name
      final query = _database.select(_database.roads).join([
        leftOuterJoin(
          _database.districts,
          _database.districts.id.equalsExp(_database.roads.districtId),
        ),
      ])..where(_database.districts.name.equals(districtName));

      final results = await query.get();

      if (results.isEmpty) {
        print('💾 No cached roads found for district: $districtName');
        return null;
      }

      final roadEntities = results.map((row) {
        final road = row.readTable(_database.roads);
        final district = row.readTableOrNull(_database.districts);

        return RoadEdit(
          id: road.id,
          uid: road.uid,
          name: road.name,
          roadNo: road.roadNo,
          sectionStart: road.sectionStart?.toString(),
          sectionFinish: road.sectionFinish?.toString(),
          districtId: road.districtId,
          districtName: district?.name,
        );
      }).toList();

      print(
        '✅ Retrieved ${roadEntities.length} cached roads for district: $districtName',
      );
      return roadEntities;
    } catch (e) {
      print('❌ Error getting cached roads: $e');
      return null;
    }
  }

  @override
  Future<void> cacheRoads(List<RoadEdit> roads, String districtName) async {
    try {
      await _database.transaction(() async {
        for (final road in roads) {
          if (road.id != null && road.uid != null) {
            await _database
                .into(_database.roads)
                .insertOnConflictUpdate(
                  RoadsCompanion(
                    id: Value(road.id!),
                    uid: Value(road.uid!),
                    name: Value(road.name ?? ''),
                    roadNo: Value(road.roadNo ?? ''),
                    sectionStart: road.sectionStart != null
                        ? Value(road.sectionStart!)
                        : const Value.absent(),
                    sectionFinish: road.sectionFinish != null
                        ? Value(road.sectionFinish!)
                        : const Value.absent(),
                    districtId: road.districtId != null
                        ? Value(road.districtId!)
                        : const Value.absent(),
                    createdAt: Value(DateTime.now()),
                    updatedAt: Value(DateTime.now()),
                    isSynced: const Value(true),
                  ),
                );
          }
        }
      });

      print('💾 Cached ${roads.length} roads for district: $districtName');
    } catch (e) {
      print('❌ Error caching roads: $e');
    }
  }

  @override
  Future<void> clearRoadEditCache() async {
    try {
      await _database.delete(_database.roads).go();
      print('✅ Road edit cache cleared from database');
    } catch (e) {
      print('❌ Error clearing road edit cache: $e');
    }
  }
}
