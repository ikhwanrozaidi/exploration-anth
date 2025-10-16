import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:rclink_app/features/daily_report_creation/domain/usecases/get_equipment_usecase.dart';

import '../../domain/entities/scope_of_work/work_equipment.dart';
import '../../domain/entities/scope_of_work/work_quantity_type.dart';
import '../../domain/usecases/clear_all_cache_usecase.dart';
import '../../domain/usecases/clear_work_scopes_cache_usecase.dart';
import '../../domain/usecases/get_district_usecase.dart';
import '../../domain/usecases/get_quantity_usecase.dart';
import '../../domain/usecases/get_road_usecase.dart';
import '../../domain/usecases/get_states_usecase.dart';
import '../../domain/usecases/get_work_scopes_usecase.dart';
import '../../domain/usecases/submit_daily_report_usecase.dart';
import 'report_creation_event.dart';
import 'report_creation_state.dart';

@lazySingleton
class ReportCreationBloc
    extends Bloc<ReportCreationEvent, ReportCreationState> {
  final GetWorkScopesUseCase _getWorkScopesUseCase;
  final ClearWorkScopesCacheUseCase _clearCacheUseCase;
  final GetStatesUseCase _getStatesUseCase;
  final GetDistrictsUseCase _getDistrictsUseCase;
  final GetRoadsUseCase _getRoadsUseCase;
  final GetQuantityUseCase _getQuantitiesUseCase;
  final GetEquipmentUseCase _getEquipmentUseCase;
  final ClearAllCacheUseCase _clearAllCacheUseCase;
  final SubmitDailyReportUseCase _submitDailyReportUseCase;

  ReportCreationBloc(
    this._getWorkScopesUseCase,
    this._clearCacheUseCase,
    this._getStatesUseCase,
    this._getDistrictsUseCase,
    this._getRoadsUseCase,
    this._getQuantitiesUseCase,
    this._getEquipmentUseCase,
    this._clearAllCacheUseCase,
    this._submitDailyReportUseCase,
  ) : super(const ReportCreationState.initial()) {
    // Initial load events
    on<LoadWorkScopes>(_onLoadWorkScopes);
    on<LoadStates>(_onLoadStates);
    on<LoadDistricts>(_onLoadDistricts);
    on<LoadRoads>(_onLoadRoads);
    on<LoadQuantities>(_onLoadQuantities);
    on<LoadEquipments>(_onLoadEquipments);
    on<LoadQuantitiesAndEquipments>(_onLoadQuantitiesAndEquipments);

    // Selection events
    on<SelectScope>(_onSelectScope);
    on<SelectWeather>(_onSelectWeather);
    on<SelectState>(_onSelectState);
    on<SelectDistrict>(_onSelectDistrict);
    on<SelectRoad>(_onSelectRoad);
    on<UpdateSection>(_onUpdateSection);
    on<UpdateConditionSnapshots>(_onUpdateConditionSnapshots);
    on<UpdateWorkerImages>(_onUpdateWorkerImages);

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
    on<ResetForm>(_onResetForm);
    on<ClearCache>(_onClearCache);
    on<StartOver>(_onStartOver);
    on<ClearAllCache>(_onClearAllCache);
  }

  // ------------------------------------------------------- Helper, Fetch from API data
  ReportApiData _getCurrentApiData() {
    return state.maybeMap(
      selectingBasicInfo: (state) => state.apiData,
      basicInfoError: (state) => state.apiData,
      editingDetails: (state) => state.apiData,
      detailsError: (state) => state.apiData,
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
      selectingBasicInfo: (state) => state.selections,
      basicInfoError: (state) => state.selections,
      editingDetails: (state) => state.selections,
      detailsError: (state) => state.selections,
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
      editingDetails: (state) => state.formData,
      detailsError: (state) => state.formData,
      submitting: (state) => state.reportData.formData,
      submitted: (state) => state.reportData.formData,
      submissionError: (state) => state.reportData.formData,
      draftSaved: (state) => state.reportData.formData,
      draftError: (state) => state.reportData.formData,
      orElse: () => const ReportFormData(),
    );
  }

  // ------------------------------------------------------- Load API fetching
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
        ReportCreationState.basicInfoError(
          apiData: currentApiData,
          selections: currentSelections,
          errorMessage: failure.message,
        ),
      ),
      (workScopes) {
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
          ReportCreationState.selectingBasicInfo(
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
        ReportCreationState.basicInfoError(
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
          ReportCreationState.selectingBasicInfo(
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
        ReportCreationState.basicInfoError(
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
        ReportCreationState.basicInfoError(
          apiData: currentApiData,
          selections: currentSelections,
          errorMessage: failure.message,
        ),
      ),
      (districts) => emit(
        ReportCreationState.selectingBasicInfo(
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
        ReportCreationState.basicInfoError(
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
        ReportCreationState.basicInfoError(
          apiData: currentApiData,
          selections: currentSelections,
          errorMessage: failure.message,
        ),
      ),
      (roads) => emit(
        ReportCreationState.selectingBasicInfo(
          apiData: currentApiData.copyWith(roads: roads),
          selections: currentSelections,
        ),
      ),
    );
  }

  Future<void> _onLoadQuantities(
    LoadQuantities event,
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
        ReportCreationState.detailsError(
          apiData: currentApiData,
          selections: currentSelections,
          formData: currentFormData,
          errorMessage: failure.message,
        ),
      ),
      (quantities) => emit(
        ReportCreationState.editingDetails(
          apiData: currentApiData.copyWith(
            quantities: quantities,
            equipment: currentApiData.equipment,
          ),
          selections: currentSelections,
          formData: currentFormData,
        ),
      ),
    );
  }

  Future<void> _onLoadEquipments(
    LoadEquipments event,
    Emitter<ReportCreationState> emit,
  ) async {
    final currentApiData = _getCurrentApiData();
    final currentSelections = _getCurrentSelections();
    final currentFormData = _getCurrentFormData();

    final result = await _getEquipmentUseCase(
      GetEquipmentParams(
        companyUID: event.companyUID,
        workScopeUID: event.workScopeUID,
        forceRefresh: event.forceRefresh,
      ),
    );

    result.fold(
      (failure) => emit(
        ReportCreationState.detailsError(
          apiData: currentApiData,
          selections: currentSelections,
          formData: currentFormData,
          errorMessage: failure.message,
        ),
      ),
      (equipments) => emit(
        ReportCreationState.editingDetails(
          apiData: currentApiData.copyWith(
            equipment: equipments,
            quantities: currentApiData.quantities,
          ),
          selections: currentSelections,
          formData: currentFormData,
        ),
      ),
    );
  }

  Future<void> _onLoadQuantitiesAndEquipments(
    LoadQuantitiesAndEquipments event,
    Emitter<ReportCreationState> emit,
  ) async {
    final currentApiData = _getCurrentApiData();
    final currentSelections = _getCurrentSelections();
    final currentFormData = _getCurrentFormData();

    final results = await Future.wait([
      _getQuantitiesUseCase(
        GetQuantityParams(
          companyUID: event.companyUID,
          workScopeUID: event.workScopeUID,
          forceRefresh: event.forceRefresh,
        ),
      ),
      _getEquipmentUseCase(
        GetEquipmentParams(
          companyUID: event.companyUID,
          workScopeUID: event.workScopeUID,
          forceRefresh: event.forceRefresh,
        ),
      ),
    ]);

    final quantitiesResult = results[0];
    final equipmentsResult = results[1];

    final quantitiesFailure = quantitiesResult.fold((l) => l, (r) => null);
    final equipmentsFailure = equipmentsResult.fold((l) => l, (r) => null);

    if (quantitiesFailure != null || equipmentsFailure != null) {
      emit(
        ReportCreationState.detailsError(
          apiData: currentApiData,
          selections: currentSelections,
          formData: currentFormData,
          errorMessage:
              quantitiesFailure?.message ?? equipmentsFailure!.message,
        ),
      );
      return;
    }

    final quantities = quantitiesResult.fold(
      (l) => <WorkQuantityType>[],
      (r) => r as List<WorkQuantityType>,
    );
    final equipments = equipmentsResult.fold(
      (l) => <WorkEquipment>[],
      (r) => r as List<WorkEquipment>,
    );

    emit(
      ReportCreationState.editingDetails(
        apiData: currentApiData.copyWith(
          quantities: quantities,
          equipment: equipments,
        ),
        selections: currentSelections,
        formData: currentFormData,
      ),
    );

    emit(
      ReportCreationState.editingDetails(
        apiData: currentApiData.copyWith(
          quantities: quantities,
          equipment: equipments,
        ),
        selections: currentSelections,
        formData: currentFormData,
      ),
    );
  }

  // ------------------------------------------------------- onSelect

  Future<void> _onSelectScope(
    SelectScope event,
    Emitter<ReportCreationState> emit,
  ) async {
    final currentApiData = _getCurrentApiData();
    final currentSelections = _getCurrentSelections();

    // Find the selected scope from available scopes
    final selectedScope = currentApiData.workScopes.firstWhere(
      (scope) => scope.uid == event.scopeUid,
    );

    emit(
      ReportCreationState.selectingBasicInfo(
        apiData: currentApiData,
        selections: currentSelections.copyWith(
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
      ReportCreationState.selectingBasicInfo(
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
    final selectedState = currentApiData.states.firstWhere(
      (state) => state.uid == event.stateUid,
    );

    emit(
      ReportCreationState.selectingBasicInfo(
        apiData: currentApiData.copyWith(districts: []), // Clear districts
        selections: currentSelections.copyWith(
          selectedState: selectedState,
          // Clear dependent selections
          selectedDistrict: null,
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
    final selectedDistrict = currentApiData.districts.firstWhere(
      (district) => district.uid == event.districtUid,
    );

    emit(
      ReportCreationState.selectingBasicInfo(
        apiData: currentApiData.copyWith(roads: []), // Clear roads
        selections: currentSelections.copyWith(
          selectedDistrict: selectedDistrict,
          // Clear dependent selections
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
    final selectedRoad = currentApiData.roads.firstWhere(
      (road) => road.uid == event.roadUid,
    );

    emit(
      ReportCreationState.selectingBasicInfo(
        apiData: currentApiData,
        selections: currentSelections.copyWith(
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
      sectionError: sectionError,
    );

    emit(
      ReportCreationState.selectingBasicInfo(
        apiData: currentApiData,
        selections: updatedSelections,
      ),
    );
  }

  Future<void> _onUpdateConditionSnapshots(
    UpdateConditionSnapshots event,
    Emitter<ReportCreationState> emit,
  ) async {
    final currentApiData = _getCurrentApiData();
    final currentSelections = _getCurrentSelections();
    final currentFormData = _getCurrentFormData();

    emit(
      ReportCreationState.editingDetails(
        apiData: currentApiData,
        selections: currentSelections.copyWith(
          conditionSnapshots: event.snapshots,
        ),
        formData: currentFormData,
      ),
    );
  }

  Future<void> _onUpdateWorkerImages(
    UpdateWorkerImages event,
    Emitter<ReportCreationState> emit,
  ) async {
    final currentApiData = _getCurrentApiData();
    final currentSelections = _getCurrentSelections();
    final currentFormData = _getCurrentFormData();

    emit(
      ReportCreationState.editingDetails(
        apiData: currentApiData,
        selections: currentSelections.copyWith(workerImages: event.images),
        formData: currentFormData,
      ),
    );
  }

  // ------------------------------------------------------- onSelect Page 2

  Future<void> _onSelectQuantityTypes(
    SelectQuantityTypes event,
    Emitter<ReportCreationState> emit,
  ) async {
    final currentApiData = _getCurrentApiData();
    final currentSelections = _getCurrentSelections();
    final currentFormData = _getCurrentFormData();

    // Find selected quantity types from available quantities
    final selectedQuantityTypes = currentApiData.quantities
        .where((qt) => event.quantityTypeUids.contains(qt.uid))
        .toList();

    emit(
      ReportCreationState.editingDetails(
        apiData: currentApiData,
        selections: currentSelections.copyWith(
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
    final currentUids = currentSelections.selectedQuantityTypes
        .map((qt) => qt.uid)
        .toList();

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
    final selectedEquipment = currentApiData.equipment
        .where((eq) => event.equipmentUids.contains(eq.uid))
        .toList();

    emit(
      ReportCreationState.editingDetails(
        apiData: currentApiData,
        selections: currentSelections.copyWith(
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
    final currentUids = currentSelections.selectedEquipment
        .map((eq) => eq.uid)
        .toList();

    if (currentUids.contains(event.equipmentUid)) {
      currentUids.remove(event.equipmentUid);
    } else {
      currentUids.add(event.equipmentUid);
    }

    add(SelectEquipment(currentUids));
  }

  // -------------------------------------------------------

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
      ReportCreationState.editingDetails(
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
      ReportCreationState.editingDetails(
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
      ReportCreationState.editingDetails(
        apiData: currentApiData,
        selections: currentSelections,
        formData: currentFormData.copyWith(imageFields: updatedImageFields),
      ),
    );
  }

  // ------------------------------------------------------- Validation & Submission

  Future<void> _onValidateForm(
    ValidateForm event,
    Emitter<ReportCreationState> emit,
  ) async {
    final currentApiData = _getCurrentApiData();
    final currentSelections = _getCurrentSelections();
    final currentFormData = _getCurrentFormData();

    final fieldErrors = <String, String?>{};
    final validationErrors = <String>[];

    if (currentSelections.selectedScope == null) {
      validationErrors.add('Please select a scope of work');
    }
    if (currentSelections.selectedWeather == null) {
      validationErrors.add('Please select weather condition');
    }
    if (currentSelections.selectedRoad == null) {
      validationErrors.add('Please select a road');
    }
    if (currentSelections.section == null ||
        currentSelections.section!.isEmpty) {
      validationErrors.add('Please enter section information');
      fieldErrors['section'] = 'Section is required';
    }

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
      ReportCreationState.editingDetails(
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
      ReportCreationState.editingDetails(
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
    print('🚀 SubmitReport event received - companyUID: ${event.companyUID}');

    // Run validation first
    final currentApiData = _getCurrentApiData();
    final currentSelections = _getCurrentSelections();
    final currentFormData = _getCurrentFormData();

    final fieldErrors = <String, String?>{};
    final validationErrors = <String>[];

    if (currentSelections.selectedScope == null) {
      validationErrors.add('Please select a scope of work');
    }
    if (currentSelections.selectedWeather == null) {
      validationErrors.add('Please select weather condition');
    }
    if (currentSelections.selectedRoad == null) {
      validationErrors.add('Please select a road');
    }
    if (currentSelections.section == null ||
        currentSelections.section!.isEmpty) {
      validationErrors.add('Please enter section information');
      fieldErrors['section'] = 'Section is required';
    }

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

    print('📋 Validation results:');
    print('  - Scope: ${currentSelections.selectedScope?.name}');
    print('  - Weather: ${currentSelections.selectedWeather}');
    print('  - Road: ${currentSelections.selectedRoad?.name}');
    print('  - Section: ${currentSelections.section}');
    print('  - Validation errors: $validationErrors');
    print('  - Form valid: $isFormValid');

    final reportData = ReportData(
      apiData: currentApiData,
      selections: currentSelections,
      formData: currentFormData.copyWith(
        fieldErrors: fieldErrors,
        validationErrors: validationErrors,
        isFormValid: isFormValid,
      ),
    );

    if (!isFormValid) {
      print('❌ Form validation failed');
      emit(
        ReportCreationState.submissionError(
          reportData: reportData,
          errorMessage: validationErrors.first,
        ),
      );
      return;
    }

    print('⏳ Emitting submitting state...');
    emit(ReportCreationState.submitting(reportData: reportData));

    try {
      print('📤 Calling submit use case...');
      // Submit report using the use case
      final result = await _submitDailyReportUseCase(
        reportData: reportData,
        companyUID: event.companyUID,
      );

      result.fold(
        (failure) {
          print('❌ Submission failed: ${failure.message}');
          emit(
            ReportCreationState.submissionError(
              reportData: reportData,
              errorMessage: failure.message,
            ),
          );
        },
        (response) {
          print('✅ Submission successful: ${response.uid}');
          emit(ReportCreationState.submitted(reportData: reportData));
        },
      );
    } catch (e) {
      print('💥 Unexpected error during submission: $e');
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
      await Future.delayed(const Duration(seconds: 1));

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

  // ------------------------------------------------------- Basics

  Future<void> _onResetForm(
    ResetForm event,
    Emitter<ReportCreationState> emit,
  ) async {
    final currentApiData = _getCurrentApiData();
    final currentSelections = _getCurrentSelections();

    final clearedFormData = const ReportFormData(
      fieldValues: {},
      imageFields: {},
      fieldErrors: {},
      validationErrors: [],
      isFormValid: false,
    );

    final clearedSelections = currentSelections.copyWith(
      selectedQuantityTypes: [],
      selectedEquipment: [],
    );

    emit(
      ReportCreationState.editingDetails(
        apiData: currentApiData,
        selections: clearedSelections,
        formData: clearedFormData,
      ),
    );

    print('✅ BLoC: Form data reset successfully');
  }

  Future<void> _onClearCache(
    ClearCache event,
    Emitter<ReportCreationState> emit,
  ) async {
    try {
      await _clearCacheUseCase();
      emit(const ReportCreationState.initial());
    } catch (e) {
      print('Error clearing caches: $e');
    }
  }

  Future<void> _onStartOver(
    StartOver event,
    Emitter<ReportCreationState> emit,
  ) async {
    emit(const ReportCreationState.initial());
  }

  Future<void> _onClearAllCache(
    ClearAllCache event,
    Emitter<ReportCreationState> emit,
  ) async {
    try {
      await _clearAllCacheUseCase();
      emit(const ReportCreationState.initial());
    } catch (e) {
      print('Error clearing caches: $e');
    }
  }
}
