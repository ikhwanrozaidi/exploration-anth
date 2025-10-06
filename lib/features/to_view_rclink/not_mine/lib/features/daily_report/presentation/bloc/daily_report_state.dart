import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/daily_report_response.dart';
import '../../domain/entities/road_edit_entity.dart';

part 'daily_report_state.freezed.dart';

@freezed
class DailyReportState with _$DailyReportState {
  const factory DailyReportState.initial() = DailyReportInitial;
  const factory DailyReportState.loading() = DailyReportLoading;
  const factory DailyReportState.loaded(List<DailyReportResponse> reports) =
      DailyReportLoaded;
  const factory DailyReportState.failure(String message) = DailyReportFailure;

  // Route Edit States
  const factory DailyReportState.roadsLoading() = RoadsLoading;

  const factory DailyReportState.roadsLoaded({
    required List<RoadEdit> roads,
    RoadEdit? selectedRoad,
    String? currentSection,
    String? sectionError,
  }) = RoadsLoaded;

  const factory DailyReportState.roadsFailure(String message) = RoadsFailure;
}
