// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'daily_report_view_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DailyReportViewState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DailyReportViewState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DailyReportViewState()';
}


}

/// @nodoc
class $DailyReportViewStateCopyWith<$Res>  {
$DailyReportViewStateCopyWith(DailyReportViewState _, $Res Function(DailyReportViewState) __);
}


/// Adds pattern-matching-related methods to [DailyReportViewState].
extension DailyReportViewStatePatterns on DailyReportViewState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( DailyReportViewInitial value)?  initial,TResult Function( DailyReportViewLoading value)?  loading,TResult Function( DailyReportViewLoaded value)?  loaded,TResult Function( DailyReportViewFailure value)?  failure,TResult Function( RoadsLoading value)?  roadsLoading,TResult Function( RoadsLoaded value)?  roadsLoaded,TResult Function( RoadsFailure value)?  roadsFailure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case DailyReportViewInitial() when initial != null:
return initial(_that);case DailyReportViewLoading() when loading != null:
return loading(_that);case DailyReportViewLoaded() when loaded != null:
return loaded(_that);case DailyReportViewFailure() when failure != null:
return failure(_that);case RoadsLoading() when roadsLoading != null:
return roadsLoading(_that);case RoadsLoaded() when roadsLoaded != null:
return roadsLoaded(_that);case RoadsFailure() when roadsFailure != null:
return roadsFailure(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( DailyReportViewInitial value)  initial,required TResult Function( DailyReportViewLoading value)  loading,required TResult Function( DailyReportViewLoaded value)  loaded,required TResult Function( DailyReportViewFailure value)  failure,required TResult Function( RoadsLoading value)  roadsLoading,required TResult Function( RoadsLoaded value)  roadsLoaded,required TResult Function( RoadsFailure value)  roadsFailure,}){
final _that = this;
switch (_that) {
case DailyReportViewInitial():
return initial(_that);case DailyReportViewLoading():
return loading(_that);case DailyReportViewLoaded():
return loaded(_that);case DailyReportViewFailure():
return failure(_that);case RoadsLoading():
return roadsLoading(_that);case RoadsLoaded():
return roadsLoaded(_that);case RoadsFailure():
return roadsFailure(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( DailyReportViewInitial value)?  initial,TResult? Function( DailyReportViewLoading value)?  loading,TResult? Function( DailyReportViewLoaded value)?  loaded,TResult? Function( DailyReportViewFailure value)?  failure,TResult? Function( RoadsLoading value)?  roadsLoading,TResult? Function( RoadsLoaded value)?  roadsLoaded,TResult? Function( RoadsFailure value)?  roadsFailure,}){
final _that = this;
switch (_that) {
case DailyReportViewInitial() when initial != null:
return initial(_that);case DailyReportViewLoading() when loading != null:
return loading(_that);case DailyReportViewLoaded() when loaded != null:
return loaded(_that);case DailyReportViewFailure() when failure != null:
return failure(_that);case RoadsLoading() when roadsLoading != null:
return roadsLoading(_that);case RoadsLoaded() when roadsLoaded != null:
return roadsLoaded(_that);case RoadsFailure() when roadsFailure != null:
return roadsFailure(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<DailyReport> reports)?  loaded,TResult Function( String message)?  failure,TResult Function()?  roadsLoading,TResult Function( List<Road> roads,  Road? selectedRoad,  String? currentSection,  String? sectionError)?  roadsLoaded,TResult Function( String message)?  roadsFailure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case DailyReportViewInitial() when initial != null:
return initial();case DailyReportViewLoading() when loading != null:
return loading();case DailyReportViewLoaded() when loaded != null:
return loaded(_that.reports);case DailyReportViewFailure() when failure != null:
return failure(_that.message);case RoadsLoading() when roadsLoading != null:
return roadsLoading();case RoadsLoaded() when roadsLoaded != null:
return roadsLoaded(_that.roads,_that.selectedRoad,_that.currentSection,_that.sectionError);case RoadsFailure() when roadsFailure != null:
return roadsFailure(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<DailyReport> reports)  loaded,required TResult Function( String message)  failure,required TResult Function()  roadsLoading,required TResult Function( List<Road> roads,  Road? selectedRoad,  String? currentSection,  String? sectionError)  roadsLoaded,required TResult Function( String message)  roadsFailure,}) {final _that = this;
switch (_that) {
case DailyReportViewInitial():
return initial();case DailyReportViewLoading():
return loading();case DailyReportViewLoaded():
return loaded(_that.reports);case DailyReportViewFailure():
return failure(_that.message);case RoadsLoading():
return roadsLoading();case RoadsLoaded():
return roadsLoaded(_that.roads,_that.selectedRoad,_that.currentSection,_that.sectionError);case RoadsFailure():
return roadsFailure(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<DailyReport> reports)?  loaded,TResult? Function( String message)?  failure,TResult? Function()?  roadsLoading,TResult? Function( List<Road> roads,  Road? selectedRoad,  String? currentSection,  String? sectionError)?  roadsLoaded,TResult? Function( String message)?  roadsFailure,}) {final _that = this;
switch (_that) {
case DailyReportViewInitial() when initial != null:
return initial();case DailyReportViewLoading() when loading != null:
return loading();case DailyReportViewLoaded() when loaded != null:
return loaded(_that.reports);case DailyReportViewFailure() when failure != null:
return failure(_that.message);case RoadsLoading() when roadsLoading != null:
return roadsLoading();case RoadsLoaded() when roadsLoaded != null:
return roadsLoaded(_that.roads,_that.selectedRoad,_that.currentSection,_that.sectionError);case RoadsFailure() when roadsFailure != null:
return roadsFailure(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class DailyReportViewInitial implements DailyReportViewState {
  const DailyReportViewInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DailyReportViewInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DailyReportViewState.initial()';
}


}




/// @nodoc


class DailyReportViewLoading implements DailyReportViewState {
  const DailyReportViewLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DailyReportViewLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DailyReportViewState.loading()';
}


}




/// @nodoc


class DailyReportViewLoaded implements DailyReportViewState {
  const DailyReportViewLoaded(final  List<DailyReport> reports): _reports = reports;
  

 final  List<DailyReport> _reports;
 List<DailyReport> get reports {
  if (_reports is EqualUnmodifiableListView) return _reports;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_reports);
}


/// Create a copy of DailyReportViewState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DailyReportViewLoadedCopyWith<DailyReportViewLoaded> get copyWith => _$DailyReportViewLoadedCopyWithImpl<DailyReportViewLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DailyReportViewLoaded&&const DeepCollectionEquality().equals(other._reports, _reports));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_reports));

@override
String toString() {
  return 'DailyReportViewState.loaded(reports: $reports)';
}


}

/// @nodoc
abstract mixin class $DailyReportViewLoadedCopyWith<$Res> implements $DailyReportViewStateCopyWith<$Res> {
  factory $DailyReportViewLoadedCopyWith(DailyReportViewLoaded value, $Res Function(DailyReportViewLoaded) _then) = _$DailyReportViewLoadedCopyWithImpl;
@useResult
$Res call({
 List<DailyReport> reports
});




}
/// @nodoc
class _$DailyReportViewLoadedCopyWithImpl<$Res>
    implements $DailyReportViewLoadedCopyWith<$Res> {
  _$DailyReportViewLoadedCopyWithImpl(this._self, this._then);

  final DailyReportViewLoaded _self;
  final $Res Function(DailyReportViewLoaded) _then;

/// Create a copy of DailyReportViewState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? reports = null,}) {
  return _then(DailyReportViewLoaded(
null == reports ? _self._reports : reports // ignore: cast_nullable_to_non_nullable
as List<DailyReport>,
  ));
}


}

