import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../road/domain/entities/road_entity.dart';
import '../../../../contractor_relation/domain/entities/contractor_relation_entity.dart';

part 'program_draft_event.freezed.dart';

@freezed
class ProgramDraftEvent with _$ProgramDraftEvent {
  // Initialize new draft
  const factory ProgramDraftEvent.initializeDraft({
    required String companyUID,
    required int workScopeID,
    required String workScopeUID,
    required String workScopeName,
    required String workScopeCode,
    Road? road,
    double? section,
  }) = InitializeDraft;

  // Load existing draft
  const factory ProgramDraftEvent.loadExistingDraft({
    required String draftUID,
  }) = LoadExistingDraft;

  // Update fields
  const factory ProgramDraftEvent.updateLocation({
    required double latitude,
    required double longitude,
  }) = UpdateLocation;

  const factory ProgramDraftEvent.updateContractor({
    ContractorRelation? contractor,
  }) = UpdateContractor;

  const factory ProgramDraftEvent.updateProgramName(String name) =
      UpdateProgramName;

  const factory ProgramDraftEvent.updateDescription({
    required String description,
  }) = UpdateDescription;

  // UPDATED: Use DateTime instead of List<ProgramPeriod>
  const factory ProgramDraftEvent.updatePeriods({
    required DateTime periodStart,
    required DateTime periodEnd,
  }) = UpdatePeriods;

  const factory ProgramDraftEvent.updateQuantityFieldData({
    required Map<String, Map<String, dynamic>> quantityFieldData,
  }) = UpdateQuantityFieldData;

  const factory ProgramDraftEvent.updateProgramImages({
    required List<String> programImages,
  }) = UpdateProgramImages;

  // Auto-save
  const factory ProgramDraftEvent.autoSaveDraft() = AutoSaveDraft;

  // Delete draft
  const factory ProgramDraftEvent.deleteDraft({required String draftUID}) =
      DeleteDraft;

  // Reset form
  const factory ProgramDraftEvent.resetForm() = ResetForm;

  // Submit program
  const factory ProgramDraftEvent.submitProgram({required String companyUID}) =
      SubmitProgram;

  // Initialize new draft for non-R02 (multi-road)
  const factory ProgramDraftEvent.initializeDraftMultiRoad({
    required String companyUID,
    required int workScopeID,
    required String workScopeUID,
    required String workScopeName,
    required String workScopeCode,
    required List<Road> roads,
    required ContractorRelation contractor,
  }) = InitializeDraftMultiRoad;

  // Update road input data (for non-R02 programs)
  const factory ProgramDraftEvent.updateRoadInputData({
    required Map<String, Map<String, dynamic>> roadInputData,
  }) = UpdateRoadInputData;
}
