import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/daily_report.dart';
import 'daily_report_equipment_model.dart';

part 'daily_report_model.freezed.dart';
part 'daily_report_model.g.dart';

@freezed
abstract class DailyReportModel with _$DailyReportModel {
  const DailyReportModel._();

  const factory DailyReportModel({
    required int id,
    required String uid,
    required String name,
    String? notes,
    required String weatherCondition,
    @Default(false) bool workPerformed,

    // Location coordinates
    String? longitude,
    String? latitude,

    // Primary ownership - the company this report belongs to
    required int companyID,

    // Optional contract relationship (null for in-house work)
    int? contractRelationID,

    // Report status for workflow management
    @Default('SUBMITTED') String status,

    // Optional approval tracking
    int? approvedByID,
    DateTime? approvedAt,
    String? rejectionReason,

    // Work scope from the company
    required int workScopeID,

    required int roadID,
    int? totalWorkers,
    String? fromSection,
    String? toSection,

    // Admin who created this report
    required int createdByID,

    required DateTime createdAt,
    required DateTime updatedAt,

    // Equipments stored as JSON
    // Equipments stored as JSON
    @JsonKey(name: 'equipments') List<DailyReportEquipmentModel>? equipments,

    // Sync fields
    @Default(false) bool isSynced,
    DateTime? deletedAt,
    String? syncAction,
    @Default(0) int syncRetryCount,
    String? syncError,
    DateTime? lastSyncAttempt,
  }) = _DailyReportModel;

  factory DailyReportModel.fromJson(Map<String, dynamic> json) =>
      _$DailyReportModelFromJson(json);

  // Convert model to entity
  DailyReport toEntity() {
    final convertedEquipments =
        equipments?.map((e) => e.toEntity()).toList() ?? [];

    return DailyReport(
      id: id,
      uid: uid,
      name: name,
      notes: notes,
      weatherCondition: weatherCondition,
      workPerformed: workPerformed,
      companyID: companyID,
      status: status,
      contractRelationID: contractRelationID,
      approvedByID: approvedByID,
      approvedAt: approvedAt,
      rejectionReason: rejectionReason,
      workScopeID: workScopeID,
      roadID: roadID,
      totalWorkers: totalWorkers,
      fromSection: fromSection?.toString(),
      toSection: toSection?.toString(),
      longitude: longitude?.toString(),
      latitude: latitude?.toString(),
      createdByID: createdByID,
      createdAt: createdAt,
      updatedAt: updatedAt,
      equipments: convertedEquipments,
    );
  }
}
