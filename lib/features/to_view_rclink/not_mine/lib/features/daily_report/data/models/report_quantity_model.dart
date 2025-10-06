import 'package:freezed_annotation/freezed_annotation.dart';

part 'report_quantity_model.freezed.dart';
part 'report_quantity_model.g.dart';

@freezed
abstract class ReportQuantityModel with _$ReportQuantityModel {
  const factory ReportQuantityModel({
    required int id,
    required String reportType, // 'DAILY_REPORT' (future: 'INSPECTION')
    int?
    dailyReportID, // Reference to DailyReports if reportType is DAILY_REPORT
    // Future: inspectionID for inspection module
    required int quantityTypeID, // Foreign key to WorkQuantityTypes
    @Default(1) int sequenceNo, // For multiple entries of same type
    double? totalLength, // For R02: total measurement entered by user
    String? notes,
    required DateTime createdAt,
    required DateTime updatedAt,

    // Sync fields
    @Default(false) bool isSynced,
    DateTime? deletedAt,
    String? syncAction,
    @Default(0) int syncRetryCount,
    String? syncError,
    DateTime? lastSyncAttempt,
  }) = _ReportQuantityModel;

  factory ReportQuantityModel.fromJson(Map<String, dynamic> json) =>
      _$ReportQuantityModelFromJson(json);
}
