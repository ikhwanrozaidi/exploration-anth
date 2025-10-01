import 'package:freezed_annotation/freezed_annotation.dart';

part 'report_creation_event.freezed.dart';

@freezed
class ReportCreationEvent with _$ReportCreationEvent {
  // Page 1 Load
  const factory ReportCreationEvent.loadWorkScopes({
    @Default(false) bool forceRefresh,
  }) = LoadWorkScopes;

  const factory ReportCreationEvent.loadStates({
    @Default(false) bool forceRefresh,
  }) = LoadStates;

  const factory ReportCreationEvent.loadDistricts({
    required String stateUid,
    @Default(false) bool forceRefresh,
  }) = LoadDistricts;

  const factory ReportCreationEvent.loadRoads({
    required String districtUid,
    @Default(false) bool forceRefresh,
  }) = LoadRoads;

  // onSelect Page 1
  const factory ReportCreationEvent.selectScope(String scopeUid) = SelectScope;
  const factory ReportCreationEvent.selectWeather(String weather) =
      SelectWeather;
  const factory ReportCreationEvent.selectState(String stateUid) = SelectState;
  const factory ReportCreationEvent.selectDistrict(String districtUid) =
      SelectDistrict;
  const factory ReportCreationEvent.selectRoad(String roadUid) = SelectRoad;
  const factory ReportCreationEvent.updateSection(String section) =
      UpdateSection;

  // Page 2 Loads
  const factory ReportCreationEvent.loadQuantities({
    required String companyUID,
    required String workScopeUID,
    @Default(false) bool forceRefresh,
  }) = LoadQuantities;

  const factory ReportCreationEvent.loadEquipments({
    required String companyUID,
    required String workScopeUID,
    @Default(false) bool forceRefresh,
  }) = LoadEquipments;

  const factory ReportCreationEvent.loadQuantitiesAndEquipments({
    required String companyUID,
    required String workScopeUID,
    @Default(false) bool forceRefresh,
  }) = LoadQuantitiesAndEquipments;

  // onSelect Page 2
  const factory ReportCreationEvent.selectQuantityTypes(
    List<String> quantityTypeUids,
  ) = SelectQuantityTypes;

  const factory ReportCreationEvent.toggleQuantityType(String quantityTypeUid) =
      ToggleQuantityType;

  const factory ReportCreationEvent.selectEquipment(
    List<String> equipmentUids,
  ) = SelectEquipment;

  const factory ReportCreationEvent.toggleEquipment(String equipmentUid) =
      ToggleEquipment;

  const factory ReportCreationEvent.updateConditionSnapshots(
    Map<String, List<Map<String, dynamic>>> snapshots,
  ) = UpdateConditionSnapshots;

  const factory ReportCreationEvent.updateWorkerImages(
    List<Map<String, dynamic>> images,
  ) = UpdateWorkerImages;

  // Basics Clear

  const factory ReportCreationEvent.clearCache() = ClearCache;
  const factory ReportCreationEvent.resetForm() = ResetForm;
  const factory ReportCreationEvent.startOver() = StartOver;

  ////--------------------------------------------------------- I don't know?
  const factory ReportCreationEvent.updateFieldValue({
    required String fieldKey,
    required dynamic value,
  }) = UpdateFieldValue;

  const factory ReportCreationEvent.addImages({
    required String fieldKey,
    required List<String> imagePaths,
  }) = AddImages;

  const factory ReportCreationEvent.removeImage({
    required String fieldKey,
    required String imagePath,
  }) = RemoveImage;

  // Validation & Submission
  const factory ReportCreationEvent.validateForm() = ValidateForm;
  const factory ReportCreationEvent.clearFieldError(String fieldKey) =
      ClearFieldError;
  const factory ReportCreationEvent.submitReport() = SubmitReport;
  const factory ReportCreationEvent.saveAsDraft() = SaveAsDraft;

  const factory ReportCreationEvent.clearAllCache() = ClearAllCache;
}
