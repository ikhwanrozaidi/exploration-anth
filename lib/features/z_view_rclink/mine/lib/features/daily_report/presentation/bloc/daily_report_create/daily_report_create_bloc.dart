import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:rclink_app/features/work_scope/domain/usecases/get_equipment_usecase.dart';
import 'package:rclink_app/features/work_scope/domain/usecases/get_work_scopes_usecase.dart';
import 'package:rclink_app/features/work_scope/domain/usecases/clear_work_scopes_cache_usecase.dart';
import 'package:rclink_app/features/work_scope/domain/usecases/get_quantity_usecase.dart';
// import 'package:rclink_app/features/road/domain/usecases/get_states_usecase.dart';
// import 'package:rclink_app/features/road/domain/usecases/get_district_usecase.dart';
// import 'package:rclink_app/features/road/domain/usecases/get_road_usecase.dart';
import 'package:rclink_app/features/work_scope/domain/entities/work_equipment.dart';
import 'package:rclink_app/features/work_scope/domain/entities/work_quantity_type.dart';

import '../../../../../core/di/injection.dart';
import '../../../../auth/presentation/bloc/auth_bloc.dart';
import '../../../../auth/presentation/bloc/auth_state.dart';
import '../../../../company/presentation/bloc/company_bloc.dart';
import '../../../../company/presentation/bloc/company_state.dart';
import '../../../../road/domain/entities/district_entity.dart';
import '../../../../road/domain/entities/province_entity.dart';
import '../../../../road/domain/entities/road_entity.dart';
import '../../../../work_scope/domain/entities/work_scope.dart';
import '../../../data/datasources/daily_report_local_datasource.dart';
import '../../../data/mapper/report_data_to_create_model_mapper.dart';
import '../../../data/models/district_response_model.dart';
import '../../../data/models/road_response_model.dart';
import '../../../data/models/work_scope_response_model.dart';
import '../../../domain/usecases/clear_all_cache_usecase.dart';
import '../../../domain/usecases/submit_daily_report_usecase.dart';
import '../../../../../core/sync/datasources/image_local_datasource.dart';
import '../../../../../core/sync/sync_constants.dart';
import '../../../../../shared/widgets/gallery/models/gallery_image.dart';
import 'daily_report_create_event.dart';
import 'daily_report_create_state.dart';

