import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rclink_app/features/road/domain/entities/road_entity.dart';
import '../../../domain/entities/daily_report.dart';

part 'daily_report_view_state.freezed.dart';

@freezed
class DailyReportViewState with _$DailyReportViewState {
  const factory DailyReportViewState.initial() = DailyReportViewInitial;
  const factory DailyReportViewState.loading() = DailyReportViewLoading;
  const factory DailyReportViewState.loaded(List<DailyReport> reports) =
      DailyReportViewLoaded;
  const factory DailyReportViewState.failure(String message) =
      DailyReportViewFailure;

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
