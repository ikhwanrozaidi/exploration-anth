import 'package:equatable/equatable.dart';
import '../../domain/entities/scope_of_work/scope_of_work.dart';
import '../../domain/entities/scope_of_work/work_equipment.dart';
import '../../domain/entities/scope_of_work/work_quantity_type.dart';
import '../../domain/entities/province/province_entity.dart';
import '../../domain/entities/province/district_entity.dart';
import '../../domain/entities/province/road_entity.dart';

class ReportCreationState extends Equatable {
  // ============================================================================
  // API DATA
  // ============================================================================

  /// Available work scopes from API
  final List<ScopeOfWork>? workScopes;
  final bool isLoadingWorkScopes;
  final String? workScopesError;

  /// Available states/provinces from API
  final List<Province>? states;
  final bool isLoadingStates;
  final String? statesError;

  /// Available districts based on selected state
  final List<District>? districts;
  final bool isLoadingDistricts;
  final String? districtsError;

  /// Available roads based on selected district
  final List<Road>? roads;
  final bool isLoadingRoads;
  final String? roadsError;

  // ============================================================================
  // USER SELECTIONS
  // ============================================================================

  /// Selected scope of work
  final String? selectedScopeUid;
  final ScopeOfWork? selectedScope;

  /// Selected weather condition
  final String? selectedWeather;

  /// Selected location hierarchy
  final String? selectedStateUid;
  final Province? selectedState;
  final String? selectedDistrictUid;
  final District? selectedDistrict;
  final String? selectedRoadUid;
  final Road? selectedRoad;
  final String? section;

  /// Selected quantity types from the scope
  final List<String> selectedQuantityTypeUids;
  final List<WorkQuantityType> selectedQuantityTypes;

  /// Selected equipment
  final List<String> selectedEquipmentUids;
  final List<WorkEquipment> selectedEquipment;

  // ============================================================================
  // FORM DATA
  // ============================================================================

  /// Field values keyed by fieldKey (fieldCode or "quantityTypeUid_fieldCode")
  final Map<String, dynamic> fieldValues;

  /// Image fields keyed by fieldKey
  final Map<String, List<String>> imageFields;

  /// Field validation errors
  final Map<String, String?> fieldErrors;

  /// Overall form validation state
  final bool isFormValid;
  final List<String> validationErrors;

  // ============================================================================
  // SUBMISSION STATE
  // ============================================================================

  final bool isSubmitting;
  final String? submissionError;
  final bool isSubmitted;

  const ReportCreationState({
    // API Data
    this.workScopes,
    this.isLoadingWorkScopes = false,
    this.workScopesError,
    this.states,
    this.isLoadingStates = false,
    this.statesError,
    this.districts,
    this.isLoadingDistricts = false,
    this.districtsError,
    this.roads,
    this.isLoadingRoads = false,
    this.roadsError,

    // User Selections
    this.selectedScopeUid,
    this.selectedScope,
    this.selectedWeather,
    this.selectedStateUid,
    this.selectedState,
    this.selectedDistrictUid,
    this.selectedDistrict,
    this.selectedRoadUid,
    this.selectedRoad,
    this.section,
    this.selectedQuantityTypeUids = const [],
    this.selectedQuantityTypes = const [],
    this.selectedEquipmentUids = const [],
    this.selectedEquipment = const [],

    // Form Data
    this.fieldValues = const {},
    this.imageFields = const {},
    this.fieldErrors = const {},
    this.isFormValid = false,
    this.validationErrors = const [],

    // Submission State
    this.isSubmitting = false,
    this.submissionError,
    this.isSubmitted = false,
  });

  // ============================================================================
  // COPY WITH
  // ============================================================================

  ReportCreationState copyWith({
    // API Data
    List<ScopeOfWork>? workScopes,
    bool? isLoadingWorkScopes,
    String? workScopesError,
    List<Province>? states,
    bool? isLoadingStates,
    String? statesError,
    List<District>? districts,
    bool? isLoadingDistricts,
    String? districtsError,
    List<Road>? roads,
    bool? isLoadingRoads,
    String? roadsError,

    // User Selections
    String? selectedScopeUid,
    ScopeOfWork? selectedScope,
    String? selectedWeather,
    String? selectedStateUid,
    Province? selectedState,
    String? selectedDistrictUid,
    District? selectedDistrict,
    String? selectedRoadUid,
    Road? selectedRoad,
    String? section,
    List<String>? selectedQuantityTypeUids,
    List<WorkQuantityType>? selectedQuantityTypes,
    List<String>? selectedEquipmentUids,
    List<WorkEquipment>? selectedEquipment,

    // Form Data
    Map<String, dynamic>? fieldValues,
    Map<String, List<String>>? imageFields,
    Map<String, String?>? fieldErrors,
    bool? isFormValid,
    List<String>? validationErrors,

    // Submission State
    bool? isSubmitting,
    String? submissionError,
    bool? isSubmitted,
  }) {
    return ReportCreationState(
      // API Data
      workScopes: workScopes ?? this.workScopes,
      isLoadingWorkScopes: isLoadingWorkScopes ?? this.isLoadingWorkScopes,
      workScopesError: workScopesError ?? this.workScopesError,
      states: states ?? this.states,
      isLoadingStates: isLoadingStates ?? this.isLoadingStates,
      statesError: statesError ?? this.statesError,
      districts: districts ?? this.districts,
      isLoadingDistricts: isLoadingDistricts ?? this.isLoadingDistricts,
      districtsError: districtsError ?? this.districtsError,
      roads: roads ?? this.roads,
      isLoadingRoads: isLoadingRoads ?? this.isLoadingRoads,
      roadsError: roadsError ?? this.roadsError,

      // User Selections
      selectedScopeUid: selectedScopeUid ?? this.selectedScopeUid,
      selectedScope: selectedScope ?? this.selectedScope,
      selectedWeather: selectedWeather ?? this.selectedWeather,
      selectedStateUid: selectedStateUid ?? this.selectedStateUid,
      selectedState: selectedState ?? this.selectedState,
      selectedDistrictUid: selectedDistrictUid ?? this.selectedDistrictUid,
      selectedDistrict: selectedDistrict ?? this.selectedDistrict,
      selectedRoadUid: selectedRoadUid ?? this.selectedRoadUid,
      selectedRoad: selectedRoad ?? this.selectedRoad,
      section: section ?? this.section,
      selectedQuantityTypeUids:
          selectedQuantityTypeUids ?? this.selectedQuantityTypeUids,
      selectedQuantityTypes:
          selectedQuantityTypes ?? this.selectedQuantityTypes,
      selectedEquipmentUids:
          selectedEquipmentUids ?? this.selectedEquipmentUids,
      selectedEquipment: selectedEquipment ?? this.selectedEquipment,

      // Form Data
      fieldValues: fieldValues ?? this.fieldValues,
      imageFields: imageFields ?? this.imageFields,
      fieldErrors: fieldErrors ?? this.fieldErrors,
      isFormValid: isFormValid ?? this.isFormValid,
      validationErrors: validationErrors ?? this.validationErrors,

      // Submission State
      isSubmitting: isSubmitting ?? this.isSubmitting,
      submissionError: submissionError ?? this.submissionError,
      isSubmitted: isSubmitted ?? this.isSubmitted,
    );
  }

