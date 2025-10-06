// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'daily_report_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DailyReportState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DailyReportState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DailyReportState()';
}


}

/// @nodoc
class $DailyReportStateCopyWith<$Res>  {
$DailyReportStateCopyWith(DailyReportState _, $Res Function(DailyReportState) __);
}


/// Adds pattern-matching-related methods to [DailyReportState].
extension DailyReportStatePatterns on DailyReportState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( DailyReportInitial value)?  initial,TResult Function( DailyReportLoading value)?  loading,TResult Function( DailyReportLoaded value)?  loaded,TResult Function( DailyReportFailure value)?  failure,TResult Function( RoadsLoading value)?  roadsLoading,TResult Function( RoadsLoaded value)?  roadsLoaded,TResult Function( RoadsFailure value)?  roadsFailure,TResult Function( EquipmentsLoading value)?  equipmentsLoading,TResult Function( EquipmentsLoaded value)?  equipmentsLoaded,TResult Function( EquipmentsFailure value)?  equipmentsFailure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case DailyReportInitial() when initial != null:
return initial(_that);case DailyReportLoading() when loading != null:
return loading(_that);case DailyReportLoaded() when loaded != null:
return loaded(_that);case DailyReportFailure() when failure != null:
return failure(_that);case RoadsLoading() when roadsLoading != null:
return roadsLoading(_that);case RoadsLoaded() when roadsLoaded != null:
return roadsLoaded(_that);case RoadsFailure() when roadsFailure != null:
return roadsFailure(_that);case EquipmentsLoading() when equipmentsLoading != null:
return equipmentsLoading(_that);case EquipmentsLoaded() when equipmentsLoaded != null:
return equipmentsLoaded(_that);case EquipmentsFailure() when equipmentsFailure != null:
return equipmentsFailure(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( DailyReportInitial value)  initial,required TResult Function( DailyReportLoading value)  loading,required TResult Function( DailyReportLoaded value)  loaded,required TResult Function( DailyReportFailure value)  failure,required TResult Function( RoadsLoading value)  roadsLoading,required TResult Function( RoadsLoaded value)  roadsLoaded,required TResult Function( RoadsFailure value)  roadsFailure,required TResult Function( EquipmentsLoading value)  equipmentsLoading,required TResult Function( EquipmentsLoaded value)  equipmentsLoaded,required TResult Function( EquipmentsFailure value)  equipmentsFailure,}){
final _that = this;
switch (_that) {
case DailyReportInitial():
return initial(_that);case DailyReportLoading():
return loading(_that);case DailyReportLoaded():
return loaded(_that);case DailyReportFailure():
return failure(_that);case RoadsLoading():
return roadsLoading(_that);case RoadsLoaded():
return roadsLoaded(_that);case RoadsFailure():
return roadsFailure(_that);case EquipmentsLoading():
return equipmentsLoading(_that);case EquipmentsLoaded():
return equipmentsLoaded(_that);case EquipmentsFailure():
return equipmentsFailure(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( DailyReportInitial value)?  initial,TResult? Function( DailyReportLoading value)?  loading,TResult? Function( DailyReportLoaded value)?  loaded,TResult? Function( DailyReportFailure value)?  failure,TResult? Function( RoadsLoading value)?  roadsLoading,TResult? Function( RoadsLoaded value)?  roadsLoaded,TResult? Function( RoadsFailure value)?  roadsFailure,TResult? Function( EquipmentsLoading value)?  equipmentsLoading,TResult? Function( EquipmentsLoaded value)?  equipmentsLoaded,TResult? Function( EquipmentsFailure value)?  equipmentsFailure,}){
final _that = this;
switch (_that) {
case DailyReportInitial() when initial != null:
return initial(_that);case DailyReportLoading() when loading != null:
return loading(_that);case DailyReportLoaded() when loaded != null:
return loaded(_that);case DailyReportFailure() when failure != null:
return failure(_that);case RoadsLoading() when roadsLoading != null:
return roadsLoading(_that);case RoadsLoaded() when roadsLoaded != null:
return roadsLoaded(_that);case RoadsFailure() when roadsFailure != null:
return roadsFailure(_that);case EquipmentsLoading() when equipmentsLoading != null:
return equipmentsLoading(_that);case EquipmentsLoaded() when equipmentsLoaded != null:
return equipmentsLoaded(_that);case EquipmentsFailure() when equipmentsFailure != null:
return equipmentsFailure(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<DailyReportResponse> reports)?  loaded,TResult Function( String message)?  failure,TResult Function()?  roadsLoading,TResult Function( List<RoadEdit> roads,  RoadEdit? selectedRoad,  String? currentSection,  String? sectionError)?  roadsLoaded,TResult Function( String message)?  roadsFailure,TResult Function()?  equipmentsLoading,TResult Function( List<WorkEquipment> equipments,  List<String> selectedEquipmentUids)?  equipmentsLoaded,TResult Function( String message)?  equipmentsFailure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case DailyReportInitial() when initial != null:
return initial();case DailyReportLoading() when loading != null:
return loading();case DailyReportLoaded() when loaded != null:
return loaded(_that.reports);case DailyReportFailure() when failure != null:
return failure(_that.message);case RoadsLoading() when roadsLoading != null:
return roadsLoading();case RoadsLoaded() when roadsLoaded != null:
return roadsLoaded(_that.roads,_that.selectedRoad,_that.currentSection,_that.sectionError);case RoadsFailure() when roadsFailure != null:
return roadsFailure(_that.message);case EquipmentsLoading() when equipmentsLoading != null:
return equipmentsLoading();case EquipmentsLoaded() when equipmentsLoaded != null:
return equipmentsLoaded(_that.equipments,_that.selectedEquipmentUids);case EquipmentsFailure() when equipmentsFailure != null:
return equipmentsFailure(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<DailyReportResponse> reports)  loaded,required TResult Function( String message)  failure,required TResult Function()  roadsLoading,required TResult Function( List<RoadEdit> roads,  RoadEdit? selectedRoad,  String? currentSection,  String? sectionError)  roadsLoaded,required TResult Function( String message)  roadsFailure,required TResult Function()  equipmentsLoading,required TResult Function( List<WorkEquipment> equipments,  List<String> selectedEquipmentUids)  equipmentsLoaded,required TResult Function( String message)  equipmentsFailure,}) {final _that = this;
switch (_that) {
case DailyReportInitial():
return initial();case DailyReportLoading():
return loading();case DailyReportLoaded():
return loaded(_that.reports);case DailyReportFailure():
return failure(_that.message);case RoadsLoading():
return roadsLoading();case RoadsLoaded():
return roadsLoaded(_that.roads,_that.selectedRoad,_that.currentSection,_that.sectionError);case RoadsFailure():
return roadsFailure(_that.message);case EquipmentsLoading():
return equipmentsLoading();case EquipmentsLoaded():
return equipmentsLoaded(_that.equipments,_that.selectedEquipmentUids);case EquipmentsFailure():
return equipmentsFailure(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<DailyReportResponse> reports)?  loaded,TResult? Function( String message)?  failure,TResult? Function()?  roadsLoading,TResult? Function( List<RoadEdit> roads,  RoadEdit? selectedRoad,  String? currentSection,  String? sectionError)?  roadsLoaded,TResult? Function( String message)?  roadsFailure,TResult? Function()?  equipmentsLoading,TResult? Function( List<WorkEquipment> equipments,  List<String> selectedEquipmentUids)?  equipmentsLoaded,TResult? Function( String message)?  equipmentsFailure,}) {final _that = this;
switch (_that) {
case DailyReportInitial() when initial != null:
return initial();case DailyReportLoading() when loading != null:
return loading();case DailyReportLoaded() when loaded != null:
return loaded(_that.reports);case DailyReportFailure() when failure != null:
return failure(_that.message);case RoadsLoading() when roadsLoading != null:
return roadsLoading();case RoadsLoaded() when roadsLoaded != null:
return roadsLoaded(_that.roads,_that.selectedRoad,_that.currentSection,_that.sectionError);case RoadsFailure() when roadsFailure != null:
return roadsFailure(_that.message);case EquipmentsLoading() when equipmentsLoading != null:
return equipmentsLoading();case EquipmentsLoaded() when equipmentsLoaded != null:
return equipmentsLoaded(_that.equipments,_that.selectedEquipmentUids);case EquipmentsFailure() when equipmentsFailure != null:
return equipmentsFailure(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class DailyReportInitial implements DailyReportState {
  const DailyReportInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DailyReportInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DailyReportState.initial()';
}


}




/// @nodoc


class DailyReportLoading implements DailyReportState {
  const DailyReportLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DailyReportLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DailyReportState.loading()';
}


}




/// @nodoc


class DailyReportLoaded implements DailyReportState {
  const DailyReportLoaded(final  List<DailyReportResponse> reports): _reports = reports;
  

 final  List<DailyReportResponse> _reports;
 List<DailyReportResponse> get reports {
  if (_reports is EqualUnmodifiableListView) return _reports;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_reports);
}


/// Create a copy of DailyReportState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DailyReportLoadedCopyWith<DailyReportLoaded> get copyWith => _$DailyReportLoadedCopyWithImpl<DailyReportLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DailyReportLoaded&&const DeepCollectionEquality().equals(other._reports, _reports));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_reports));

@override
String toString() {
  return 'DailyReportState.loaded(reports: $reports)';
}


}

/// @nodoc
abstract mixin class $DailyReportLoadedCopyWith<$Res> implements $DailyReportStateCopyWith<$Res> {
  factory $DailyReportLoadedCopyWith(DailyReportLoaded value, $Res Function(DailyReportLoaded) _then) = _$DailyReportLoadedCopyWithImpl;
@useResult
$Res call({
 List<DailyReportResponse> reports
});




}
/// @nodoc
class _$DailyReportLoadedCopyWithImpl<$Res>
    implements $DailyReportLoadedCopyWith<$Res> {
  _$DailyReportLoadedCopyWithImpl(this._self, this._then);

  final DailyReportLoaded _self;
  final $Res Function(DailyReportLoaded) _then;

/// Create a copy of DailyReportState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? reports = null,}) {
  return _then(DailyReportLoaded(
null == reports ? _self._reports : reports // ignore: cast_nullable_to_non_nullable
as List<DailyReportResponse>,
  ));
}


}

