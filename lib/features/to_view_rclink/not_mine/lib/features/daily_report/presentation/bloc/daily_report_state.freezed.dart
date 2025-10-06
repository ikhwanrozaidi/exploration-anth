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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( DailyReportInitial value)?  initial,TResult Function( DailyReportLoading value)?  loading,TResult Function( DailyReportLoaded value)?  loaded,TResult Function( DailyReportFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case DailyReportInitial() when initial != null:
return initial(_that);case DailyReportLoading() when loading != null:
return loading(_that);case DailyReportLoaded() when loaded != null:
return loaded(_that);case DailyReportFailure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( DailyReportInitial value)  initial,required TResult Function( DailyReportLoading value)  loading,required TResult Function( DailyReportLoaded value)  loaded,required TResult Function( DailyReportFailure value)  failure,}){
final _that = this;
switch (_that) {
case DailyReportInitial():
return initial(_that);case DailyReportLoading():
return loading(_that);case DailyReportLoaded():
return loaded(_that);case DailyReportFailure():
return failure(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( DailyReportInitial value)?  initial,TResult? Function( DailyReportLoading value)?  loading,TResult? Function( DailyReportLoaded value)?  loaded,TResult? Function( DailyReportFailure value)?  failure,}){
final _that = this;
switch (_that) {
case DailyReportInitial() when initial != null:
return initial(_that);case DailyReportLoading() when loading != null:
return loading(_that);case DailyReportLoaded() when loaded != null:
return loaded(_that);case DailyReportFailure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<DailyReport> reports)?  loaded,TResult Function( String message)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case DailyReportInitial() when initial != null:
return initial();case DailyReportLoading() when loading != null:
return loading();case DailyReportLoaded() when loaded != null:
return loaded(_that.reports);case DailyReportFailure() when failure != null:
return failure(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<DailyReport> reports)  loaded,required TResult Function( String message)  failure,}) {final _that = this;
switch (_that) {
case DailyReportInitial():
return initial();case DailyReportLoading():
return loading();case DailyReportLoaded():
return loaded(_that.reports);case DailyReportFailure():
return failure(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<DailyReport> reports)?  loaded,TResult? Function( String message)?  failure,}) {final _that = this;
switch (_that) {
case DailyReportInitial() when initial != null:
return initial();case DailyReportLoading() when loading != null:
return loading();case DailyReportLoaded() when loaded != null:
return loaded(_that.reports);case DailyReportFailure() when failure != null:
return failure(_that.message);case _:
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
  const DailyReportLoaded(final  List<DailyReport> reports): _reports = reports;
  

 final  List<DailyReport> _reports;
 List<DailyReport> get reports {
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
 List<DailyReport> reports
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
as List<DailyReport>,
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

// dart format on
