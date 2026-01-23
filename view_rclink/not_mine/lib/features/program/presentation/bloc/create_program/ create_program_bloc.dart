import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/di/injection.dart';
import '../../../../../core/sync/datasources/image_local_datasource.dart';
import '../../../../../core/sync/sync_constants.dart';
import '../../../../auth/presentation/bloc/auth_bloc.dart';
import '../../../../auth/presentation/bloc/auth_state.dart';
import '../../../data/datasource/program_image_remote_datasource.dart';
import '../../../data/helper/programs_api_transformer.dart';
import '../../../data/models/program_create/submit_program_request_model.dart';
import '../../../domain/usecases/submit_program_usecase.dart';
import 'create_program_event.dart';
import 'create_program_state.dart';

@injectable
class CreateProgramBloc extends Bloc<CreateProgramEvent, CreateProgramState> {
  final SubmitProgramUseCase _submitProgramUseCase;

  CreateProgramBloc(this._submitProgramUseCase)
    : super(const CreateProgramState.initial()) {
    on<SubmitR02Program>(_onSubmitR02Program);
    on<SubmitNonR02Program>(_onSubmitNonR02Program);
  }

  Future<void> _onSubmitR02Program(
    SubmitR02Program event,
    Emitter<CreateProgramState> emit,
  ) async {
    emit(const CreateProgramState.submitting());

    try {
      // Build roads array (single road for R02)
      final roads = [
        RoadInputModel(
          roadUID: event.roadUID,
          fromSection: event.section,
          toSection: null, // R02 uses single section value
        ),
      ];

      // Build periods
      final periods = event.periods.map((p) {
        return PeriodModel(
          periodStart: p['periodStart']!,
          periodEnd: p['periodEnd']!,
        );
      }).toList();

      // Generate program name
      final programName = ProgramApiTransformer.generateProgramName(
        workScopeCode: event.workScopeCode,
        workScopeName: event.workScopeName,
        periodStart: event.periodStart,
      );

      // Transform quantities
      final quantities = ProgramApiTransformer.transformQuantitiesForAPI(
        quantityFieldData: event.quantityFieldData,
        quantityTypes: event.quantityTypes,
        quantityNotes: event.description,
      );

      // Build request model
      final requestModel = SubmitProgramRequestModel(
        workScopeUID: event.workScopeUID,
        roads: roads,
        periods: periods,
        contractRelationUID: event.contractRelationUID,
        name: programName,
        description: event.description,
        latitude: event.latitude,
        longitude: event.longitude,
        quantities: quantities,
      );

      // Debug print
      print('\n═══════════════════════════════════════════════════════');
      print('📋 R02 PROGRAM SUBMISSION');
      print('═══════════════════════════════════════════════════════');
      print(JsonEncoder.withIndent('  ').convert(requestModel.toJson()));
      print('═══════════════════════════════════════════════════════\n');

      // Call use case
      final result = await _submitProgramUseCase(
        SubmitProgramParams(
          companyUID: event.companyUID,
          requestModel: requestModel,
        ),
      );

      // IMPORTANT: Handle result synchronously before any async operations
      await result.fold(
        (failure) async {
          print('❌ Submission failed: ${failure.message}');
          if (!emit.isDone) {
            emit(CreateProgramState.error(failure.message));
          }
        },
        (program) async {
          print('✅ Submission successful: ${program.uid}');

          // Activate draft images for upload if draft exists (R02 ONLY)
          if (event.draftUID != null && event.draftUID!.isNotEmpty) {
            try {
              // Validate program UID
              if (program.uid!.isNotEmpty) {
                // Get admin UID from AuthBloc
                String? adminUID;
                final authBloc = getIt<AuthBloc>();
                final authState = authBloc.state;

                if (authState is Authenticated &&
                    authState.currentAdmin != null) {
                  adminUID = authState.currentAdmin!.uid;
                }

                if (adminUID != null && adminUID.isNotEmpty) {
                  print(
                    '📷 Activating draft images for upload: ${event.draftUID} → ${program.uid}',
                  );

                  final imageLocalDataSource = getIt<ImageLocalDataSource>();

                  // STEP 1: Activate images (draft_pending → pending_upload)
                  await imageLocalDataSource.activateDraftImagesForSubmission(
                    entityType: SyncEntityType.program,
                    draftUID: event.draftUID!,
                    serverUID: program.uid,
                    uploadedByUID: adminUID,
                  );
                  print('✅ Draft images activated for upload');

                  // STEP 2: Upload images immediately after activation
                  print('📤 Starting immediate image upload...');
                  await _uploadProgramImagesImmediately(
                    companyUID: event.companyUID,
                    programUID: program.uid,
                    imageLocalDataSource: imageLocalDataSource,
                  );
                } else {
                  print('⚠️ No admin UID available for image activation');
                }
              } else {
                print('⚠️ Program UID is empty, cannot activate images');
              }
            } catch (e) {
              print('⚠️ Error activating draft images: $e');
              // Don't fail submission if image activation fails
            }
          } else {
            print('ℹ️ No draft UID provided, skipping image activation');
          }

          // Emit success state AFTER all async operations are complete
          if (!emit.isDone) {
            emit(CreateProgramState.success(program));
          }
        },
      );
    } catch (e) {
      print('❌ Unexpected error: $e');
      if (!emit.isDone) {
        emit(CreateProgramState.error('Failed to submit: ${e.toString()}'));
      }
    }
  }