/// @nodoc


class DailyReportViewFailure implements DailyReportViewState {
  const DailyReportViewFailure(this.message);
  

 final  String message;

/// Create a copy of DailyReportViewState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DailyReportViewFailureCopyWith<DailyReportViewFailure> get copyWith => _$DailyReportViewFailureCopyWithImpl<DailyReportViewFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DailyReportViewFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'DailyReportViewState.failure(message: $message)';
}


}

/// @nodoc
abstract mixin class $DailyReportViewFailureCopyWith<$Res> implements $DailyReportViewStateCopyWith<$Res> {
  factory $DailyReportViewFailureCopyWith(DailyReportViewFailure value, $Res Function(DailyReportViewFailure) _then) = _$DailyReportViewFailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$DailyReportViewFailureCopyWithImpl<$Res>
    implements $DailyReportViewFailureCopyWith<$Res> {
  _$DailyReportViewFailureCopyWithImpl(this._self, this._then);

  final DailyReportViewFailure _self;
  final $Res Function(DailyReportViewFailure) _then;

/// Create a copy of DailyReportViewState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(DailyReportViewFailure(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class RoadsLoading implements DailyReportViewState {
  const RoadsLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RoadsLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DailyReportViewState.roadsLoading()';
}


}




/// @nodoc


class RoadsLoaded implements DailyReportViewState {
  const RoadsLoaded({required final  List<Road> roads, this.selectedRoad, this.currentSection, this.sectionError}): _roads = roads;
  

 final  List<Road> _roads;
 List<Road> get roads {
  if (_roads is EqualUnmodifiableListView) return _roads;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_roads);
}

 final  Road? selectedRoad;
 final  String? currentSection;
 final  String? sectionError;

/// Create a copy of DailyReportViewState
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
  return 'DailyReportViewState.roadsLoaded(roads: $roads, selectedRoad: $selectedRoad, currentSection: $currentSection, sectionError: $sectionError)';
}


}

/// @nodoc
abstract mixin class $RoadsLoadedCopyWith<$Res> implements $DailyReportViewStateCopyWith<$Res> {
  factory $RoadsLoadedCopyWith(RoadsLoaded value, $Res Function(RoadsLoaded) _then) = _$RoadsLoadedCopyWithImpl;
@useResult
$Res call({
 List<Road> roads, Road? selectedRoad, String? currentSection, String? sectionError
});




}
/// @nodoc
class _$RoadsLoadedCopyWithImpl<$Res>
    implements $RoadsLoadedCopyWith<$Res> {
  _$RoadsLoadedCopyWithImpl(this._self, this._then);

  final RoadsLoaded _self;
  final $Res Function(RoadsLoaded) _then;

/// Create a copy of DailyReportViewState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? roads = null,Object? selectedRoad = freezed,Object? currentSection = freezed,Object? sectionError = freezed,}) {
  return _then(RoadsLoaded(
roads: null == roads ? _self._roads : roads // ignore: cast_nullable_to_non_nullable
as List<Road>,selectedRoad: freezed == selectedRoad ? _self.selectedRoad : selectedRoad // ignore: cast_nullable_to_non_nullable
as Road?,currentSection: freezed == currentSection ? _self.currentSection : currentSection // ignore: cast_nullable_to_non_nullable
as String?,sectionError: freezed == sectionError ? _self.sectionError : sectionError // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class RoadsFailure implements DailyReportViewState {
  const RoadsFailure(this.message);
  

 final  String message;

/// Create a copy of DailyReportViewState
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
  return 'DailyReportViewState.roadsFailure(message: $message)';
}


}

/// @nodoc
abstract mixin class $RoadsFailureCopyWith<$Res> implements $DailyReportViewStateCopyWith<$Res> {
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

/// Create a copy of DailyReportViewState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(RoadsFailure(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
