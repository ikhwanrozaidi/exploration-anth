import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/errors/failures.dart';
import '../../../../../core/sync/datasources/image_local_datasource.dart';
import '../../../../../core/sync/sync_constants.dart';
import '../../../data/datasource/program_draft_local_datasource.dart';
import '../../../data/datasource/program_settings_local_datasource.dart';
import '../../../domain/entities/program_draft_data_entity.dart';
import 'program_draft_event.dart';
import 'program_draft_state.dart';

@lazySingleton
class ProgramDraftBloc extends Bloc<ProgramDraftEvent, ProgramDraftState> {
  final ProgramDraftLocalDataSource _localDataSource;
  final ImageLocalDataSource _imageLocalDataSource;

  Timer? _autoSaveTimer;

  ProgramDraftBloc(this._localDataSource, this._imageLocalDataSource)
    : super(const ProgramDraftState.initial()) {
    on<InitializeDraft>(_onInitializeDraft);
    on<LoadExistingDraft>(_onLoadExistingDraft);

    on<UpdateLocation>(_onUpdateLocation);
    on<UpdateContractor>(_onUpdateContractor);
    on<UpdateProgramName>(_onUpdateProgramName);
    on<UpdateDescription>(_onUpdateDescription);
    on<UpdatePeriods>(_onUpdatePeriods);
    on<UpdateQuantityFieldData>(_onUpdateQuantityFieldData);
    on<UpdateProgramImages>(_onUpdateProgramImages);

    on<AutoSaveDraft>(_onAutoSaveDraft);
    on<DeleteDraft>(_onDeleteDraft);
    on<ResetForm>(_onResetForm);

    on<SubmitProgram>(_onSubmitProgram);
    on<LoadDraftList>(_onLoadDraftList);

    on<InitializeDraftMultiRoad>(_onInitializeDraftMultiRoad);
    on<UpdateRoadInputData>(_onUpdateRoadInputData);
  }

  @override
  Future<void> close() {
    _autoSaveTimer?.cancel();
    return super.close();
  }

  // Helper to get current draft data
  ProgramDraftData? _getCurrentDraftDataOrNull() {
    return state.maybeWhen(
      editing: (draftData) => draftData,
      autoSaving: (draftData) => draftData,
      autoSaved: (draftData) => draftData,
      submitting: (draftData) => draftData,
      error: (failure, draftData) => draftData,
      orElse: () => null,
    );
  }

  /// Initialize new draft
  Future<void> _onInitializeDraft(
    InitializeDraft event,
    Emitter<ProgramDraftState> emit,
  ) async {
    try {
      print('📝 Initializing new program draft...');

      final result = await _localDataSource.createDraftLocal(
        companyUID: event.companyUID,
        workScopeID: event.workScopeID,
        workScopeUID: event.workScopeUID,
        workScopeName: event.workScopeName,
        workScopeCode: event.workScopeCode,
        road: event.road,
        fromSection: event.section?.toString(),
      );

      result.fold(
        (failure) {
          print('❌ Error creating draft: ${failure.message}');
          emit(ProgramDraftState.error(failure: failure));
        },
        (draftData) {
          print('✅ Draft initialized: ${draftData.uid}');
          emit(ProgramDraftState.editing(draftData: draftData));

          // Trigger initial auto-save
          add(const ProgramDraftEvent.autoSaveDraft());
        },
      );
    } catch (e) {
      print('❌ Error initializing draft: $e');
      emit(
        ProgramDraftState.error(
          failure: ServerFailure('Failed to initialize draft: $e'),
        ),
      );
    }
  }

  /// Load existing draft
  Future<void> _onLoadExistingDraft(
    LoadExistingDraft event,
    Emitter<ProgramDraftState> emit,
  ) async {
    try {
      emit(const ProgramDraftState.loading());

      print('📂 Loading existing draft: ${event.draftUID}');

      final draftResult = await _localDataSource.getDraftByUID(event.draftUID);

      await draftResult.fold(
        (failure) async {
          print('❌ Error loading draft: ${failure.message}');
          emit(ProgramDraftState.error(failure: failure));
        },
        (draftData) async {
          if (draftData == null) {
            print('❌ Draft not found: ${event.draftUID}');
            emit(
              ProgramDraftState.error(
                failure: ServerFailure('Draft not found'),
              ),
            );
            return;
          }

          print('✅ Draft loaded: ${event.draftUID}');

          // Load draft images
          final draftImages = await _loadDraftImages(event.draftUID);

          final updatedDraftData = draftData.copyWith(
            programImages: draftImages,
          );

          emit(ProgramDraftState.editing(draftData: updatedDraftData));
        },
      );
    } catch (e) {
      print('❌ Error loading draft: $e');
      emit(
        ProgramDraftState.error(
          failure: ServerFailure('Failed to load draft: $e'),
        ),
      );
    }
  }