/// @nodoc


class DailyReportFailure implements DailyReportState {
  const DailyReportFailure(this.message);
  

 final  String message;

/// Create a copy of DailyReportState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DailyReportFailureCopyWith<DailyReportFailure> get copyWith => _$DailyReportFailureCopyWithImpl<DailyReportFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DailyReportFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'DailyReportState.failure(message: $message)';
}


}

/// @nodoc
abstract mixin class $DailyReportFailureCopyWith<$Res> implements $DailyReportStateCopyWith<$Res> {
  factory $DailyReportFailureCopyWith(DailyReportFailure value, $Res Function(DailyReportFailure) _then) = _$DailyReportFailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$DailyReportFailureCopyWithImpl<$Res>
    implements $DailyReportFailureCopyWith<$Res> {
  _$DailyReportFailureCopyWithImpl(this._self, this._then);

  final DailyReportFailure _self;
  final $Res Function(DailyReportFailure) _then;

/// Create a copy of DailyReportState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(DailyReportFailure(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class RoadsLoading implements DailyReportState {
  const RoadsLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RoadsLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DailyReportState.roadsLoading()';
}


}




/// @nodoc


class RoadsLoaded implements DailyReportState {
  const RoadsLoaded({required final  List<RoadEdit> roads, this.selectedRoad, this.currentSection, this.sectionError}): _roads = roads;
  

