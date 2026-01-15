// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_program_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CreateProgramEvent {

 String get companyUID; String get workScopeUID; String get workScopeCode; String get workScopeName; List<Map<String, String>> get periods; DateTime get periodStart; String? get contractRelationUID;
/// Create a copy of CreateProgramEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateProgramEventCopyWith<CreateProgramEvent> get copyWith => _$CreateProgramEventCopyWithImpl<CreateProgramEvent>(this as CreateProgramEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateProgramEvent&&(identical(other.companyUID, companyUID) || other.companyUID == companyUID)&&(identical(other.workScopeUID, workScopeUID) || other.workScopeUID == workScopeUID)&&(identical(other.workScopeCode, workScopeCode) || other.workScopeCode == workScopeCode)&&(identical(other.workScopeName, workScopeName) || other.workScopeName == workScopeName)&&const DeepCollectionEquality().equals(other.periods, periods)&&(identical(other.periodStart, periodStart) || other.periodStart == periodStart)&&(identical(other.contractRelationUID, contractRelationUID) || other.contractRelationUID == contractRelationUID));
}


@override
int get hashCode => Object.hash(runtimeType,companyUID,workScopeUID,workScopeCode,workScopeName,const DeepCollectionEquality().hash(periods),periodStart,contractRelationUID);

@override
String toString() {
  return 'CreateProgramEvent(companyUID: $companyUID, workScopeUID: $workScopeUID, workScopeCode: $workScopeCode, workScopeName: $workScopeName, periods: $periods, periodStart: $periodStart, contractRelationUID: $contractRelationUID)';
}


}

