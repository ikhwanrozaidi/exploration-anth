// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'daily_report_edit_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DailyReportEditEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DailyReportEditEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DailyReportEditEvent()';
}


}

/// @nodoc
class $DailyReportEditEventCopyWith<$Res>  {
$DailyReportEditEventCopyWith(DailyReportEditEvent _, $Res Function(DailyReportEditEvent) __);
}


/// Adds pattern-matching-related methods to [DailyReportEditEvent].
extension DailyReportEditEventPatterns on DailyReportEditEvent {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoadExistingReportEdit value)?  loadExistingReport,TResult Function( LoadQuantitiesAndEquipmentsEdit value)?  loadQuantitiesAndEquipments,TResult Function( UpdateWorkScopeEdit value)?  updateWorkScope,TResult Function( UpdateRoadEdit value)?  updateRoad,TResult Function( UpdateWeatherEdit value)?  updateWeather,TResult Function( UpdateWorkersEdit value)?  updateWorkers,TResult Function( UpdateNotesEdit value)?  updateNotes,TResult Function( UpdateSectionEdit value)?  updateSection,TResult Function( AddQuantityEdit value)?  addQuantity,TResult Function( RemoveQuantityEdit value)?  removeQuantity,TResult Function( UpdateQuantityFieldValueEdit value)?  updateQuantityFieldValue,TResult Function( ToggleEquipmentEdit value)?  toggleEquipment,TResult Function( UpdateConditionSnapshotEdit value)?  updateConditionSnapshot,TResult Function( UpdateWorkerImageEdit value)?  updateWorkerImage,TResult Function( SubmitUpdateEdit value)?  submitUpdate,TResult Function( CancelEdit value)?  cancelEdit,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoadExistingReportEdit() when loadExistingReport != null:
return loadExistingReport(_that);case LoadQuantitiesAndEquipmentsEdit() when loadQuantitiesAndEquipments != null:
return loadQuantitiesAndEquipments(_that);case UpdateWorkScopeEdit() when updateWorkScope != null:
return updateWorkScope(_that);case UpdateRoadEdit() when updateRoad != null:
return updateRoad(_that);case UpdateWeatherEdit() when updateWeather != null:
return updateWeather(_that);case UpdateWorkersEdit() when updateWorkers != null:
return updateWorkers(_that);case UpdateNotesEdit() when updateNotes != null:
return updateNotes(_that);case UpdateSectionEdit() when updateSection != null:
return updateSection(_that);case AddQuantityEdit() when addQuantity != null:
return addQuantity(_that);case RemoveQuantityEdit() when removeQuantity != null:
return removeQuantity(_that);case UpdateQuantityFieldValueEdit() when updateQuantityFieldValue != null:
return updateQuantityFieldValue(_that);case ToggleEquipmentEdit() when toggleEquipment != null:
return toggleEquipment(_that);case UpdateConditionSnapshotEdit() when updateConditionSnapshot != null:
return updateConditionSnapshot(_that);case UpdateWorkerImageEdit() when updateWorkerImage != null:
return updateWorkerImage(_that);case SubmitUpdateEdit() when submitUpdate != null:
return submitUpdate(_that);case CancelEdit() when cancelEdit != null:
return cancelEdit(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoadExistingReportEdit value)  loadExistingReport,required TResult Function( LoadQuantitiesAndEquipmentsEdit value)  loadQuantitiesAndEquipments,required TResult Function( UpdateWorkScopeEdit value)  updateWorkScope,required TResult Function( UpdateRoadEdit value)  updateRoad,required TResult Function( UpdateWeatherEdit value)  updateWeather,required TResult Function( UpdateWorkersEdit value)  updateWorkers,required TResult Function( UpdateNotesEdit value)  updateNotes,required TResult Function( UpdateSectionEdit value)  updateSection,required TResult Function( AddQuantityEdit value)  addQuantity,required TResult Function( RemoveQuantityEdit value)  removeQuantity,required TResult Function( UpdateQuantityFieldValueEdit value)  updateQuantityFieldValue,required TResult Function( ToggleEquipmentEdit value)  toggleEquipment,required TResult Function( UpdateConditionSnapshotEdit value)  updateConditionSnapshot,required TResult Function( UpdateWorkerImageEdit value)  updateWorkerImage,required TResult Function( SubmitUpdateEdit value)  submitUpdate,required TResult Function( CancelEdit value)  cancelEdit,}){
final _that = this;
switch (_that) {
case LoadExistingReportEdit():
return loadExistingReport(_that);case LoadQuantitiesAndEquipmentsEdit():
return loadQuantitiesAndEquipments(_that);case UpdateWorkScopeEdit():
return updateWorkScope(_that);case UpdateRoadEdit():
return updateRoad(_that);case UpdateWeatherEdit():
return updateWeather(_that);case UpdateWorkersEdit():
return updateWorkers(_that);case UpdateNotesEdit():
return updateNotes(_that);case UpdateSectionEdit():
return updateSection(_that);case AddQuantityEdit():
return addQuantity(_that);case RemoveQuantityEdit():
return removeQuantity(_that);case UpdateQuantityFieldValueEdit():
return updateQuantityFieldValue(_that);case ToggleEquipmentEdit():
return toggleEquipment(_that);case UpdateConditionSnapshotEdit():
return updateConditionSnapshot(_that);case UpdateWorkerImageEdit():
return updateWorkerImage(_that);case SubmitUpdateEdit():
return submitUpdate(_that);case CancelEdit():
return cancelEdit(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoadExistingReportEdit value)?  loadExistingReport,TResult? Function( LoadQuantitiesAndEquipmentsEdit value)?  loadQuantitiesAndEquipments,TResult? Function( UpdateWorkScopeEdit value)?  updateWorkScope,TResult? Function( UpdateRoadEdit value)?  updateRoad,TResult? Function( UpdateWeatherEdit value)?  updateWeather,TResult? Function( UpdateWorkersEdit value)?  updateWorkers,TResult? Function( UpdateNotesEdit value)?  updateNotes,TResult? Function( UpdateSectionEdit value)?  updateSection,TResult? Function( AddQuantityEdit value)?  addQuantity,TResult? Function( RemoveQuantityEdit value)?  removeQuantity,TResult? Function( UpdateQuantityFieldValueEdit value)?  updateQuantityFieldValue,TResult? Function( ToggleEquipmentEdit value)?  toggleEquipment,TResult? Function( UpdateConditionSnapshotEdit value)?  updateConditionSnapshot,TResult? Function( UpdateWorkerImageEdit value)?  updateWorkerImage,TResult? Function( SubmitUpdateEdit value)?  submitUpdate,TResult? Function( CancelEdit value)?  cancelEdit,}){
final _that = this;
switch (_that) {
case LoadExistingReportEdit() when loadExistingReport != null:
return loadExistingReport(_that);case LoadQuantitiesAndEquipmentsEdit() when loadQuantitiesAndEquipments != null:
return loadQuantitiesAndEquipments(_that);case UpdateWorkScopeEdit() when updateWorkScope != null:
return updateWorkScope(_that);case UpdateRoadEdit() when updateRoad != null:
return updateRoad(_that);case UpdateWeatherEdit() when updateWeather != null:
return updateWeather(_that);case UpdateWorkersEdit() when updateWorkers != null:
return updateWorkers(_that);case UpdateNotesEdit() when updateNotes != null:
return updateNotes(_that);case UpdateSectionEdit() when updateSection != null:
return updateSection(_that);case AddQuantityEdit() when addQuantity != null:
return addQuantity(_that);case RemoveQuantityEdit() when removeQuantity != null:
return removeQuantity(_that);case UpdateQuantityFieldValueEdit() when updateQuantityFieldValue != null:
return updateQuantityFieldValue(_that);case ToggleEquipmentEdit() when toggleEquipment != null:
return toggleEquipment(_that);case UpdateConditionSnapshotEdit() when updateConditionSnapshot != null:
return updateConditionSnapshot(_that);case UpdateWorkerImageEdit() when updateWorkerImage != null:
return updateWorkerImage(_that);case SubmitUpdateEdit() when submitUpdate != null:
return submitUpdate(_that);case CancelEdit() when cancelEdit != null:
return cancelEdit(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( DailyReport report,  String companyUID)?  loadExistingReport,TResult Function( String companyUID,  String workScopeUID,  bool forceRefresh)?  loadQuantitiesAndEquipments,TResult Function( WorkScope scope)?  updateWorkScope,TResult Function( Road road)?  updateRoad,TResult Function( String weather)?  updateWeather,TResult Function( int count)?  updateWorkers,TResult Function( String notes)?  updateNotes,TResult Function( String section)?  updateSection,TResult Function( WorkQuantityType quantityType)?  addQuantity,TResult Function( String compositeKey)?  removeQuantity,TResult Function( String compositeKey,  String fieldKey,  dynamic value)?  updateQuantityFieldValue,TResult Function( WorkEquipment equipment)?  toggleEquipment,TResult Function( String type,  List<Map<String, dynamic>> snapshots)?  updateConditionSnapshot,TResult Function( Map<String, dynamic>? image)?  updateWorkerImage,TResult Function()?  submitUpdate,TResult Function()?  cancelEdit,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LoadExistingReportEdit() when loadExistingReport != null:
return loadExistingReport(_that.report,_that.companyUID);case LoadQuantitiesAndEquipmentsEdit() when loadQuantitiesAndEquipments != null:
return loadQuantitiesAndEquipments(_that.companyUID,_that.workScopeUID,_that.forceRefresh);case UpdateWorkScopeEdit() when updateWorkScope != null:
return updateWorkScope(_that.scope);case UpdateRoadEdit() when updateRoad != null:
return updateRoad(_that.road);case UpdateWeatherEdit() when updateWeather != null:
return updateWeather(_that.weather);case UpdateWorkersEdit() when updateWorkers != null:
return updateWorkers(_that.count);case UpdateNotesEdit() when updateNotes != null:
return updateNotes(_that.notes);case UpdateSectionEdit() when updateSection != null:
return updateSection(_that.section);case AddQuantityEdit() when addQuantity != null:
return addQuantity(_that.quantityType);case RemoveQuantityEdit() when removeQuantity != null:
return removeQuantity(_that.compositeKey);case UpdateQuantityFieldValueEdit() when updateQuantityFieldValue != null:
return updateQuantityFieldValue(_that.compositeKey,_that.fieldKey,_that.value);case ToggleEquipmentEdit() when toggleEquipment != null:
return toggleEquipment(_that.equipment);case UpdateConditionSnapshotEdit() when updateConditionSnapshot != null:
return updateConditionSnapshot(_that.type,_that.snapshots);case UpdateWorkerImageEdit() when updateWorkerImage != null:
return updateWorkerImage(_that.image);case SubmitUpdateEdit() when submitUpdate != null:
return submitUpdate();case CancelEdit() when cancelEdit != null:
return cancelEdit();case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( DailyReport report,  String companyUID)  loadExistingReport,required TResult Function( String companyUID,  String workScopeUID,  bool forceRefresh)  loadQuantitiesAndEquipments,required TResult Function( WorkScope scope)  updateWorkScope,required TResult Function( Road road)  updateRoad,required TResult Function( String weather)  updateWeather,required TResult Function( int count)  updateWorkers,required TResult Function( String notes)  updateNotes,required TResult Function( String section)  updateSection,required TResult Function( WorkQuantityType quantityType)  addQuantity,required TResult Function( String compositeKey)  removeQuantity,required TResult Function( String compositeKey,  String fieldKey,  dynamic value)  updateQuantityFieldValue,required TResult Function( WorkEquipment equipment)  toggleEquipment,required TResult Function( String type,  List<Map<String, dynamic>> snapshots)  updateConditionSnapshot,required TResult Function( Map<String, dynamic>? image)  updateWorkerImage,required TResult Function()  submitUpdate,required TResult Function()  cancelEdit,}) {final _that = this;
switch (_that) {
case LoadExistingReportEdit():
return loadExistingReport(_that.report,_that.companyUID);case LoadQuantitiesAndEquipmentsEdit():
return loadQuantitiesAndEquipments(_that.companyUID,_that.workScopeUID,_that.forceRefresh);case UpdateWorkScopeEdit():
return updateWorkScope(_that.scope);case UpdateRoadEdit():
return updateRoad(_that.road);case UpdateWeatherEdit():
return updateWeather(_that.weather);case UpdateWorkersEdit():
return updateWorkers(_that.count);case UpdateNotesEdit():
return updateNotes(_that.notes);case UpdateSectionEdit():
return updateSection(_that.section);case AddQuantityEdit():
return addQuantity(_that.quantityType);case RemoveQuantityEdit():
return removeQuantity(_that.compositeKey);case UpdateQuantityFieldValueEdit():
return updateQuantityFieldValue(_that.compositeKey,_that.fieldKey,_that.value);case ToggleEquipmentEdit():
return toggleEquipment(_that.equipment);case UpdateConditionSnapshotEdit():
return updateConditionSnapshot(_that.type,_that.snapshots);case UpdateWorkerImageEdit():
return updateWorkerImage(_that.image);case SubmitUpdateEdit():
return submitUpdate();case CancelEdit():
return cancelEdit();case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( DailyReport report,  String companyUID)?  loadExistingReport,TResult? Function( String companyUID,  String workScopeUID,  bool forceRefresh)?  loadQuantitiesAndEquipments,TResult? Function( WorkScope scope)?  updateWorkScope,TResult? Function( Road road)?  updateRoad,TResult? Function( String weather)?  updateWeather,TResult? Function( int count)?  updateWorkers,TResult? Function( String notes)?  updateNotes,TResult? Function( String section)?  updateSection,TResult? Function( WorkQuantityType quantityType)?  addQuantity,TResult? Function( String compositeKey)?  removeQuantity,TResult? Function( String compositeKey,  String fieldKey,  dynamic value)?  updateQuantityFieldValue,TResult? Function( WorkEquipment equipment)?  toggleEquipment,TResult? Function( String type,  List<Map<String, dynamic>> snapshots)?  updateConditionSnapshot,TResult? Function( Map<String, dynamic>? image)?  updateWorkerImage,TResult? Function()?  submitUpdate,TResult? Function()?  cancelEdit,}) {final _that = this;
switch (_that) {
case LoadExistingReportEdit() when loadExistingReport != null:
return loadExistingReport(_that.report,_that.companyUID);case LoadQuantitiesAndEquipmentsEdit() when loadQuantitiesAndEquipments != null:
return loadQuantitiesAndEquipments(_that.companyUID,_that.workScopeUID,_that.forceRefresh);case UpdateWorkScopeEdit() when updateWorkScope != null:
return updateWorkScope(_that.scope);case UpdateRoadEdit() when updateRoad != null:
return updateRoad(_that.road);case UpdateWeatherEdit() when updateWeather != null:
return updateWeather(_that.weather);case UpdateWorkersEdit() when updateWorkers != null:
return updateWorkers(_that.count);case UpdateNotesEdit() when updateNotes != null:
return updateNotes(_that.notes);case UpdateSectionEdit() when updateSection != null:
return updateSection(_that.section);case AddQuantityEdit() when addQuantity != null:
return addQuantity(_that.quantityType);case RemoveQuantityEdit() when removeQuantity != null:
return removeQuantity(_that.compositeKey);case UpdateQuantityFieldValueEdit() when updateQuantityFieldValue != null:
return updateQuantityFieldValue(_that.compositeKey,_that.fieldKey,_that.value);case ToggleEquipmentEdit() when toggleEquipment != null:
return toggleEquipment(_that.equipment);case UpdateConditionSnapshotEdit() when updateConditionSnapshot != null:
return updateConditionSnapshot(_that.type,_that.snapshots);case UpdateWorkerImageEdit() when updateWorkerImage != null:
return updateWorkerImage(_that.image);case SubmitUpdateEdit() when submitUpdate != null:
return submitUpdate();case CancelEdit() when cancelEdit != null:
return cancelEdit();case _:
  return null;

}
}

}

