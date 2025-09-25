import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/repository/daily_report_creation_repository.dart';

import 'report_creation_event.dart';
import 'report_creation_state.dart';

@lazySingleton
class ReportCreationBloc
    extends Bloc<ReportCreationEvent, ReportCreationState> {
  final DailyReportCreationRepository _repository;

  ReportCreationBloc(this._repository) : super(const ReportCreationState()) {
    // Initial load events
    on<LoadWorkScopesRequested>(_onLoadWorkScopesRequested);
    on<LoadStatesRequested>(_onLoadStatesRequested);
    on<LoadDistrictsRequested>(_onLoadDistrictsRequested);
    on<LoadRoadsRequested>(_onLoadRoadsRequested);

    // Selection events
    on<ScopeOfWorkSelected>(_onScopeOfWorkSelected);
    on<WeatherSelected>(_onWeatherSelected);
    on<StateSelected>(_onStateSelected);
    on<DistrictSelected>(_onDistrictSelected);
    on<RoadSelected>(_onRoadSelected);
    on<SectionUpdated>(_onSectionUpdated);

    // Quantity and equipment events
    on<QuantityTypesSelected>(_onQuantityTypesSelected);
    on<QuantityTypeToggled>(_onQuantityTypeToggled);
    on<EquipmentSelected>(_onEquipmentSelected);
    on<EquipmentToggled>(_onEquipmentToggled);

    // Field input events
    on<FieldValueUpdated>(_onFieldValueUpdated);
    on<ImagesAdded>(_onImagesAdded);
    on<ImageRemoved>(_onImageRemoved);

    // Validation events
    on<ValidateFormRequested>(_onValidateFormRequested);
    on<FieldErrorCleared>(_onFieldErrorCleared);

    // Submission events
    on<SubmitReportRequested>(_onSubmitReportRequested);
    on<SaveAsDraftRequested>(_onSaveAsDraftRequested);

    // Clear/reset events
    on<ClearCacheRequested>(_onClearCacheRequested);
    on<ResetFormRequested>(_onResetFormRequested);
    on<StartOverRequested>(_onStartOverRequested);
  }

  // ============================================================================
  // INITIAL LOAD EVENT HANDLERS
  // ============================================================================

  Future<void> _onLoadWorkScopesRequested(
    LoadWorkScopesRequested event,
    Emitter<ReportCreationState> emit,
  ) async {
    emit(state.copyWith(isLoadingWorkScopes: true, workScopesError: null));

    final result = await _repository.getWorkScopes(
      forceRefresh: event.forceRefresh,
    );

    result.fold(
      (failure) => emit(
        state.copyWith(
          isLoadingWorkScopes: false,
          workScopesError: _mapFailureToMessage(failure),
        ),
      ),
      (workScopes) => emit(
        state.copyWith(
          isLoadingWorkScopes: false,
          workScopes: workScopes,
          workScopesError: null,
        ),
      ),
    );
  }

  Future<void> _onLoadStatesRequested(
    LoadStatesRequested event,
    Emitter<ReportCreationState> emit,
  ) async {
    emit(state.copyWith(isLoadingStates: true, statesError: null));

    final result = await _repository.getStates(
      forceRefresh: event.forceRefresh,
    );

    result.fold(
      (failure) => emit(
        state.copyWith(
          isLoadingStates: false,
          statesError: _mapFailureToMessage(failure),
        ),
      ),
      (states) => emit(
        state.copyWith(
          isLoadingStates: false,
          states: states,
          statesError: null,
        ),
      ),
    );
  }

  Future<void> _onLoadDistrictsRequested(
    LoadDistrictsRequested event,
    Emitter<ReportCreationState> emit,
  ) async {
    emit(state.copyWith(isLoadingDistricts: true, districtsError: null));

    // Get the state ID from the selected state
    final selectedState = state.selectedState;
    if (selectedState?.id == null) {
      emit(
        state.copyWith(
          isLoadingDistricts: false,
          districtsError: 'No state selected or invalid state ID',
        ),
      );
      return;
    }

    final result = await _repository.getDistricts(
      stateID: selectedState!.id!,
      forceRefresh: event.forceRefresh,
    );

    result.fold(
      (failure) => emit(
        state.copyWith(
          isLoadingDistricts: false,
          districtsError: _mapFailureToMessage(failure),
        ),
      ),
      (districts) => emit(
        state.copyWith(
          isLoadingDistricts: false,
          districts: districts,
          districtsError: null,
        ),
      ),
    );
  }

  Future<void> _onLoadRoadsRequested(
    LoadRoadsRequested event,
    Emitter<ReportCreationState> emit,
  ) async {
    emit(state.copyWith(isLoadingRoads: true, roadsError: null));

    // Get the district ID from the selected district
    final selectedDistrict = state.selectedDistrict;
    if (selectedDistrict?.id == null) {
      emit(
        state.copyWith(
          isLoadingRoads: false,
          roadsError: 'No district selected or invalid district ID',
        ),
      );
      return;
    }

    final result = await _repository.getRoads(
      districtID: selectedDistrict!.id!,
      forceRefresh: event.forceRefresh,
    );

    result.fold(
      (failure) => emit(
        state.copyWith(
          isLoadingRoads: false,
          roadsError: _mapFailureToMessage(failure),
        ),
      ),
      (roads) => emit(
        state.copyWith(isLoadingRoads: false, roads: roads, roadsError: null),
      ),
    );
  }

  // ============================================================================
  // SELECTION EVENT HANDLERS
  // ============================================================================

  Future<void> _onScopeOfWorkSelected(
    ScopeOfWorkSelected event,
    Emitter<ReportCreationState> emit,
  ) async {
    final selectedScope = state.workScopes?.firstWhere(
      (scope) => scope.uid == event.scopeUid,
      orElse: () => throw Exception('Scope not found'),
    );

    emit(
      state.copyWith(
        selectedScopeUid: event.scopeUid,
        selectedScope: selectedScope,
        // Clear previous selections when scope changes
        selectedQuantityTypeUids: [],
        selectedQuantityTypes: [],
        selectedEquipmentUids: [],
        selectedEquipment: [],
        fieldValues: {},
        imageFields: {},
        fieldErrors: {},
      ),
    );
  }

  Future<void> _onWeatherSelected(
    WeatherSelected event,
    Emitter<ReportCreationState> emit,
  ) async {
    emit(state.copyWith(selectedWeather: event.weather));
  }

  Future<void> _onStateSelected(
    StateSelected event,
    Emitter<ReportCreationState> emit,
  ) async {
    final selectedState = state.states?.firstWhere(
      (state) => state.uid == event.stateUid,
      orElse: () => throw Exception('State not found'),
    );

    emit(
      state.copyWith(
        selectedStateUid: event.stateUid,
        selectedState: selectedState,
        // Clear dependent selections
        selectedDistrictUid: null,
        selectedDistrict: null,
        selectedRoadUid: null,
        selectedRoad: null,
        districts: null,
        roads: null,
      ),
    );

    // Auto-load districts for the selected state using the state ID
    if (selectedState?.id != null) {
      add(LoadDistrictsRequested(stateUid: event.stateUid));
    }
  }

  Future<void> _onDistrictSelected(
    DistrictSelected event,
    Emitter<ReportCreationState> emit,
  ) async {
    final selectedDistrict = state.districts?.firstWhere(
      (district) => district.uid == event.districtUid,
      orElse: () => throw Exception('District not found'),
    );

    emit(
      state.copyWith(
        selectedDistrictUid: event.districtUid,
        selectedDistrict: selectedDistrict,
        // Clear dependent selections
        selectedRoadUid: null,
        selectedRoad: null,
        roads: null,
      ),
    );

    // Auto-load roads for the selected district using the district ID
    if (selectedDistrict?.id != null) {
      add(LoadRoadsRequested(districtUid: event.districtUid));
    }
  }

  Future<void> _onRoadSelected(
    RoadSelected event,
    Emitter<ReportCreationState> emit,
  ) async {
    final selectedRoad = state.roads?.firstWhere(
      (road) => road.uid == event.roadUid,
      orElse: () => throw Exception('Road not found'),
    );

    emit(
      state.copyWith(
        selectedRoadUid: event.roadUid,
        selectedRoad: selectedRoad,
      ),
    );
  }

  Future<void> _onSectionUpdated(
    SectionUpdated event,
    Emitter<ReportCreationState> emit,
  ) async {
    emit(state.copyWith(section: event.section));

    // Validate section if road is selected
    if (state.selectedRoad != null) {
      add(const ValidateFormRequested());
    }
  }

  // ============================================================================
  // QUANTITY AND EQUIPMENT EVENT HANDLERS
  // ============================================================================

  Future<void> _onQuantityTypesSelected(
    QuantityTypesSelected event,
    Emitter<ReportCreationState> emit,
  ) async {
    final selectedQuantityTypes = state.availableQuantityTypes
        .where((qt) => event.quantityTypeUids.contains(qt.uid))
        .toList();

    emit(
      state.copyWith(
        selectedQuantityTypeUids: event.quantityTypeUids,
        selectedQuantityTypes: selectedQuantityTypes,
      ),
    );
  }

  Future<void> _onQuantityTypeToggled(
    QuantityTypeToggled event,
    Emitter<ReportCreationState> emit,
  ) async {
    final currentSelected = List<String>.from(state.selectedQuantityTypeUids);

    if (currentSelected.contains(event.quantityTypeUid)) {
      currentSelected.remove(event.quantityTypeUid);
    } else {
      currentSelected.add(event.quantityTypeUid);
    }

    add(QuantityTypesSelected(currentSelected));
  }

  Future<void> _onEquipmentSelected(
    EquipmentSelected event,
    Emitter<ReportCreationState> emit,
  ) async {
    final selectedEquipment = state.availableEquipment
        .where((eq) => event.equipmentUids.contains(eq.uid))
        .toList();

    emit(
      state.copyWith(
        selectedEquipmentUids: event.equipmentUids,
        selectedEquipment: selectedEquipment,
      ),
    );
  }

  Future<void> _onEquipmentToggled(
    EquipmentToggled event,
    Emitter<ReportCreationState> emit,
  ) async {
    final currentSelected = List<String>.from(state.selectedEquipmentUids);

    if (currentSelected.contains(event.equipmentUid)) {
      currentSelected.remove(event.equipmentUid);
    } else {
      currentSelected.add(event.equipmentUid);
    }

    add(EquipmentSelected(currentSelected));
  }

  // ============================================================================
  // FIELD INPUT EVENT HANDLERS
  // ============================================================================

  Future<void> _onFieldValueUpdated(
    FieldValueUpdated event,
    Emitter<ReportCreationState> emit,
  ) async {
    final updatedFieldValues = Map<String, dynamic>.from(state.fieldValues);
    updatedFieldValues[event.fieldKey] = event.value;

    // Clear field error if value is updated
    final updatedFieldErrors = Map<String, String?>.from(state.fieldErrors);
    updatedFieldErrors.remove(event.fieldKey);

    emit(
      state.copyWith(
        fieldValues: updatedFieldValues,
        fieldErrors: updatedFieldErrors,
      ),
    );
  }

  Future<void> _onImagesAdded(
    ImagesAdded event,
    Emitter<ReportCreationState> emit,
  ) async {
    final updatedImageFields = Map<String, List<String>>.from(
      state.imageFields,
    );
    final existingImages = updatedImageFields[event.fieldKey] ?? [];
    updatedImageFields[event.fieldKey] = [
      ...existingImages,
      ...event.imagePaths,
    ];

    emit(state.copyWith(imageFields: updatedImageFields));
  }

  Future<void> _onImageRemoved(
    ImageRemoved event,
    Emitter<ReportCreationState> emit,
  ) async {
    final updatedImageFields = Map<String, List<String>>.from(
      state.imageFields,
    );
    final existingImages = updatedImageFields[event.fieldKey] ?? [];
    existingImages.remove(event.imagePath);
    updatedImageFields[event.fieldKey] = existingImages;

    emit(state.copyWith(imageFields: updatedImageFields));
  }

  // ============================================================================
  // VALIDATION EVENT HANDLERS
  // ============================================================================

  Future<void> _onValidateFormRequested(
    ValidateFormRequested event,
    Emitter<ReportCreationState> emit,
  ) async {
    final fieldErrors = <String, String?>{};
    final validationErrors = <String>[];

    // Validate basic selections
    if (state.selectedScopeUid == null) {
      validationErrors.add('Please select a scope of work');
    }
    if (state.selectedWeather == null) {
      validationErrors.add('Please select weather condition');
    }
    if (state.selectedRoadUid == null) {
      validationErrors.add('Please select a road');
    }
    if (state.section == null || state.section!.isEmpty) {
      validationErrors.add('Please enter section information');
      fieldErrors['section'] = 'Section is required';
    }

    // Validate section range if road is selected
    if (!state.isSectionValid && state.selectedRoad != null) {
      fieldErrors['section'] =
          'Section must be within ${state.selectedRoad!.sectionStart} - ${state.selectedRoad!.sectionFinish}';
      validationErrors.add('Invalid section range');
    }

    // Validate quantity type fields
    for (final quantityType in state.selectedQuantityTypes) {
      for (final field in quantityType.quantityFields) {
        final fieldKey = '${quantityType.uid}_${field.code}';

        if (field.isRequired) {
          final value = state.getFieldValue(fieldKey);
          final imageValue = state.getImageFieldValue(fieldKey);

          if ((value == null || value.toString().isEmpty) &&
              imageValue.isEmpty) {
            fieldErrors[fieldKey] = '${field.name} is required';
            validationErrors.add('${field.name} is required');
          }
        }
      }
    }

    final isFormValid = validationErrors.isEmpty;

    emit(
      state.copyWith(
        fieldErrors: fieldErrors,
        validationErrors: validationErrors,
        isFormValid: isFormValid,
      ),
    );
  }

  Future<void> _onFieldErrorCleared(
    FieldErrorCleared event,
    Emitter<ReportCreationState> emit,
  ) async {
    final updatedFieldErrors = Map<String, String?>.from(state.fieldErrors);
    updatedFieldErrors.remove(event.fieldKey);

    emit(state.copyWith(fieldErrors: updatedFieldErrors));
  }

  // ============================================================================
  // SUBMISSION EVENT HANDLERS
  // ============================================================================

  Future<void> _onSubmitReportRequested(
    SubmitReportRequested event,
    Emitter<ReportCreationState> emit,
  ) async {
    // First validate the form
    add(const ValidateFormRequested());

    // Wait for validation to complete
    await stream.firstWhere((state) => !state.isLoading);

    if (!state.isFormValid) {
      emit(
        state.copyWith(
          submissionError: 'Please fix validation errors before submitting',
        ),
      );
      return;
    }

    emit(state.copyWith(isSubmitting: true, submissionError: null));

    try {
      // TODO: Implement actual submission logic
      // final reportData = _buildReportData();
      // final result = await _repository.submitReport(reportData);

      // Simulate submission
      await Future.delayed(const Duration(seconds: 2));

      emit(state.copyWith(isSubmitting: false, isSubmitted: true));
    } catch (e) {
      emit(
        state.copyWith(
          isSubmitting: false,
          submissionError: 'Failed to submit report: ${e.toString()}',
        ),
      );
    }
  }

  Future<void> _onSaveAsDraftRequested(
    SaveAsDraftRequested event,
    Emitter<ReportCreationState> emit,
  ) async {
    emit(state.copyWith(isSubmitting: true, submissionError: null));

    try {
      // TODO: Implement draft saving logic
      // final draftData = _buildReportData();
      // final result = await _repository.saveDraft(draftData);

      // Simulate saving
      await Future.delayed(const Duration(seconds: 1));

      emit(state.copyWith(isSubmitting: false, submissionError: null));
    } catch (e) {
      emit(
        state.copyWith(
          isSubmitting: false,
          submissionError: 'Failed to save draft: ${e.toString()}',
        ),
      );
    }
  }

  // ============================================================================
  // CLEAR/RESET EVENT HANDLERS
  // ============================================================================

  Future<void> _onClearCacheRequested(
    ClearCacheRequested event,
    Emitter<ReportCreationState> emit,
  ) async {
    await _repository.clearCache();
    emit(const ReportCreationState());
  }

  Future<void> _onResetFormRequested(
    ResetFormRequested event,
    Emitter<ReportCreationState> emit,
  ) async {
    emit(
      state.copyWith(
        selectedScopeUid: null,
        selectedScope: null,
        selectedWeather: null,
        selectedStateUid: null,
        selectedState: null,
        selectedDistrictUid: null,
        selectedDistrict: null,
        selectedRoadUid: null,
        selectedRoad: null,
        section: null,
        selectedQuantityTypeUids: [],
        selectedQuantityTypes: [],
        selectedEquipmentUids: [],
        selectedEquipment: [],
        fieldValues: {},
        imageFields: {},
        fieldErrors: {},
        isFormValid: false,
        validationErrors: [],
        isSubmitting: false,
        submissionError: null,
        isSubmitted: false,
      ),
    );
  }

  Future<void> _onStartOverRequested(
    StartOverRequested event,
    Emitter<ReportCreationState> emit,
  ) async {
    emit(const ReportCreationState());
  }

  // ============================================================================
  // HELPER METHODS
  // ============================================================================

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case NetworkFailure:
        return 'Network error. Please check your connection.';
      case ServerFailure:
        return failure.message;
      case CacheFailure:
        return 'Cache error: ${failure.message}';
      default:
        return 'An unexpected error occurred: ${failure.message}';
    }
  }

  // TODO: Implement when submission API is ready
  // Map<String, dynamic> _buildReportData() {
  //   return {
  //     'scopeOfWorkUid': state.selectedScopeUid,
  //     'weather': state.selectedWeather,
  //     'roadUid': state.selectedRoadUid,
  //     'section': state.section,
  //     'quantityTypes': state.selectedQuantityTypes.map((qt) => {
  //       'uid': qt.uid,
  //       'fields': qt.quantityFields.map((field) => {
  //         'code': field.code,
  //         'value': state.getFieldValue('${qt.uid}_${field.code}'),
  //       }).toList(),
  //     }).toList(),
  //     'equipment': state.selectedEquipmentUids,
  //     'fieldValues': state.fieldValues,
  //     'imageFields': state.imageFields,
  //   };
  // }
}