  // ============================================================================
  // COMPUTED PROPERTIES
  // ============================================================================

  /// Whether basic selections are complete for navigation
  bool get canProceedToTips =>
      selectedScopeUid != null &&
      selectedWeather != null &&
      selectedRoadUid != null &&
      section != null &&
      section!.isNotEmpty;

  /// Whether location selections are complete
  bool get isLocationComplete =>
      selectedStateUid != null &&
      selectedDistrictUid != null &&
      selectedRoadUid != null;

  /// Whether any API data is loading
  bool get isLoading =>
      isLoadingWorkScopes ||
      isLoadingStates ||
      isLoadingDistricts ||
      isLoadingRoads;

  /// Whether there are any API errors
  bool get hasErrors =>
      workScopesError != null ||
      statesError != null ||
      districtsError != null ||
      roadsError != null;

  /// Get all errors combined
  List<String> get allErrors {
    final errors = <String>[];
    if (workScopesError != null) errors.add(workScopesError!);
    if (statesError != null) errors.add(statesError!);
    if (districtsError != null) errors.add(districtsError!);
    if (roadsError != null) errors.add(roadsError!);
    if (submissionError != null) errors.add(submissionError!);
    return errors;
  }

  /// Whether section is valid for selected road
  bool get isSectionValid {
    if (selectedRoad == null || section == null || section!.isEmpty) {
      return false;
    }

    // Parse section input (e.g., "10-15" or "10")
    final parts = section!.split('-');
    if (parts.isEmpty) return false;

    final startSection = double.tryParse(parts[0].trim());
    if (startSection == null) return false;

    final endSection = parts.length > 1
        ? double.tryParse(parts[1].trim())
        : startSection;
    if (endSection == null) return false;

    // Check if within road's section range
    final roadStart = double.tryParse(selectedRoad!.sectionStart ?? '0') ?? 0;
    final roadEnd =
        double.tryParse(selectedRoad!.sectionFinish ?? '0') ?? double.infinity;

    return startSection >= roadStart &&
        endSection <= roadEnd &&
        startSection <= endSection;
  }

  // ============================================================================
  // HELPER METHODS
  // ============================================================================

  /// Get available equipment for selected scope
  List<WorkEquipment> get availableEquipment {
    return selectedScope?.workEquipments ?? [];
  }

  /// Get available quantity types for selected scope
  List<WorkQuantityType> get availableQuantityTypes {
    return selectedScope?.workQuantityTypes ?? [];
  }

  /// Check if a specific field has an error
  bool hasFieldError(String fieldKey) {
    return fieldErrors.containsKey(fieldKey) && fieldErrors[fieldKey] != null;
  }

  /// Get field error message
  String? getFieldError(String fieldKey) {
    return fieldErrors[fieldKey];
  }

  /// Get field value
  dynamic getFieldValue(String fieldKey) {
    return fieldValues[fieldKey];
  }

  /// Get image field values
  List<String> getImageFieldValue(String fieldKey) {
    return imageFields[fieldKey] ?? [];
  }

  @override
  List<Object?> get props => [
    // API Data
    workScopes,
    isLoadingWorkScopes,
    workScopesError,
    states,
    isLoadingStates,
    statesError,
    districts,
    isLoadingDistricts,
    districtsError,
    roads,
    isLoadingRoads,
    roadsError,

    // User Selections
    selectedScopeUid,
    selectedScope,
    selectedWeather,
    selectedStateUid,
    selectedState,
    selectedDistrictUid,
    selectedDistrict,
    selectedRoadUid,
    selectedRoad,
    section,
    selectedQuantityTypeUids,
    selectedQuantityTypes,
    selectedEquipmentUids,
    selectedEquipment,

    // Form Data
    fieldValues,
    imageFields,
    fieldErrors,
    isFormValid,
    validationErrors,

    // Submission State
    isSubmitting,
    submissionError,
    isSubmitted,
  ];
}