 final  List<RoadEdit> _roads;
 List<RoadEdit> get roads {
  if (_roads is EqualUnmodifiableListView) return _roads;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_roads);
}

 final  RoadEdit? selectedRoad;
 final  String? currentSection;
 final  String? sectionError;

/// Create a copy of DailyReportState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RoadsLoadedCopyWith<RoadsLoaded> get copyWith => _$RoadsLoadedCopyWithImpl<RoadsLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RoadsLoaded&&const DeepCollectionEquality().equals(other._roads, _roads)&&(identical(other.selectedRoad, selectedRoad) || other.selectedRoad == selectedRoad)&&(identical(other.currentSection, currentSection) || other.currentSection == currentSection)&&(identical(other.sectionError, sectionError) || other.sectionError == sectionError));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_roads),selectedRoad,currentSection,sectionError);

@override
String toString() {
  return 'DailyReportState.roadsLoaded(roads: $roads, selectedRoad: $selectedRoad, currentSection: $currentSection, sectionError: $sectionError)';
}


}

/// @nodoc
abstract mixin class $RoadsLoadedCopyWith<$Res> implements $DailyReportStateCopyWith<$Res> {
  factory $RoadsLoadedCopyWith(RoadsLoaded value, $Res Function(RoadsLoaded) _then) = _$RoadsLoadedCopyWithImpl;
@useResult
$Res call({
 List<RoadEdit> roads, RoadEdit? selectedRoad, String? currentSection, String? sectionError
});




}
/// @nodoc
class _$RoadsLoadedCopyWithImpl<$Res>
    implements $RoadsLoadedCopyWith<$Res> {
  _$RoadsLoadedCopyWithImpl(this._self, this._then);

  final RoadsLoaded _self;
  final $Res Function(RoadsLoaded) _then;

/// Create a copy of DailyReportState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? roads = null,Object? selectedRoad = freezed,Object? currentSection = freezed,Object? sectionError = freezed,}) {
  return _then(RoadsLoaded(
roads: null == roads ? _self._roads : roads // ignore: cast_nullable_to_non_nullable
as List<RoadEdit>,selectedRoad: freezed == selectedRoad ? _self.selectedRoad : selectedRoad // ignore: cast_nullable_to_non_nullable
as RoadEdit?,currentSection: freezed == currentSection ? _self.currentSection : currentSection // ignore: cast_nullable_to_non_nullable
as String?,sectionError: freezed == sectionError ? _self.sectionError : sectionError // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class RoadsFailure implements DailyReportState {
  const RoadsFailure(this.message);
  

 final  String message;

/// Create a copy of DailyReportState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RoadsFailureCopyWith<RoadsFailure> get copyWith => _$RoadsFailureCopyWithImpl<RoadsFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RoadsFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'DailyReportState.roadsFailure(message: $message)';
}


}

/// @nodoc
abstract mixin class $RoadsFailureCopyWith<$Res> implements $DailyReportStateCopyWith<$Res> {
  factory $RoadsFailureCopyWith(RoadsFailure value, $Res Function(RoadsFailure) _then) = _$RoadsFailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$RoadsFailureCopyWithImpl<$Res>
    implements $RoadsFailureCopyWith<$Res> {
  _$RoadsFailureCopyWithImpl(this._self, this._then);

  final RoadsFailure _self;
  final $Res Function(RoadsFailure) _then;

/// Create a copy of DailyReportState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(RoadsFailure(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class EquipmentsLoading implements DailyReportState {
  const EquipmentsLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EquipmentsLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DailyReportState.equipmentsLoading()';
}


}




/// @nodoc


class EquipmentsLoaded implements DailyReportState {
  const EquipmentsLoaded({required final  List<WorkEquipment> equipments, required final  List<String> selectedEquipmentUids}): _equipments = equipments,_selectedEquipmentUids = selectedEquipmentUids;
  

 final  List<WorkEquipment> _equipments;
 List<WorkEquipment> get equipments {
  if (_equipments is EqualUnmodifiableListView) return _equipments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_equipments);
}

 final  List<String> _selectedEquipmentUids;
 List<String> get selectedEquipmentUids {
  if (_selectedEquipmentUids is EqualUnmodifiableListView) return _selectedEquipmentUids;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_selectedEquipmentUids);
}


