import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/di/injection.dart';
import '../../../../../core/errors/failures.dart';
import '../../../../company/presentation/bloc/company_bloc.dart';
import '../../../../company/presentation/bloc/company_state.dart';
import '../../../../road/domain/entities/road_entity.dart';
import '../../../data/datasources/warnings_local_datasource.dart';
import '../../../data/models/create_warning_model.dart';
import '../../../domain/usecases/create_site_warning_usecase.dart';
import 'site_warning_draft_event.dart';
import 'site_warning_draft_state.dart';

@lazySingleton
class SiteWarningDraftBloc
    extends Bloc<SiteWarningDraftEvent, SiteWarningDraftState> {
  final WarningsLocalDataSource _localDataSource;
  final CreateSiteWarningUseCase _createSiteWarningUseCase;

  Timer? _autoSaveTimer;

  SiteWarningDraftBloc(this._localDataSource, this._createSiteWarningUseCase)
    : super(const SiteWarningDraftState.initial()) {
    on<InitializeDraft>(_onInitializeDraft);

    on<UpdateLocation>(_onUpdateLocation);
    on<UpdateContractor>(_onUpdateContractor);
    on<UpdateWarningReasons>(_onUpdateWarningReasons);
    on<UpdateDescription>(_onUpdateDescription);

    on<AutoSaveDraft>(_onAutoSaveDraft);

    on<LoadExistingDraft>(_onLoadExistingDraft);
    on<DeleteDraft>(_onDeleteDraft);

    on<SubmitWarning>(_onSubmitWarning);
    on<LoadDraftList>(_onLoadDraftList);
  }

  @override
  Future<void> close() {
    _autoSaveTimer?.cancel();
    return super.close();
  }

  // ------------------------------------------------------- Helper
  SiteWarningDraftData? _getCurrentDraftDataOrNull() {
    return state.maybeMap(
      editing: (state) => state.draftData,
      autoSaving: (state) => state.draftData,
      autoSaved: (state) => state.draftData,
      submitting: (state) => state.draftData,
      submitted: (state) => state.draftData,
      error: (state) => state.draftData,
      orElse: () => null,
    );
  }

  // ------------------------------------------------------- Event Handlers

  /// Initialize a new draft warning
  Future<void> _onInitializeDraft(
    InitializeDraft event,
    Emitter<SiteWarningDraftState> emit,
  ) async {
    try {
      print('📝 Creating new draft warning for company: ${event.companyUID}');

      if (event.road.uid == null) {
        emit(
          SiteWarningDraftState.error(
            failure: ServerFailure('Road UID is required'),
          ),
        );
        return;
      }

      if (event.scopeUID.isEmpty) {
        emit(
          SiteWarningDraftState.error(
            failure: ServerFailure('Work scope UID is required'),
          ),
        );
        return;
      }

      emit(const SiteWarningDraftState.loading());

      final fromSectionValue = double.tryParse(event.startSection);
      final toSectionValue = event.endSection != null
          ? double.tryParse(event.endSection!)
          : null;

      if (fromSectionValue == null) {
        emit(
          SiteWarningDraftState.error(
            failure: ServerFailure('Invalid start section value'),
          ),
        );
        return;
      }

      final draftWarning = await _localDataSource.createDraftWarningLocal(
        companyUID: event.companyUID,
        roadUID: event.road.uid!,
        workScopeUID: event.scopeUID,
        fromSection: fromSectionValue,
        toSection: toSectionValue,
      );

      print('✅ Draft warning created with UID: ${draftWarning.uid}');

      final draftData = SiteWarningDraftData(
        draftUID: draftWarning.uid,
        isDraftMode: true,
        companyUID: event.companyUID,
        scopeID: event.scopeID,
        scopeUID: event.scopeUID,
        scopeName: event.scopeName,
        road: event.road,
        startSection: event.startSection,
        endSection: event.endSection,
      );

      emit(SiteWarningDraftState.editing(draftData: draftData));

      print('✅ State updated with new draft UID: ${draftData.draftUID}');

      add(const SiteWarningDraftEvent.autoSaveDraft());
    } catch (e) {
      print('❌ Error creating draft: $e');
      emit(
        SiteWarningDraftState.error(
          failure: ServerFailure('Failed to create draft: $e'),
        ),
      );
    }
  }

  /// Load an existing draft warning
  Future<void> _onLoadExistingDraft(
    LoadExistingDraft event,
    Emitter<SiteWarningDraftState> emit,
  ) async {
    try {
      print('📂 Loading draft warning: ${event.draftUID}');

      emit(const SiteWarningDraftState.loading());

      final draftWarning = await _localDataSource.getCachedWarningByUid(
        event.draftUID,
      );

      if (draftWarning == null) {
        print('❌ Draft not found: ${event.draftUID}');

        emit(
          SiteWarningDraftState.error(
            failure: ServerFailure('Draft not found'),
          ),
        );
        return;
      }

      print('✅ Draft loaded: ${event.draftUID}');

      String workScopeUID = '';
      String workScopeName = '';
      if (draftWarning.workScope != null) {
        workScopeUID = draftWarning.workScope!.uid;
        workScopeName = draftWarning.workScope!.name;
      }

      Road? road;
      if (draftWarning.road != null) {
        road = Road(
          id: null,
          uid: draftWarning.road!.uid,
          name: draftWarning.road!.name,
          roadNo: draftWarning.road!.roadNo,
          sectionStart: null,
          sectionFinish: null,
          mainCategory: null,
          secondaryCategory: null,
          district: null,
          createdAt: DateTime.now().toString(),
          updatedAt: DateTime.now().toString(),
        );
      } else {
        road = Road(
          id: 0,
          uid: '',
          name: 'Unknown Road',
          roadNo: null,
          sectionStart: null,
          sectionFinish: null,
          mainCategory: null,
          secondaryCategory: null,
          district: null,
          createdAt: DateTime.now().toString(),
          updatedAt: DateTime.now().toString(),
        );
      }

      List<String> warningReasonUIDs = [];
      if (draftWarning.warningItems.isNotEmpty) {
        warningReasonUIDs = draftWarning.warningItems
            .where((item) => item.warningReason != null)
            .map((item) => item.warningReason!.uid)
            .toList();
      }

      final companyState = getIt<CompanyBloc>().state;
      String companyUID = '';
      if (companyState is CompanyLoaded &&
          companyState.selectedCompany != null) {
        companyUID = companyState.selectedCompany!.uid;
      }

      final draftData = SiteWarningDraftData(
        draftUID: draftWarning.uid,
        isDraftMode: true,
        companyUID: companyUID,
        scopeID: draftWarning.workScopeID,
        scopeUID: workScopeUID,
        scopeName: workScopeName,
        road: road,
        startSection: draftWarning.fromSection ?? '',
        endSection: draftWarning.toSection,
        latitude: draftWarning.latitude != null
            ? double.tryParse(draftWarning.latitude!)
            : null,
        longitude: draftWarning.longitude != null
            ? double.tryParse(draftWarning.longitude!)
            : null,
        contractor: null, // TODO: Load contractor from contractRelationID
        warningReasonUIDs: warningReasonUIDs,
        description: draftWarning.description ?? '',
      );

      emit(SiteWarningDraftState.editing(draftData: draftData));

      print('✅ Draft data loaded into state');
    } catch (e) {
      print('❌ Error loading draft: $e');
      emit(
        SiteWarningDraftState.error(
          failure: ServerFailure('Failed to load draft: $e'),
        ),
      );
    }
  }

  /// Delete a draft warning
  Future<void> _onDeleteDraft(
    DeleteDraft event,
    Emitter<SiteWarningDraftState> emit,
  ) async {
    try {
      await _localDataSource.deleteDraftWarning(event.draftUID);

      emit(const SiteWarningDraftState.initial());
    } catch (e) {
      print('❌ Error deleting draft: $e');
    }
  }

  /// Update location
  Future<void> _onUpdateLocation(
    UpdateLocation event,
    Emitter<SiteWarningDraftState> emit,
  ) async {
    final currentData = _getCurrentDraftDataOrNull();
    if (currentData == null) return;

    final updatedData = currentData.copyWith(
      latitude: event.latitude,
      longitude: event.longitude,
    );

    emit(SiteWarningDraftState.editing(draftData: updatedData));
    add(const SiteWarningDraftEvent.autoSaveDraft());
  }

  /// Update contractor
  Future<void> _onUpdateContractor(
    UpdateContractor event,
    Emitter<SiteWarningDraftState> emit,
  ) async {
    final currentData = _getCurrentDraftDataOrNull();

    if (currentData == null) return;

    final updatedData = currentData.copyWith(contractor: event.contractor);

    emit(SiteWarningDraftState.editing(draftData: updatedData));

    add(const SiteWarningDraftEvent.autoSaveDraft());
  }

  /// Update warning reasons
  Future<void> _onUpdateWarningReasons(
    UpdateWarningReasons event,
    Emitter<SiteWarningDraftState> emit,
  ) async {
    final currentData = _getCurrentDraftDataOrNull();
    if (currentData == null) return;

    final updatedData = currentData.copyWith(
      warningReasonUIDs: event.warningReasonUIDs,
    );

    emit(SiteWarningDraftState.editing(draftData: updatedData));

    add(const SiteWarningDraftEvent.autoSaveDraft());
  }

  /// Update description
  Future<void> _onUpdateDescription(
    UpdateDescription event,
    Emitter<SiteWarningDraftState> emit,
  ) async {
    final currentData = _getCurrentDraftDataOrNull();
    if (currentData == null) return;

    final updatedData = currentData.copyWith(description: event.description);

    emit(SiteWarningDraftState.editing(draftData: updatedData));

    add(const SiteWarningDraftEvent.autoSaveDraft());
  }

  Future<void> _onAutoSaveDraft(
    AutoSaveDraft event,
    Emitter<SiteWarningDraftState> emit,
  ) async {
    try {
      final currentData = _getCurrentDraftDataOrNull();
      if (currentData == null) return;

      final draftUID = currentData.draftUID;

      print('🔍 [AUTO-SAVE DEBUG] Current state draft UID: $draftUID');
      print('🔍 [AUTO-SAVE DEBUG] isDraftMode: ${currentData.isDraftMode}');

      if (draftUID == null) {
        print('⚠️ No draft UID, cannot auto-save');
        return;
      }

      print('💾 Auto-saving draft: $draftUID');

      emit(SiteWarningDraftState.autoSaving(draftData: currentData));

      final createModel = CreateWarningModel(
        roadUID: currentData.road.uid ?? '',
        workScopeUID: currentData.scopeUID,
        fromSection: double.tryParse(currentData.startSection),
        toSection: currentData.endSection != null
            ? double.tryParse(currentData.endSection!)
            : null,
        contractRelationUID: currentData.contractor?.contractRelationUID,
        warningReasonUIDs: currentData.warningReasonUIDs,
        description: currentData.description.isEmpty
            ? null
            : currentData.description,
        longitude: currentData.longitude,
        latitude: currentData.latitude,
        requiresAction: true,
      );

      await _localDataSource.updateDraftWarningLocal(draftUID, createModel);

      print('✅ Draft auto-saved successfully');

      emit(SiteWarningDraftState.autoSaved(draftData: currentData));

      await Future.delayed(const Duration(milliseconds: 500));
      emit(SiteWarningDraftState.editing(draftData: currentData));
    } catch (e) {
      print('❌ Error auto-saving draft: $e');

      final currentData = _getCurrentDraftDataOrNull();

      if (currentData != null) {
        emit(SiteWarningDraftState.editing(draftData: currentData));
      }
    }
  }

  /// Submit warning
  Future<void> _onSubmitWarning(
    SubmitWarning event,
    Emitter<SiteWarningDraftState> emit,
  ) async {
    try {
      final currentData = _getCurrentDraftDataOrNull();
      if (currentData == null) return;

      final draftUID = currentData.draftUID;

      print('📤 Submitting warning: $draftUID');

      emit(SiteWarningDraftState.submitting(draftData: currentData));

      // Step 1: Build the CreateWarningModel
      final createModel = CreateWarningModel(
        roadUID: currentData.road.uid ?? '',
        workScopeUID: currentData.scopeUID,
        fromSection: double.tryParse(currentData.startSection),
        toSection: currentData.endSection != null
            ? double.tryParse(currentData.endSection!)
            : null,
        contractRelationUID: currentData.contractor?.contractRelationUID,
        warningReasonUIDs: currentData.warningReasonUIDs,
        description: currentData.description.isEmpty
            ? null
            : currentData.description,
        longitude: currentData.longitude,
        latitude: currentData.latitude,
        requiresAction: true,
      );

      // Step 2: Call use case to create site warning
      final result = await _createSiteWarningUseCase(
        CreateSiteWarningParams(
          data: createModel,
          companyUID: event.companyUID,
        ),
      );

      // Step 3: Handle result
      await result.fold(
        (failure) async {
          print('❌ Failed to submit warning: ${failure.message}');
          emit(
            SiteWarningDraftState.error(
              failure: ServerFailure(failure.message),
              draftData: currentData,
            ),
          );
        },
        (warning) async {
          print('✅ Warning submitted successfully: ${warning.uid}');

          // Step 4: Delete the draft after successful submission
          if (draftUID != null) {
            await _localDataSource.deleteWarningByUID(draftUID);
            print('🗑️ Draft deleted: $draftUID');
          }

          // Emit submitted with the draft data (not Warning entity)
          emit(SiteWarningDraftState.submitted(draftData: currentData));
        },
      );
    } catch (e) {
      print('❌ Error submitting warning: $e');

      final currentData = _getCurrentDraftDataOrNull();
      if (currentData != null) {
        emit(
          SiteWarningDraftState.error(
            failure: ServerFailure('Failed to submit warning: $e'),
            draftData: currentData,
          ),
        );
      }
    }
  }

  Future<void> _onLoadDraftList(
    LoadDraftList event,
    Emitter<SiteWarningDraftState> emit,
  ) async {
    try {
      print('📂 Loading draft list for company: ${event.companyUID}');

      emit(const SiteWarningDraftState.loading());

      final drafts = await _localDataSource.getDraftWarnings(event.companyUID);

      if (drafts == null || drafts.isEmpty) {
        print('📭 No drafts found');
        emit(const SiteWarningDraftState.draftListLoaded(drafts: []));
        return;
      }

      print('✅ Loaded ${drafts.length} drafts');

      final draftEntities = drafts.map((model) => model.toEntity()).toList();
      emit(SiteWarningDraftState.draftListLoaded(drafts: draftEntities));
    } catch (e) {
      print('❌ Error loading draft list: $e');
      emit(
        SiteWarningDraftState.error(
          failure: ServerFailure('Failed to load drafts: $e'),
        ),
      );
    }
  }
}