/// @nodoc
abstract mixin class $CreateProgramEventCopyWith<$Res>  {
  factory $CreateProgramEventCopyWith(CreateProgramEvent value, $Res Function(CreateProgramEvent) _then) = _$CreateProgramEventCopyWithImpl;
@useResult
$Res call({
 String companyUID, String workScopeUID, String workScopeCode, String workScopeName, List<Map<String, String>> periods, DateTime periodStart, String? contractRelationUID
});




}
/// @nodoc
class _$CreateProgramEventCopyWithImpl<$Res>
    implements $CreateProgramEventCopyWith<$Res> {
  _$CreateProgramEventCopyWithImpl(this._self, this._then);

  final CreateProgramEvent _self;
  final $Res Function(CreateProgramEvent) _then;

/// Create a copy of CreateProgramEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? companyUID = null,Object? workScopeUID = null,Object? workScopeCode = null,Object? workScopeName = null,Object? periods = null,Object? periodStart = null,Object? contractRelationUID = freezed,}) {
  return _then(_self.copyWith(
companyUID: null == companyUID ? _self.companyUID : companyUID // ignore: cast_nullable_to_non_nullable
as String,workScopeUID: null == workScopeUID ? _self.workScopeUID : workScopeUID // ignore: cast_nullable_to_non_nullable
as String,workScopeCode: null == workScopeCode ? _self.workScopeCode : workScopeCode // ignore: cast_nullable_to_non_nullable
as String,workScopeName: null == workScopeName ? _self.workScopeName : workScopeName // ignore: cast_nullable_to_non_nullable
as String,periods: null == periods ? _self.periods : periods // ignore: cast_nullable_to_non_nullable
as List<Map<String, String>>,periodStart: null == periodStart ? _self.periodStart : periodStart // ignore: cast_nullable_to_non_nullable
as DateTime,contractRelationUID: freezed == contractRelationUID ? _self.contractRelationUID : contractRelationUID // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateProgramEvent].
extension CreateProgramEventPatterns on CreateProgramEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( SubmitR02Program value)?  submitR02Program,TResult Function( SubmitNonR02Program value)?  submitNonR02Program,required TResult orElse(),}){
final _that = this;
switch (_that) {
case SubmitR02Program() when submitR02Program != null:
return submitR02Program(_that);case SubmitNonR02Program() when submitNonR02Program != null:
return submitNonR02Program(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( SubmitR02Program value)  submitR02Program,required TResult Function( SubmitNonR02Program value)  submitNonR02Program,}){
final _that = this;
switch (_that) {
case SubmitR02Program():
return submitR02Program(_that);case SubmitNonR02Program():
return submitNonR02Program(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( SubmitR02Program value)?  submitR02Program,TResult? Function( SubmitNonR02Program value)?  submitNonR02Program,}){
final _that = this;
switch (_that) {
case SubmitR02Program() when submitR02Program != null:
return submitR02Program(_that);case SubmitNonR02Program() when submitNonR02Program != null:
return submitNonR02Program(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String companyUID,  String workScopeUID,  String workScopeCode,  String workScopeName,  String roadUID,  double section,  List<Map<String, String>> periods,  DateTime periodStart,  String? contractRelationUID,  String description,  double? latitude,  double? longitude,  Map<String, Map<String, dynamic>> quantityFieldData,  List<dynamic> quantityTypes)?  submitR02Program,TResult Function( String companyUID,  String workScopeUID,  String workScopeCode,  String workScopeName,  List<Map<String, dynamic>> selectedRoads,  List<Map<String, String>> periods,  DateTime periodStart,  String? contractRelationUID)?  submitNonR02Program,required TResult orElse(),}) {final _that = this;
switch (_that) {
case SubmitR02Program() when submitR02Program != null:
return submitR02Program(_that.companyUID,_that.workScopeUID,_that.workScopeCode,_that.workScopeName,_that.roadUID,_that.section,_that.periods,_that.periodStart,_that.contractRelationUID,_that.description,_that.latitude,_that.longitude,_that.quantityFieldData,_that.quantityTypes);case SubmitNonR02Program() when submitNonR02Program != null:
return submitNonR02Program(_that.companyUID,_that.workScopeUID,_that.workScopeCode,_that.workScopeName,_that.selectedRoads,_that.periods,_that.periodStart,_that.contractRelationUID);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String companyUID,  String workScopeUID,  String workScopeCode,  String workScopeName,  String roadUID,  double section,  List<Map<String, String>> periods,  DateTime periodStart,  String? contractRelationUID,  String description,  double? latitude,  double? longitude,  Map<String, Map<String, dynamic>> quantityFieldData,  List<dynamic> quantityTypes)  submitR02Program,required TResult Function( String companyUID,  String workScopeUID,  String workScopeCode,  String workScopeName,  List<Map<String, dynamic>> selectedRoads,  List<Map<String, String>> periods,  DateTime periodStart,  String? contractRelationUID)  submitNonR02Program,}) {final _that = this;
switch (_that) {
case SubmitR02Program():
return submitR02Program(_that.companyUID,_that.workScopeUID,_that.workScopeCode,_that.workScopeName,_that.roadUID,_that.section,_that.periods,_that.periodStart,_that.contractRelationUID,_that.description,_that.latitude,_that.longitude,_that.quantityFieldData,_that.quantityTypes);case SubmitNonR02Program():
return submitNonR02Program(_that.companyUID,_that.workScopeUID,_that.workScopeCode,_that.workScopeName,_that.selectedRoads,_that.periods,_that.periodStart,_that.contractRelationUID);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String companyUID,  String workScopeUID,  String workScopeCode,  String workScopeName,  String roadUID,  double section,  List<Map<String, String>> periods,  DateTime periodStart,  String? contractRelationUID,  String description,  double? latitude,  double? longitude,  Map<String, Map<String, dynamic>> quantityFieldData,  List<dynamic> quantityTypes)?  submitR02Program,TResult? Function( String companyUID,  String workScopeUID,  String workScopeCode,  String workScopeName,  List<Map<String, dynamic>> selectedRoads,  List<Map<String, String>> periods,  DateTime periodStart,  String? contractRelationUID)?  submitNonR02Program,}) {final _that = this;
switch (_that) {
case SubmitR02Program() when submitR02Program != null:
return submitR02Program(_that.companyUID,_that.workScopeUID,_that.workScopeCode,_that.workScopeName,_that.roadUID,_that.section,_that.periods,_that.periodStart,_that.contractRelationUID,_that.description,_that.latitude,_that.longitude,_that.quantityFieldData,_that.quantityTypes);case SubmitNonR02Program() when submitNonR02Program != null:
return submitNonR02Program(_that.companyUID,_that.workScopeUID,_that.workScopeCode,_that.workScopeName,_that.selectedRoads,_that.periods,_that.periodStart,_that.contractRelationUID);case _:
  return null;

}
}

}