/// @nodoc


class LoadExistingReportEdit implements DailyReportEditEvent {
  const LoadExistingReportEdit({required this.report, required this.companyUID});
  

 final  DailyReport report;
 final  String companyUID;

/// Create a copy of DailyReportEditEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadExistingReportEditCopyWith<LoadExistingReportEdit> get copyWith => _$LoadExistingReportEditCopyWithImpl<LoadExistingReportEdit>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadExistingReportEdit&&(identical(other.report, report) || other.report == report)&&(identical(other.companyUID, companyUID) || other.companyUID == companyUID));
}


@override
int get hashCode => Object.hash(runtimeType,report,companyUID);

@override
String toString() {
  return 'DailyReportEditEvent.loadExistingReport(report: $report, companyUID: $companyUID)';
}


}

/// @nodoc
abstract mixin class $LoadExistingReportEditCopyWith<$Res> implements $DailyReportEditEventCopyWith<$Res> {
  factory $LoadExistingReportEditCopyWith(LoadExistingReportEdit value, $Res Function(LoadExistingReportEdit) _then) = _$LoadExistingReportEditCopyWithImpl;
@useResult
$Res call({
 DailyReport report, String companyUID
});




}
/// @nodoc
class _$LoadExistingReportEditCopyWithImpl<$Res>
    implements $LoadExistingReportEditCopyWith<$Res> {
  _$LoadExistingReportEditCopyWithImpl(this._self, this._then);

  final LoadExistingReportEdit _self;
  final $Res Function(LoadExistingReportEdit) _then;

/// Create a copy of DailyReportEditEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? report = null,Object? companyUID = null,}) {
  return _then(LoadExistingReportEdit(
report: null == report ? _self.report : report // ignore: cast_nullable_to_non_nullable
as DailyReport,companyUID: null == companyUID ? _self.companyUID : companyUID // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class LoadQuantitiesAndEquipmentsEdit implements DailyReportEditEvent {
  const LoadQuantitiesAndEquipmentsEdit({required this.companyUID, required this.workScopeUID, this.forceRefresh = false});
  

 final  String companyUID;
 final  String workScopeUID;
@JsonKey() final  bool forceRefresh;

/// Create a copy of DailyReportEditEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadQuantitiesAndEquipmentsEditCopyWith<LoadQuantitiesAndEquipmentsEdit> get copyWith => _$LoadQuantitiesAndEquipmentsEditCopyWithImpl<LoadQuantitiesAndEquipmentsEdit>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadQuantitiesAndEquipmentsEdit&&(identical(other.companyUID, companyUID) || other.companyUID == companyUID)&&(identical(other.workScopeUID, workScopeUID) || other.workScopeUID == workScopeUID)&&(identical(other.forceRefresh, forceRefresh) || other.forceRefresh == forceRefresh));
}


@override
int get hashCode => Object.hash(runtimeType,companyUID,workScopeUID,forceRefresh);

@override
String toString() {
  return 'DailyReportEditEvent.loadQuantitiesAndEquipments(companyUID: $companyUID, workScopeUID: $workScopeUID, forceRefresh: $forceRefresh)';
}


}

/// @nodoc
abstract mixin class $LoadQuantitiesAndEquipmentsEditCopyWith<$Res> implements $DailyReportEditEventCopyWith<$Res> {
  factory $LoadQuantitiesAndEquipmentsEditCopyWith(LoadQuantitiesAndEquipmentsEdit value, $Res Function(LoadQuantitiesAndEquipmentsEdit) _then) = _$LoadQuantitiesAndEquipmentsEditCopyWithImpl;
@useResult
$Res call({
 String companyUID, String workScopeUID, bool forceRefresh
});




}
/// @nodoc
class _$LoadQuantitiesAndEquipmentsEditCopyWithImpl<$Res>
    implements $LoadQuantitiesAndEquipmentsEditCopyWith<$Res> {
  _$LoadQuantitiesAndEquipmentsEditCopyWithImpl(this._self, this._then);

  final LoadQuantitiesAndEquipmentsEdit _self;
  final $Res Function(LoadQuantitiesAndEquipmentsEdit) _then;

/// Create a copy of DailyReportEditEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? companyUID = null,Object? workScopeUID = null,Object? forceRefresh = null,}) {
  return _then(LoadQuantitiesAndEquipmentsEdit(
companyUID: null == companyUID ? _self.companyUID : companyUID // ignore: cast_nullable_to_non_nullable
as String,workScopeUID: null == workScopeUID ? _self.workScopeUID : workScopeUID // ignore: cast_nullable_to_non_nullable
as String,forceRefresh: null == forceRefresh ? _self.forceRefresh : forceRefresh // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class UpdateWorkScopeEdit implements DailyReportEditEvent {
  const UpdateWorkScopeEdit({required this.scope});
  

 final  WorkScope scope;

/// Create a copy of DailyReportEditEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateWorkScopeEditCopyWith<UpdateWorkScopeEdit> get copyWith => _$UpdateWorkScopeEditCopyWithImpl<UpdateWorkScopeEdit>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateWorkScopeEdit&&(identical(other.scope, scope) || other.scope == scope));
}


@override
int get hashCode => Object.hash(runtimeType,scope);

@override
String toString() {
  return 'DailyReportEditEvent.updateWorkScope(scope: $scope)';
}


}

/// @nodoc
abstract mixin class $UpdateWorkScopeEditCopyWith<$Res> implements $DailyReportEditEventCopyWith<$Res> {
  factory $UpdateWorkScopeEditCopyWith(UpdateWorkScopeEdit value, $Res Function(UpdateWorkScopeEdit) _then) = _$UpdateWorkScopeEditCopyWithImpl;
@useResult
$Res call({
 WorkScope scope
});




}
/// @nodoc
class _$UpdateWorkScopeEditCopyWithImpl<$Res>
    implements $UpdateWorkScopeEditCopyWith<$Res> {
  _$UpdateWorkScopeEditCopyWithImpl(this._self, this._then);

  final UpdateWorkScopeEdit _self;
  final $Res Function(UpdateWorkScopeEdit) _then;

/// Create a copy of DailyReportEditEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? scope = null,}) {
  return _then(UpdateWorkScopeEdit(
scope: null == scope ? _self.scope : scope // ignore: cast_nullable_to_non_nullable
as WorkScope,
  ));
}


}

/// @nodoc


class UpdateRoadEdit implements DailyReportEditEvent {
  const UpdateRoadEdit({required this.road});
  

 final  Road road;

/// Create a copy of DailyReportEditEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateRoadEditCopyWith<UpdateRoadEdit> get copyWith => _$UpdateRoadEditCopyWithImpl<UpdateRoadEdit>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateRoadEdit&&(identical(other.road, road) || other.road == road));
}


@override
int get hashCode => Object.hash(runtimeType,road);

@override
String toString() {
  return 'DailyReportEditEvent.updateRoad(road: $road)';
}


}

