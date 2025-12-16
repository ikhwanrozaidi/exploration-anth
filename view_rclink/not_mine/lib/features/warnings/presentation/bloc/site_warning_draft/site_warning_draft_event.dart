import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../contractor_relation/domain/entities/contractor_relation_entity.dart';
import '../../../../road/domain/entities/road_entity.dart';

part 'site_warning_draft_event.freezed.dart';

@freezed
abstract class SiteWarningDraftEvent with _$SiteWarningDraftEvent {
  const factory SiteWarningDraftEvent.initializeDraft({
    required String companyUID,
    required int scopeID,
    required String scopeUID,
    required String scopeName,
    required Road road,
    required String startSection,
    String? endSection,
  }) = InitializeDraft;

  const factory SiteWarningDraftEvent.updateLocation({
    required double latitude,
    required double longitude,
  }) = UpdateLocation;

  const factory SiteWarningDraftEvent.updateContractor({
    required ContractorRelation contractor,
  }) = UpdateContractor;

  const factory SiteWarningDraftEvent.updateWarningReasons({
    required List<String> warningReasonUIDs,
  }) = UpdateWarningReasons;

  const factory SiteWarningDraftEvent.updateDescription({
    required String description,
  }) = UpdateDescription;

  const factory SiteWarningDraftEvent.updateWarningImages({
    required List<String> warningImages,
  }) = UpdateWarningImages;

  // Auto-save
  const factory SiteWarningDraftEvent.autoSaveDraft() = AutoSaveDraft;

  // Draft management
  const factory SiteWarningDraftEvent.loadExistingDraft({
    required String draftUID,
  }) = LoadExistingDraft;

  const factory SiteWarningDraftEvent.deleteDraft({required String draftUID}) =
      DeleteDraft;

  // Submission
  const factory SiteWarningDraftEvent.submitWarning({
    required String companyUID,
  }) = SubmitWarning;

  const factory SiteWarningDraftEvent.loadDraftList({
    required String companyUID,
  }) = LoadDraftList;
}
