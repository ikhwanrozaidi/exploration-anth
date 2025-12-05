import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../../core/errors/failures.dart';
import '../../../../contractor_relation/domain/entities/contractor_relation_entity.dart';
import '../../../../road/domain/entities/road_entity.dart';
import '../../../domain/entities/warning.dart';

part 'site_warning_draft_state.freezed.dart';

@freezed
abstract class SiteWarningDraftState with _$SiteWarningDraftState {
  const factory SiteWarningDraftState.initial() = SiteWarningDraftInitial;

  const factory SiteWarningDraftState.loading() = SiteWarningDraftLoading;

  const factory SiteWarningDraftState.editing({
    required SiteWarningDraftData draftData,
  }) = SiteWarningDraftEditing;

  const factory SiteWarningDraftState.autoSaving({
    required SiteWarningDraftData draftData,
  }) = SiteWarningDraftAutoSaving;

  const factory SiteWarningDraftState.autoSaved({
    required SiteWarningDraftData draftData,
  }) = SiteWarningDraftAutoSaved;

  const factory SiteWarningDraftState.submitting({
    required SiteWarningDraftData draftData,
  }) = SiteWarningDraftSubmitting;

  const factory SiteWarningDraftState.submitted({
    required SiteWarningDraftData draftData,
  }) = SiteWarningDraftSubmitted;

  const factory SiteWarningDraftState.error({
    required Failure failure,
    SiteWarningDraftData? draftData,
  }) = SiteWarningDraftError;

  const factory SiteWarningDraftState.draftListLoaded({
    required List<Warning> drafts,
  }) = SiteWarningDraftListLoaded;
}

// Data class to hold all warning draft fields
@freezed
abstract class SiteWarningDraftData with _$SiteWarningDraftData {
  const factory SiteWarningDraftData({
    // Draft metadata
    String? draftUID,
    @Default(false) bool isDraftMode,

    // Required fields from initialization
    required String companyUID,
    required int scopeID,
    required String scopeUID,
    required String scopeName,
    required Road road,
    required String startSection,
    String? endSection,

    // Optional fields
    double? latitude,
    double? longitude,
    ContractorRelation? contractor,
    @Default([]) List<String> warningReasonUIDs,
    @Default('') String description,
  }) = _SiteWarningDraftData;
}
