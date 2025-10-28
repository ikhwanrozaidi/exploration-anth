import 'package:freezed_annotation/freezed_annotation.dart';

part 'daily_report_create_event.freezed.dart';

@freezed
class DailyReportCreateEvent with _$DailyReportCreateEvent {
  // Page 1 Load
  const factory DailyReportCreateEvent.loadWorkScopes({
    @Default(false) bool forceRefresh,
  }) = LoadWorkScopes;

  const factory DailyReportCreateEvent.loadStates({
    @Default(false) bool forceRefresh,
  }) = LoadStates;

  const factory DailyReportCreateEvent.loadDistricts({
    required String stateUid,
    @Default(false) bool forceRefresh,
  }) = LoadDistricts;

  const factory DailyReportCreateEvent.loadRoads({
    required String districtUid,
    @Default(false) bool forceRefresh,
  }) = LoadRoads;

  // onSelect Page 1
  const factory DailyReportCreateEvent.selectScope(String scopeUid) = SelectScope;
  const factory DailyReportCreateEvent.selectWeather(String weather) =
      SelectWeather;
  const factory DailyReportCreateEvent.selectState(String stateUid) = SelectState;
  const factory DailyReportCreateEvent.selectDistrict(String districtUid) =
      SelectDistrict;
  const factory DailyReportCreateEvent.selectRoad(String roadUid) = SelectRoad;
  const factory DailyReportCreateEvent.updateSection(String section) =
      UpdateSection;

  // Page 2 Loads
  const factory DailyReportCreateEvent.loadQuantities({
    required String companyUID,
    required String workScopeUID,
    @Default(false) bool forceRefresh,
  }) = LoadQuantities;

  const factory DailyReportCreateEvent.loadEquipments({
    required String companyUID,
    required String workScopeUID,
    @Default(false) bool forceRefresh,
  }) = LoadEquipments;

  const factory DailyReportCreateEvent.loadQuantitiesAndEquipments({
    required String companyUID,
    required String workScopeUID,
    @Default(false) bool forceRefresh,
  }) = LoadQuantitiesAndEquipments;

  // onSelect Page 2
  const factory DailyReportCreateEvent.selectQuantityTypes(
    List<String> quantityTypeUids,
  ) = SelectQuantityTypes;

  const factory DailyReportCreateEvent.toggleQuantityType(String quantityTypeUid) =
      ToggleQuantityType;

  const factory DailyReportCreateEvent.selectEquipment(
    List<String> equipmentUids,
  ) = SelectEquipment;

  const factory DailyReportCreateEvent.toggleEquipment(String equipmentUid) =
      ToggleEquipment;

  const factory DailyReportCreateEvent.updateConditionSnapshots(
    Map<String, List<Map<String, dynamic>>> snapshots,
  ) = UpdateConditionSnapshots;

  const factory DailyReportCreateEvent.updateWorkerImages(
    List<Map<String, dynamic>> images,
  ) = UpdateWorkerImages;

  // Basics Clear

  const factory DailyReportCreateEvent.clearCache() = ClearCache;
  const factory DailyReportCreateEvent.resetForm() = ResetForm;
  const factory DailyReportCreateEvent.startOver() = StartOver;

  ////--------------------------------------------------------- I don't know?
  const factory DailyReportCreateEvent.updateFieldValue({
    required String fieldKey,
    required dynamic value,
  }) = UpdateFieldValue;

  // Validation & Submission
  const factory DailyReportCreateEvent.validateForm() = ValidateForm;
  const factory DailyReportCreateEvent.clearFieldError(String fieldKey) =
      ClearFieldError;
  const factory DailyReportCreateEvent.submitReport({
    required String companyUID,
  }) = SubmitReport;
  const factory DailyReportCreateEvent.saveAsDraft() = SaveAsDraft;

  const factory DailyReportCreateEvent.clearAllCache() = ClearAllCache;
}
