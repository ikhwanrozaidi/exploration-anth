import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rclink_app/features/daily_report/domain/entities/daily_report.dart';
import '../daily_report_create/daily_report_create_state.dart';

part 'daily_report_edit_state.freezed.dart';

/// Edit bloc state reuses the same ReportData structure from CREATE
/// This ensures consistency and allows reusing the same widgets
@freezed
class DailyReportEditState with _$DailyReportEditState {
  /// Initial state before loading
  const factory DailyReportEditState.initial() = EditInitial;

  /// Loading existing report data
  const factory DailyReportEditState.loading() = EditLoading;

  /// Editing state with report data
  /// Uses ReportData from CREATE bloc for consistency
  const factory DailyReportEditState.editing({
    required ReportApiData apiData,
    required ReportSelections selections,
    required ReportFormData formData,
    required String reportUID, // Track which report we're editing
    required String companyUID,
  }) = EditingReport;

  /// Loading quantities and equipment
  const factory DailyReportEditState.loadingData({
    required ReportApiData apiData,
    required ReportSelections selections,
    required ReportFormData formData,
    required String reportUID,
    required String companyUID,
  }) = LoadingDataEdit;

  /// Error loading data
  const factory DailyReportEditState.loadError({
    required String message,
    required String reportUID,
  }) = LoadErrorEdit;

  /// Submitting update to server
  const factory DailyReportEditState.submitting({
    required ReportApiData apiData,
    required ReportSelections selections,
    required ReportFormData formData,
    required String reportUID,
    required String companyUID,
  }) = SubmittingUpdate;

  /// Update successful
  const factory DailyReportEditState.success({
    required DailyReport updatedReport,
  }) = UpdateSuccess;

  /// Update failed
  const factory DailyReportEditState.error({
    required String message,
    required ReportApiData apiData,
    required ReportSelections selections,
    required ReportFormData formData,
    required String reportUID,
    required String companyUID,
  }) = UpdateError;
}
