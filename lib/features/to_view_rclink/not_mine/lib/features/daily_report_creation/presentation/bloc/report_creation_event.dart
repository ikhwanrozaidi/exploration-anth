import 'package:freezed_annotation/freezed_annotation.dart';

part 'report_creation_event.freezed.dart';

@freezed
class ReportCreationEvent with _$ReportCreationEvent {
  // INITIAL LOAD EVENTS
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

  const factory ReportCreationEvent.loadQuantitiesAndEquipment({
    required String companyUID,
    required String workScopeUID,
    @Default(false) bool forceRefresh,
  }) = LoadQuantitiesAndEquipment;

  // SELECTION EVENTS
  const factory ReportCreationEvent.selectScope(String scopeUid) = SelectScope;
  const factory ReportCreationEvent.selectWeather(String weather) =
      SelectWeather;
  const factory ReportCreationEvent.selectState(String stateUid) = SelectState;
  const factory ReportCreationEvent.selectDistrict(String districtUid) =
      SelectDistrict;
  const factory ReportCreationEvent.selectRoad(String roadUid) = SelectRoad;
  const factory ReportCreationEvent.updateSection(String section) =
      UpdateSection;

  // QUANTITY & EQUIPMENT SELECTION EVENTS
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

  // FORM DATA EVENTS
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

  // VALIDATION & SUBMISSION EVENTS
  const factory ReportCreationEvent.validateForm() = ValidateForm;
  const factory ReportCreationEvent.clearFieldError(String fieldKey) =
      ClearFieldError;
  const factory ReportCreationEvent.submitReport() = SubmitReport;
  const factory ReportCreationEvent.saveAsDraft() = SaveAsDraft;

  // UTILITY EVENTS
  const factory ReportCreationEvent.clearCache() = ClearCache;
  const factory ReportCreationEvent.resetForm() = ResetForm;
  const factory ReportCreationEvent.startOver() = StartOver;
}
