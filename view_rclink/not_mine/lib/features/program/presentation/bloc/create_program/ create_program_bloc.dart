import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../data/helper/programs_api_transformer.dart';
import '../../../data/models/submit_program_request_model.dart';
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
          fromSection: roadData['fromSection'] as double,
          toSection: roadData['toSection'] as double?,
          inputValue: roadData['inputValue'] as int?,
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