@lazySingleton
class DailyReportCreateBloc
    extends Bloc<DailyReportCreateEvent, DailyReportCreateState> {
  final GetWorkScopesUseCase _getWorkScopesUseCase;
  final ClearWorkScopesCacheUseCase _clearCacheUseCase;
  // final GetStatesUseCase _getStatesUseCase;
  // final GetDistrictsUseCase _getDistrictsUseCase;
  // final GetRoadsUseCase _getRoadsUseCase;
  final GetQuantityUseCase _getQuantitiesUseCase;
  final GetEquipmentUseCase _getEquipmentUseCase;
  final ClearAllCacheUseCase _clearAllCacheUseCase;
  final SubmitDailyReportUseCase _submitDailyReportUseCase;
  final DailyReportLocalDataSource _localDataSource;
  final ImageLocalDataSource _imageLocalDataSource;

  // Auto-save debounce timer
  Timer? _autoSaveTimer;

  DailyReportCreateBloc(
    this._getWorkScopesUseCase,
    this._clearCacheUseCase,
    // this._getStatesUseCase,
    // this._getDistrictsUseCase,
    // this._getRoadsUseCase,
    this._getQuantitiesUseCase,
    this._getEquipmentUseCase,
    this._clearAllCacheUseCase,
    this._submitDailyReportUseCase,
    this._localDataSource,
    this._imageLocalDataSource,
  ) : super(const DailyReportCreateState.initial()) {
    on<LoadWorkScopes>(_onLoadWorkScopes);
    // on<LoadStates>(_onLoadStates); // Handled by RoadFieldTile widget
    // on<LoadDistricts>(_onLoadDistricts); // Handled by RoadFieldTile widget
    // on<LoadRoads>(_onLoadRoads); // Handled by RoadFieldTile widget
    on<LoadQuantities>(_onLoadQuantities);
    on<LoadEquipments>(_onLoadEquipments);
    on<LoadQuantitiesAndEquipments>(_onLoadQuantitiesAndEquipments);

    // Selection events
    on<SelectScope>(_onSelectScope);
    on<SelectWeather>(_onSelectWeather);
    on<SelectState>(_onSelectState);
    on<SelectDistrict>(_onSelectDistrict);
    on<SelectRoad>(_onSelectRoad);
    on<SelectLocationFromResult>(_onSelectLocationFromResult);
    on<UpdateSection>(_onUpdateSection);
    on<UpdateConditionSnapshots>(_onUpdateConditionSnapshots);
    on<UpdateWorkerImages>(_onUpdateWorkerImages);

    // Quantity field data events
    on<UpdateQuantityFieldValue>(_onUpdateQuantityFieldValue);
    on<UpdateQuantityFieldImages>(_onUpdateQuantityFieldImages);
    on<RemoveQuantityType>(_onRemoveQuantityType);

    // Segment data events
    on<UpdateSegmentData>(_onUpdateSegmentData);

    // Worker information events
    on<UpdateWorkerCount>(_onUpdateWorkerCount);
    on<UpdateWorkerImage>(_onUpdateWorkerImage);

    // Notes and additional images events
    on<UpdateNotes>(_onUpdateNotes);
    on<UpdateAdditionalImages>(_onUpdateAdditionalImages);

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

    // Draft management events
    on<InitializeDraftReport>(_onInitializeDraftReport);
    on<LoadExistingDraft>(_onLoadExistingDraft);
    on<DeleteDraft>(_onDeleteDraft);
    on<AutoSaveDraft>(_onAutoSaveDraft);

    // Utility events
    on<ResetForm>(_onResetForm);
    on<ClearCache>(_onClearCache);
    on<StartOver>(_onStartOver);
    on<ClearAllCache>(_onClearAllCache);
  }

  @override
  Future<void> close() {
    _autoSaveTimer?.cancel();
    return super.close();
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

  /// Helper method to trigger auto-save if in draft mode
  void _triggerAutoSave(String companyUID) {
    final selections = _getCurrentSelections();
    if (selections.isDraftMode) {
      add(AutoSaveDraft(companyUID: companyUID));
    }
  }

  /// Check if form is ready for submission
  /// Returns true if all required fields are filled
  bool canSubmitForm() {
    final selections = _getCurrentSelections();

    // 1. Basic info must be complete
    if (selections.selectedScope == null ||
        selections.selectedWeather == null ||
        selections.selectedRoad == null ||
        selections.section == null ||
        selections.section!.isEmpty) {
      return false;
    }

    // 2. At least 1 equipment must be selected
    if (selections.selectedEquipment.isEmpty) {
      return false;
    }

    // 3. At least 1 quantity type must be selected
    if (selections.selectedQuantityTypes.isEmpty) {
      return false;
    }

    // 4. Images must be uploaded (before only, during/after optional)
    final conditionSnapshots = selections.conditionSnapshots;
    final beforeImages = conditionSnapshots['before'] ?? [];

    if (beforeImages.isEmpty) {
      return false;
    }

    // 5. Quantity fields must be filled
    for (final quantityType in selections.selectedQuantityTypes) {
      final instanceKeys = selections.quantityFieldData.keys
          .where((key) => key.startsWith('${quantityType.uid}_'))
          .toList();

      if (instanceKeys.isEmpty) {
        return false; // No data entered for this quantity type
      }

      // Check if all required fields are filled
      for (final compositeKey in instanceKeys) {
        final instanceData = selections.quantityFieldData[compositeKey] ?? {};

        for (final field in quantityType.quantityFields) {
          if (field.isRequired && !field.isForSegment) {
            final value = instanceData[field.uid];
            if (value == null || value.toString().trim().isEmpty) {
              return false; // Required field is empty
            }
          }
        }
      }
    }

    return true; // All validations passed
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

        // CRITICAL FIX: Check if selections were just cleared by StartOver
        // If all key selections are null, use fresh empty selections instead of preserving old ones
        final latestSelections = _getCurrentSelections();
        final shouldUseEmptySelections =
            latestSelections.selectedScope == null &&
            latestSelections.selectedWeather == null &&
            latestSelections.selectedRoad == null &&
            latestSelections.section == null;

        emit(
          DailyReportCreateState.selectingBasicInfo(
            apiData: updatedApiData,
            selections: shouldUseEmptySelections
                ? const ReportSelections()
                : latestSelections,
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
    Emitter<DailyReportCreateState> emit, {
    ReportApiData?
    updatedApiData, // CRITICAL: Must pass when loading draft to preserve work scopes in state
    ReportSelections?
    updatedSelections, // CRITICAL: Must pass when loading draft to preserve road/district in state
  }) async {
    final currentApiData = updatedApiData ?? _getCurrentApiData();
    final currentSelections = updatedSelections ?? _getCurrentSelections();
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

    // Extract quantity type UIDs from quantityFieldData composite keys
    // This is needed when loading a draft - the draft has quantityFieldData
    // but selectedQuantityTypes is empty, so we need to populate it
    final quantityTypeUIDsFromData = currentSelections.quantityFieldData.keys
        .map((compositeKey) {
          // Parse "quantityTypeUID_sequenceNo" to extract UID
          final parts = compositeKey.split('_');
          return parts.length >= 2
              ? parts.sublist(0, parts.length - 1).join('_')
              : compositeKey;
        })
        .toSet() // Remove duplicates
        .toList();

    // Match UIDs to actual WorkQuantityType objects
    final selectedQuantityTypes = quantities
        .where((qt) => quantityTypeUIDsFromData.contains(qt.uid))
        .toList();

    print('🔍 [LOAD Q&E] Matching quantity types from draft:');
    print('   - UIDs from quantityFieldData: $quantityTypeUIDsFromData');
    print(
      '   - Matched quantity types: ${selectedQuantityTypes.map((q) => q.name).toList()}',
    );

    emit(
      DailyReportCreateState.editingDetails(
        apiData: currentApiData.copyWith(
          quantities: quantities,
          equipment: equipments,
        ),
        selections: currentSelections.copyWith(
          selectedQuantityTypes:
              selectedQuantityTypes, // ✅ Populate from draft data
        ),
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

    // Find the selected road from available roads (or use currently selected road if already set)
    final selectedRoad = currentApiData.roads.firstWhere(
      (road) => road.uid == event.roadUid,
      orElse: () {
        // If road not in list, keep the currently selected road
        // This happens when RoadFieldTile manages its own data
        print(
          '⚠️ Road ${event.roadUid} not found in roads list, keeping current selection',
        );
        return currentSelections.selectedRoad!;
      },
    );

    emit(
      DailyReportCreateState.selectingBasicInfo(
        apiData: currentApiData,
        selections: currentSelections.copyWith(selectedRoad: selectedRoad),
      ),
    );
  }

  Future<void> _onSelectLocationFromResult(
    SelectLocationFromResult event,
    Emitter<DailyReportCreateState> emit,
  ) async {
    final currentApiData = _getCurrentApiData();
    final currentSelections = _getCurrentSelections();

    print('📍 Storing location from RoadSelectionResult:');
    print('   Province: ${event.province.name}');
    print('   District: ${event.district.name}');
    print(
      '   Road: ${event.road.name} (${event.road.sectionStart} - ${event.road.sectionFinish})',
    );
    print(
      '🔍 [DRAFT UID DEBUG] SelectLocationFromResult - Before copyWith - draftUID: ${currentSelections.draftReportUID}, isDraftMode: ${currentSelections.isDraftMode}',
    );

    final updatedSelections = currentSelections.copyWith(
      selectedState: event.province,
      selectedDistrict: event.district,
      selectedRoad: event.road,
    );

    print(
      '🔍 [DRAFT UID DEBUG] SelectLocationFromResult - After copyWith - draftUID: ${updatedSelections.draftReportUID}, isDraftMode: ${updatedSelections.isDraftMode}',
    );

    emit(
      DailyReportCreateState.selectingBasicInfo(
        apiData: currentApiData,
        selections: updatedSelections,
      ),
    );
  }

  Future<void> _onUpdateSection(
    UpdateSection event,
    Emitter<DailyReportCreateState> emit,
  ) async {
    final currentApiData = _getCurrentApiData();
    final currentSelections = _getCurrentSelections();

    print('🔍 UpdateSection called with value: "${event.section}"');
    print('🔍 Selected road: ${currentSelections.selectedRoad?.name}');
    print(
      '🔍 Section range: ${currentSelections.selectedRoad?.sectionStart} - ${currentSelections.selectedRoad?.sectionFinish}',
    );

    // Validate section input
    String? sectionError;
    if (event.section.isEmpty) {
      sectionError = 'Section is required';
      print('❌ Section is empty');
    } else {
      // Validate section range if road is selected
      final selectedRoad = currentSelections.selectedRoad;
      if (selectedRoad != null) {
        final sectionValue = double.tryParse(event.section);
        print('🔍 Parsed section value: $sectionValue');

        if (sectionValue == null) {
          sectionError = 'Please enter a valid number';
          print('❌ Section is not a valid number');
        } else if (selectedRoad.sectionStart != null &&
            selectedRoad.sectionFinish != null) {
          // Road entity already has sectionStart and sectionFinish as double?
          final start = selectedRoad.sectionStart!;
          final finish = selectedRoad.sectionFinish!;
          print(
            '🔍 Validating: $sectionValue < $start || $sectionValue > $finish',
          );

          if (sectionValue < start || sectionValue > finish) {
            sectionError = 'Section must be between $start and $finish';
            print('❌ Section out of range');
          } else {
            print('✅ Section is valid');
          }
        } else {
          print(
            '⚠️ Road has no section range defined (sectionStart or sectionFinish is null)',
          );
        }
      } else {
        print('⚠️ No road selected');
      }
    }

    print('🔍 Final sectionError: $sectionError');
    print(
      '🔍 [DRAFT UID DEBUG] Before copyWith - draftUID: ${currentSelections.draftReportUID}, isDraftMode: ${currentSelections.isDraftMode}',
    );

    final updatedSelections = currentSelections.copyWith(
      section: event.section,
      sectionError: sectionError,
    );

    print(
      '🔍 [DRAFT UID DEBUG] After copyWith - draftUID: ${updatedSelections.draftReportUID}, isDraftMode: ${updatedSelections.isDraftMode}',
    );

    emit(
      DailyReportCreateState.selectingBasicInfo(
        apiData: currentApiData,
        selections: updatedSelections,
      ),
    );

    print(
      '✅ State emitted with section: "${updatedSelections.section}", error: $sectionError',
    );
  }

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

  // ------------------------------------------------------- Quantity Field Data Handlers

  Future<void> _onUpdateQuantityFieldValue(
    UpdateQuantityFieldValue event,
    Emitter<DailyReportCreateState> emit,
  ) async {
    print('✏️ [QUANTITY DEBUG] UpdateQuantityFieldValue event received:');
    print('  - quantityTypeUID: ${event.quantityTypeUID}');
    print('  - fieldKey: ${event.fieldKey}');
    print('  - value: ${event.value}');

    final currentApiData = _getCurrentApiData();
    final currentSelections = _getCurrentSelections();
    final currentFormData = _getCurrentFormData();

    // Get existing data for this quantity type or create new
    final quantityData = Map<String, Map<String, dynamic>>.from(
      currentSelections.quantityFieldData,
    );
    final typeData = Map<String, dynamic>.from(
      quantityData[event.quantityTypeUID] ?? {},
    );

    // Update the specific field value
    typeData[event.fieldKey] = event.value;
    quantityData[event.quantityTypeUID] = typeData;

    print('  - Updated quantityFieldData keys: ${quantityData.keys.toList()}');
    print('  - This type data: $typeData');

    emit(
      DailyReportCreateState.editingDetails(
        apiData: currentApiData,
        selections: currentSelections.copyWith(quantityFieldData: quantityData),
        formData: currentFormData,
      ),
    );
  }

  Future<void> _onUpdateQuantityFieldImages(
    UpdateQuantityFieldImages event,
    Emitter<DailyReportCreateState> emit,
  ) async {
    final currentApiData = _getCurrentApiData();
    final currentSelections = _getCurrentSelections();
    final currentFormData = _getCurrentFormData();

    // Get existing data for this quantity type or create new
    final quantityData = Map<String, Map<String, dynamic>>.from(
      currentSelections.quantityFieldData,
    );
    final typeData = Map<String, dynamic>.from(
      quantityData[event.quantityTypeUID] ?? {},
    );

    // Store images with _images suffix to distinguish from regular fields
    typeData['${event.fieldKey}_images'] = event.images;
    quantityData[event.quantityTypeUID] = typeData;

    emit(
      DailyReportCreateState.editingDetails(
        apiData: currentApiData,
        selections: currentSelections.copyWith(quantityFieldData: quantityData),
        formData: currentFormData,
      ),
    );
  }

  Future<void> _onRemoveQuantityType(
    RemoveQuantityType event,
    Emitter<DailyReportCreateState> emit,
  ) async {
    final currentApiData = _getCurrentApiData();
    final currentSelections = _getCurrentSelections();
    final currentFormData = _getCurrentFormData();

    // Remove quantity type data
    final quantityData = Map<String, Map<String, dynamic>>.from(
      currentSelections.quantityFieldData,
    );
    quantityData.remove(event.quantityTypeUID);

    // Also remove segment data for this quantity type
    final segmentData = Map<String, List<Map<String, dynamic>>>.from(
      currentSelections.segmentData,
    );
    segmentData.remove(event.quantityTypeUID);

    // Remove from selectedQuantityTypes as well
    final updatedSelectedTypes = currentSelections.selectedQuantityTypes
        .where((qt) => qt.uid != event.quantityTypeUID)
        .toList();

    print(
      '🗑️ [QUANTITY DEBUG] Removing quantity type: ${event.quantityTypeUID}',
    );
    print(
      '   - Remaining selectedQuantityTypes: ${updatedSelectedTypes.map((q) => q.name).toList()}',
    );

    emit(
      DailyReportCreateState.editingDetails(
        apiData: currentApiData,
        selections: currentSelections.copyWith(
          quantityFieldData: quantityData,
          segmentData: segmentData,
          selectedQuantityTypes: updatedSelectedTypes,
        ),
        formData: currentFormData,
      ),
    );
  }

  // ------------------------------------------------------- Segment Data Handlers

  Future<void> _onUpdateSegmentData(
    UpdateSegmentData event,
    Emitter<DailyReportCreateState> emit,
  ) async {
    final currentApiData = _getCurrentApiData();
    final currentSelections = _getCurrentSelections();
    final currentFormData = _getCurrentFormData();

    final segmentData = Map<String, List<Map<String, dynamic>>>.from(
      currentSelections.segmentData,
    );
    segmentData[event.quantityTypeUID] = event.segments;

    emit(
      DailyReportCreateState.editingDetails(
        apiData: currentApiData,
        selections: currentSelections.copyWith(segmentData: segmentData),
        formData: currentFormData,
      ),
    );
  }

  // ------------------------------------------------------- Worker Information Handlers

  Future<void> _onUpdateWorkerCount(
    UpdateWorkerCount event,
    Emitter<DailyReportCreateState> emit,
  ) async {
    final currentApiData = _getCurrentApiData();
    final currentSelections = _getCurrentSelections();
    final currentFormData = _getCurrentFormData();

    emit(
      DailyReportCreateState.editingDetails(
        apiData: currentApiData,
        selections: currentSelections.copyWith(workerCount: event.count),
        formData: currentFormData,
      ),
    );
  }

  Future<void> _onUpdateWorkerImage(
    UpdateWorkerImage event,
    Emitter<DailyReportCreateState> emit,
  ) async {
    final currentApiData = _getCurrentApiData();
    final currentSelections = _getCurrentSelections();
    final currentFormData = _getCurrentFormData();

    emit(
      DailyReportCreateState.editingDetails(
        apiData: currentApiData,
        selections: currentSelections.copyWith(workerImage: event.image),
        formData: currentFormData,
      ),
    );
  }

  // ------------------------------------------------------- Notes and Additional Images Handlers

  Future<void> _onUpdateNotes(
    UpdateNotes event,
    Emitter<DailyReportCreateState> emit,
  ) async {
    final currentApiData = _getCurrentApiData();
    final currentSelections = _getCurrentSelections();
    final currentFormData = _getCurrentFormData();

    emit(
      DailyReportCreateState.editingDetails(
        apiData: currentApiData,
        selections: currentSelections.copyWith(notes: event.notes),
        formData: currentFormData,
      ),
    );
  }

  Future<void> _onUpdateAdditionalImages(
    UpdateAdditionalImages event,
    Emitter<DailyReportCreateState> emit,
  ) async {
    final currentApiData = _getCurrentApiData();
    final currentSelections = _getCurrentSelections();
    final currentFormData = _getCurrentFormData();

    emit(
      DailyReportCreateState.editingDetails(
        apiData: currentApiData,
        selections: currentSelections.copyWith(additionalImages: event.images),
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

    // 1. Basic Info Validation
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

    // 2. Equipment Validation - At least 1 equipment required
    if (currentSelections.selectedEquipment.isEmpty) {
      validationErrors.add('Please select at least 1 equipment');
    }

    // 3. Quantity Type Validation - At least 1 quantity type required
    if (currentSelections.selectedQuantityTypes.isEmpty) {
      validationErrors.add('Please select at least 1 quantity type');
    }

    // 4. Validate quantity fields - check in quantityFieldData (not fieldValues)
    for (final quantityType in currentSelections.selectedQuantityTypes) {
      // Find all instances of this quantity type (using composite keys)
      final instanceKeys = currentSelections.quantityFieldData.keys
          .where((key) => key.startsWith('${quantityType.uid}_'))
          .toList();

      if (instanceKeys.isEmpty) {
        // No data entered for this quantity type at all
        validationErrors.add(
          'Please fill in ${quantityType.name} quantity data',
        );
        continue;
      }

      // Validate each instance
      for (final compositeKey in instanceKeys) {
        final instanceData =
            currentSelections.quantityFieldData[compositeKey] ?? {};

        // Check each required field
        for (final field in quantityType.quantityFields) {
          if (field.isRequired && !field.isForSegment) {
            // Look up value using field.uid (not field.code)
            final value = instanceData[field.uid];

            if (value == null || value.toString().trim().isEmpty) {
              final errorKey = '${compositeKey}_${field.uid}';
              fieldErrors[errorKey] = '${field.name} is required';
              validationErrors.add(
                '${field.name} is required in ${quantityType.name}',
              );
            }
          }
        }
      }
    }

    // 5. Image Validation - Condition Snapshots (before only, during/after optional)
    final conditionSnapshots = currentSelections.conditionSnapshots;

    // Check if at least one image exists in BEFORE snapshots
    final beforeImages = conditionSnapshots['before'] ?? [];
    if (beforeImages.isEmpty) {
      validationErrors.add('Please upload at least 1 BEFORE image');
    }

    final isFormValid = validationErrors.isEmpty;

    print('📋 Validation results:');
    print('  - Scope: ${currentSelections.selectedScope?.name}');
    print('  - Weather: ${currentSelections.selectedWeather}');
    print('  - Road: ${currentSelections.selectedRoad?.name}');
    print('  - Section: ${currentSelections.section}');
    print('  - Equipment count: ${currentSelections.selectedEquipment.length}');
    print(
      '  - Quantity types count: ${currentSelections.selectedQuantityTypes.length}',
    );
    print('  - BEFORE images: ${beforeImages.length}');
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

    print('📊 [QUANTITY DEBUG] Quantity data before submission:');
    print(
      '  - quantityFieldData isEmpty: ${currentSelections.quantityFieldData.isEmpty}',
    );
    print(
      '  - quantityFieldData keys: ${currentSelections.quantityFieldData.keys.toList()}',
    );
    print('  - quantityFieldData full: ${currentSelections.quantityFieldData}');
    print(
      '  - selectedQuantityTypes count: ${currentSelections.selectedQuantityTypes.length}',
    );
    print(
      '  - selectedQuantityTypes: ${currentSelections.selectedQuantityTypes.map((q) => q.name).toList()}',
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

      await result.fold(
        (failure) async {
          print('❌ Submission failed: ${failure.message}');
          if (!emit.isDone) {
            emit(
              DailyReportCreateState.submissionError(
                reportData: reportData,
                errorMessage: failure.message,
              ),
            );
          }
        },
        (response) async {
          print('✅ Submission successful: ${response.uid}');

          // Activate draft images for upload if draft exists
          final draftUID = currentSelections.draftReportUID;
          if (draftUID != null && adminUID != null) {
            try {
              print(
                '📷 Activating draft images for upload: $draftUID → ${response.uid}',
              );
              await _imageLocalDataSource.activateDraftImagesForSubmission(
                entityType: SyncEntityType.dailyReport,
                draftUID: draftUID,
                serverUID: response.uid,
                uploadedByUID: adminUID,
              );
              print('✅ Draft images activated for upload');
            } catch (e) {
              print('⚠️ Error activating draft images: $e');
              // Don't fail submission if image activation fails
            }

            // Delete draft record (images now linked to submitted report)
            try {
              print(
                '🗑️ Deleting draft after successful submission: $draftUID',
              );
              await _localDataSource.deleteDraftReport(draftUID);
              print('✅ Draft deleted');
            } catch (e) {
              print('⚠️ Error deleting draft: $e');
              // Don't fail submission if draft deletion fails
            }
          }

          if (!emit.isDone) {
            emit(DailyReportCreateState.submitted(reportData: reportData));
          }
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
      notes: '',
      additionalImages: [],
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
    // CRITICAL FIX: Clear user selections but preserve API data
    // BLoC is @lazySingleton so state persists between navigations
    // Preserving API data (workScopes, quantities, equipment) avoids unnecessary re-fetching
    // and ensures UI is responsive immediately
    final currentApiData = _getCurrentApiData();

    emit(
      DailyReportCreateState.selectingBasicInfo(
        apiData:
            currentApiData, // Preserve loaded workScopes/quantities/equipment
        selections: const ReportSelections(), // Clear user selections only
      ),
    );
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

  // ======================================================================
  // DRAFT MANAGEMENT EVENT HANDLERS
  // ======================================================================

  /// Initialize a new draft report
  Future<void> _onInitializeDraftReport(
    InitializeDraftReport event,
    Emitter<DailyReportCreateState> emit,
  ) async {
    try {
      print('📝 Creating new draft report for company: ${event.companyUID}');

      // Create draft in local database
      final draftReport = await _localDataSource.createDraftReportLocal(
        event.companyUID,
      );

      print('✅ Draft created with UID: ${draftReport.uid}');

      // Update current state with draft UID
      final currentApiData = _getCurrentApiData();
      final currentSelections = _getCurrentSelections();

      final updatedSelections = currentSelections.copyWith(
        draftReportUID: draftReport.uid,
        isDraftMode: true,
      );

      emit(
        DailyReportCreateState.selectingBasicInfo(
          apiData: currentApiData,
          selections: updatedSelections,
        ),
      );

      print(
        '✅ State updated with new draft UID: ${updatedSelections.draftReportUID}',
      );

      // Verify draft was created by querying it back
      print('🔍 Verifying draft exists in database...');
      final drafts = await _localDataSource.getDraftReports(event.companyUID);
      print('✅ Verification: Found ${drafts.length} drafts for company');
    } catch (e) {
      print('❌ Error creating draft: $e');
      // Don't emit error state - just log it
      // User can continue without draft if creation fails
    }
  }

  /// Load an existing draft report
  Future<void> _onLoadExistingDraft(
    LoadExistingDraft event,
    Emitter<DailyReportCreateState> emit,
  ) async {
    try {
      print('📂 Loading draft report: ${event.draftUID}');

      // Get draft MODEL from local database
      final draftModel = await _localDataSource.getCachedDailyReportByUid(
        event.draftUID,
      );

      if (draftModel == null) {
        print('❌ Draft not found: ${event.draftUID}');
        return;
      }

      // CLEAN ARCHITECTURE: Convert Model to Entity immediately
      final draftEntity = draftModel.toEntity();

      print('✅ Draft entity loaded: ${draftEntity.name}');
      print('   Work Scope: ${draftEntity.workScope?.name}');
      print('   Road: ${draftEntity.road?.name}');
      print('   Weather: ${draftEntity.weatherCondition}');

      // Get current API data
      var currentApiData = _getCurrentApiData();

      // Ensure work scopes are loaded BEFORE matching
      if (currentApiData.workScopes.isEmpty) {
        print('⚠️ Work scopes not loaded, loading now...');

        final result = await _getWorkScopesUseCase(
          GetWorkScopesParams(forceRefresh: false), // Use cache if available
        );

        await result.fold(
          (failure) {
            print('❌ Failed to load work scopes: ${failure.message}');
            return Future.value();
          },
          (workScopes) {
            print('✅ Work scopes loaded: ${workScopes.length} scopes');
            // Update currentApiData with loaded work scopes
            currentApiData = ReportApiData(
              workScopes: workScopes,
              states: currentApiData.states,
              districts: currentApiData.districts,
              roads: currentApiData.roads,
              quantities: currentApiData.quantities,
              equipment: currentApiData.equipment,
            );
            return Future.value();
          },
        );
      } else {
        print(
          '✅ Work scopes already loaded: ${currentApiData.workScopes.length} scopes',
        );
      }

      // Find matching work scope from loaded work scopes
      // draftEntity.workScope is WorkScopeResponse (flattened entity)
      // We need full WorkScope entity with quantities and equipment
      WorkScope? selectedScope;
      if (draftEntity.workScope != null &&
          currentApiData.workScopes.isNotEmpty) {
        try {
          selectedScope = currentApiData.workScopes.firstWhere(
            (scope) => scope.uid == draftEntity.workScope!.uid,
          );
          print('   ✓ Found matching scope: ${selectedScope.name}');
        } catch (e) {
          print(
            '   ⚠️ Work scope not found in loaded scopes: ${draftEntity.workScope!.uid}',
          );
        }
      }

      // Extract road/district/province from draft entity
      // draftEntity.road is RoadResponse entity (flattened structure)
      Road? selectedRoad;
      District? selectedDistrict;
      Province? selectedState;

      if (draftEntity.road != null) {
        // Reconstruct Road entity from flattened RoadResponse
        selectedRoad = Road(
          uid: draftEntity.road!.uid,
          name: draftEntity.road!.name,
          roadNo: draftEntity.road!.roadNo,
        );

        // Create District entity from flattened data
        if (draftEntity.road!.districtName != null) {
          selectedDistrict = District(
            name: draftEntity.road!.districtName,
            // UID not available in flattened RoadResponse, will be null
          );
        }

        // Create Province entity from flattened data
        if (draftEntity.road!.stateName != null) {
          selectedState = Province(
            name: draftEntity.road!.stateName,
            // UID not available in flattened RoadResponse, will be null
          );
        }

        print('   ✓ Road: ${selectedRoad.name}');
        print('   ✓ District: ${selectedDistrict?.name}');
        print('   ✓ State: ${selectedState?.name}');
      }

      // Parse section from entity
      String? section;
      if (draftEntity.fromSection != null && draftEntity.toSection != null) {
        section = '${draftEntity.fromSection}-${draftEntity.toSection}';
      } else if (draftEntity.fromSection != null) {
        section = draftEntity.fromSection.toString();
      }

      // Parse equipment from entity
      // draftEntity.equipments is List<DailyReportEquipment> (domain entities)
      final selectedEquipment = <WorkEquipment>[];
      if (draftEntity.equipments != null &&
          draftEntity.equipments!.isNotEmpty) {
        for (final equipEntity in draftEntity.equipments!) {
          // Create WorkEquipment entity (only uid and name are available from draft)
          // Full equipment data will be loaded when quantities/equipment are fetched
          selectedEquipment.add(
            WorkEquipment(
              id: 0, // Not available in draft, will be populated from API
              uid: equipEntity.uid,
              name: equipEntity.name,
              code: '', // Not stored in draft
            ),
          );
        }
        print('   ✓ Equipment: ${selectedEquipment.length} items');
      }

      // Load draft images from permanent storage
      print('   Loading draft images from permanent storage...');
      final draftImages = await _imageLocalDataSource.getDraftImages(
        entityType: SyncEntityType.dailyReport,
        entityUID: event.draftUID,
      );

      // Convert image paths back to GalleryImage JSON format
      Map<String, dynamic>? workerImage;
      List<Map<String, dynamic>> workerImages = [];
      Map<String, List<Map<String, dynamic>>> conditionSnapshots = {};
      List<Map<String, dynamic>> additionalImages = [];

      // Worker images
      final workerImagePaths =
          draftImages[ImageContextField.workersImage] ?? [];
      if (workerImagePaths.isNotEmpty) {
        workerImage = _pathToGalleryImageJson(workerImagePaths.first);
        workerImages = workerImagePaths.map(_pathToGalleryImageJson).toList();
      }

      // Condition snapshots
      conditionSnapshots['before'] =
          (draftImages[ImageContextField.beforeImage] ?? [])
              .map(_pathToGalleryImageJson)
              .toList();
      conditionSnapshots['current'] =
          (draftImages[ImageContextField.inprogressImage] ?? [])
              .map(_pathToGalleryImageJson)
              .toList();
      conditionSnapshots['after'] =
          (draftImages[ImageContextField.afterImage] ?? [])
              .map(_pathToGalleryImageJson)
              .toList();

      // Additional images
      additionalImages = (draftImages[ImageContextField.general] ?? [])
          .map(_pathToGalleryImageJson)
          .toList();

      print('   ✓ Loaded ${draftImages.length} image contexts');

      print('   Storing quantity UIDs for later matching...');
      // Store quantity type UIDs to match after LoadQuantitiesAndEquipments completes
      final List<String> quantityTypeUIDsFromDraft = [];
      final Map<String, Map<String, dynamic>> savedQuantityFieldData = {};

      if (draftEntity.reportQuantities != null &&
          draftEntity.reportQuantities!.isNotEmpty) {
        print(
          '   ✓ Found ${draftEntity.reportQuantities!.length} quantity types in draft',
        );

        for (final reportQty in draftEntity.reportQuantities!) {
          final quantityUID = reportQty.quantityType.uid;
          quantityTypeUIDsFromDraft.add(quantityUID);

          // Build temporary composite key (will be rebuilt after matching with full data)
          final tempKey = '${quantityUID}_1';

          // Reconstruct field data map
          final fieldData = <String, dynamic>{};
          for (final qtyValue in reportQty.quantityValues) {
            fieldData[qtyValue.quantityField.uid] = qtyValue.value;
          }

          savedQuantityFieldData[tempKey] = fieldData;
          print(
            '      - ${reportQty.quantityType.name} (${reportQty.quantityValues.length} fields)',
          );
        }
      }

      print('📦 Draft data parsed successfully');

      // Create selections with populated data (including quantity field data)
      final selections = ReportSelections(
        draftReportUID: draftEntity.uid,
        isDraftMode: true,
        selectedScope: selectedScope,
        selectedWeather: draftEntity.weatherCondition?.toLowerCase(),
        selectedState: selectedState,
        selectedDistrict: selectedDistrict,
        selectedRoad: selectedRoad,
        section: section,
        selectedEquipment: selectedEquipment,
        workerCount: draftEntity.totalWorkers ?? 0,
        workerImage: workerImage,
        workerImages: workerImages,
        conditionSnapshots: conditionSnapshots,
        additionalImages: additionalImages,
        notes: draftEntity.notes ?? '',
        quantityFieldData:
            savedQuantityFieldData, // ✅ Quantity data now included!
      );

      // Load quantities and equipment BEFORE emitting state
      // This ensures equipment/quantity lists are populated when UI renders
      if (selectedScope != null) {
        print(
          '🔄 Loading quantities and equipment for scope: ${selectedScope.name}',
        );
        final companyState = getIt<CompanyBloc>().state;
        if (companyState is CompanyLoaded &&
            companyState.selectedCompany != null) {
          // Call handler directly and await completion
          // CRITICAL: Pass both updatedApiData and updatedSelections to preserve draft data
          // Without these params, the handler will call _getCurrentApiData() and _getCurrentSelections()
          // which retrieve OLD state data, causing work scope and road to disappear from the UI
          await _onLoadQuantitiesAndEquipments(
            LoadQuantitiesAndEquipments(
              companyUID: companyState.selectedCompany!.uid,
              workScopeUID: selectedScope.uid,
            ),
            emit,
            updatedApiData:
                currentApiData, // Contains work scopes loaded from cache/API
            updatedSelections:
                selections, // Contains road/district/state parsed from draft
          );
          // Handler already emitted editingDetails state with populated equipment/quantities
          print('✅ Draft loaded with equipment and quantities');
          return;
        }
      }

      // Fallback: emit state without quantities/equipment if no scope selected
      emit(
        DailyReportCreateState.editingDetails(
          apiData: currentApiData,
          selections: selections,
          formData: const ReportFormData(),
        ),
      );
    } catch (e, stackTrace) {
      print('❌ Error loading draft: $e');
      print('   Stack trace: $stackTrace');
    }
  }

  /// Delete a draft report
  Future<void> _onDeleteDraft(
    DeleteDraft event,
    Emitter<DailyReportCreateState> emit,
  ) async {
    try {
      print('🗑️ Deleting draft: ${event.draftUID}');

      // Delete draft images first
      try {
        await _imageLocalDataSource.deleteDraftImages(
          entityType: SyncEntityType.dailyReport,
          draftUID: event.draftUID,
        );
        print('✅ Draft images deleted');
      } catch (e) {
        print('⚠️ Error deleting draft images: $e');
        // Continue with draft deletion even if image deletion fails
      }

      // Delete draft record
      await _localDataSource.deleteDraftReport(event.draftUID);

      print('✅ Draft deleted successfully');

      // Clear draft UID from state
      final currentApiData = _getCurrentApiData();
      final currentSelections = _getCurrentSelections();

      emit(
        DailyReportCreateState.selectingBasicInfo(
          apiData: currentApiData,
          selections: currentSelections.copyWith(
            draftReportUID: null,
            isDraftMode: false,
          ),
        ),
      );
    } catch (e) {
      print('❌ Error deleting draft: $e');
    }
  }

  /// Auto-save draft - saves immediately without debounce
  /// Debounce can be handled at the UI layer if needed
  Future<void> _onAutoSaveDraft(
    AutoSaveDraft event,
    Emitter<DailyReportCreateState> emit,
  ) async {
    try {
      final currentSelections = _getCurrentSelections();
      final draftUID = currentSelections.draftReportUID;

      print('🔍 [AUTO-SAVE DEBUG] Current state draft UID: $draftUID');
      print(
        '🔍 [AUTO-SAVE DEBUG] isDraftMode: ${currentSelections.isDraftMode}',
      );

      // If no draft UID, create one first
      if (draftUID == null) {
        print('📝 No draft UID, creating new draft...');
        final draftReport = await _localDataSource.createDraftReportLocal(
          event.companyUID,
        );

        // Update state with new draft UID
        final currentApiData = _getCurrentApiData();
        final updatedSelections = currentSelections.copyWith(
          draftReportUID: draftReport.uid,
          isDraftMode: true,
        );

        // Emit updated state based on current state type
        state.maybeMap(
          selectingBasicInfo: (state) {
            emit(state.copyWith(selections: updatedSelections));
          },
          editingDetails: (state) {
            emit(state.copyWith(selections: updatedSelections));
          },
          orElse: () {},
        );

        print('✅ New draft created: ${draftReport.uid}');

        // Now save the current form data
        final currentFormData = _getCurrentFormData();
        final reportData = ReportData(
          apiData: currentApiData,
          selections: updatedSelections,
          formData: currentFormData,
        );

        final createModel = ReportDataToCreateModelMapper.fromReportData(
          reportData,
        );

        // Convert road to response model for proper storage
        // Use separate province/district/road from selections to build complete nested structure
        final roadResponseModel = _convertRoadToResponseModel(
          updatedSelections.selectedRoad,
          updatedSelections.selectedDistrict,
          updatedSelections.selectedState,
        );

        // Convert workScope to response model for proper storage
        final workScopeResponseModel = _convertWorkScopeToResponseModel(
          currentSelections.selectedScope,
        );

        // Update draft with current form data
        await _localDataSource.updateDraftReportLocal(
          draftReport.uid,
          createModel,
          selectedRoad: roadResponseModel,
          selectedWorkScope: workScopeResponseModel,
        );

        print('✅ Draft auto-saved with initial data');
        return;
      }

      print('💾 Auto-saving draft: $draftUID');

      // Convert current state to CreateDailyReportModel using the mapper
      final currentApiData = _getCurrentApiData();
      final currentFormData = _getCurrentFormData();

      final reportData = ReportData(
        apiData: currentApiData,
        selections: currentSelections,
        formData: currentFormData,
      );

      final createModel = ReportDataToCreateModelMapper.fromReportData(
        reportData,
      );

      // Convert road to response model for proper storage
      // Use separate province/district/road from selections to build complete nested structure
      final roadResponseModel = _convertRoadToResponseModel(
        currentSelections.selectedRoad,
        currentSelections.selectedDistrict,
        currentSelections.selectedState,
      );

      // Convert workScope to response model for proper storage
      final workScopeResponseModel = _convertWorkScopeToResponseModel(
        currentSelections.selectedScope,
      );

      // Update draft with current form data
      await _localDataSource.updateDraftReportLocal(
        draftUID,
        createModel,
        selectedRoad: roadResponseModel,
        selectedWorkScope: workScopeResponseModel,
      );

      print('✅ Draft auto-saved: $draftUID');

      // Save draft images to permanent storage
      await _saveDraftImages(
        draftUID: draftUID,
        companyUID: event.companyUID,
        selections: currentSelections,
      );
    } catch (e) {
      print('❌ Error auto-saving draft: $e');
    }
  }

  /// Convert file path to GalleryImage JSON format
  Map<String, dynamic> _pathToGalleryImageJson(String path) {
    return GalleryImage(
      path: path,
      capturedAt: DateTime.now(), // Timestamp not critical for display
    ).toJson();
  }

  /// Save draft images to permanent storage
  /// Extracts images from selections and calls ImageLocalDataSource
  Future<void> _saveDraftImages({
    required String draftUID,
    required String companyUID,
    required ReportSelections selections,
  }) async {
    try {
      // Map draft images to ImageContextField
      final imagesByContext = <ImageContextField, List<String>>{};

      // 1. Worker images
      if (selections.workerImages.isNotEmpty) {
        final workerImagePaths = selections.workerImages
            .map((json) => GalleryImage.fromJson(json).path)
            .toList();
        imagesByContext[ImageContextField.workersImage] = workerImagePaths;
      } else if (selections.workerImage != null) {
        // Fallback to single worker image
        final workerImg = GalleryImage.fromJson(selections.workerImage!);
        imagesByContext[ImageContextField.workersImage] = [workerImg.path];
      }

      // 2. Condition snapshots
      final conditionSnapshots = selections.conditionSnapshots;

      // Before images
      final beforeImages = (conditionSnapshots['before'] ?? [])
          .map((json) => GalleryImage.fromJson(json).path)
          .toList();
      if (beforeImages.isNotEmpty) {
        imagesByContext[ImageContextField.beforeImage] = beforeImages;
      }

      // Current/In-progress images
      final currentImages = (conditionSnapshots['current'] ?? [])
          .map((json) => GalleryImage.fromJson(json).path)
          .toList();
      if (currentImages.isNotEmpty) {
        imagesByContext[ImageContextField.inprogressImage] = currentImages;
      }

      // After images
      final afterImages = (conditionSnapshots['after'] ?? [])
          .map((json) => GalleryImage.fromJson(json).path)
          .toList();
      if (afterImages.isNotEmpty) {
        imagesByContext[ImageContextField.afterImage] = afterImages;
      }

      // 3. Additional images
      final additionalImages = selections.additionalImages
          .map((json) => GalleryImage.fromJson(json).path)
          .toList();
      if (additionalImages.isNotEmpty) {
        imagesByContext[ImageContextField.general] = additionalImages;
      }

      if (imagesByContext.isEmpty) {
        print('📷 No draft images to save for $draftUID');
        return;
      }

      // Save to permanent storage with draft_pending status
      await _imageLocalDataSource.saveDraftImages(
        entityType: SyncEntityType.dailyReport,
        entityUID: draftUID,
        companyUID: companyUID,
        imagesByContextField: imagesByContext,
      );

      print(
        '✅ Draft images saved: $draftUID (${imagesByContext.length} contexts)',
      );
    } catch (e) {
      print('❌ Error saving draft images: $e');
    }
  }

  /// Convert Road entity to RoadResponseModel for proper storage
  /// This ensures draft reports display road name and district information
  ///
  /// Uses separate province/district/road objects from selections (just like SelectLocationFromResult)
  /// to build the complete nested structure that matches the API response format
  RoadResponseModel? _convertRoadToResponseModel(
    Road? road,
    District? district,
    Province? province,
  ) {
    if (road == null) return null;
    if (road.uid == null || road.name == null) {
      return null;
    }

    // Build nested district/state/country structure from separate objects
    // This matches how the API returns data: road → district → state → country
    DistrictResponseModel? districtModel;
    if (district != null && district.uid != null && district.name != null) {
      StateResponseModel? stateModel;
      if (province != null && province.uid != null && province.name != null) {
        // Build country model from province.country
        CountryResponseModel? countryModel;
        if (province.country != null &&
            province.country!.uid != null &&
            province.country!.name != null) {
          countryModel = CountryResponseModel(
            uid: province.country!.uid!,
            name: province.country!.name!,
          );
        }

        stateModel = StateResponseModel(
          uid: province.uid!,
          name: province.name!,
          country: countryModel,
        );
      }

      districtModel = DistrictResponseModel(
        uid: district.uid!,
        name: district.name!,
        state: stateModel,
      );
    }

    return RoadResponseModel(
      uid: road.uid!,
      name: road.name!,
      roadNo: road.roadNo ?? '', // Use empty string if roadNo is null
      district: districtModel,
    );
  }

  /// Convert WorkScope entity to WorkScopeResponseModel for proper storage
  /// This ensures draft reports display work scope code and name
  WorkScopeResponseModel? _convertWorkScopeToResponseModel(
    WorkScope? workScope,
  ) {
    if (workScope == null) return null;
    if (workScope.uid == null ||
        workScope.name == null ||
        workScope.code == null) {
      return null;
    }

    return WorkScopeResponseModel(
      uid: workScope.uid!,
      name: workScope.name!,
      code: workScope.code!,
    );
  }
}
