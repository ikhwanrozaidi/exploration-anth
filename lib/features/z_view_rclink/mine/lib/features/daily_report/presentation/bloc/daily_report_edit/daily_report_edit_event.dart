import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rclink_app/features/work_scope/domain/entities/work_equipment.dart';
import 'package:rclink_app/features/work_scope/domain/entities/work_quantity_type.dart';
import 'package:rclink_app/features/work_scope/domain/entities/work_scope.dart';
import 'package:rclink_app/features/road/domain/entities/road_entity.dart';
import 'package:rclink_app/features/daily_report/domain/entities/daily_report.dart';

part 'daily_report_edit_event.freezed.dart';

@freezed
class DailyReportEditEvent with _$DailyReportEditEvent {
  /// Load existing report data for editing
  const factory DailyReportEditEvent.loadExistingReport({
    required DailyReport report,
    required String companyUID,
  }) = LoadExistingReportEdit;

  /// Load quantities and equipments for selected work scope
  const factory DailyReportEditEvent.loadQuantitiesAndEquipments({
    required String companyUID,
    required String workScopeUID,
    @Default(false) bool forceRefresh,
  }) = LoadQuantitiesAndEquipmentsEdit;

  /// Update work scope selection
  const factory DailyReportEditEvent.updateWorkScope({
    required WorkScope scope,
  }) = UpdateWorkScopeEdit;

  /// Update road selection
  const factory DailyReportEditEvent.updateRoad({
    required Road road,
  }) = UpdateRoadEdit;

  /// Update weather condition
  const factory DailyReportEditEvent.updateWeather({
    required String weather,
  }) = UpdateWeatherEdit;

  /// Update worker count
  const factory DailyReportEditEvent.updateWorkers({
    required int count,
  }) = UpdateWorkersEdit;

  /// Update notes/remarks
  const factory DailyReportEditEvent.updateNotes({
    required String notes,
  }) = UpdateNotesEdit;

  /// Update section (from-to)
  const factory DailyReportEditEvent.updateSection({
    required String section,
  }) = UpdateSectionEdit;

  /// Add a quantity type to the report
  const factory DailyReportEditEvent.addQuantity({
    required WorkQuantityType quantityType,
  }) = AddQuantityEdit;

  /// Remove a quantity from the report by composite key
  const factory DailyReportEditEvent.removeQuantity({
    required String compositeKey,
  }) = RemoveQuantityEdit;

  /// Update a quantity field value
  const factory DailyReportEditEvent.updateQuantityFieldValue({
    required String compositeKey,
    required String fieldKey,
    required dynamic value,
  }) = UpdateQuantityFieldValueEdit;

  /// Toggle equipment selection
  const factory DailyReportEditEvent.toggleEquipment({
    required WorkEquipment equipment,
  }) = ToggleEquipmentEdit;

  /// Update condition snapshot images
  const factory DailyReportEditEvent.updateConditionSnapshot({
    required String type, // 'before', 'current', 'after'
    required List<Map<String, dynamic>> snapshots,
  }) = UpdateConditionSnapshotEdit;

  /// Update worker image
  const factory DailyReportEditEvent.updateWorkerImage({
    Map<String, dynamic>? image,
  }) = UpdateWorkerImageEdit;

  /// Submit the updated report
  const factory DailyReportEditEvent.submitUpdate() = SubmitUpdateEdit;

  /// Cancel editing and revert changes
  const factory DailyReportEditEvent.cancelEdit() = CancelEdit;
}
