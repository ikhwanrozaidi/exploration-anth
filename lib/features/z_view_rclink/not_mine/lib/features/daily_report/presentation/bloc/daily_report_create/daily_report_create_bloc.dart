import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:rclink_app/features/work_scope/domain/usecases/get_equipment_usecase.dart';
import 'package:rclink_app/features/work_scope/domain/usecases/get_work_scopes_usecase.dart';
import 'package:rclink_app/features/work_scope/domain/usecases/clear_work_scopes_cache_usecase.dart';
import 'package:rclink_app/features/work_scope/domain/usecases/get_quantity_usecase.dart';
// import 'package:rclink_app/features/road/domain/usecases/get_states_usecase.dart';
// import 'package:rclink_app/features/road/domain/usecases/get_district_usecase.dart';
import 'package:rclink_app/features/road/domain/usecases/get_road_usecase.dart';
import 'package:rclink_app/features/work_scope/domain/entities/work_equipment.dart';
import 'package:rclink_app/features/work_scope/domain/entities/work_quantity_type.dart';

import '../../../../../core/di/injection.dart';
import '../../../../auth/presentation/bloc/auth_bloc.dart';
import '../../../../auth/presentation/bloc/auth_state.dart';
import '../../../domain/usecases/clear_all_cache_usecase.dart';
import '../../../domain/usecases/submit_daily_report_usecase.dart';
import 'daily_report_create_event.dart';
import 'daily_report_create_state.dart';