/// @nodoc


class SubmitR02Program implements CreateProgramEvent {
  const SubmitR02Program({required this.companyUID, required this.workScopeUID, required this.workScopeCode, required this.workScopeName, required this.roadUID, required this.section, required final  List<Map<String, String>> periods, required this.periodStart, this.contractRelationUID, required this.description, this.latitude, this.longitude, required final  Map<String, Map<String, dynamic>> quantityFieldData, required final  List<dynamic> quantityTypes}): _periods = periods,_quantityFieldData = quantityFieldData,_quantityTypes = quantityTypes;
  

@override final  String companyUID;
@override final  String workScopeUID;
@override final  String workScopeCode;
@override final  String workScopeName;
 final  String roadUID;
 final  double section;
 final  List<Map<String, String>> _periods;
@override List<Map<String, String>> get periods {
  if (_periods is EqualUnmodifiableListView) return _periods;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_periods);
}

@override final  DateTime periodStart;
@override final  String? contractRelationUID;
 final  String description;
 final  double? latitude;
 final  double? longitude;
 final  Map<String, Map<String, dynamic>> _quantityFieldData;
 Map<String, Map<String, dynamic>> get quantityFieldData {
  if (_quantityFieldData is EqualUnmodifiableMapView) return _quantityFieldData;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_quantityFieldData);
}

 final  List<dynamic> _quantityTypes;
 List<dynamic> get quantityTypes {
  if (_quantityTypes is EqualUnmodifiableListView) return _quantityTypes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_quantityTypes);
}


/// Create a copy of CreateProgramEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SubmitR02ProgramCopyWith<SubmitR02Program> get copyWith => _$SubmitR02ProgramCopyWithImpl<SubmitR02Program>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubmitR02Program&&(identical(other.companyUID, companyUID) || other.companyUID == companyUID)&&(identical(other.workScopeUID, workScopeUID) || other.workScopeUID == workScopeUID)&&(identical(other.workScopeCode, workScopeCode) || other.workScopeCode == workScopeCode)&&(identical(other.workScopeName, workScopeName) || other.workScopeName == workScopeName)&&(identical(other.roadUID, roadUID) || other.roadUID == roadUID)&&(identical(other.section, section) || other.section == section)&&const DeepCollectionEquality().equals(other._periods, _periods)&&(identical(other.periodStart, periodStart) || other.periodStart == periodStart)&&(identical(other.contractRelationUID, contractRelationUID) || other.contractRelationUID == contractRelationUID)&&(identical(other.description, description) || other.description == description)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&const DeepCollectionEquality().equals(other._quantityFieldData, _quantityFieldData)&&const DeepCollectionEquality().equals(other._quantityTypes, _quantityTypes));
}


@override
int get hashCode => Object.hash(runtimeType,companyUID,workScopeUID,workScopeCode,workScopeName,roadUID,section,const DeepCollectionEquality().hash(_periods),periodStart,contractRelationUID,description,latitude,longitude,const DeepCollectionEquality().hash(_quantityFieldData),const DeepCollectionEquality().hash(_quantityTypes));

@override
String toString() {
  return 'CreateProgramEvent.submitR02Program(companyUID: $companyUID, workScopeUID: $workScopeUID, workScopeCode: $workScopeCode, workScopeName: $workScopeName, roadUID: $roadUID, section: $section, periods: $periods, periodStart: $periodStart, contractRelationUID: $contractRelationUID, description: $description, latitude: $latitude, longitude: $longitude, quantityFieldData: $quantityFieldData, quantityTypes: $quantityTypes)';
}


}

