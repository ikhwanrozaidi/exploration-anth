import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:rclink_app/features/work_scope/domain/usecases/get_equipment_usecase.dart';
import 'package:rclink_app/features/work_scope/domain/usecases/get_quantity_usecase.dart';
import 'package:rclink_app/features/work_scope/domain/entities/work_equipment.dart';
import 'package:rclink_app/features/work_scope/domain/entities/work_quantity_type.dart';
import '../../../domain/usecases/update_daily_report_usecase.dart';
import '../daily_report_create/daily_report_create_state.dart';
import 'daily_report_edit_event.dart';
import 'daily_report_edit_state.dart';

@lazySingleton
class DailyReportEditBloc
    extends Bloc<DailyReportEditEvent, DailyReportEditState> {
  final GetQuantityUseCase _getQuantitiesUseCase;
  final GetEquipmentUseCase _getEquipmentUseCase;
  final UpdateDailyReportUseCase _updateDailyReportUseCase;

  DailyReportEditBloc(
    this._getQuantitiesUseCase,
    this._getEquipmentUseCase,
    this._updateDailyReportUseCase,
  ) : super(const DailyReportEditState.initial()) {
    on<LoadExistingReportEdit>(_onLoadExistingReport);
    on<LoadQuantitiesAndEquipmentsEdit>(_onLoadQuantitiesAndEquipments);
    on<UpdateWorkScopeEdit>(_onUpdateWorkScope);
    on<UpdateRoadEdit>(_onUpdateRoad);
    on<UpdateWeatherEdit>(_onUpdateWeather);
    on<UpdateWorkersEdit>(_onUpdateWorkers);
    on<UpdateNotesEdit>(_onUpdateNotes);
    on<UpdateSectionEdit>(_onUpdateSection);
    on<AddQuantityEdit>(_onAddQuantity);
    on<RemoveQuantityEdit>(_onRemoveQuantity);
    on<UpdateQuantityFieldValueEdit>(_onUpdateQuantityFieldValue);
    on<ToggleEquipmentEdit>(_onToggleEquipment);
    on<UpdateConditionSnapshotEdit>(_onUpdateConditionSnapshot);
    on<UpdateWorkerImageEdit>(_onUpdateWorkerImage);
    on<SubmitUpdateEdit>(_onSubmitUpdate);
    on<CancelEdit>(_onCancelEdit);
  }

  /// Helper to get current state data
  ReportApiData _getCurrentApiData() {
    return state.maybeMap(
      editing: (s) => s.apiData,
      loadingData: (s) => s.apiData,
      submitting: (s) => s.apiData,
      error: (s) => s.apiData,
      orElse: () => const ReportApiData(),
    );
  }

  ReportSelections _getCurrentSelections() {
    return state.maybeMap(
      editing: (s) => s.selections,
      loadingData: (s) => s.selections,
      submitting: (s) => s.selections,
      error: (s) => s.selections,
      orElse: () => const ReportSelections(),
    );
  }

  ReportFormData _getCurrentFormData() {
    return state.maybeMap(
      editing: (s) => s.formData,
      loadingData: (s) => s.formData,
      submitting: (s) => s.formData,
      error: (s) => s.formData,
      orElse: () => const ReportFormData(),
    );
  }

  String _getCurrentReportUID() {
    return state.maybeMap(
      editing: (s) => s.reportUID,
      loadingData: (s) => s.reportUID,
      submitting: (s) => s.reportUID,
      error: (s) => s.reportUID,
      orElse: () => '',
    );
  }

  String _getCurrentCompanyUID() {
    return state.maybeMap(
      editing: (s) => s.companyUID,
      loadingData: (s) => s.companyUID,
      submitting: (s) => s.companyUID,
      error: (s) => s.companyUID,
      orElse: () => '',
    );
  }

  /// Load existing report data for editing
  Future<void> _onLoadExistingReport(
    LoadExistingReportEdit event,
    Emitter<DailyReportEditState> emit,
  ) async {
    emit(const DailyReportEditState.loading());

    try {
      final report = event.report;

      // Pre-populate selections from existing report
      // Note: Types may need conversion from response models to entities
      final selections = ReportSelections(
        selectedScope: null, // TODO: Convert WorkScopeResponse to WorkScope
        selectedRoad: null, // TODO: Convert RoadResponse to Road
        selectedWeather: report.weatherCondition,
        workerCount: report.totalWorkers ?? 0,
        notes: report.notes ?? '',
        section: _formatSection(report.fromSection, report.toSection),
        selectedQuantityTypes: report.reportQuantities
                ?.map((q) => q.quantityType)
                .whereType<WorkQuantityType>()
                .toList() ??
            [],
        // Equipment will be populated after loading full equipment list
        // We only have UIDs from the report, need to match with full WorkEquipment objects
        selectedEquipment: [],
        // Convert existing quantities to quantityFieldData map
        quantityFieldData: _convertQuantitiesToFieldData(report.reportQuantities),
        // Extract condition snapshots from files
        conditionSnapshots: _extractConditionSnapshots(report.files),
        // Extract worker image from files
        workerImage: _extractWorkerImage(report.files),
      );

      // Emit loadingData state first - don't allow navigation until data is ready
      emit(DailyReportEditState.loadingData(
        apiData: const ReportApiData(), // Will be loaded when quantities/equipment are fetched
        selections: selections,
        formData: const ReportFormData(),
        reportUID: report.uid,
        companyUID: event.companyUID,
      ));

      // Trigger loading of quantities and equipment for the selected work scope
      // Once this completes, it will emit 'editing' state with populated apiData
      if (report.workScope != null) {
        add(LoadQuantitiesAndEquipmentsEdit(
          companyUID: event.companyUID,
          workScopeUID: report.workScope!.uid,
        ));
      }
    } catch (e) {
      emit(DailyReportEditState.loadError(
        message: 'Failed to load report: ${e.toString()}',
        reportUID: event.report.uid,
      ));
    }
  }

  /// Load quantities and equipment for selected work scope
  Future<void> _onLoadQuantitiesAndEquipments(
    LoadQuantitiesAndEquipmentsEdit event,
    Emitter<DailyReportEditState> emit,
  ) async {
    final currentApiData = _getCurrentApiData();
    final currentSelections = _getCurrentSelections();
    final currentFormData = _getCurrentFormData();
    final reportUID = _getCurrentReportUID();
    final companyUID = _getCurrentCompanyUID();

    emit(DailyReportEditState.loadingData(
      apiData: currentApiData,
      selections: currentSelections,
      formData: currentFormData,
      reportUID: reportUID,
      companyUID: companyUID,
    ));

    // Load both in parallel
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

    // Handle results
    final quantities = quantitiesResult.fold(
      (l) => <WorkQuantityType>[],
      (r) => r as List<WorkQuantityType>,
    );
    final equipments = equipmentsResult.fold(
      (l) => <WorkEquipment>[],
      (r) => r as List<WorkEquipment>,
    );

    // Check for errors
    String? errorMessage;
    quantitiesResult.fold(
      (failure) => errorMessage = 'Failed to load quantities: ${failure.message}',
      (_) {},
    );
    equipmentsResult.fold(
      (failure) => errorMessage ??= 'Failed to load equipment: ${failure.message}',
      (_) {},
    );

    if (errorMessage != null) {
      emit(DailyReportEditState.error(
        message: errorMessage!,
        apiData: currentApiData,
        selections: currentSelections,
        formData: currentFormData,
        reportUID: reportUID,
        companyUID: companyUID,
      ));
      return;
    }

    // If we're loading equipment for the first time and have equipment UIDs from the report,
    // match them with the full WorkEquipment objects
    ReportSelections updatedSelections = currentSelections;
    if (currentSelections.selectedEquipment.isEmpty && equipments.isNotEmpty) {
      // Get equipment UIDs from the current state (stored during initial load)
      // For now, we'll leave this empty and let the user reselect equipment
      // TODO: Store equipment UIDs separately during initial load to match here
      updatedSelections = currentSelections;
    }

    emit(DailyReportEditState.editing(
      apiData: currentApiData.copyWith(
        quantities: quantities,
        equipment: equipments,
      ),
      selections: updatedSelections,
      formData: currentFormData,
      reportUID: reportUID,
      companyUID: companyUID,
    ));
  }

  /// Update work scope
  Future<void> _onUpdateWorkScope(
    UpdateWorkScopeEdit event,
    Emitter<DailyReportEditState> emit,
  ) async {
    final currentApiData = _getCurrentApiData();
    final currentSelections = _getCurrentSelections();
    final currentFormData = _getCurrentFormData();
    final reportUID = _getCurrentReportUID();
    final companyUID = _getCurrentCompanyUID();

    emit(DailyReportEditState.editing(
      apiData: currentApiData,
      selections: currentSelections.copyWith(selectedScope: event.scope),
      formData: currentFormData,
      reportUID: reportUID,
      companyUID: companyUID,
    ));

    // Reload quantities and equipment for new work scope
    add(LoadQuantitiesAndEquipmentsEdit(
      companyUID: companyUID,
      workScopeUID: event.scope.uid,
    ));
  }

  /// Update road
  Future<void> _onUpdateRoad(
    UpdateRoadEdit event,
    Emitter<DailyReportEditState> emit,
  ) async {
    final currentApiData = _getCurrentApiData();
    final currentSelections = _getCurrentSelections();
    final currentFormData = _getCurrentFormData();
    final reportUID = _getCurrentReportUID();
    final companyUID = _getCurrentCompanyUID();

    emit(DailyReportEditState.editing(
      apiData: currentApiData,
      selections: currentSelections.copyWith(selectedRoad: event.road),
      formData: currentFormData,
      reportUID: reportUID,
      companyUID: companyUID,
    ));
  }

  /// Update weather
  Future<void> _onUpdateWeather(
    UpdateWeatherEdit event,
    Emitter<DailyReportEditState> emit,
  ) async {
    final currentApiData = _getCurrentApiData();
    final currentSelections = _getCurrentSelections();
    final currentFormData = _getCurrentFormData();
    final reportUID = _getCurrentReportUID();
    final companyUID = _getCurrentCompanyUID();

    emit(DailyReportEditState.editing(
      apiData: currentApiData,
      selections: currentSelections.copyWith(selectedWeather: event.weather),
      formData: currentFormData,
      reportUID: reportUID,
      companyUID: companyUID,
    ));
  }

  /// Update workers
  Future<void> _onUpdateWorkers(
    UpdateWorkersEdit event,
    Emitter<DailyReportEditState> emit,
  ) async {
    final currentApiData = _getCurrentApiData();
    final currentSelections = _getCurrentSelections();
    final currentFormData = _getCurrentFormData();
    final reportUID = _getCurrentReportUID();
    final companyUID = _getCurrentCompanyUID();

    emit(DailyReportEditState.editing(
      apiData: currentApiData,
      selections: currentSelections.copyWith(workerCount: event.count),
      formData: currentFormData,
      reportUID: reportUID,
      companyUID: companyUID,
    ));
  }

  /// Update notes
  Future<void> _onUpdateNotes(
    UpdateNotesEdit event,
    Emitter<DailyReportEditState> emit,
  ) async {
    final currentApiData = _getCurrentApiData();
    final currentSelections = _getCurrentSelections();
    final currentFormData = _getCurrentFormData();
    final reportUID = _getCurrentReportUID();
    final companyUID = _getCurrentCompanyUID();

    emit(DailyReportEditState.editing(
      apiData: currentApiData,
      selections: currentSelections.copyWith(notes: event.notes),
      formData: currentFormData,
      reportUID: reportUID,
      companyUID: companyUID,
    ));
  }

  /// Update section
  Future<void> _onUpdateSection(
    UpdateSectionEdit event,
    Emitter<DailyReportEditState> emit,
  ) async {
    final currentApiData = _getCurrentApiData();
    final currentSelections = _getCurrentSelections();
    final currentFormData = _getCurrentFormData();
    final reportUID = _getCurrentReportUID();
    final companyUID = _getCurrentCompanyUID();

    emit(DailyReportEditState.editing(
      apiData: currentApiData,
      selections: currentSelections.copyWith(section: event.section),
      formData: currentFormData,
      reportUID: reportUID,
      companyUID: companyUID,
    ));
  }

  /// Add quantity type
  Future<void> _onAddQuantity(
    AddQuantityEdit event,
    Emitter<DailyReportEditState> emit,
  ) async {
    final currentApiData = _getCurrentApiData();
    final currentSelections = _getCurrentSelections();
    final currentFormData = _getCurrentFormData();
    final reportUID = _getCurrentReportUID();
    final companyUID = _getCurrentCompanyUID();

    // Add to selected quantity types
    final updatedQuantityTypes = [
      ...currentSelections.selectedQuantityTypes,
      event.quantityType,
    ];

    emit(DailyReportEditState.editing(
      apiData: currentApiData,
      selections: currentSelections.copyWith(
        selectedQuantityTypes: updatedQuantityTypes,
      ),
      formData: currentFormData,
      reportUID: reportUID,
      companyUID: companyUID,
    ));
  }

  /// Remove quantity
  Future<void> _onRemoveQuantity(
    RemoveQuantityEdit event,
    Emitter<DailyReportEditState> emit,
  ) async {
    final currentApiData = _getCurrentApiData();
    final currentSelections = _getCurrentSelections();
    final currentFormData = _getCurrentFormData();
    final reportUID = _getCurrentReportUID();
    final companyUID = _getCurrentCompanyUID();

    // Remove from quantityFieldData
    final updatedFieldData = Map<String, Map<String, dynamic>>.from(
      currentSelections.quantityFieldData,
    );
    updatedFieldData.remove(event.compositeKey);

    // Also remove from segment data if exists
    final updatedSegmentData = Map<String, List<Map<String, dynamic>>>.from(
      currentSelections.segmentData,
    );
    updatedSegmentData.remove(event.compositeKey);

    emit(DailyReportEditState.editing(
      apiData: currentApiData,
      selections: currentSelections.copyWith(
        quantityFieldData: updatedFieldData,
        segmentData: updatedSegmentData,
      ),
      formData: currentFormData,
      reportUID: reportUID,
      companyUID: companyUID,
    ));
  }

  /// Update quantity field value
  Future<void> _onUpdateQuantityFieldValue(
    UpdateQuantityFieldValueEdit event,
    Emitter<DailyReportEditState> emit,
  ) async {
    final currentApiData = _getCurrentApiData();
    final currentSelections = _getCurrentSelections();
    final currentFormData = _getCurrentFormData();
    final reportUID = _getCurrentReportUID();
    final companyUID = _getCurrentCompanyUID();

    // Update quantity field data
    final updatedFieldData = Map<String, Map<String, dynamic>>.from(
      currentSelections.quantityFieldData,
    );

    if (!updatedFieldData.containsKey(event.compositeKey)) {
      updatedFieldData[event.compositeKey] = {};
    }

    updatedFieldData[event.compositeKey]![event.fieldKey] = event.value;

    emit(DailyReportEditState.editing(
      apiData: currentApiData,
      selections: currentSelections.copyWith(
        quantityFieldData: updatedFieldData,
      ),
      formData: currentFormData,
      reportUID: reportUID,
      companyUID: companyUID,
    ));
  }

  /// Toggle equipment
  Future<void> _onToggleEquipment(
    ToggleEquipmentEdit event,
    Emitter<DailyReportEditState> emit,
  ) async {
    final currentApiData = _getCurrentApiData();
    final currentSelections = _getCurrentSelections();
    final currentFormData = _getCurrentFormData();
    final reportUID = _getCurrentReportUID();
    final companyUID = _getCurrentCompanyUID();

    final currentEquipment = currentSelections.selectedEquipment;
    final isSelected = currentEquipment.any((e) => e.uid == event.equipment.uid);

    final updatedEquipment = isSelected
        ? currentEquipment.where((e) => e.uid != event.equipment.uid).toList()
        : [...currentEquipment, event.equipment];

    emit(DailyReportEditState.editing(
      apiData: currentApiData,
      selections: currentSelections.copyWith(
        selectedEquipment: updatedEquipment,
      ),
      formData: currentFormData,
      reportUID: reportUID,
      companyUID: companyUID,
    ));
  }

  /// Update condition snapshot
  Future<void> _onUpdateConditionSnapshot(
    UpdateConditionSnapshotEdit event,
    Emitter<DailyReportEditState> emit,
  ) async {
    final currentApiData = _getCurrentApiData();
    final currentSelections = _getCurrentSelections();
    final currentFormData = _getCurrentFormData();
    final reportUID = _getCurrentReportUID();
    final companyUID = _getCurrentCompanyUID();

    final updatedSnapshots = Map<String, List<Map<String, dynamic>>>.from(
      currentSelections.conditionSnapshots,
    );
    updatedSnapshots[event.type] = event.snapshots;

    emit(DailyReportEditState.editing(
      apiData: currentApiData,
      selections: currentSelections.copyWith(
        conditionSnapshots: updatedSnapshots,
      ),
      formData: currentFormData,
      reportUID: reportUID,
      companyUID: companyUID,
    ));
  }

  /// Update worker image
  Future<void> _onUpdateWorkerImage(
    UpdateWorkerImageEdit event,
    Emitter<DailyReportEditState> emit,
  ) async {
    final currentApiData = _getCurrentApiData();
    final currentSelections = _getCurrentSelections();
    final currentFormData = _getCurrentFormData();
    final reportUID = _getCurrentReportUID();
    final companyUID = _getCurrentCompanyUID();

    emit(DailyReportEditState.editing(
      apiData: currentApiData,
      selections: currentSelections.copyWith(
        workerImage: event.image,
      ),
      formData: currentFormData,
      reportUID: reportUID,
      companyUID: companyUID,
    ));
  }

  /// Submit update
  Future<void> _onSubmitUpdate(
    SubmitUpdateEdit event,
    Emitter<DailyReportEditState> emit,
  ) async {
    final currentApiData = _getCurrentApiData();
    final currentSelections = _getCurrentSelections();
    final currentFormData = _getCurrentFormData();
    final reportUID = _getCurrentReportUID();
    final companyUID = _getCurrentCompanyUID();

    // Validate
    if (currentSelections.selectedScope == null) {
      emit(DailyReportEditState.error(
        message: 'Please select a work scope',
        apiData: currentApiData,
        selections: currentSelections,
        formData: currentFormData,
        reportUID: reportUID,
        companyUID: companyUID,
      ));
      return;
    }

    if (currentSelections.selectedRoad == null) {
      emit(DailyReportEditState.error(
        message: 'Please select a road',
        apiData: currentApiData,
        selections: currentSelections,
        formData: currentFormData,
        reportUID: reportUID,
        companyUID: companyUID,
      ));
      return;
    }

    emit(DailyReportEditState.submitting(
      apiData: currentApiData,
      selections: currentSelections,
      formData: currentFormData,
      reportUID: reportUID,
      companyUID: companyUID,
    ));

    // Call use case
    final reportData = ReportData(
      apiData: currentApiData,
      selections: currentSelections,
      formData: currentFormData,
    );

    final result = await _updateDailyReportUseCase(
      dailyReportUID: reportUID,
      reportData: reportData,
      companyUID: companyUID,
    );

    result.fold(
      (failure) {
        emit(DailyReportEditState.error(
          message: failure.message,
          apiData: currentApiData,
          selections: currentSelections,
          formData: currentFormData,
          reportUID: reportUID,
          companyUID: companyUID,
        ));
      },
      (updatedReport) {
        emit(DailyReportEditState.success(
          updatedReport: updatedReport,
        ));
      },
    );
  }

  /// Cancel edit
  Future<void> _onCancelEdit(
    CancelEdit event,
    Emitter<DailyReportEditState> emit,
  ) async {
    emit(const DailyReportEditState.initial());
  }

  // Helper methods

  String _formatSection(String? fromSection, String? toSection) {
    if (fromSection != null && toSection != null) {
      return '$fromSection-$toSection';
    } else if (fromSection != null) {
      return fromSection;
    }
    return '';
  }

  Map<String, Map<String, dynamic>> _convertQuantitiesToFieldData(
    List<dynamic>? quantities,
  ) {
    // TODO: Convert existing quantity data to field data map format
    // This is complex and depends on the structure of reportQuantities
    return {};
  }

  Map<String, List<Map<String, dynamic>>> _extractConditionSnapshots(
    List<dynamic>? files,
  ) {
    // TODO: Extract condition snapshots from files
    return {};
  }

  Map<String, dynamic>? _extractWorkerImage(List<dynamic>? files) {
    // TODO: Extract worker image from files
    return null;
  }
}
