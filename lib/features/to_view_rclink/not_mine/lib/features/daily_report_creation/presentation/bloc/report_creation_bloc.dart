import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/repository/workscopes_repository.dart';
import '../../../company/presentation/bloc/company_bloc.dart';
import '../../../company/presentation/bloc/company_state.dart';
import '../../data/datasources/daily_report_creation_remote_datasource.dart';

import '../../domain/usecases/clear_work_scopes_cache_usecase.dart';
import '../../domain/usecases/get_district_usecase.dart';
import '../../domain/usecases/get_quantity_usecase.dart';
import '../../domain/usecases/get_road_usecase.dart';
import '../../domain/usecases/get_states_usecase.dart';
import '../../domain/usecases/get_work_scopes_usecase.dart';
import 'report_creation_event.dart';
import 'report_creation_state.dart';
import 'report_creation_data.dart';

@lazySingleton
class ReportCreationBloc
    extends Bloc<ReportCreationEvent, ReportCreationState> {
  final GetWorkScopesUseCase _getWorkScopesUseCase;
  final ClearWorkScopesCacheUseCase _clearCacheUseCase;
  final GetStatesUseCase _getStatesUseCase;
  final GetDistrictsUseCase _getDistrictsUseCase;
  final GetRoadsUseCase _getRoadsUseCase;
  final GetQuantityUseCase _getQuantitiesUseCase;
  final CompanyBloc _companyBloc;

  ReportCreationBloc(
    this._getWorkScopesUseCase,
    this._clearCacheUseCase,
    this._getStatesUseCase,
    this._getDistrictsUseCase,
    this._getRoadsUseCase,
    this._getQuantitiesUseCase,
    this._companyBloc,
  ) : super(const ReportCreationState.initial()) {
    // Initial load events
    on<LoadWorkScopes>(_onLoadWorkScopes);
    on<LoadStates>(_onLoadStates);
    on<LoadDistricts>(_onLoadDistricts);
    on<LoadRoads>(_onLoadRoads);
    on<LoadQuantitiesAndEquipment>(_onLoadQuantitiesAndEquipment);

    // Selection events
    on<SelectScope>(_onSelectScope);
    on<SelectWeather>(_onSelectWeather);
    on<SelectState>(_onSelectState);
    on<SelectDistrict>(_onSelectDistrict);
    on<SelectRoad>(_onSelectRoad);
    on<UpdateSection>(_onUpdateSection);

    // Quantity and equipment selection events
    on<SelectQuantityTypes>(_onSelectQuantityTypes);
    on<ToggleQuantityType>(_onToggleQuantityType);
    on<SelectEquipment>(_onSelectEquipment);
    on<ToggleEquipment>(_onToggleEquipment);

    // Form data events
    on<UpdateFieldValue>(_onUpdateFieldValue);
    on<AddImages>(_onAddImages);
    on<RemoveImage>(_onRemoveImage);

    // Validation and submission events
    on<ValidateForm>(_onValidateForm);
    on<ClearFieldError>(_onClearFieldError);
    on<SubmitReport>(_onSubmitReport);
    on<SaveAsDraft>(_onSaveAsDraft);

    // Utility events
    on<ClearCache>(_onClearCache);
    on<ResetForm>(_onResetForm);
    on<StartOver>(_onStartOver);
  }

  // ============================================================================
  // HELPER METHODS
  // ============================================================================

  ReportApiData _getCurrentApiData() {
    return state.maybeMap(
      page1Ready: (state) => state.apiData,
      page1Error: (state) => state.apiData,
      page2Ready: (state) => state.apiData,
      page2Error: (state) => state.apiData,
      submitting: (state) => state.reportData.apiData,
      submitted: (state) => state.reportData.apiData,
      submissionError: (state) => state.reportData.apiData,
      draftSaved: (state) => state.reportData.apiData,
      draftError: (state) => state.reportData.apiData,
      orElse: () => const ReportApiData(),
    );
  }

  ReportSelections _getCurrentSelections() {
    return state.maybeMap(
      page1Ready: (state) => state.selections,
      page1Error: (state) => state.selections,
      page2Ready: (state) => state.selections,
      page2Error: (state) => state.selections,
      submitting: (state) => state.reportData.selections,
      submitted: (state) => state.reportData.selections,
      submissionError: (state) => state.reportData.selections,
      draftSaved: (state) => state.reportData.selections,
      draftError: (state) => state.reportData.selections,
      orElse: () => const ReportSelections(),
    );
  }

  ReportFormData _getCurrentFormData() {
    return state.maybeMap(
      page2Ready: (state) => state.formData,
      page2Error: (state) => state.formData,
      submitting: (state) => state.reportData.formData,
      submitted: (state) => state.reportData.formData,
      submissionError: (state) => state.reportData.formData,
      draftSaved: (state) => state.reportData.formData,
      draftError: (state) => state.reportData.formData,
      orElse: () => const ReportFormData(),
    );
  }

  // ============================================================================
  // INITIAL LOAD EVENT HANDLERS
  // ============================================================================

  Future<void> _onLoadWorkScopes(
    LoadWorkScopes event,
    Emitter<ReportCreationState> emit,
  ) async {
    final currentApiData = _getCurrentApiData();
    final currentSelections = _getCurrentSelections();

    final result = await _getWorkScopesUseCase(
      GetWorkScopesParams(forceRefresh: event.forceRefresh),
    );

    result.fold(
      (failure) => emit(
        ReportCreationState.page1Error(
          apiData: currentApiData,
          selections: currentSelections,
          errorMessage: failure.message,
        ),
      ),
      (workScopes) {
        // Get the LATEST state data to avoid overwriting concurrent loads
        final latestApiData = _getCurrentApiData();

        final updatedApiData = ReportApiData(
          workScopes: workScopes, // New data
          states: latestApiData.states, // Preserve existing
          districts: latestApiData.districts, // Preserve existing
          roads: latestApiData.roads, // Preserve existing
          quantities: latestApiData.quantities, // Preserve existing
          equipment: latestApiData.equipment, // Preserve existing
        );

        emit(
          ReportCreationState.page1Ready(
            apiData: updatedApiData,
            selections: currentSelections,
          ),
        );
      },
    );
  }

  Future<void> _onLoadStates(
    LoadStates event,
    Emitter<ReportCreationState> emit,
  ) async {
    final currentApiData = _getCurrentApiData();
    final currentSelections = _getCurrentSelections();

    final result = await _getStatesUseCase(
      GetStatesParams(forceRefresh: event.forceRefresh),
    );

    result.fold(
      (failure) => emit(
        ReportCreationState.page1Error(
          apiData: currentApiData,
          selections: currentSelections,
          errorMessage: failure.message,
        ),
      ),
      (states) {
        // Get the LATEST state data to avoid overwriting concurrent loads
        final latestApiData = _getCurrentApiData();

        final updatedApiData = ReportApiData(
          workScopes: latestApiData.workScopes, // Preserve existing
          states: states, // New data
          districts: latestApiData.districts, // Preserve existing
          roads: latestApiData.roads, // Preserve existing
          quantities: latestApiData.quantities, // Preserve existing
          equipment: latestApiData.equipment, // Preserve existing
        );

        emit(
          ReportCreationState.page1Ready(
            apiData: updatedApiData,
            selections: currentSelections,
          ),
        );
      },
    );
  }

  Future<void> _onLoadDistricts(
    LoadDistricts event,
    Emitter<ReportCreationState> emit,
  ) async {
    final currentApiData = _getCurrentApiData();
    final currentSelections = _getCurrentSelections();

    final selectedState = currentSelections.selectedState;
    if (selectedState == null) {
      emit(
        ReportCreationState.page1Error(
          apiData: currentApiData,
          selections: currentSelections,
          errorMessage: 'No state selected',
        ),
      );
      return;
    }

    final result = await _getDistrictsUseCase(
      GetDistrictsParams(
        stateID: selectedState.id,
        forceRefresh: event.forceRefresh,
      ),
    );

    result.fold(
      (failure) => emit(
        ReportCreationState.page1Error(
          apiData: currentApiData,
          selections: currentSelections,
          errorMessage: failure.message,
        ),
      ),
      (districts) => emit(
        ReportCreationState.page1Ready(
          apiData: currentApiData.copyWith(districts: districts),
          selections: currentSelections,
        ),
      ),
    );
  }

  Future<void> _onLoadRoads(
    LoadRoads event,
    Emitter<ReportCreationState> emit,
  ) async {
    final currentApiData = _getCurrentApiData();
    final currentSelections = _getCurrentSelections();

    final selectedDistrict = currentSelections.selectedDistrict;
    if (selectedDistrict == null) {
      emit(
        ReportCreationState.page1Error(
          apiData: currentApiData,
          selections: currentSelections,
          errorMessage: 'No district selected',
        ),
      );
      return;
    }

    final result = await _getRoadsUseCase(
      GetRoadsParams(
        districtID: selectedDistrict.id,
        forceRefresh: event.forceRefresh,
      ),
    );

    result.fold(
      (failure) => emit(
        ReportCreationState.page1Error(
          apiData: currentApiData,
          selections: currentSelections,
          errorMessage: failure.message,
        ),
      ),
      (roads) => emit(
        ReportCreationState.page1Ready(
          apiData: currentApiData.copyWith(roads: roads),
          selections: currentSelections,
        ),
      ),
    );
  }

  Future<void> _onLoadQuantitiesAndEquipment(
    LoadQuantitiesAndEquipment event,
    Emitter<ReportCreationState> emit,
  ) async {
    final currentApiData = _getCurrentApiData();
    final currentSelections = _getCurrentSelections();
    final currentFormData = _getCurrentFormData();

    final result = await _getQuantitiesUseCase(
      GetQuantityParams(
        companyUID: event.companyUID,
        workScopeUID: event.workScopeUID,
        forceRefresh: event.forceRefresh,
      ),
    );

    result.fold(
      (failure) => emit(
        ReportCreationState.page2Error(
          apiData: currentApiData,
          selections: currentSelections,
          formData: currentFormData,
          errorMessage: failure.message,
        ),
      ),
      (quantities) => emit(
        ReportCreationState.page2Ready(
          apiData: currentApiData.copyWith(quantities: quantities),
          selections: currentSelections,
          formData: currentFormData,
        ),
      ),
    );
  }

  // ============================================================================
  // SELECTION EVENT HANDLERS
  // ============================================================================

  Future<void> _onSelectScope(
    SelectScope event,
    Emitter<ReportCreationState> emit,
  ) async {
    final currentApiData = _getCurrentApiData();
    final currentSelections = _getCurrentSelections();

    // Find the selected scope from available scopes
    final selectedScope = currentApiData.workScopes?.firstWhere(
      (scope) => scope.uid == event.scopeUid,
    );

    emit(
      ReportCreationState.page1Ready(
        apiData: currentApiData,
        selections: currentSelections.copyWith(
          selectedScopeUid: event.scopeUid,
          selectedScope: selectedScope,
        ),
      ),
    );
  }

  Future<void> _onSelectWeather(
    SelectWeather event,
    Emitter<ReportCreationState> emit,
  ) async {
    final currentApiData = _getCurrentApiData();
    final currentSelections = _getCurrentSelections();

    emit(
      ReportCreationState.page1Ready(
        apiData: currentApiData,
        selections: currentSelections.copyWith(selectedWeather: event.weather),
      ),
    );
  }

  Future<void> _onSelectState(
    SelectState event,
    Emitter<ReportCreationState> emit,
  ) async {
    final currentApiData = _getCurrentApiData();
    final currentSelections = _getCurrentSelections();

    // Find the selected state from available states
    final selectedState = currentApiData.states?.firstWhere(
      (state) => state.uid == event.stateUid,
    );

    emit(
      ReportCreationState.page1Ready(
        apiData: currentApiData.copyWith(districts: null), // Clear districts
        selections: currentSelections.copyWith(
          selectedStateUid: event.stateUid,
          selectedState: selectedState,
          // Clear dependent selections
          selectedDistrictUid: null,
          selectedDistrict: null,
          selectedRoadUid: null,
          selectedRoad: null,
        ),
      ),
    );
  }

  Future<void> _onSelectDistrict(
    SelectDistrict event,
    Emitter<ReportCreationState> emit,
  ) async {
    final currentApiData = _getCurrentApiData();
    final currentSelections = _getCurrentSelections();

    // Find the selected district from available districts
    final selectedDistrict = currentApiData.districts?.firstWhere(
      (district) => district.uid == event.districtUid,
    );

    emit(
      ReportCreationState.page1Ready(
        apiData: currentApiData.copyWith(roads: null), // Clear roads
        selections: currentSelections.copyWith(
          selectedDistrictUid: event.districtUid,
          selectedDistrict: selectedDistrict,
          // Clear dependent selections
          selectedRoadUid: null,
          selectedRoad: null,
        ),
      ),
    );
  }

  Future<void> _onSelectRoad(
    SelectRoad event,
    Emitter<ReportCreationState> emit,
  ) async {
    final currentApiData = _getCurrentApiData();
    final currentSelections = _getCurrentSelections();

    // Find the selected road from available roads
    final selectedRoad = currentApiData.roads?.firstWhere(
      (road) => road.uid == event.roadUid,
    );

    emit(
      ReportCreationState.page1Ready(
        apiData: currentApiData,
        selections: currentSelections.copyWith(
          selectedRoadUid: event.roadUid,
          selectedRoad: selectedRoad,
        ),
      ),
    );
  }

  Future<void> _onUpdateSection(
    UpdateSection event,
    Emitter<ReportCreationState> emit,
  ) async {
    final currentApiData = _getCurrentApiData();
    final currentSelections = _getCurrentSelections();

    // Validate section input
    String? sectionError;
    if (event.section.isEmpty) {
      sectionError = 'Section is required';
    } else {
      // Validate section range if road is selected
      final selectedRoad = currentSelections.selectedRoad;
      if (selectedRoad != null) {
        final sectionValue = double.tryParse(event.section);
        if (sectionValue == null) {
          sectionError = 'Please enter a valid number';
        } else if (selectedRoad.sectionStart != null &&
            selectedRoad.sectionFinish != null) {
          final start = double.tryParse(selectedRoad.sectionStart!);
          final finish = double.tryParse(selectedRoad.sectionFinish!);

          if (start != null && finish != null) {
            if (sectionValue < start || sectionValue > finish) {
              sectionError = 'Section must be between $start and $finish';
            }
          }
        }
      }
    }

    final updatedSelections = currentSelections.copyWith(
      section: event.section,
      sectionError: sectionError, // This will be null if no error
    );

    emit(
      ReportCreationState.page1Ready(
        apiData: currentApiData,
        selections: updatedSelections,
      ),
    );
  }

  // ============================================================================
  // QUANTITY & EQUIPMENT SELECTION HANDLERS
  // ============================================================================

  Future<void> _onSelectQuantityTypes(
    SelectQuantityTypes event,
    Emitter<ReportCreationState> emit,
  ) async {
    final currentApiData = _getCurrentApiData();
    final currentSelections = _getCurrentSelections();
    final currentFormData = _getCurrentFormData();

    // Find selected quantity types from available quantities
    final selectedQuantityTypes =
        currentApiData.quantities
            ?.where((qt) => event.quantityTypeUids.contains(qt.uid))
            .toList() ??
        [];

    emit(
      ReportCreationState.page2Ready(
        apiData: currentApiData,
        selections: currentSelections.copyWith(
          selectedQuantityTypeUids: event.quantityTypeUids,
          selectedQuantityTypes: selectedQuantityTypes,
        ),
        formData: currentFormData,
      ),
    );
  }

  Future<void> _onToggleQuantityType(
    ToggleQuantityType event,
    Emitter<ReportCreationState> emit,
  ) async {
    final currentSelections = _getCurrentSelections();
    final currentUids = List<String>.from(
      currentSelections.selectedQuantityTypeUids,
    );

    if (currentUids.contains(event.quantityTypeUid)) {
      currentUids.remove(event.quantityTypeUid);
    } else {
      currentUids.add(event.quantityTypeUid);
    }

    add(SelectQuantityTypes(currentUids));
  }

  Future<void> _onSelectEquipment(
    SelectEquipment event,
    Emitter<ReportCreationState> emit,
  ) async {
    final currentApiData = _getCurrentApiData();
    final currentSelections = _getCurrentSelections();
    final currentFormData = _getCurrentFormData();

    // Find selected equipment from available equipment
    final selectedEquipment =
        currentApiData.equipment
            ?.where((eq) => event.equipmentUids.contains(eq.uid))
            .toList() ??
        [];

    emit(
      ReportCreationState.page2Ready(
        apiData: currentApiData,
        selections: currentSelections.copyWith(
          selectedEquipmentUids: event.equipmentUids,
          selectedEquipment: selectedEquipment,
        ),
        formData: currentFormData,
      ),
    );
  }

  Future<void> _onToggleEquipment(
    ToggleEquipment event,
    Emitter<ReportCreationState> emit,
  ) async {
    final currentSelections = _getCurrentSelections();
    final currentUids = List<String>.from(
      currentSelections.selectedEquipmentUids,
    );

    if (currentUids.contains(event.equipmentUid)) {
      currentUids.remove(event.equipmentUid);
    } else {
      currentUids.add(event.equipmentUid);
    }

    add(SelectEquipment(currentUids));
  }

  // ============================================================================
  // FORM DATA EVENT HANDLERS
  // ============================================================================

  Future<void> _onUpdateFieldValue(
    UpdateFieldValue event,
    Emitter<ReportCreationState> emit,
  ) async {
    final currentApiData = _getCurrentApiData();
    final currentSelections = _getCurrentSelections();
    final currentFormData = _getCurrentFormData();

    final updatedFieldValues = Map<String, dynamic>.from(
      currentFormData.fieldValues,
    );
    updatedFieldValues[event.fieldKey] = event.value;

    emit(
      ReportCreationState.page2Ready(
        apiData: currentApiData,
        selections: currentSelections,
        formData: currentFormData.copyWith(fieldValues: updatedFieldValues),
      ),
    );
  }

  Future<void> _onAddImages(
    AddImages event,
    Emitter<ReportCreationState> emit,
  ) async {
    final currentApiData = _getCurrentApiData();
    final currentSelections = _getCurrentSelections();
    final currentFormData = _getCurrentFormData();

    final updatedImageFields = Map<String, List<String>>.from(
      currentFormData.imageFields,
    );
    final existingImages = updatedImageFields[event.fieldKey] ?? [];
    updatedImageFields[event.fieldKey] = [
      ...existingImages,
      ...event.imagePaths,
    ];

    emit(
      ReportCreationState.page2Ready(
        apiData: currentApiData,
        selections: currentSelections,
        formData: currentFormData.copyWith(imageFields: updatedImageFields),
      ),
    );
  }

  Future<void> _onRemoveImage(
    RemoveImage event,
    Emitter<ReportCreationState> emit,
  ) async {
    final currentApiData = _getCurrentApiData();
    final currentSelections = _getCurrentSelections();
    final currentFormData = _getCurrentFormData();

    final updatedImageFields = Map<String, List<String>>.from(
      currentFormData.imageFields,
    );
    final existingImages = updatedImageFields[event.fieldKey] ?? [];
    existingImages.remove(event.imagePath);
    updatedImageFields[event.fieldKey] = existingImages;

    emit(
      ReportCreationState.page2Ready(
        apiData: currentApiData,
        selections: currentSelections,
        formData: currentFormData.copyWith(imageFields: updatedImageFields),
      ),
    );
  }

  // ============================================================================
  // VALIDATION & SUBMISSION HANDLERS
  // ============================================================================

  Future<void> _onValidateForm(
    ValidateForm event,
    Emitter<ReportCreationState> emit,
  ) async {
    final currentApiData = _getCurrentApiData();
    final currentSelections = _getCurrentSelections();
    final currentFormData = _getCurrentFormData();

    final fieldErrors = <String, String?>{};
    final validationErrors = <String>[];

    // Validate basic selections
    if (currentSelections.selectedScopeUid == null) {
      validationErrors.add('Please select a scope of work');
    }
    if (currentSelections.selectedWeather == null) {
      validationErrors.add('Please select weather condition');
    }
    if (currentSelections.selectedRoadUid == null) {
      validationErrors.add('Please select a road');
    }
    if (currentSelections.section == null ||
        currentSelections.section!.isEmpty) {
      validationErrors.add('Please enter section information');
      fieldErrors['section'] = 'Section is required';
    }

    // Validate quantity type fields
    for (final quantityType in currentSelections.selectedQuantityTypes) {
      for (final field in quantityType.quantityFields) {
        final fieldKey = '${quantityType.uid}_${field.code}';

        if (field.isRequired) {
          final value = currentFormData.fieldValues[fieldKey];
          final imageValue = currentFormData.imageFields[fieldKey] ?? [];

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
      ReportCreationState.page2Ready(
        apiData: currentApiData,
        selections: currentSelections,
        formData: currentFormData.copyWith(
          fieldErrors: fieldErrors,
          validationErrors: validationErrors,
          isFormValid: isFormValid,
        ),
      ),
    );
  }

  Future<void> _onClearFieldError(
    ClearFieldError event,
    Emitter<ReportCreationState> emit,
  ) async {
    final currentApiData = _getCurrentApiData();
    final currentSelections = _getCurrentSelections();
    final currentFormData = _getCurrentFormData();

    final updatedFieldErrors = Map<String, String?>.from(
      currentFormData.fieldErrors,
    );
    updatedFieldErrors.remove(event.fieldKey);

    emit(
      ReportCreationState.page2Ready(
        apiData: currentApiData,
        selections: currentSelections,
        formData: currentFormData.copyWith(fieldErrors: updatedFieldErrors),
      ),
    );
  }

  Future<void> _onSubmitReport(
    SubmitReport event,
    Emitter<ReportCreationState> emit,
  ) async {
    final reportData = ReportData(
      apiData: _getCurrentApiData(),
      selections: _getCurrentSelections(),
      formData: _getCurrentFormData(),
    );

    // First validate
    if (!reportData.formData.isFormValid) {
      emit(
        ReportCreationState.submissionError(
          reportData: reportData,
          errorMessage: 'Please fix validation errors before submitting',
        ),
      );
      return;
    }

    emit(ReportCreationState.submitting(reportData: reportData));

    try {
      // TODO: Implement actual submission logic
      await Future.delayed(const Duration(seconds: 2)); // Simulate API call

      emit(ReportCreationState.submitted(reportData: reportData));
    } catch (e) {
      emit(
        ReportCreationState.submissionError(
          reportData: reportData,
          errorMessage: 'Failed to submit report: ${e.toString()}',
        ),
      );
    }
  }

  Future<void> _onSaveAsDraft(
    SaveAsDraft event,
    Emitter<ReportCreationState> emit,
  ) async {
    final reportData = ReportData(
      apiData: _getCurrentApiData(),
      selections: _getCurrentSelections(),
      formData: _getCurrentFormData(),
    );

    try {
      // TODO: Implement draft saving logic
      await Future.delayed(const Duration(seconds: 1)); // Simulate saving

      emit(ReportCreationState.draftSaved(reportData: reportData));
    } catch (e) {
      emit(
        ReportCreationState.draftError(
          reportData: reportData,
          errorMessage: 'Failed to save draft: ${e.toString()}',
        ),
      );
    }
  }

  // ============================================================================
  // UTILITY EVENT HANDLERS
  // ============================================================================

  Future<void> _onClearCache(
    ClearCache event,
    Emitter<ReportCreationState> emit,
  ) async {
    try {
      await _clearCacheUseCase();
      emit(const ReportCreationState.initial());
    } catch (e) {
      // Handle error if needed
    }
  }

  Future<void> _onResetForm(
    ResetForm event,
    Emitter<ReportCreationState> emit,
  ) async {
    emit(
      ReportCreationState.page1Ready(
        apiData: _getCurrentApiData(),
        selections: const ReportSelections(),
      ),
    );
  }

  Future<void> _onStartOver(
    StartOver event,
    Emitter<ReportCreationState> emit,
  ) async {
    emit(const ReportCreationState.initial());
  }
}