@lazySingleton
class DailyReportCreateBloc
    extends Bloc<DailyReportCreateEvent, DailyReportCreateState> {
  final GetWorkScopesUseCase _getWorkScopesUseCase;
  final ClearWorkScopesCacheUseCase _clearCacheUseCase;
  // final GetStatesUseCase _getStatesUseCase;
  // final GetDistrictsUseCase _getDistrictsUseCase;
  final GetRoadsUseCase _getRoadsUseCase;
  final GetQuantityUseCase _getQuantitiesUseCase;
  final GetEquipmentUseCase _getEquipmentUseCase;
  final ClearAllCacheUseCase _clearAllCacheUseCase;
  final SubmitDailyReportUseCase _submitDailyReportUseCase;

  DailyReportCreateBloc(
    this._getWorkScopesUseCase,
    this._clearCacheUseCase,
    // this._getStatesUseCase,
    // this._getDistrictsUseCase,
    this._getRoadsUseCase,
    this._getQuantitiesUseCase,
    this._getEquipmentUseCase,
    this._clearAllCacheUseCase,
    this._submitDailyReportUseCase,
  ) : super(const DailyReportCreateState.initial()) {
    on<LoadWorkScopes>(_onLoadWorkScopes);
    // on<LoadStates>(_onLoadStates);
    // on<LoadDistricts>(_onLoadDistricts);
    // on<LoadRoads>(_onLoadRoads);
    on<LoadQuantities>(_onLoadQuantities);
    on<LoadEquipments>(_onLoadEquipments);
    on<LoadQuantitiesAndEquipments>(_onLoadQuantitiesAndEquipments);

    // Selection events
    on<SelectScope>(_onSelectScope);
    on<SelectWeather>(_onSelectWeather);
    on<SelectState>(_onSelectState);
    on<SelectDistrict>(_onSelectDistrict);
    on<SelectRoad>(_onSelectRoad);
    // on<UpdateSection>(_onUpdateSection);
    on<UpdateConditionSnapshots>(_onUpdateConditionSnapshots);
    on<UpdateWorkerImages>(_onUpdateWorkerImages);

    // Quantity and equipment selection events
    on<SelectQuantityTypes>(_onSelectQuantityTypes);
    on<ToggleQuantityType>(_onToggleQuantityType);
    on<SelectEquipment>(_onSelectEquipment);
    on<ToggleEquipment>(_onToggleEquipment);

    // Form data events
    on<UpdateFieldValue>(_onUpdateFieldValue);

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
    Emitter<DailyReportCreateState> emit,
  ) async {
    final currentApiData = _getCurrentApiData();
    final currentSelections = _getCurrentSelections();

    final result = await _getWorkScopesUseCase(
      GetWorkScopesParams(forceRefresh: event.forceRefresh),
    );

    result.fold(
      (failure) => emit(
        DailyReportCreateState.basicInfoError(
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
          DailyReportCreateState.selectingBasicInfo(
            apiData: updatedApiData,
            selections: currentSelections,
          ),
        );
      },
    );
  }

  // Future<void> _onLoadStates(
  //   LoadStates event,
  //   Emitter<DailyReportCreateState> emit,
  // ) async {
  //   final currentApiData = _getCurrentApiData();
  //   final currentSelections = _getCurrentSelections();

  //   final result = await _getStatesUseCase(
  //     GetStatesParams(forceRefresh: event.forceRefresh),
  //   );

  //   result.fold(
  //     (failure) => emit(
  //       DailyReportCreateState.basicInfoError(
  //         apiData: currentApiData,
  //         selections: currentSelections,
  //         errorMessage: failure.message,
  //       ),
  //     ),
  //     (states) {
  //       // Get the LATEST state data to avoid overwriting concurrent loads
  //       final latestApiData = _getCurrentApiData();

  //       final updatedApiData = ReportApiData(
  //         workScopes: latestApiData.workScopes, // Preserve existing
  //         states: states, // New data
  //         districts: latestApiData.districts, // Preserve existing
  //         roads: latestApiData.roads, // Preserve existing
  //         quantities: latestApiData.quantities, // Preserve existing
  //         equipment: latestApiData.equipment, // Preserve existing
  //       );

  //       emit(
  //         DailyReportCreateState.selectingBasicInfo(
  //           apiData: updatedApiData,
  //           selections: currentSelections,
  //         ),
  //       );
  //     },
  //   );
  // }

  // Future<void> _onLoadDistricts(
  //   LoadDistricts event,
  //   Emitter<DailyReportCreateState> emit,
  // ) async {
  //   final currentApiData = _getCurrentApiData();
  //   final currentSelections = _getCurrentSelections();

  //   final selectedState = currentSelections.selectedState;
  //   if (selectedState == null) {
  //     emit(
  //       DailyReportCreateState.basicInfoError(
  //         apiData: currentApiData,
  //         selections: currentSelections,
  //         errorMessage: 'No state selected',
  //       ),
  //     );
  //     return;
  //   }

  //   final result = await _getDistrictsUseCase(
  //     GetDistrictsParams(
  //       stateID: selectedState.id,
  //       forceRefresh: event.forceRefresh,
  //     ),
  //   );

  //   result.fold(
  //     (failure) => emit(
  //       DailyReportCreateState.basicInfoError(
  //         apiData: currentApiData,
  //         selections: currentSelections,
  //         errorMessage: failure.message,
  //       ),
  //     ),
  //     (districts) => emit(
  //       DailyReportCreateState.selectingBasicInfo(
  //         apiData: currentApiData.copyWith(districts: districts),
  //         selections: currentSelections,
  //       ),
  //     ),
  //   );
  // }

  // Future<void> _onLoadRoads(
  //   LoadRoads event,
  //   Emitter<DailyReportCreateState> emit,
  // ) async {
  //   final currentApiData = _getCurrentApiData();
  //   final currentSelections = _getCurrentSelections();

  //   final selectedDistrict = currentSelections.selectedDistrict;
  //   if (selectedDistrict == null) {
  //     emit(
  //       DailyReportCreateState.basicInfoError(
  //         apiData: currentApiData,
  //         selections: currentSelections,
  //         errorMessage: 'No district selected',
  //       ),
  //     );
  //     return;
  //   }

  //   final result = await _getRoadsUseCase(
  //     GetRoadsParams(
  //       districtID: selectedDistrict.id,
  //       forceRefresh: event.forceRefresh,
  //     ),
  //   );

  //   result.fold(
  //     (failure) => emit(
  //       DailyReportCreateState.basicInfoError(
  //         apiData: currentApiData,
  //         selections: currentSelections,
  //         errorMessage: failure.message,
  //       ),
  //     ),
  //     (roads) => emit(
  //       DailyReportCreateState.selectingBasicInfo(
  //         apiData: currentApiData.copyWith(roads: roads),
  //         selections: currentSelections,
  //       ),
  //     ),
  //   );
  // }

  Future<void> _onLoadQuantities(
    LoadQuantities event,
    Emitter<DailyReportCreateState> emit,
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
        DailyReportCreateState.detailsError(
          apiData: currentApiData,
          selections: currentSelections,
          formData: currentFormData,
          errorMessage: failure.message,
        ),
      ),
      (quantities) => emit(
        DailyReportCreateState.editingDetails(
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
    Emitter<DailyReportCreateState> emit,
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
        DailyReportCreateState.detailsError(
          apiData: currentApiData,
          selections: currentSelections,
          formData: currentFormData,
          errorMessage: failure.message,
        ),
      ),
      (equipments) => emit(
        DailyReportCreateState.editingDetails(
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
    Emitter<DailyReportCreateState> emit,
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
        DailyReportCreateState.detailsError(
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
      DailyReportCreateState.editingDetails(
        apiData: currentApiData.copyWith(
          quantities: quantities,
          equipment: equipments,
        ),
        selections: currentSelections,
        formData: currentFormData,
      ),
    );

    emit(
      DailyReportCreateState.editingDetails(
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
    Emitter<DailyReportCreateState> emit,
  ) async {
    final currentApiData = _getCurrentApiData();
    final currentSelections = _getCurrentSelections();

    // Find the selected scope from available scopes
    final selectedScope = currentApiData.workScopes.firstWhere(
      (scope) => scope.uid == event.scopeUid,
    );

    emit(
      DailyReportCreateState.selectingBasicInfo(
        apiData: currentApiData,
        selections: currentSelections.copyWith(selectedScope: selectedScope),
      ),
    );
  }

  Future<void> _onSelectWeather(
    SelectWeather event,
    Emitter<DailyReportCreateState> emit,
  ) async {
    final currentApiData = _getCurrentApiData();
    final currentSelections = _getCurrentSelections();

    emit(
      DailyReportCreateState.selectingBasicInfo(
        apiData: currentApiData,
        selections: currentSelections.copyWith(selectedWeather: event.weather),
      ),
    );
  }

  Future<void> _onSelectState(
    SelectState event,
    Emitter<DailyReportCreateState> emit,
  ) async {
    final currentApiData = _getCurrentApiData();
    final currentSelections = _getCurrentSelections();

    // Find the selected state from available states
    final selectedState = currentApiData.states.firstWhere(
      (state) => state.uid == event.stateUid,
    );

    emit(
      DailyReportCreateState.selectingBasicInfo(
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
    Emitter<DailyReportCreateState> emit,
  ) async {
    final currentApiData = _getCurrentApiData();
    final currentSelections = _getCurrentSelections();

    // Find the selected district from available districts
    final selectedDistrict = currentApiData.districts.firstWhere(
      (district) => district.uid == event.districtUid,
    );

    emit(
      DailyReportCreateState.selectingBasicInfo(
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
    Emitter<DailyReportCreateState> emit,
  ) async {
    final currentApiData = _getCurrentApiData();
    final currentSelections = _getCurrentSelections();

    // Find the selected road from available roads
    final selectedRoad = currentApiData.roads.firstWhere(
      (road) => road.uid == event.roadUid,
    );

    emit(
      DailyReportCreateState.selectingBasicInfo(
        apiData: currentApiData,
        selections: currentSelections.copyWith(selectedRoad: selectedRoad),
      ),
    );
  }

  // Future<void> _onUpdateSection(
  //   UpdateSection event,
  //   Emitter<DailyReportCreateState> emit,
  // ) async {
  //   final currentApiData = _getCurrentApiData();
  //   final currentSelections = _getCurrentSelections();

  //   // Validate section input
  //   String? sectionError;
  //   if (event.section.isEmpty) {
  //     sectionError = 'Section is required';
  //   } else {
  //     // Validate section range if road is selected
  //     final selectedRoad = currentSelections.selectedRoad;
  //     if (selectedRoad != null) {
  //       final sectionValue = double.tryParse(event.section);
  //       if (sectionValue == null) {
  //         sectionError = 'Please enter a valid number';
  //       } else if (selectedRoad.sectionStart != null &&
  //           selectedRoad.sectionFinish != null) {
  //         final start = double.tryParse(selectedRoad.sectionStart!);
  //         final finish = double.tryParse(selectedRoad.sectionFinish!);

  //         if (start != null && finish != null) {
  //           if (sectionValue < start || sectionValue > finish) {
  //             sectionError = 'Section must be between $start and $finish';
  //           }
  //         }
  //       }
  //     }
  //   }

  //   final updatedSelections = currentSelections.copyWith(
  //     section: event.section,
  //     sectionError: sectionError,
  //   );

  //   emit(
  //     DailyReportCreateState.selectingBasicInfo(
  //       apiData: currentApiData,
  //       selections: updatedSelections,
  //     ),
  //   );
  // }

  Future<void> _onUpdateConditionSnapshots(
    UpdateConditionSnapshots event,
    Emitter<DailyReportCreateState> emit,
  ) async {
    final currentApiData = _getCurrentApiData();
    final currentSelections = _getCurrentSelections();
    final currentFormData = _getCurrentFormData();

    emit(
      DailyReportCreateState.editingDetails(
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
    Emitter<DailyReportCreateState> emit,
  ) async {
    final currentApiData = _getCurrentApiData();
    final currentSelections = _getCurrentSelections();
    final currentFormData = _getCurrentFormData();

    emit(
      DailyReportCreateState.editingDetails(
        apiData: currentApiData,
        selections: currentSelections.copyWith(workerImages: event.images),
        formData: currentFormData,
      ),
    );
  }

  // ------------------------------------------------------- onSelect Page 2

  Future<void> _onSelectQuantityTypes(
    SelectQuantityTypes event,
    Emitter<DailyReportCreateState> emit,
  ) async {
    final currentApiData = _getCurrentApiData();
    final currentSelections = _getCurrentSelections();
    final currentFormData = _getCurrentFormData();

    // Find selected quantity types from available quantities
    final selectedQuantityTypes = currentApiData.quantities
        .where((qt) => event.quantityTypeUids.contains(qt.uid))
        .toList();

    emit(
      DailyReportCreateState.editingDetails(
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
    Emitter<DailyReportCreateState> emit,
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
    Emitter<DailyReportCreateState> emit,
  ) async {
    final currentApiData = _getCurrentApiData();
    final currentSelections = _getCurrentSelections();
    final currentFormData = _getCurrentFormData();

    // Find selected equipment from available equipment
    final selectedEquipment = currentApiData.equipment
        .where((eq) => event.equipmentUids.contains(eq.uid))
        .toList();

    emit(
      DailyReportCreateState.editingDetails(
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
    Emitter<DailyReportCreateState> emit,
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
    Emitter<DailyReportCreateState> emit,
  ) async {
    final currentApiData = _getCurrentApiData();
    final currentSelections = _getCurrentSelections();
    final currentFormData = _getCurrentFormData();

    final updatedFieldValues = Map<String, dynamic>.from(
      currentFormData.fieldValues,
    );
    updatedFieldValues[event.fieldKey] = event.value;

    emit(
      DailyReportCreateState.editingDetails(
        apiData: currentApiData,
        selections: currentSelections,
        formData: currentFormData.copyWith(fieldValues: updatedFieldValues),
      ),
    );
  }

  // ------------------------------------------------------- Validation & Submission

  Future<void> _onValidateForm(
    ValidateForm event,
    Emitter<DailyReportCreateState> emit,
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

          if (value == null || value.toString().isEmpty) {
            fieldErrors[fieldKey] = '${field.name} is required';
            validationErrors.add('${field.name} is required');
          }
        }
      }
    }

    final isFormValid = validationErrors.isEmpty;

    emit(
      DailyReportCreateState.editingDetails(
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
    Emitter<DailyReportCreateState> emit,
  ) async {
    final currentApiData = _getCurrentApiData();
    final currentSelections = _getCurrentSelections();
    final currentFormData = _getCurrentFormData();

    final updatedFieldErrors = Map<String, String?>.from(
      currentFormData.fieldErrors,
    );
    updatedFieldErrors.remove(event.fieldKey);

    emit(
      DailyReportCreateState.editingDetails(
        apiData: currentApiData,
        selections: currentSelections,
        formData: currentFormData.copyWith(fieldErrors: updatedFieldErrors),
      ),
    );
  }

  Future<void> _onSubmitReport(
    SubmitReport event,
    Emitter<DailyReportCreateState> emit,
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

          if (value == null || value.toString().isEmpty) {
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
        DailyReportCreateState.submissionError(
          reportData: reportData,
          errorMessage: validationErrors.first,
        ),
      );
      return;
    }

    print('⏳ Emitting submitting state...');
    emit(DailyReportCreateState.submitting(reportData: reportData));

    // Get admin UID from AuthBloc state
    String? adminUID;
    final authBloc = getIt<AuthBloc>();
    final authState = authBloc.state;

    if (authState is Authenticated && authState.currentAdmin != null) {
      adminUID = authState.currentAdmin!.uid;
      print('✅ Got admin UID from AuthBloc: $adminUID');
    } else {
      print('⚠️ No admin data available in AuthBloc state');
    }

    try {
      print('📤 Calling submit use case...');
      // Submit report using the use case
      final result = await _submitDailyReportUseCase(
        reportData: reportData,
        companyUID: event.companyUID,
        adminUID: adminUID,
      );

      result.fold(
        (failure) {
          print('❌ Submission failed: ${failure.message}');
          emit(
            DailyReportCreateState.submissionError(
              reportData: reportData,
              errorMessage: failure.message,
            ),
          );
        },
        (response) {
          print('✅ Submission successful: ${response.uid}');
          emit(DailyReportCreateState.submitted(reportData: reportData));
        },
      );
    } catch (e) {
      print('💥 Unexpected error during submission: $e');
      emit(
        DailyReportCreateState.submissionError(
          reportData: reportData,
          errorMessage: 'Failed to submit report: ${e.toString()}',
        ),
      );
    }
  }

  Future<void> _onSaveAsDraft(
    SaveAsDraft event,
    Emitter<DailyReportCreateState> emit,
  ) async {
    final reportData = ReportData(
      apiData: _getCurrentApiData(),
      selections: _getCurrentSelections(),
      formData: _getCurrentFormData(),
    );

    try {
      await Future.delayed(const Duration(seconds: 1));

      emit(DailyReportCreateState.draftSaved(reportData: reportData));
    } catch (e) {
      emit(
        DailyReportCreateState.draftError(
          reportData: reportData,
          errorMessage: 'Failed to save draft: ${e.toString()}',
        ),
      );
    }
  }

  // ------------------------------------------------------- Basics

  Future<void> _onResetForm(
    ResetForm event,
    Emitter<DailyReportCreateState> emit,
  ) async {
    final currentApiData = _getCurrentApiData();
    final currentSelections = _getCurrentSelections();

    final clearedFormData = const ReportFormData(
      fieldValues: {},
      fieldErrors: {},
      validationErrors: [],
      isFormValid: false,
    );

    final clearedSelections = currentSelections.copyWith(
      selectedQuantityTypes: [],
      selectedEquipment: [],
    );

    emit(
      DailyReportCreateState.editingDetails(
        apiData: currentApiData,
        selections: clearedSelections,
        formData: clearedFormData,
      ),
    );

    print('✅ BLoC: Form data reset successfully');
  }

  Future<void> _onClearCache(
    ClearCache event,
    Emitter<DailyReportCreateState> emit,
  ) async {
    try {
      await _clearCacheUseCase();
      emit(const DailyReportCreateState.initial());
    } catch (e) {
      print('Error clearing caches: $e');
    }
  }

  Future<void> _onStartOver(
    StartOver event,
    Emitter<DailyReportCreateState> emit,
  ) async {
    emit(const DailyReportCreateState.initial());
  }

  Future<void> _onClearAllCache(
    ClearAllCache event,
    Emitter<DailyReportCreateState> emit,
  ) async {
    try {
      await _clearAllCacheUseCase();
      emit(const DailyReportCreateState.initial());
    } catch (e) {
      print('Error clearing caches: $e');
    }
  }
}