/// Create a copy of DailyReportState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EquipmentsLoadedCopyWith<EquipmentsLoaded> get copyWith => _$EquipmentsLoadedCopyWithImpl<EquipmentsLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EquipmentsLoaded&&const DeepCollectionEquality().equals(other._equipments, _equipments)&&const DeepCollectionEquality().equals(other._selectedEquipmentUids, _selectedEquipmentUids));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_equipments),const DeepCollectionEquality().hash(_selectedEquipmentUids));

@override
String toString() {
  return 'DailyReportState.equipmentsLoaded(equipments: $equipments, selectedEquipmentUids: $selectedEquipmentUids)';
}


}

/// @nodoc
abstract mixin class $EquipmentsLoadedCopyWith<$Res> implements $DailyReportStateCopyWith<$Res> {
  factory $EquipmentsLoadedCopyWith(EquipmentsLoaded value, $Res Function(EquipmentsLoaded) _then) = _$EquipmentsLoadedCopyWithImpl;
@useResult
$Res call({
 List<WorkEquipment> equipments, List<String> selectedEquipmentUids
});




}
/// @nodoc
class _$EquipmentsLoadedCopyWithImpl<$Res>
    implements $EquipmentsLoadedCopyWith<$Res> {
  _$EquipmentsLoadedCopyWithImpl(this._self, this._then);

  final EquipmentsLoaded _self;
  final $Res Function(EquipmentsLoaded) _then;

/// Create a copy of DailyReportState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? equipments = null,Object? selectedEquipmentUids = null,}) {
  return _then(EquipmentsLoaded(
equipments: null == equipments ? _self._equipments : equipments // ignore: cast_nullable_to_non_nullable
as List<WorkEquipment>,selectedEquipmentUids: null == selectedEquipmentUids ? _self._selectedEquipmentUids : selectedEquipmentUids // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

/// @nodoc


class EquipmentsFailure implements DailyReportState {
  const EquipmentsFailure(this.message);
  

 final  String message;

/// Create a copy of DailyReportState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EquipmentsFailureCopyWith<EquipmentsFailure> get copyWith => _$EquipmentsFailureCopyWithImpl<EquipmentsFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EquipmentsFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'DailyReportState.equipmentsFailure(message: $message)';
}


}

/// @nodoc
abstract mixin class $EquipmentsFailureCopyWith<$Res> implements $DailyReportStateCopyWith<$Res> {
  factory $EquipmentsFailureCopyWith(EquipmentsFailure value, $Res Function(EquipmentsFailure) _then) = _$EquipmentsFailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$EquipmentsFailureCopyWithImpl<$Res>
    implements $EquipmentsFailureCopyWith<$Res> {
  _$EquipmentsFailureCopyWithImpl(this._self, this._then);

  final EquipmentsFailure _self;
  final $Res Function(EquipmentsFailure) _then;

/// Create a copy of DailyReportState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(EquipmentsFailure(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
