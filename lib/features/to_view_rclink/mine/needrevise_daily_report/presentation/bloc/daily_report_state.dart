import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../daily_report_creation/domain/entities/scope_of_work/work_equipment.dart';
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

  // Equipment Edit States
  const factory DailyReportState.equipmentsLoading() = EquipmentsLoading;

  const factory DailyReportState.equipmentsLoaded({
    required List<WorkEquipment> equipments,
    required List<String> selectedEquipmentUids,
  }) = EquipmentsLoaded;

  const factory DailyReportState.equipmentsFailure(String message) =
      EquipmentsFailure;

  const factory DailyReportState.updating() = DailyReportUpdating;
  const factory DailyReportState.updateSuccess(DailyReportResponse report) =
      DailyReportUpdateSuccess;
  const factory DailyReportState.updateFailure(String message) =
      DailyReportUpdateFailure;
}
