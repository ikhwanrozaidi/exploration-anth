import 'dart:convert';
import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/database/app_database.dart';
import '../../domain/entities/daily_report_response.dart';
import '../../domain/entities/daily_report_equipment_response.dart';
import '../../domain/entities/quantity_value_response.dart';
import '../../domain/entities/report_quantity_response.dart';
import '../../domain/entities/road_edit_entity.dart';
import '../../domain/entities/work_scope_response.dart';
import '../../domain/entities/road_response.dart';

abstract class DailyReportLocalDataSource {
  Future<List<DailyReportResponse>?> getCachedDailyReports(String companyUID);
  Future<void> cacheDailyReports(List<DailyReportResponse> reports);
  Future<void> clearCache();

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
  Future<List<DailyReportResponse>?> getCachedDailyReports(
    String companyUID,
  ) async {
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

        return DailyReportResponse(
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
  Future<void> cacheDailyReports(List<DailyReportResponse> reports) async {
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