  /// Upload program images immediately after activation
  Future<void> _uploadProgramImagesImmediately({
    required String companyUID,
    required String programUID,
    required ImageLocalDataSource imageLocalDataSource,
  }) async {
    try {
      print('🔍 DEBUG: _uploadProgramImagesImmediately called');
      print('   companyUID: $companyUID');
      print('   programUID: $programUID');

      // Get the program image remote datasource
      final programImageRemoteDataSource =
          getIt<ProgramImageRemoteDataSource>();

      // Get activated images for this program
      final images = await imageLocalDataSource.getImagesByEntity(
        entityType: SyncEntityType.program,
        entityUID: programUID,
      );
      print('✅ DEBUG: getImagesByEntity completed');
      print('   Found ${images.length} images');

      if (images.isEmpty) {
        print('No images to upload for program $programUID');
        return;
      }

      // Debug each image record
      for (int i = 0; i < images.length; i++) {
        final img = images[i];
        print('🔍 DEBUG: Image $i:');
        print('   - id: ${img.id}');
        print('   - entityType: ${img.entityType}');
        print('   - entityUID: ${img.entityUID}');
        print('   - contextField: ${img.contextField}');
        print('   - sequence: ${img.sequence}');
        print('   - localFilePath: ${img.localFilePath}');
        print('   - fileName: ${img.fileName}');
        print('   - syncStatus: ${img.syncStatus}');
      }

      print('📤 Uploading ${images.length} images immediately...');
      print('🔍 DEBUG: Calling uploadImagesForProgram...');

      final result = await programImageRemoteDataSource.uploadImagesForProgram(
        companyUID: companyUID,
        programUID: programUID,
        images: images,
      );

      print('✅ DEBUG: uploadImagesForProgram completed');

      await result.fold(
        (failure) async {
          print('⚠️ Immediate image upload failed: ${failure.message}');
          print('   Images will retry via periodic sync');

          await imageLocalDataSource.incrementRetryCount(
            SyncEntityType.program,
            programUID,
            failure.message,
          );
        },
        (uploadedFiles) async {
          print(
            '✅ Immediate upload successful! ${uploadedFiles.length} images uploaded',
          );

          await imageLocalDataSource.markImagesAsSynced(
            SyncEntityType.program,
            programUID,
            uploadedFiles,
          );
        },
      );
    } catch (e, stackTrace) {
      print('❌ Error in immediate image upload: $e');
      print('📍 Stack trace:');
      print(stackTrace);
      print('   Images will retry via periodic sync');

      try {
        await imageLocalDataSource.incrementRetryCount(
          SyncEntityType.program,
          programUID,
          e.toString(),
        );
      } catch (incrementError) {
        print('❌ Error incrementing retry count: $incrementError');
      }
    }
  }

  Future<void> _onSubmitNonR02Program(
    SubmitNonR02Program event,
    Emitter<CreateProgramState> emit,
  ) async {
    emit(const CreateProgramState.submitting());

    try {
      // Build roads array (multiple roads for non-R02)
      final roads = event.selectedRoads.map((roadData) {
        return RoadInputModel(
          roadUID: roadData['roadUID'] as String,
          fromSection: roadData['fromSection'] as double?,
          toSection: roadData['toSection'] as double?,
          inputValue: roadData['inputValue'] as double?,
        );
      }).toList();

      // Build periods
      final periods = event.periods.map((p) {
        return PeriodModel(
          periodStart: p['periodStart']!,
          periodEnd: p['periodEnd']!,
        );
      }).toList();

      // Generate program name
      final programName = ProgramApiTransformer.generateProgramName(
        workScopeCode: event.workScopeCode,
        workScopeName: event.workScopeName,
        periodStart: event.periodStart,
      );

      // Build request model
      final requestModel = SubmitProgramRequestModel(
        workScopeUID: event.workScopeUID,
        roads: roads,
        periods: periods,
        contractRelationUID: event.contractRelationUID,
        name: programName,
        description: '', // Non-R02 doesn't have description
      );

      // Debug print
      print('\n═══════════════════════════════════════════════════════');
      print('📋 NON-R02 PROGRAM SUBMISSION');
      print('═══════════════════════════════════════════════════════');
      print(JsonEncoder.withIndent('  ').convert(requestModel.toJson()));
      print('═══════════════════════════════════════════════════════\n');

      // Call use case
      final result = await _submitProgramUseCase(
        SubmitProgramParams(
          companyUID: event.companyUID,
          requestModel: requestModel,
        ),
      );

      result.fold(
        (failure) {
          print('❌ Submission failed: ${failure.message}');
          emit(CreateProgramState.error(failure.message));
        },
        (program) {
          print('✅ Submission successful: ${program.uid}');
          emit(CreateProgramState.success(program));
        },
      );
    } catch (e) {
      print('❌ Unexpected error: $e');
      emit(CreateProgramState.error('Failed to submit: ${e.toString()}'));
    }
  }
}
