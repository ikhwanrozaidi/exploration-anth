import 'package:freezed_annotation/freezed_annotation.dart';

part 'daily_report_model.freezed.dart';
part 'daily_report_model.g.dart';

@freezed
abstract class DailyReportModel with _$DailyReportModel {
  const factory DailyReportModel({
    required int id,
    required String uid,
    required String name,
    String? notes,
    required String weatherCondition,
    @Default(false) bool workPerformed,

    // Location coordinates
    double? longitude,
    double? latitude,

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
    double? fromSection,
    double? toSection,

    // Admin who created this report
    required int createdByID,

    required DateTime createdAt,
    required DateTime updatedAt,

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
}