/// @nodoc
abstract mixin class $SubmitR02ProgramCopyWith<$Res> implements $CreateProgramEventCopyWith<$Res> {
  factory $SubmitR02ProgramCopyWith(SubmitR02Program value, $Res Function(SubmitR02Program) _then) = _$SubmitR02ProgramCopyWithImpl;
@override @useResult
$Res call({
 String companyUID, String workScopeUID, String workScopeCode, String workScopeName, String roadUID, double section, List<Map<String, String>> periods, DateTime periodStart, String? contractRelationUID, String description, double? latitude, double? longitude, Map<String, Map<String, dynamic>> quantityFieldData, List<dynamic> quantityTypes
});




}
/// @nodoc
class _$SubmitR02ProgramCopyWithImpl<$Res>
    implements $SubmitR02ProgramCopyWith<$Res> {
  _$SubmitR02ProgramCopyWithImpl(this._self, this._then);

  final SubmitR02Program _self;
  final $Res Function(SubmitR02Program) _then;

/// Create a copy of CreateProgramEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? companyUID = null,Object? workScopeUID = null,Object? workScopeCode = null,Object? workScopeName = null,Object? roadUID = null,Object? section = null,Object? periods = null,Object? periodStart = null,Object? contractRelationUID = freezed,Object? description = null,Object? latitude = freezed,Object? longitude = freezed,Object? quantityFieldData = null,Object? quantityTypes = null,}) {
  return _then(SubmitR02Program(
companyUID: null == companyUID ? _self.companyUID : companyUID // ignore: cast_nullable_to_non_nullable
as String,workScopeUID: null == workScopeUID ? _self.workScopeUID : workScopeUID // ignore: cast_nullable_to_non_nullable
as String,workScopeCode: null == workScopeCode ? _self.workScopeCode : workScopeCode // ignore: cast_nullable_to_non_nullable
as String,workScopeName: null == workScopeName ? _self.workScopeName : workScopeName // ignore: cast_nullable_to_non_nullable
as String,roadUID: null == roadUID ? _self.roadUID : roadUID // ignore: cast_nullable_to_non_nullable
as String,section: null == section ? _self.section : section // ignore: cast_nullable_to_non_nullable
as double,periods: null == periods ? _self._periods : periods // ignore: cast_nullable_to_non_nullable
as List<Map<String, String>>,periodStart: null == periodStart ? _self.periodStart : periodStart // ignore: cast_nullable_to_non_nullable
as DateTime,contractRelationUID: freezed == contractRelationUID ? _self.contractRelationUID : contractRelationUID // ignore: cast_nullable_to_non_nullable
as String?,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,quantityFieldData: null == quantityFieldData ? _self._quantityFieldData : quantityFieldData // ignore: cast_nullable_to_non_nullable
as Map<String, Map<String, dynamic>>,quantityTypes: null == quantityTypes ? _self._quantityTypes : quantityTypes // ignore: cast_nullable_to_non_nullable
as List<dynamic>,
  ));
}


}

/// @nodoc


class SubmitNonR02Program implements CreateProgramEvent {
  const SubmitNonR02Program({required this.companyUID, required this.workScopeUID, required this.workScopeCode, required this.workScopeName, required final  List<Map<String, dynamic>> selectedRoads, required final  List<Map<String, String>> periods, required this.periodStart, this.contractRelationUID}): _selectedRoads = selectedRoads,_periods = periods;
  

@override final  String companyUID;
@override final  String workScopeUID;
@override final  String workScopeCode;
@override final  String workScopeName;
 final  List<Map<String, dynamic>> _selectedRoads;
 List<Map<String, dynamic>> get selectedRoads {
  if (_selectedRoads is EqualUnmodifiableListView) return _selectedRoads;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_selectedRoads);
}

 final  List<Map<String, String>> _periods;
