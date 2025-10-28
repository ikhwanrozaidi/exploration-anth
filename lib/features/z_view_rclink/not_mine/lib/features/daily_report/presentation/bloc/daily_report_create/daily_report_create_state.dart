import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rclink_app/features/road/domain/entities/district_entity.dart';
import 'package:rclink_app/features/road/domain/entities/province_entity.dart';
import 'package:rclink_app/features/road/domain/entities/road_entity.dart';
import 'package:rclink_app/features/work_scope/domain/entities/work_scope.dart';
import 'package:rclink_app/features/work_scope/domain/entities/work_equipment.dart';
import 'package:rclink_app/features/work_scope/domain/entities/work_quantity_type.dart';

part 'daily_report_create_state.freezed.dart';

// ============================================================================
// STATE
// ============================================================================

@freezed
class DailyReportCreateState with _$DailyReportCreateState {
  const factory DailyReportCreateState.initial() = DailyReportInitial;

  const factory DailyReportCreateState.selectingBasicInfo({
    required ReportApiData apiData,
    required ReportSelections selections,
  }) = DailyReportSelectingBasicInfo;

  const factory DailyReportCreateState.basicInfoError({
    required ReportApiData apiData,
    required ReportSelections selections,
    required String errorMessage,
  }) = DailyReportBasicInfoError;

  const factory DailyReportCreateState.editingDetails({
    required ReportApiData apiData,
    required ReportSelections selections,
    required ReportFormData formData,
  }) = DailyReportEditingDetails;

  const factory DailyReportCreateState.detailsError({
    required ReportApiData apiData,
    required ReportSelections selections,
    required ReportFormData formData,
    required String errorMessage,
  }) = DailyReportDetailsError;

  const factory DailyReportCreateState.submitting({
    required ReportData reportData,
  }) = DailyReportSubmitting;

  const factory DailyReportCreateState.submitted({
    required ReportData reportData,
  }) = DailyReportSubmitted;

  const factory DailyReportCreateState.submissionError({
    required ReportData reportData,
    required String errorMessage,
  }) = DailyReportSubmissionError;

  const factory DailyReportCreateState.draftSaved({
    required ReportData reportData,
  }) = DailyReportDraftSaved;

  const factory DailyReportCreateState.draftError({
    required ReportData reportData,
    required String errorMessage,
  }) = DailyReportDraftError;
}

// ============================================================================
// DATA MODELS
// ============================================================================

/// Complete report data combining all information
@freezed
abstract class ReportData with _$ReportData {
  const factory ReportData({
    required ReportApiData apiData,
    required ReportSelections selections,
    required ReportFormData formData,
  }) = _ReportData;
}

/// Data from API responses
@freezed
abstract class ReportApiData with _$ReportApiData {
  const factory ReportApiData({
    @Default([]) List<WorkScope> workScopes,
    @Default([]) List<Province> states,
    @Default([]) List<District> districts,
    @Default([]) List<Road> roads,
    @Default([]) List<WorkQuantityType> quantities,
    @Default([]) List<WorkEquipment> equipment,
  }) = _ReportApiData;
}

/// User selections and form progress
@freezed
abstract class ReportSelections with _$ReportSelections {
  const factory ReportSelections({
    // Scope selection
    WorkScope? selectedScope,

    // Weather selection
    String? selectedWeather,

    // Location selections (UID is inside entity, no need to store separately)
    Province? selectedState,
    District? selectedDistrict,
    Road? selectedRoad,

    // Section input
    String? section,
    String? sectionError,

    // Quantity and equipment selections
    @Default([]) List<WorkQuantityType> selectedQuantityTypes,
    @Default([]) List<WorkEquipment> selectedEquipment,

    // Additional data
    @Default({}) Map<String, List<Map<String, dynamic>>> conditionSnapshots,
    @Default([]) List<Map<String, dynamic>> workerImages,
  }) = _ReportSelections;
}

/// Form data and validation state
@freezed
abstract class ReportFormData with _$ReportFormData {
  const factory ReportFormData({
    @Default({}) Map<String, dynamic> fieldValues,
    @Default({}) Map<String, String?> fieldErrors,
    @Default([]) List<String> validationErrors,
    @Default(false) bool isFormValid,
  }) = _ReportFormData;
}
