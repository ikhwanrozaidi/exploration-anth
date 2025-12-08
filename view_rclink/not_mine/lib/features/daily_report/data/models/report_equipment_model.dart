import 'package:freezed_annotation/freezed_annotation.dart';

part 'report_equipment_model.freezed.dart';
part 'report_equipment_model.g.dart';

@freezed
abstract class ReportEquipmentModel with _$ReportEquipmentModel {
  const factory ReportEquipmentModel({
    required int id,
    required String reportType, // 'DAILY_REPORT' (future: 'INSPECTION')
    int?
    dailyReportID, // Reference to DailyReports if reportType is DAILY_REPORT
    // Future: inspectionID for inspection module
    required int workEquipmentID, // Foreign key to WorkScopeEquipments
    required int addedByID, // Admin who added this equipment
    required DateTime createdAt,

    // Sync fields
    @Default(false) bool isSynced,
    DateTime? deletedAt,
    String? syncAction,
    @Default(0) int syncRetryCount,
    String? syncError,
    DateTime? lastSyncAttempt,
  }) = _ReportEquipmentModel;

  factory ReportEquipmentModel.fromJson(Map<String, dynamic> json) =>
      _$ReportEquipmentModelFromJson(json);
}