/// @nodoc
abstract mixin class $UpdateRoadEditCopyWith<$Res> implements $DailyReportEditEventCopyWith<$Res> {
  factory $UpdateRoadEditCopyWith(UpdateRoadEdit value, $Res Function(UpdateRoadEdit) _then) = _$UpdateRoadEditCopyWithImpl;
@useResult
$Res call({
 Road road
});




}
/// @nodoc
class _$UpdateRoadEditCopyWithImpl<$Res>
    implements $UpdateRoadEditCopyWith<$Res> {
  _$UpdateRoadEditCopyWithImpl(this._self, this._then);

  final UpdateRoadEdit _self;
  final $Res Function(UpdateRoadEdit) _then;

/// Create a copy of DailyReportEditEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? road = null,}) {
  return _then(UpdateRoadEdit(
road: null == road ? _self.road : road // ignore: cast_nullable_to_non_nullable
as Road,
  ));
}


}

/// @nodoc


class UpdateWeatherEdit implements DailyReportEditEvent {
  const UpdateWeatherEdit({required this.weather});
  

 final  String weather;

/// Create a copy of DailyReportEditEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateWeatherEditCopyWith<UpdateWeatherEdit> get copyWith => _$UpdateWeatherEditCopyWithImpl<UpdateWeatherEdit>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateWeatherEdit&&(identical(other.weather, weather) || other.weather == weather));
}


