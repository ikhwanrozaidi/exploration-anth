import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rclink_app/features/road/domain/entities/road_entity.dart';

part 'daily_report_view_event.freezed.dart';

@freezed
class DailyReportViewEvent with _$DailyReportViewEvent {
  const factory DailyReportViewEvent.loadDailyReports({
    required String companyUID,
    @Default(1) int page,
    @Default(10) int limit,
    @Default('asc') String sortOrder,
    @Default(false) bool forceRefresh,
    String? search,
    String? roadUid,
    String? workScopeUid,
    String? contractorUid,
    String? fromDate,
    String? toDate,
  }) = LoadDailyReports;

  const factory DailyReportViewEvent.loadMoreDailyReports({
    required String companyUID,
    required int page,
    @Default(10) int limit,
    @Default('asc') String sortOrder,
    String? search,
  }) = LoadMoreDailyReports;

  const factory DailyReportViewEvent.loadDailyReportById({
    required String companyUID,
    required String dailyReportUID,
    @Default(false) bool forceRefresh,
  }) = LoadDailyReportById;

  const factory DailyReportViewEvent.changeTab({
    required int tabIndex,
    required String companyUID,
  }) = ChangeTab;

  const factory DailyReportViewEvent.loadDraftReports({
    required String companyUID,
  }) = LoadDraftReports;

  const factory DailyReportViewEvent.clearCache() = ClearDailyReportCache;

  const factory DailyReportViewEvent.approveDailyReport({
    required String companyUID,
    required String dailyReportUID,
    required String reviewComment,
  }) = ApproveDailyReport;

  // Route Edit Events
  const factory DailyReportViewEvent.loadRoadsForEdit({
    required String districtName,
    @Default(false) bool forceRefresh,
  }) = LoadRoadsForEdit;

  const factory DailyReportViewEvent.selectRoadForEdit({
    required Road selectedRoad,
  }) = SelectRoadForEdit;

  const factory DailyReportViewEvent.updateSectionForEdit({
    required String section,
  }) = UpdateSectionForEdit;

  const factory DailyReportViewEvent.clearRoadEditData() = ClearRoadEditData;
}
