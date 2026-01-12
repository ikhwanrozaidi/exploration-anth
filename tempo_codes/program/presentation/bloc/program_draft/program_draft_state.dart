import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../../core/errors/failures.dart';
import '../../../domain/entities/program_draft_data_entity.dart';

part 'program_draft_state.freezed.dart';

@freezed
class ProgramDraftState with _$ProgramDraftState {
  const factory ProgramDraftState.initial() = ProgramDraftInitial;
  const factory ProgramDraftState.loading() = ProgramDraftLoading;
  const factory ProgramDraftState.editing({
    required ProgramDraftData draftData,
  }) = ProgramDraftEditing;
  const factory ProgramDraftState.autoSaving({
    required ProgramDraftData draftData,
  }) = ProgramDraftAutoSaving;
  const factory ProgramDraftState.autoSaved({
    required ProgramDraftData draftData,
  }) = ProgramDraftAutoSaved;
  const factory ProgramDraftState.submitting({
    required ProgramDraftData draftData,
  }) = ProgramDraftSubmitting;
  const factory ProgramDraftState.submitted({
    required ProgramDraftData draftData,
  }) = ProgramDraftSubmitted;
  const factory ProgramDraftState.error({
    required Failure failure,
    ProgramDraftData? draftData,
  }) = ProgramDraftError;
}
