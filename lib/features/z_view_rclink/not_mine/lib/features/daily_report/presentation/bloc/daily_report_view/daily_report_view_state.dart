import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rclink_app/features/road/domain/entities/road_entity.dart';
import '../../../domain/entities/daily_report.dart';

part 'daily_report_view_state.freezed.dart';

@freezed
class DailyReportViewState with _$DailyReportViewState {
  const factory DailyReportViewState.initial() = DailyReportViewInitial;
  const factory DailyReportViewState.loading() = DailyReportViewLoading;
  const factory DailyReportViewState.loaded({
    required List<DailyReport> reports,
    @Default(1) int currentPage,
    @Default(true) bool hasMore,
    @Default(false) bool isLoadingMore,
    String? searchQuery,
    @Default(0) int selectedTabIndex, // 0 = Submitted, 1 = Draft
  }) = DailyReportViewLoaded;
  const factory DailyReportViewState.failure(String message) =
      DailyReportViewFailure;

  // Detail Page States
  const factory DailyReportViewState.detailLoading() = DailyReportViewDetailLoading;
  const factory DailyReportViewState.detailLoaded({
    required DailyReport report,
  }) = DailyReportViewDetailLoaded;
  const factory DailyReportViewState.detailFailure(String message) =
      DailyReportViewDetailFailure;

  // Approval States
  const factory DailyReportViewState.approving({
    required DailyReport report,
  }) = DailyReportViewApproving;
  const factory DailyReportViewState.approved({
    required DailyReport report,
  }) = DailyReportViewApproved;
  const factory DailyReportViewState.approvalFailure({
    required String message,
    DailyReport? report,
  }) = DailyReportViewApprovalFailure;

  // Route Edit States
  const factory DailyReportViewState.roadsLoading() = RoadsLoading;

  const factory DailyReportViewState.roadsLoaded({
    required List<Road> roads,
    Road? selectedRoad,
    String? currentSection,
    String? sectionError,
  }) = RoadsLoaded;

  const factory DailyReportViewState.roadsFailure(String message) =
      RoadsFailure;
}
