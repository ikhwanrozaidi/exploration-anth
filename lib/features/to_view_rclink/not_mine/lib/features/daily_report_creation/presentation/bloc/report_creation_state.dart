import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/scope_of_work/scope_of_work.dart';
import '../../domain/entities/scope_of_work/work_equipment.dart';
import '../../domain/entities/scope_of_work/work_quantity_type.dart';
import '../../domain/entities/province/province_entity.dart';
import '../../domain/entities/province/district_entity.dart';
import '../../domain/entities/province/road_entity.dart';

part 'report_creation_state.freezed.dart';

// ============================================================================
// STATE
// ============================================================================

@freezed
class ReportCreationState with _$ReportCreationState {
  const factory ReportCreationState.initial() = ReportInitial;

  const factory ReportCreationState.selectingBasicInfo({
    required ReportApiData apiData,
    required ReportSelections selections,
  }) = ReportSelectingBasicInfo;

  const factory ReportCreationState.basicInfoError({
    required ReportApiData apiData,
    required ReportSelections selections,
    required String errorMessage,
  }) = ReportBasicInfoError;

  const factory ReportCreationState.editingDetails({
    required ReportApiData apiData,
    required ReportSelections selections,
    required ReportFormData formData,
  }) = ReportEditingDetails;

  const factory ReportCreationState.detailsError({
    required ReportApiData apiData,
    required ReportSelections selections,
    required ReportFormData formData,
    required String errorMessage,
  }) = ReportDetailsError;

  const factory ReportCreationState.submitting({
    required ReportData reportData,
  }) = ReportSubmitting;

  const factory ReportCreationState.submitted({
    required ReportData reportData,
  }) = ReportSubmitted;

  const factory ReportCreationState.submissionError({
    required ReportData reportData,
    required String errorMessage,
  }) = ReportSubmissionError;

  const factory ReportCreationState.draftSaved({
    required ReportData reportData,
  }) = ReportDraftSaved;

  const factory ReportCreationState.draftError({
    required ReportData reportData,
    required String errorMessage,
  }) = ReportDraftError;
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
    @Default([]) List<ScopeOfWork> workScopes,
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
    ScopeOfWork? selectedScope,

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
    @Default({}) Map<String, List<String>> imageFields,
    @Default({}) Map<String, String?> fieldErrors,
    @Default([]) List<String> validationErrors,
    @Default(false) bool isFormValid,
  }) = _ReportFormData;
}
