import 'dart:async';
import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/database/app_database.dart';
import '../../../../../core/di/injection.dart';
import '../../../../../core/errors/failures.dart';
import '../../../../../core/sync/datasources/image_local_datasource.dart';
import '../../../../../core/sync/sync_constants.dart';
import '../../../../auth/presentation/bloc/auth_bloc.dart';
import '../../../../auth/presentation/bloc/auth_state.dart';
import '../../../../company/presentation/bloc/company_bloc.dart';
import '../../../../company/presentation/bloc/company_state.dart';
import '../../../../contractor_relation/domain/entities/contractor_relation_entity.dart';
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
  final ImageLocalDataSource _imageLocalDataSource;

  Timer? _autoSaveTimer;

  SiteWarningDraftBloc(
    this._localDataSource,
    this._createSiteWarningUseCase,
    this._imageLocalDataSource,
  ) : super(const SiteWarningDraftState.initial()) {
    on<InitializeDraft>(_onInitializeDraft);

    on<UpdateLocation>(_onUpdateLocation);
    on<UpdateContractor>(_onUpdateContractor);
    on<UpdateWarningReasons>(_onUpdateWarningReasons);
    on<UpdateDescription>(_onUpdateDescription);
    on<UpdateWarningImages>(_onUpdateWarningImages);

    on<AutoSaveDraft>(_onAutoSaveDraft);

    on<LoadExistingDraft>(_onLoadExistingDraft);
    on<DeleteDraft>(_onDeleteDraft);

    on<ResetForm>(_onResetForm);

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

      ContractorRelation? contractor;
      if (draftWarning.contractRelationID != null) {
        contractor = await _localDataSource.getContractorByID(
          draftWarning.contractRelationID!,
        );
      }

      final draftImages = await _loadDraftImages(event.draftUID);

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
        contractor: contractor,
        warningReasonUIDs: warningReasonUIDs,
        description: draftWarning.description ?? '',
        warningImages: draftImages,
      );

      emit(SiteWarningDraftState.editing(draftData: draftData));
    } catch (e) {
      print('❌ Error loading draft: $e');
      emit(
        SiteWarningDraftState.error(
          failure: ServerFailure('Failed to load draft: $e'),
        ),
      );
    }
  }

  /// Update location
  Future<void> _onUpdateLocation(
    UpdateLocation event,
    Emitter<SiteWarningDraftState> emit,
  ) async {
    final currentData = _getCurrentDraftDataOrNull();
    if (currentData == null) return;

    emit(
      SiteWarningDraftState.editing(
        draftData: currentData.copyWith(
          latitude: event.latitude,
          longitude: event.longitude,
        ),
      ),
    );
  }

  /// Update contractor
  Future<void> _onUpdateContractor(
    UpdateContractor event,
    Emitter<SiteWarningDraftState> emit,
  ) async {
    final currentData = _getCurrentDraftDataOrNull();
    if (currentData == null) return;

    emit(
      SiteWarningDraftState.editing(
        draftData: currentData.copyWith(contractor: event.contractor),
      ),
    );
  }

  /// Update warning reasons
  Future<void> _onUpdateWarningReasons(
    UpdateWarningReasons event,
    Emitter<SiteWarningDraftState> emit,
  ) async {
    final currentData = _getCurrentDraftDataOrNull();
    if (currentData == null) return;

    emit(
      SiteWarningDraftState.editing(
        draftData: currentData.copyWith(
          warningReasonUIDs: event.warningReasonUIDs,
        ),
      ),
    );
  }

  /// Update description
  Future<void> _onUpdateDescription(
    UpdateDescription event,
    Emitter<SiteWarningDraftState> emit,
  ) async {
    final currentData = _getCurrentDraftDataOrNull();
    if (currentData == null) return;

    emit(
      SiteWarningDraftState.editing(
        draftData: currentData.copyWith(description: event.description),
      ),
    );
  }

  /// Update warning images
  Future<void> _onUpdateWarningImages(
    UpdateWarningImages event,
    Emitter<SiteWarningDraftState> emit,
  ) async {
    final currentData = _getCurrentDraftDataOrNull();
    if (currentData == null) return;

    emit(
      SiteWarningDraftState.editing(
        draftData: currentData.copyWith(warningImages: event.warningImages),
      ),
    );
  }

  /// Auto-save draft
  Future<void> _onAutoSaveDraft(
    AutoSaveDraft event,
    Emitter<SiteWarningDraftState> emit,
  ) async {
    try {
      final currentData = _getCurrentDraftDataOrNull();
      if (currentData == null || currentData.draftUID == null) {
        print('⚠️ Cannot auto-save: no draft UID');
        return;
      }

      final draftUID = currentData.draftUID!;

      print('💾 Auto-saving draft: $draftUID');

      emit(SiteWarningDraftState.autoSaving(draftData: currentData));

      final createModel = CreateWarningModel(
        roadUID: currentData.road.uid ?? '',
        workScopeUID: currentData.scopeUID,
        fromSection: double.tryParse(currentData.startSection),
        toSection: currentData.endSection != null
            ? double.tryParse(currentData.endSection!)
            : null,
        contractRelationUID: currentData.contractor?.uid,
        warningReasonUIDs: currentData.warningReasonUIDs,
        description: currentData.description.isEmpty
            ? null
            : currentData.description,
        longitude: currentData.longitude,
        latitude: currentData.latitude,
        requiresAction: true,
      );

      await _localDataSource.updateDraftWarningLocal(draftUID, createModel);

      print('✅ Draft data auto-saved: $draftUID');

      await _saveWarningDraftImages(
        draftUID: draftUID,
        companyUID: currentData.companyUID,
        warningImages: currentData.warningImages,
      );

      emit(SiteWarningDraftState.autoSaved(draftData: currentData));
    } catch (e) {
      print('❌ Error auto-saving draft: $e');
      final currentData = _getCurrentDraftDataOrNull();
      if (currentData != null) {
        emit(SiteWarningDraftState.editing(draftData: currentData));
      }
    }
  }

  /// Delete draft
  Future<void> _onDeleteDraft(
    DeleteDraft event,
    Emitter<SiteWarningDraftState> emit,
  ) async {
    try {
      print('🗑️ Deleting draft: ${event.draftUID}');

      try {
        await _deleteDraftImages(event.draftUID);
        print('✅ Draft images deleted');
      } catch (e) {
        print('⚠️ Error deleting draft images: $e');
      }

      await _localDataSource.deleteDraftWarning(event.draftUID);

      print('✅ Draft deleted successfully');

      emit(const SiteWarningDraftState.initial());
    } catch (e) {
      print('❌ Error deleting draft: $e');
      emit(
        SiteWarningDraftState.error(
          failure: ServerFailure('Failed to delete draft: $e'),
        ),
      );
    }
  }

  /// Reset form to initial state
  Future<void> _onResetForm(
    ResetForm event,
    Emitter<SiteWarningDraftState> emit,
  ) async {
    try {
      print('🔄 Resetting form to initial state');

      // Emit initial state to clear all data
      emit(const SiteWarningDraftState.initial());

      print('✅ Form reset to initial state');
    } catch (e) {
      print('❌ Error resetting form: $e');
    }
  }

  /// Submit warning
  Future<void> _onSubmitWarning(
    SubmitWarning event,
    Emitter<SiteWarningDraftState> emit,
  ) async {
    try {
      final currentData = _getCurrentDraftDataOrNull();
      if (currentData == null) {
        print('❌ No draft data available');
        return;
      }

      final draftUID = currentData.draftUID;

      // Validation
      if (currentData.warningReasonUIDs.isEmpty) {
        emit(
          SiteWarningDraftState.error(
            failure: ServerFailure('Please select at least one warning reason'),
            draftData: currentData,
          ),
        );
        return;
      }

      if (currentData.warningImages.length < 2) {
        emit(
          SiteWarningDraftState.error(
            failure: ServerFailure(
              'Please upload at least 2 images (currently: ${currentData.warningImages.length})',
            ),
            draftData: currentData,
          ),
        );
        return;
      }

      print(
        '📤 Submitting warning with ${currentData.warningImages.length} images',
      );

      emit(SiteWarningDraftState.submitting(draftData: currentData));

      // Get admin UID from AuthBloc
      String? adminUID;
      final authBloc = getIt<AuthBloc>();
      final authState = authBloc.state;

      if (authState is Authenticated && authState.currentAdmin != null) {
        adminUID = authState.currentAdmin!.uid;
        print('✅ Got admin UID from AuthBloc: $adminUID');
      } else {
        print('⚠️ No admin data available in AuthBloc state');
      }

      if (adminUID == null) {
        print('⚠️ Admin UID not found, continuing without it');
      }

      // Step 1: Build CreateWarningModel
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

      // DEBUG: Print the contractor details and payload
      print('🔍 DEBUG: Contractor details:');
      print('   Contractor name: ${currentData.contractor?.name}');
      print('   Contractor company UID: ${currentData.contractor?.uid}');
      print(
        '   Contractor contractRelationUID: ${currentData.contractor?.contractRelationUID}',
      );
      print('🔍 DEBUG: CreateWarningModel payload:');
      print(
        '   contractRelationUID in payload: ${createModel.contractRelationUID}',
      );
      print('   Full JSON: ${jsonEncode(createModel.toJson())}');

      // Step 2: Call use case to create site warning with images
      final result = await _createSiteWarningUseCase(
        CreateSiteWarningParams(
          data: createModel,
          companyUID: event.companyUID,
          images: currentData.warningImages,
          adminUID: adminUID,
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
            try {
              await _deleteDraftImages(draftUID);
              await _localDataSource.deleteWarningByUID(draftUID);
              print('🗑️ Draft deleted: $draftUID');
            } catch (e) {
              print('⚠️ Error deleting draft: $e');
            }
          }

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

  // ------------------------------------------------------- Draft Image Helpers

  /// Save draft images to permanent storage
  Future<void> _saveWarningDraftImages({
    required String draftUID,
    required String companyUID,
    required List<String> warningImages,
  }) async {
    try {
      if (warningImages.isEmpty) {
        print('📷 No draft images to save for $draftUID');
        return;
      }

      final imagesByContext = <ImageContextField, List<String>>{};

      imagesByContext[ImageContextField.general] = warningImages;

      await _imageLocalDataSource.saveDraftImages(
        entityType: SyncEntityType.warning,
        entityUID: draftUID,
        companyUID: companyUID,
        imagesByContextField: imagesByContext,
      );

      print('✅ Draft images saved successfully: $draftUID');
    } catch (e) {
      print('❌ Error saving draft images: $e');
      print('   Stack trace: ${StackTrace.current}');
    }
  }

  /// Load draft images from permanent storage
  Future<List<String>> _loadDraftImages(String draftUID) async {
    try {
      print('📂 Loading draft images for: $draftUID');

      final imagesByContext = await _imageLocalDataSource.getDraftImages(
        entityType: SyncEntityType.warning,
        entityUID: draftUID,
      );

      final generalImages = imagesByContext[ImageContextField.general] ?? [];

      return generalImages;
    } catch (e) {
      print('❌ Error loading draft images: $e');

      print('   Stack trace: ${StackTrace.current}');
      return [];
    }
  }

  /// Delete draft images
  Future<void> _deleteDraftImages(String draftUID) async {
    try {
      await _imageLocalDataSource.deleteDraftImages(
        entityType: SyncEntityType.warning,
        draftUID: draftUID,
      );

      print('🗑️ Deleted draft images for $draftUID');
    } catch (e) {
      print('❌ Error deleting draft images: $e');
      rethrow;
    }
  }
}