  /// Update location
  Future<void> _onUpdateLocation(
    UpdateLocation event,
    Emitter<ProgramDraftState> emit,
  ) async {
    final currentData = _getCurrentDraftDataOrNull();
    if (currentData == null) return;

    emit(
      ProgramDraftState.editing(
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
    Emitter<ProgramDraftState> emit,
  ) async {
    final currentData = _getCurrentDraftDataOrNull();
    if (currentData == null) return;

    emit(
      ProgramDraftState.editing(
        draftData: currentData.copyWith(contractor: event.contractor),
      ),
    );
  }

  /// Update program name
  Future<void> _onUpdateProgramName(
    UpdateProgramName event,
    Emitter<ProgramDraftState> emit,
  ) async {
    final currentData = _getCurrentDraftDataOrNull();
    if (currentData == null) return;

    emit(
      ProgramDraftState.editing(
        draftData: currentData.copyWith(name: event.name),
      ),
    );
  }

  Future<void> _onUpdateDescription(
    UpdateDescription event,
    Emitter<ProgramDraftState> emit,
  ) async {
    state.maybeWhen(
      editing: (currentData) {
        emit(
          ProgramDraftState.editing(
            draftData: currentData.copyWith(description: event.description),
          ),
        );
      },
      autoSaving: (currentData) {
        emit(
          ProgramDraftState.editing(
            draftData: currentData.copyWith(description: event.description),
          ),
        );
      },
      autoSaved: (currentData) {
        emit(
          ProgramDraftState.editing(
            draftData: currentData.copyWith(description: event.description),
          ),
        );
      },
      orElse: () {},
    );
  }

  /// Update periods
  Future<void> _onUpdatePeriods(
    UpdatePeriods event,
    Emitter<ProgramDraftState> emit,
  ) async {
    final currentData = _getCurrentDraftDataOrNull();
    if (currentData == null) return;

    emit(
      ProgramDraftState.editing(
        draftData: currentData.copyWith(
          periodStart: event.periodStart,
          periodEnd: event.periodEnd,
        ),
      ),
    );
  }

  /// Update quantity field data
  Future<void> _onUpdateQuantityFieldData(
    UpdateQuantityFieldData event,
    Emitter<ProgramDraftState> emit,
  ) async {
    final currentData = _getCurrentDraftDataOrNull();
    if (currentData == null) return;

    emit(
      ProgramDraftState.editing(
        draftData: currentData.copyWith(
          quantityFieldData: event.quantityFieldData,
        ),
      ),
    );
  }

  /// Update program images
  Future<void> _onUpdateProgramImages(
    UpdateProgramImages event,
    Emitter<ProgramDraftState> emit,
  ) async {
    final currentData = _getCurrentDraftDataOrNull();
    if (currentData == null) return;

    emit(
      ProgramDraftState.editing(
        draftData: currentData.copyWith(programImages: event.programImages),
      ),
    );
  }

  /// Auto-save draft
  Future<void> _onAutoSaveDraft(
    AutoSaveDraft event,
    Emitter<ProgramDraftState> emit,
  ) async {
    try {
      final currentData = _getCurrentDraftDataOrNull();
      if (currentData == null || currentData.uid == null) {
        print('⚠️ Cannot auto-save: no draft UID');
        return;
      }

      final draftUID = currentData.uid!;

      print('💾 Auto-saving draft: $draftUID');

      emit(ProgramDraftState.autoSaving(draftData: currentData));

      // Save draft data to database
      await _localDataSource.updateDraftLocal(draftUID, currentData);

      print('✅ Draft data auto-saved: $draftUID');

      // Save draft images
      await _saveProgramDraftImages(
        draftUID: draftUID,
        companyUID: currentData.companyUID,
        programImages: currentData.programImages,
      );

      emit(ProgramDraftState.autoSaved(draftData: currentData));
    } catch (e) {
      print('❌ Error auto-saving draft: $e');
      final currentData = _getCurrentDraftDataOrNull();
      if (currentData != null) {
        emit(ProgramDraftState.editing(draftData: currentData));
      }
    }
  }

  /// Delete draft
  Future<void> _onDeleteDraft(
    DeleteDraft event,
    Emitter<ProgramDraftState> emit,
  ) async {
    try {
      print('🗑️ Deleting draft: ${event.draftUID}');

      // Delete draft images
      try {
        await _deleteDraftImages(event.draftUID);
        print('✅ Draft images deleted');
      } catch (e) {
        print('⚠️ Error deleting draft images: $e');
      }

      // Delete draft from database
      await _localDataSource.deleteDraftByUID(event.draftUID);

      print('✅ Draft deleted successfully');

      emit(const ProgramDraftState.initial());
    } catch (e) {
      print('❌ Error deleting draft: $e');
      emit(
        ProgramDraftState.error(
          failure: ServerFailure('Failed to delete draft: $e'),
        ),
      );
    }
  }

  /// Reset form
  Future<void> _onResetForm(
    ResetForm event,
    Emitter<ProgramDraftState> emit,
  ) async {
    try {
      print('🔄 Resetting form to initial state');
      emit(const ProgramDraftState.initial());
      print('✅ Form reset to initial state');
    } catch (e) {
      print('❌ Error resetting form: $e');
    }
  }

  /// Submit program
  Future<void> _onSubmitProgram(
    SubmitProgram event,
    Emitter<ProgramDraftState> emit,
  ) async {
    try {
      final currentData = _getCurrentDraftDataOrNull();
      if (currentData == null) {
        print('⚠️ No draft data to submit');
        return;
      }

      print('📤 Submitting program...');

      emit(ProgramDraftState.submitting(draftData: currentData));

      // TODO: Implement program submission via CreateProgramUseCase
      // 1. Map ProgramDraftData -> CreateProgramModel
      // 2. Call API via usecase
      // 3. On success, update draft status to 'SUBMITTED'
      // 4. Delete draft images

      // For now, just simulate success
      await Future.delayed(const Duration(seconds: 2));

      // After successful submission, delete draft and images
      if (currentData.uid != null) {
        try {
          await _deleteDraftImages(currentData.uid!);
          await _localDataSource.deleteDraftByUID(currentData.uid!);
          print('🗑️ Draft deleted: ${currentData.uid}');
        } catch (e) {
          print('⚠️ Error deleting draft: $e');
        }
      }

      emit(ProgramDraftState.submitted(draftData: currentData));
    } catch (e) {
      print('❌ Error submitting program: $e');

      final currentData = _getCurrentDraftDataOrNull();
      if (currentData != null) {
        emit(
          ProgramDraftState.error(
            failure: ServerFailure('Failed to submit program: $e'),
            draftData: currentData,
          ),
        );
      }
    }
  }

  /// Load draft list
  Future<void> _onLoadDraftList(
    LoadDraftList event,
    Emitter<ProgramDraftState> emit,
  ) async {
    try {
      print('📂 Loading program draft list for company: ${event.companyUID}');

      emit(const ProgramDraftState.loading());

      final result = await _localDataSource.getDraftList(event.companyUID);

      result.fold(
        (failure) {
          print('❌ Error loading draft list: ${failure.message}');
          emit(ProgramDraftState.error(failure: failure));
        },
        (drafts) {
          print('✅ Loaded ${drafts.length} program drafts');
          emit(ProgramDraftState.draftListLoaded(drafts: drafts));
        },
      );
    } catch (e) {
      print('❌ Error loading draft list: $e');
      emit(
        ProgramDraftState.error(
          failure: ServerFailure('Failed to load draft list: $e'),
        ),
      );
    }
  }

  /// Initialize new draft for non-R02 (multi-road)
  Future<void> _onInitializeDraftMultiRoad(
    InitializeDraftMultiRoad event,
    Emitter<ProgramDraftState> emit,
  ) async {
    try {
      print('📝 Initializing new multi-road program draft...');

      final result = await _localDataSource.createDraftMultiRoadLocal(
        companyUID: event.companyUID,
        workScopeID: event.workScopeID,
        workScopeUID: event.workScopeUID,
        workScopeName: event.workScopeName,
        workScopeCode: event.workScopeCode,
        roads: event.roads,
        contractor: event.contractor,
      );

      result.fold(
        (failure) {
          print('❌ Error creating multi-road draft: ${failure.message}');
          emit(ProgramDraftState.error(failure: failure));
        },
        (draftData) {
          print('✅ Multi-road draft initialized: ${draftData.uid}');
          emit(ProgramDraftState.editing(draftData: draftData));

          // Trigger initial auto-save
          add(const ProgramDraftEvent.autoSaveDraft());
        },
      );
    } catch (e) {
      print('❌ Error initializing multi-road draft: $e');
      emit(
        ProgramDraftState.error(
          failure: ServerFailure('Failed to initialize draft: $e'),
        ),
      );
    }
  }

  /// Update road input data
  Future<void> _onUpdateRoadInputData(
    UpdateRoadInputData event,
    Emitter<ProgramDraftState> emit,
  ) async {
    final currentData = _getCurrentDraftDataOrNull();
    if (currentData == null) return;

    emit(
      ProgramDraftState.editing(
        draftData: currentData.copyWith(roadInputData: event.roadInputData),
      ),
    );
  }

  // ------------------------------------------------------- Draft Image Helpers

  /// Save draft images to permanent storage
  Future<void> _saveProgramDraftImages({
    required String draftUID,
    required String companyUID,
    required List<String> programImages,
  }) async {
    try {
      if (programImages.isEmpty) {
        print('📷 No draft images to save for $draftUID');
        return;
      }

      final imagesByContext = <ImageContextField, List<String>>{};
      imagesByContext[ImageContextField.general] = programImages;

      await _imageLocalDataSource.saveDraftImages(
        entityType: SyncEntityType.program,
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
        entityType: SyncEntityType.program,
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
        entityType: SyncEntityType.program,
        draftUID: draftUID,
      );

      print('🗑️ Deleted draft images for $draftUID');
    } catch (e) {
      print('❌ Error deleting draft images: $e');
      rethrow;
    }
  }
}
