import 'package:freezed_annotation/freezed_annotation.dart';
import 'report_creation_data.dart';

part 'report_creation_state.freezed.dart';

@freezed
class ReportCreationState with _$ReportCreationState {
  const factory ReportCreationState.initial() = ReportInitial;

  // ============================================================================
  // PAGE 1 STATES (DailyReportCreationPage)
  // ============================================================================
  const factory ReportCreationState.page1Ready({
    required ReportApiData apiData,
    required ReportSelections selections,
  }) = ReportPage1Ready;

  const factory ReportCreationState.page1Error({
    required ReportApiData apiData,
    required ReportSelections selections,
    required String errorMessage,
  }) = ReportPage1Error;

  // ============================================================================
  // PAGE 2 STATES (TipsPage -> DraftPage)
  // ============================================================================
  const factory ReportCreationState.page2Ready({
    required ReportApiData apiData,
    required ReportSelections selections,
    required ReportFormData formData,
  }) = ReportPage2Ready;

  const factory ReportCreationState.page2Error({
    required ReportApiData apiData,
    required ReportSelections selections,
    required ReportFormData formData,
    required String errorMessage,
  }) = ReportPage2Error;

  // ============================================================================
  // SUBMISSION STATES
  // ============================================================================
  const factory ReportCreationState.submitting({
    required ReportData reportData,
  }) = ReportSubmitting;

  const factory ReportCreationState.submitted({
    required ReportData reportData,
  }) = ReportSubmitted;

  const factory ReportCreationState.submissionError({
    required ReportData reportData,
    required String errorMessage,
  }) = ReportSubmissionError;

  // ============================================================================
  // DRAFT STATES
  // ============================================================================
  const factory ReportCreationState.draftSaved({
    required ReportData reportData,
  }) = ReportDraftSaved;

  const factory ReportCreationState.draftError({
    required ReportData reportData,
    required String errorMessage,
  }) = ReportDraftError;
}