@override
int get hashCode => Object.hash(runtimeType,weather);

@override
String toString() {
  return 'DailyReportEditEvent.updateWeather(weather: $weather)';
}


}

/// @nodoc
abstract mixin class $UpdateWeatherEditCopyWith<$Res> implements $DailyReportEditEventCopyWith<$Res> {
  factory $UpdateWeatherEditCopyWith(UpdateWeatherEdit value, $Res Function(UpdateWeatherEdit) _then) = _$UpdateWeatherEditCopyWithImpl;
@useResult
$Res call({
 String weather
});




}
/// @nodoc
class _$UpdateWeatherEditCopyWithImpl<$Res>
    implements $UpdateWeatherEditCopyWith<$Res> {
  _$UpdateWeatherEditCopyWithImpl(this._self, this._then);

  final UpdateWeatherEdit _self;
  final $Res Function(UpdateWeatherEdit) _then;

/// Create a copy of DailyReportEditEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? weather = null,}) {
  return _then(UpdateWeatherEdit(
weather: null == weather ? _self.weather : weather // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class UpdateWorkersEdit implements DailyReportEditEvent {
  const UpdateWorkersEdit({required this.count});
  

 final  int count;

/// Create a copy of DailyReportEditEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateWorkersEditCopyWith<UpdateWorkersEdit> get copyWith => _$UpdateWorkersEditCopyWithImpl<UpdateWorkersEdit>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateWorkersEdit&&(identical(other.count, count) || other.count == count));
}


@override
int get hashCode => Object.hash(runtimeType,count);

@override
String toString() {
  return 'DailyReportEditEvent.updateWorkers(count: $count)';
}


}

/// @nodoc
abstract mixin class $UpdateWorkersEditCopyWith<$Res> implements $DailyReportEditEventCopyWith<$Res> {
  factory $UpdateWorkersEditCopyWith(UpdateWorkersEdit value, $Res Function(UpdateWorkersEdit) _then) = _$UpdateWorkersEditCopyWithImpl;
@useResult
$Res call({
 int count
});




}
/// @nodoc
class _$UpdateWorkersEditCopyWithImpl<$Res>
    implements $UpdateWorkersEditCopyWith<$Res> {
  _$UpdateWorkersEditCopyWithImpl(this._self, this._then);

  final UpdateWorkersEdit _self;
  final $Res Function(UpdateWorkersEdit) _then;

/// Create a copy of DailyReportEditEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? count = null,}) {
  return _then(UpdateWorkersEdit(
count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class UpdateNotesEdit implements DailyReportEditEvent {
  const UpdateNotesEdit({required this.notes});
  

 final  String notes;

/// Create a copy of DailyReportEditEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateNotesEditCopyWith<UpdateNotesEdit> get copyWith => _$UpdateNotesEditCopyWithImpl<UpdateNotesEdit>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateNotesEdit&&(identical(other.notes, notes) || other.notes == notes));
}


@override
int get hashCode => Object.hash(runtimeType,notes);

@override
String toString() {
  return 'DailyReportEditEvent.updateNotes(notes: $notes)';
}


}

/// @nodoc
abstract mixin class $UpdateNotesEditCopyWith<$Res> implements $DailyReportEditEventCopyWith<$Res> {
  factory $UpdateNotesEditCopyWith(UpdateNotesEdit value, $Res Function(UpdateNotesEdit) _then) = _$UpdateNotesEditCopyWithImpl;
@useResult
$Res call({
 String notes
});




}
/// @nodoc
class _$UpdateNotesEditCopyWithImpl<$Res>
    implements $UpdateNotesEditCopyWith<$Res> {
  _$UpdateNotesEditCopyWithImpl(this._self, this._then);

  final UpdateNotesEdit _self;
  final $Res Function(UpdateNotesEdit) _then;

/// Create a copy of DailyReportEditEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? notes = null,}) {
  return _then(UpdateNotesEdit(
notes: null == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class UpdateSectionEdit implements DailyReportEditEvent {
  const UpdateSectionEdit({required this.section});
  

 final  String section;

/// Create a copy of DailyReportEditEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateSectionEditCopyWith<UpdateSectionEdit> get copyWith => _$UpdateSectionEditCopyWithImpl<UpdateSectionEdit>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateSectionEdit&&(identical(other.section, section) || other.section == section));
}


@override
int get hashCode => Object.hash(runtimeType,section);

@override
String toString() {
  return 'DailyReportEditEvent.updateSection(section: $section)';
}


}

/// @nodoc
abstract mixin class $UpdateSectionEditCopyWith<$Res> implements $DailyReportEditEventCopyWith<$Res> {
  factory $UpdateSectionEditCopyWith(UpdateSectionEdit value, $Res Function(UpdateSectionEdit) _then) = _$UpdateSectionEditCopyWithImpl;
@useResult
$Res call({
 String section
});




}
/// @nodoc
class _$UpdateSectionEditCopyWithImpl<$Res>
    implements $UpdateSectionEditCopyWith<$Res> {
  _$UpdateSectionEditCopyWithImpl(this._self, this._then);

  final UpdateSectionEdit _self;
  final $Res Function(UpdateSectionEdit) _then;

/// Create a copy of DailyReportEditEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? section = null,}) {
  return _then(UpdateSectionEdit(
section: null == section ? _self.section : section // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class AddQuantityEdit implements DailyReportEditEvent {
  const AddQuantityEdit({required this.quantityType});
  

 final  WorkQuantityType quantityType;

/// Create a copy of DailyReportEditEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddQuantityEditCopyWith<AddQuantityEdit> get copyWith => _$AddQuantityEditCopyWithImpl<AddQuantityEdit>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddQuantityEdit&&(identical(other.quantityType, quantityType) || other.quantityType == quantityType));
}


@override
int get hashCode => Object.hash(runtimeType,quantityType);

@override
String toString() {
  return 'DailyReportEditEvent.addQuantity(quantityType: $quantityType)';
}


}

/// @nodoc
abstract mixin class $AddQuantityEditCopyWith<$Res> implements $DailyReportEditEventCopyWith<$Res> {
  factory $AddQuantityEditCopyWith(AddQuantityEdit value, $Res Function(AddQuantityEdit) _then) = _$AddQuantityEditCopyWithImpl;
@useResult
$Res call({
 WorkQuantityType quantityType
});




}
/// @nodoc
class _$AddQuantityEditCopyWithImpl<$Res>
    implements $AddQuantityEditCopyWith<$Res> {
  _$AddQuantityEditCopyWithImpl(this._self, this._then);

  final AddQuantityEdit _self;
  final $Res Function(AddQuantityEdit) _then;

/// Create a copy of DailyReportEditEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? quantityType = null,}) {
  return _then(AddQuantityEdit(
quantityType: null == quantityType ? _self.quantityType : quantityType // ignore: cast_nullable_to_non_nullable
as WorkQuantityType,
  ));
}


}

/// @nodoc


class RemoveQuantityEdit implements DailyReportEditEvent {
  const RemoveQuantityEdit({required this.compositeKey});
  

 final  String compositeKey;

/// Create a copy of DailyReportEditEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RemoveQuantityEditCopyWith<RemoveQuantityEdit> get copyWith => _$RemoveQuantityEditCopyWithImpl<RemoveQuantityEdit>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RemoveQuantityEdit&&(identical(other.compositeKey, compositeKey) || other.compositeKey == compositeKey));
}


@override
int get hashCode => Object.hash(runtimeType,compositeKey);

@override
String toString() {
  return 'DailyReportEditEvent.removeQuantity(compositeKey: $compositeKey)';
}


}

/// @nodoc
abstract mixin class $RemoveQuantityEditCopyWith<$Res> implements $DailyReportEditEventCopyWith<$Res> {
  factory $RemoveQuantityEditCopyWith(RemoveQuantityEdit value, $Res Function(RemoveQuantityEdit) _then) = _$RemoveQuantityEditCopyWithImpl;
@useResult
$Res call({
 String compositeKey
});




}
/// @nodoc
class _$RemoveQuantityEditCopyWithImpl<$Res>
    implements $RemoveQuantityEditCopyWith<$Res> {
  _$RemoveQuantityEditCopyWithImpl(this._self, this._then);

  final RemoveQuantityEdit _self;
  final $Res Function(RemoveQuantityEdit) _then;

/// Create a copy of DailyReportEditEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? compositeKey = null,}) {
  return _then(RemoveQuantityEdit(
compositeKey: null == compositeKey ? _self.compositeKey : compositeKey // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class UpdateQuantityFieldValueEdit implements DailyReportEditEvent {
  const UpdateQuantityFieldValueEdit({required this.compositeKey, required this.fieldKey, required this.value});
  

 final  String compositeKey;
 final  String fieldKey;
 final  dynamic value;

/// Create a copy of DailyReportEditEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateQuantityFieldValueEditCopyWith<UpdateQuantityFieldValueEdit> get copyWith => _$UpdateQuantityFieldValueEditCopyWithImpl<UpdateQuantityFieldValueEdit>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateQuantityFieldValueEdit&&(identical(other.compositeKey, compositeKey) || other.compositeKey == compositeKey)&&(identical(other.fieldKey, fieldKey) || other.fieldKey == fieldKey)&&const DeepCollectionEquality().equals(other.value, value));
}


@override
int get hashCode => Object.hash(runtimeType,compositeKey,fieldKey,const DeepCollectionEquality().hash(value));

@override
String toString() {
  return 'DailyReportEditEvent.updateQuantityFieldValue(compositeKey: $compositeKey, fieldKey: $fieldKey, value: $value)';
}


}

/// @nodoc
abstract mixin class $UpdateQuantityFieldValueEditCopyWith<$Res> implements $DailyReportEditEventCopyWith<$Res> {
  factory $UpdateQuantityFieldValueEditCopyWith(UpdateQuantityFieldValueEdit value, $Res Function(UpdateQuantityFieldValueEdit) _then) = _$UpdateQuantityFieldValueEditCopyWithImpl;
@useResult
$Res call({
 String compositeKey, String fieldKey, dynamic value
});




}
/// @nodoc
class _$UpdateQuantityFieldValueEditCopyWithImpl<$Res>
    implements $UpdateQuantityFieldValueEditCopyWith<$Res> {
  _$UpdateQuantityFieldValueEditCopyWithImpl(this._self, this._then);

  final UpdateQuantityFieldValueEdit _self;
  final $Res Function(UpdateQuantityFieldValueEdit) _then;

/// Create a copy of DailyReportEditEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? compositeKey = null,Object? fieldKey = null,Object? value = freezed,}) {
  return _then(UpdateQuantityFieldValueEdit(
compositeKey: null == compositeKey ? _self.compositeKey : compositeKey // ignore: cast_nullable_to_non_nullable
as String,fieldKey: null == fieldKey ? _self.fieldKey : fieldKey // ignore: cast_nullable_to_non_nullable
as String,value: freezed == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}


}

/// @nodoc


class ToggleEquipmentEdit implements DailyReportEditEvent {
  const ToggleEquipmentEdit({required this.equipment});
  

 final  WorkEquipment equipment;

/// Create a copy of DailyReportEditEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ToggleEquipmentEditCopyWith<ToggleEquipmentEdit> get copyWith => _$ToggleEquipmentEditCopyWithImpl<ToggleEquipmentEdit>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ToggleEquipmentEdit&&(identical(other.equipment, equipment) || other.equipment == equipment));
}


@override
int get hashCode => Object.hash(runtimeType,equipment);

@override
String toString() {
  return 'DailyReportEditEvent.toggleEquipment(equipment: $equipment)';
}


}

/// @nodoc
abstract mixin class $ToggleEquipmentEditCopyWith<$Res> implements $DailyReportEditEventCopyWith<$Res> {
  factory $ToggleEquipmentEditCopyWith(ToggleEquipmentEdit value, $Res Function(ToggleEquipmentEdit) _then) = _$ToggleEquipmentEditCopyWithImpl;
@useResult
$Res call({
 WorkEquipment equipment
});




}
/// @nodoc
class _$ToggleEquipmentEditCopyWithImpl<$Res>
    implements $ToggleEquipmentEditCopyWith<$Res> {
  _$ToggleEquipmentEditCopyWithImpl(this._self, this._then);

  final ToggleEquipmentEdit _self;
  final $Res Function(ToggleEquipmentEdit) _then;

/// Create a copy of DailyReportEditEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? equipment = null,}) {
  return _then(ToggleEquipmentEdit(
equipment: null == equipment ? _self.equipment : equipment // ignore: cast_nullable_to_non_nullable
as WorkEquipment,
  ));
}


}

/// @nodoc


class UpdateConditionSnapshotEdit implements DailyReportEditEvent {
  const UpdateConditionSnapshotEdit({required this.type, required final  List<Map<String, dynamic>> snapshots}): _snapshots = snapshots;
  

 final  String type;
// 'before', 'current', 'after'
 final  List<Map<String, dynamic>> _snapshots;
// 'before', 'current', 'after'
 List<Map<String, dynamic>> get snapshots {
  if (_snapshots is EqualUnmodifiableListView) return _snapshots;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_snapshots);
}


/// Create a copy of DailyReportEditEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateConditionSnapshotEditCopyWith<UpdateConditionSnapshotEdit> get copyWith => _$UpdateConditionSnapshotEditCopyWithImpl<UpdateConditionSnapshotEdit>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateConditionSnapshotEdit&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other._snapshots, _snapshots));
}


@override
int get hashCode => Object.hash(runtimeType,type,const DeepCollectionEquality().hash(_snapshots));

@override
String toString() {
  return 'DailyReportEditEvent.updateConditionSnapshot(type: $type, snapshots: $snapshots)';
}


}

/// @nodoc
abstract mixin class $UpdateConditionSnapshotEditCopyWith<$Res> implements $DailyReportEditEventCopyWith<$Res> {
  factory $UpdateConditionSnapshotEditCopyWith(UpdateConditionSnapshotEdit value, $Res Function(UpdateConditionSnapshotEdit) _then) = _$UpdateConditionSnapshotEditCopyWithImpl;
@useResult
$Res call({
 String type, List<Map<String, dynamic>> snapshots
});




}
/// @nodoc
class _$UpdateConditionSnapshotEditCopyWithImpl<$Res>
    implements $UpdateConditionSnapshotEditCopyWith<$Res> {
  _$UpdateConditionSnapshotEditCopyWithImpl(this._self, this._then);

  final UpdateConditionSnapshotEdit _self;
  final $Res Function(UpdateConditionSnapshotEdit) _then;

/// Create a copy of DailyReportEditEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? type = null,Object? snapshots = null,}) {
  return _then(UpdateConditionSnapshotEdit(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,snapshots: null == snapshots ? _self._snapshots : snapshots // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>,
  ));
}


}

/// @nodoc


class UpdateWorkerImageEdit implements DailyReportEditEvent {
  const UpdateWorkerImageEdit({final  Map<String, dynamic>? image}): _image = image;
  

 final  Map<String, dynamic>? _image;
 Map<String, dynamic>? get image {
  final value = _image;
  if (value == null) return null;
  if (_image is EqualUnmodifiableMapView) return _image;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of DailyReportEditEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateWorkerImageEditCopyWith<UpdateWorkerImageEdit> get copyWith => _$UpdateWorkerImageEditCopyWithImpl<UpdateWorkerImageEdit>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateWorkerImageEdit&&const DeepCollectionEquality().equals(other._image, _image));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_image));

