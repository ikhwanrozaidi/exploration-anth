import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/program_entity.dart';

part 'create_program_state.freezed.dart';

@freezed
class CreateProgramState with _$CreateProgramState {
  const factory CreateProgramState.initial() = CreateProgramInitial;

  const factory CreateProgramState.submitting() = CreateProgramSubmitting;

  const factory CreateProgramState.success(Program program) =
      CreateProgramSuccess;

  const factory CreateProgramState.error(String message) = CreateProgramError;
}
