import 'package:freezed_annotation/freezed_annotation.dart';

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
}