@override List<Map<String, String>> get periods {
  if (_periods is EqualUnmodifiableListView) return _periods;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_periods);
}

@override final  DateTime periodStart;
@override final  String? contractRelationUID;

/// Create a copy of CreateProgramEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SubmitNonR02ProgramCopyWith<SubmitNonR02Program> get copyWith => _$SubmitNonR02ProgramCopyWithImpl<SubmitNonR02Program>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubmitNonR02Program&&(identical(other.companyUID, companyUID) || other.companyUID == companyUID)&&(identical(other.workScopeUID, workScopeUID) || other.workScopeUID == workScopeUID)&&(identical(other.workScopeCode, workScopeCode) || other.workScopeCode == workScopeCode)&&(identical(other.workScopeName, workScopeName) || other.workScopeName == workScopeName)&&const DeepCollectionEquality().equals(other._selectedRoads, _selectedRoads)&&const DeepCollectionEquality().equals(other._periods, _periods)&&(identical(other.periodStart, periodStart) || other.periodStart == periodStart)&&(identical(other.contractRelationUID, contractRelationUID) || other.contractRelationUID == contractRelationUID));
}


@override
int get hashCode => Object.hash(runtimeType,companyUID,workScopeUID,workScopeCode,workScopeName,const DeepCollectionEquality().hash(_selectedRoads),const DeepCollectionEquality().hash(_periods),periodStart,contractRelationUID);

@override
String toString() {
  return 'CreateProgramEvent.submitNonR02Program(companyUID: $companyUID, workScopeUID: $workScopeUID, workScopeCode: $workScopeCode, workScopeName: $workScopeName, selectedRoads: $selectedRoads, periods: $periods, periodStart: $periodStart, contractRelationUID: $contractRelationUID)';
}


}

/// @nodoc
abstract mixin class $SubmitNonR02ProgramCopyWith<$Res> implements $CreateProgramEventCopyWith<$Res> {
  factory $SubmitNonR02ProgramCopyWith(SubmitNonR02Program value, $Res Function(SubmitNonR02Program) _then) = _$SubmitNonR02ProgramCopyWithImpl;
@override @useResult
$Res call({
 String companyUID, String workScopeUID, String workScopeCode, String workScopeName, List<Map<String, dynamic>> selectedRoads, List<Map<String, String>> periods, DateTime periodStart, String? contractRelationUID
});




}
/// @nodoc
class _$SubmitNonR02ProgramCopyWithImpl<$Res>
    implements $SubmitNonR02ProgramCopyWith<$Res> {
  _$SubmitNonR02ProgramCopyWithImpl(this._self, this._then);

  final SubmitNonR02Program _self;
  final $Res Function(SubmitNonR02Program) _then;

/// Create a copy of CreateProgramEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? companyUID = null,Object? workScopeUID = null,Object? workScopeCode = null,Object? workScopeName = null,Object? selectedRoads = null,Object? periods = null,Object? periodStart = null,Object? contractRelationUID = freezed,}) {
  return _then(SubmitNonR02Program(
companyUID: null == companyUID ? _self.companyUID : companyUID // ignore: cast_nullable_to_non_nullable
as String,workScopeUID: null == workScopeUID ? _self.workScopeUID : workScopeUID // ignore: cast_nullable_to_non_nullable
as String,workScopeCode: null == workScopeCode ? _self.workScopeCode : workScopeCode // ignore: cast_nullable_to_non_nullable
as String,workScopeName: null == workScopeName ? _self.workScopeName : workScopeName // ignore: cast_nullable_to_non_nullable
as String,selectedRoads: null == selectedRoads ? _self._selectedRoads : selectedRoads // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>,periods: null == periods ? _self._periods : periods // ignore: cast_nullable_to_non_nullable
as List<Map<String, String>>,periodStart: null == periodStart ? _self.periodStart : periodStart // ignore: cast_nullable_to_non_nullable
as DateTime,contractRelationUID: freezed == contractRelationUID ? _self.contractRelationUID : contractRelationUID // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