@override
String toString() {
  return 'DailyReportEditEvent.updateWorkerImage(image: $image)';
}


}

/// @nodoc
abstract mixin class $UpdateWorkerImageEditCopyWith<$Res> implements $DailyReportEditEventCopyWith<$Res> {
  factory $UpdateWorkerImageEditCopyWith(UpdateWorkerImageEdit value, $Res Function(UpdateWorkerImageEdit) _then) = _$UpdateWorkerImageEditCopyWithImpl;
@useResult
$Res call({
 Map<String, dynamic>? image
});




}
/// @nodoc
class _$UpdateWorkerImageEditCopyWithImpl<$Res>
    implements $UpdateWorkerImageEditCopyWith<$Res> {
  _$UpdateWorkerImageEditCopyWithImpl(this._self, this._then);

  final UpdateWorkerImageEdit _self;
  final $Res Function(UpdateWorkerImageEdit) _then;

/// Create a copy of DailyReportEditEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? image = freezed,}) {
  return _then(UpdateWorkerImageEdit(
image: freezed == image ? _self._image : image // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}


}

/// @nodoc


class SubmitUpdateEdit implements DailyReportEditEvent {
  const SubmitUpdateEdit();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubmitUpdateEdit);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DailyReportEditEvent.submitUpdate()';
}


}




/// @nodoc


class CancelEdit implements DailyReportEditEvent {
  const CancelEdit();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CancelEdit);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DailyReportEditEvent.cancelEdit()';
}


}




// dart format on
