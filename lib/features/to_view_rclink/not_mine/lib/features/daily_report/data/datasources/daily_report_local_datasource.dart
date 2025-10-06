import 'dart:convert';
import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/database/app_database.dart';
import '../../domain/entities/daily_report.dart';
import '../../domain/entities/daily_report_equipment.dart';

abstract class DailyReportLocalDataSource {
  Future<List<DailyReport>?> getCachedDailyReports(String companyUID);
  Future<void> cacheDailyReports(List<DailyReport> reports);
  Future<void> clearCache();
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

      // Convert database records to domain entities
      final reports = records.map((record) {
        // Parse equipments JSON
        List<DailyReportEquipment> equipments = [];
        if (record.equipmentsJson != null &&
            record.equipmentsJson!.isNotEmpty) {
          try {
            final List<dynamic> equipmentsData = jsonDecode(
              record.equipmentsJson!,
            );
            equipments = equipmentsData
                .map(
                  (e) => DailyReportEquipment(
                    name: e['name'] as String,
                    uid: e['uid'] as String,
                  ),
                )
                .toList();
          } catch (e) {
            print('Error parsing equipments JSON: $e');
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
          equipments: equipments,
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
      // Clear existing daily reports
      await _database.delete(_database.dailyReports).go();

      // Insert new daily reports
      for (final report in reports) {
        // Convert equipments to JSON string
        String? equipmentsJson;
        if (report.equipments.isNotEmpty) {
          equipmentsJson = jsonEncode(
            report.equipments
                .map((e) => {'name': e.name, 'uid': e.uid})
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
                equipmentsJson: Value(equipmentsJson),
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
}
