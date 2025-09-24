import 'package:equatable/equatable.dart';

abstract class ReportCreationEvent extends Equatable {
  const ReportCreationEvent();

  @override
  List<Object?> get props => [];
}

// ============================================================================
// INITIAL LOAD EVENTS
// ============================================================================

/// Load work scopes from API
class LoadWorkScopesRequested extends ReportCreationEvent {
  final bool forceRefresh;

  const LoadWorkScopesRequested({this.forceRefresh = false});

  @override
  List<Object?> get props => [forceRefresh];
}

/// Load states/provinces from API
class LoadStatesRequested extends ReportCreationEvent {
  final bool forceRefresh;

  const LoadStatesRequested({this.forceRefresh = false});

  @override
  List<Object?> get props => [forceRefresh];
}

/// Load districts based on selected state
class LoadDistrictsRequested extends ReportCreationEvent {
  final String
  stateUid; // Keep for identification but use state ID from bloc state
  final bool forceRefresh;

  const LoadDistrictsRequested({
    required this.stateUid,
    this.forceRefresh = false,
  });

  @override
  List<Object?> get props => [stateUid, forceRefresh];
}

/// Load roads based on selected district
class LoadRoadsRequested extends ReportCreationEvent {
  final String
  districtUid; // Keep for identification but use district ID from bloc state
  final bool forceRefresh;

  const LoadRoadsRequested({
    required this.districtUid,
    this.forceRefresh = false,
  });

  @override
  List<Object?> get props => [districtUid, forceRefresh];
}

// ============================================================================
// SELECTION EVENTS
// ============================================================================

/// User selects a scope of work
class ScopeOfWorkSelected extends ReportCreationEvent {
  final String scopeUid;

  const ScopeOfWorkSelected(this.scopeUid);

  @override
  List<Object?> get props => [scopeUid];
}

/// User selects weather condition
class WeatherSelected extends ReportCreationEvent {
  final String weather;

  const WeatherSelected(this.weather);

  @override
  List<Object?> get props => [weather];
}

/// User selects state
class StateSelected extends ReportCreationEvent {
  final String stateUid;

  const StateSelected(this.stateUid);

  @override
  List<Object?> get props => [stateUid];
}

/// User selects district
class DistrictSelected extends ReportCreationEvent {
  final String districtUid;

  const DistrictSelected(this.districtUid);

  @override
  List<Object?> get props => [districtUid];
}

/// User selects road
class RoadSelected extends ReportCreationEvent {
  final String roadUid;

  const RoadSelected(this.roadUid);

  @override
  List<Object?> get props => [roadUid];
}

/// User enters section
class SectionUpdated extends ReportCreationEvent {
  final String section;

  const SectionUpdated(this.section);

  @override
  List<Object?> get props => [section];
}

// ============================================================================
// QUANTITY SELECTION EVENTS
// ============================================================================

/// User selects/deselects quantity types
class QuantityTypesSelected extends ReportCreationEvent {
  final List<String> quantityTypeUids;

  const QuantityTypesSelected(this.quantityTypeUids);

  @override
  List<Object?> get props => [quantityTypeUids];
}

/// User toggles a single quantity type
class QuantityTypeToggled extends ReportCreationEvent {
  final String quantityTypeUid;

  const QuantityTypeToggled(this.quantityTypeUid);

  @override
  List<Object?> get props => [quantityTypeUid];
}

// ============================================================================
// FIELD INPUT EVENTS
// ============================================================================

/// User updates a field value
class FieldValueUpdated extends ReportCreationEvent {
  final String fieldKey; // Can be field code or "quantityTypeUid_fieldCode"
  final dynamic value;

  const FieldValueUpdated({required this.fieldKey, required this.value});

  @override
  List<Object?> get props => [fieldKey, value];
}

/// User adds images to an image field
class ImagesAdded extends ReportCreationEvent {
  final String fieldKey;
  final List<String> imagePaths;

  const ImagesAdded({required this.fieldKey, required this.imagePaths});

  @override
  List<Object?> get props => [fieldKey, imagePaths];
}

/// User removes an image from an image field
class ImageRemoved extends ReportCreationEvent {
  final String fieldKey;
  final String imagePath;

  const ImageRemoved({required this.fieldKey, required this.imagePath});

  @override
  List<Object?> get props => [fieldKey, imagePath];
}

// ============================================================================
// EQUIPMENT SELECTION EVENTS
// ============================================================================

/// User selects equipment
class EquipmentSelected extends ReportCreationEvent {
  final List<String> equipmentUids;

  const EquipmentSelected(this.equipmentUids);

  @override
  List<Object?> get props => [equipmentUids];
}

/// User toggles a single equipment
class EquipmentToggled extends ReportCreationEvent {
  final String equipmentUid;

  const EquipmentToggled(this.equipmentUid);

  @override
  List<Object?> get props => [equipmentUid];
}

// ============================================================================
// VALIDATION EVENTS
// ============================================================================

/// Validate current form state
class ValidateFormRequested extends ReportCreationEvent {
  const ValidateFormRequested();
}

/// Clear field error
class FieldErrorCleared extends ReportCreationEvent {
  final String fieldKey;

  const FieldErrorCleared(this.fieldKey);

  @override
  List<Object?> get props => [fieldKey];
}

// ============================================================================
// SUBMISSION EVENTS
// ============================================================================

/// Submit the daily report
class SubmitReportRequested extends ReportCreationEvent {
  const SubmitReportRequested();
}

/// Save as draft
class SaveAsDraftRequested extends ReportCreationEvent {
  const SaveAsDraftRequested();
}

// ============================================================================
// CLEAR/RESET EVENTS
// ============================================================================

/// Clear all cache
class ClearCacheRequested extends ReportCreationEvent {
  const ClearCacheRequested();
}

/// Reset form to initial state
class ResetFormRequested extends ReportCreationEvent {
  const ResetFormRequested();
}

/// Clear all selections and start over
class StartOverRequested extends ReportCreationEvent {
  const StartOverRequested();
}
