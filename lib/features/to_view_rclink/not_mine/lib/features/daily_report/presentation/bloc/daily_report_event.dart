import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/road_edit_entity.dart';

part 'daily_report_event.freezed.dart';

@freezed
class DailyReportEvent with _$DailyReportEvent {
  const factory DailyReportEvent.loadDailyReports({
    required String companyUID,
    @Default(1) int page,
    @Default(10) int limit,
    @Default('asc') String sortOrder,
    @Default(false) bool forceRefresh,
  }) = LoadDailyReports;

  const factory DailyReportEvent.clearCache() = ClearDailyReportCache;

  // Route Edit Events
  const factory DailyReportEvent.loadRoadsForEdit({
    required String districtName,
    @Default(false) bool forceRefresh,
  }) = LoadRoadsForEdit;

  const factory DailyReportEvent.selectRoadForEdit({
    required RoadEdit selectedRoad,
  }) = SelectRoadForEdit;

  const factory DailyReportEvent.updateSectionForEdit({
    required String section,
  }) = UpdateSectionForEdit;

  const factory DailyReportEvent.clearRoadEditData() = ClearRoadEditData;
}
