// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'warning_details_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WarningDetailsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WarningDetailsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WarningDetailsState()';
}


}

/// @nodoc
class $WarningDetailsStateCopyWith<$Res>  {
$WarningDetailsStateCopyWith(WarningDetailsState _, $Res Function(WarningDetailsState) __);
}


/// Adds pattern-matching-related methods to [WarningDetailsState].
extension WarningDetailsStatePatterns on WarningDetailsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( WarningDetailsInitial value)?  initial,TResult Function( WarningDetailsLoading value)?  loading,TResult Function( WarningDetailsLoaded value)?  loaded,TResult Function( WarningDetailsError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case WarningDetailsInitial() when initial != null:
return initial(_that);case WarningDetailsLoading() when loading != null:
return loading(_that);case WarningDetailsLoaded() when loaded != null:
return loaded(_that);case WarningDetailsError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( WarningDetailsInitial value)  initial,required TResult Function( WarningDetailsLoading value)  loading,required TResult Function( WarningDetailsLoaded value)  loaded,required TResult Function( WarningDetailsError value)  error,}){
final _that = this;
switch (_that) {
case WarningDetailsInitial():
return initial(_that);case WarningDetailsLoading():
return loading(_that);case WarningDetailsLoaded():
return loaded(_that);case WarningDetailsError():
return error(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( WarningDetailsInitial value)?  initial,TResult? Function( WarningDetailsLoading value)?  loading,TResult? Function( WarningDetailsLoaded value)?  loaded,TResult? Function( WarningDetailsError value)?  error,}){
final _that = this;
switch (_that) {
case WarningDetailsInitial() when initial != null:
return initial(_that);case WarningDetailsLoading() when loading != null:
return loading(_that);case WarningDetailsLoaded() when loaded != null:
return loaded(_that);case WarningDetailsError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( Warning warning)?  loaded,TResult Function( Failure failure,  Warning? cachedWarning)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case WarningDetailsInitial() when initial != null:
return initial();case WarningDetailsLoading() when loading != null:
return loading();case WarningDetailsLoaded() when loaded != null:
return loaded(_that.warning);case WarningDetailsError() when error != null:
return error(_that.failure,_that.cachedWarning);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( Warning warning)  loaded,required TResult Function( Failure failure,  Warning? cachedWarning)  error,}) {final _that = this;
switch (_that) {
case WarningDetailsInitial():
return initial();case WarningDetailsLoading():
return loading();case WarningDetailsLoaded():
return loaded(_that.warning);case WarningDetailsError():
return error(_that.failure,_that.cachedWarning);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( Warning warning)?  loaded,TResult? Function( Failure failure,  Warning? cachedWarning)?  error,}) {final _that = this;
switch (_that) {
case WarningDetailsInitial() when initial != null:
return initial();case WarningDetailsLoading() when loading != null:
return loading();case WarningDetailsLoaded() when loaded != null:
return loaded(_that.warning);case WarningDetailsError() when error != null:
return error(_that.failure,_that.cachedWarning);case _:
  return null;

}
}

}

/// @nodoc


class WarningDetailsInitial implements WarningDetailsState {
  const WarningDetailsInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WarningDetailsInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WarningDetailsState.initial()';
}


}




/// @nodoc


class WarningDetailsLoading implements WarningDetailsState {
  const WarningDetailsLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WarningDetailsLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WarningDetailsState.loading()';
}


}




/// @nodoc


class WarningDetailsLoaded implements WarningDetailsState {
  const WarningDetailsLoaded({required this.warning});
  

 final  Warning warning;

/// Create a copy of WarningDetailsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WarningDetailsLoadedCopyWith<WarningDetailsLoaded> get copyWith => _$WarningDetailsLoadedCopyWithImpl<WarningDetailsLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WarningDetailsLoaded&&(identical(other.warning, warning) || other.warning == warning));
}


@override
int get hashCode => Object.hash(runtimeType,warning);

@override
String toString() {
  return 'WarningDetailsState.loaded(warning: $warning)';
}


}

/// @nodoc
abstract mixin class $WarningDetailsLoadedCopyWith<$Res> implements $WarningDetailsStateCopyWith<$Res> {
  factory $WarningDetailsLoadedCopyWith(WarningDetailsLoaded value, $Res Function(WarningDetailsLoaded) _then) = _$WarningDetailsLoadedCopyWithImpl;
@useResult
$Res call({
 Warning warning
});




}
/// @nodoc
class _$WarningDetailsLoadedCopyWithImpl<$Res>
    implements $WarningDetailsLoadedCopyWith<$Res> {
  _$WarningDetailsLoadedCopyWithImpl(this._self, this._then);

  final WarningDetailsLoaded _self;
  final $Res Function(WarningDetailsLoaded) _then;

/// Create a copy of WarningDetailsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? warning = null,}) {
  return _then(WarningDetailsLoaded(
warning: null == warning ? _self.warning : warning // ignore: cast_nullable_to_non_nullable
as Warning,
  ));
}


}

/// @nodoc


class WarningDetailsError implements WarningDetailsState {
  const WarningDetailsError({required this.failure, this.cachedWarning});
  

 final  Failure failure;
 final  Warning? cachedWarning;

/// Create a copy of WarningDetailsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WarningDetailsErrorCopyWith<WarningDetailsError> get copyWith => _$WarningDetailsErrorCopyWithImpl<WarningDetailsError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WarningDetailsError&&(identical(other.failure, failure) || other.failure == failure)&&(identical(other.cachedWarning, cachedWarning) || other.cachedWarning == cachedWarning));
}


@override
int get hashCode => Object.hash(runtimeType,failure,cachedWarning);

@override
String toString() {
  return 'WarningDetailsState.error(failure: $failure, cachedWarning: $cachedWarning)';
}


}

/// @nodoc
abstract mixin class $WarningDetailsErrorCopyWith<$Res> implements $WarningDetailsStateCopyWith<$Res> {
  factory $WarningDetailsErrorCopyWith(WarningDetailsError value, $Res Function(WarningDetailsError) _then) = _$WarningDetailsErrorCopyWithImpl;
@useResult
$Res call({
 Failure failure, Warning? cachedWarning
});




}
/// @nodoc
class _$WarningDetailsErrorCopyWithImpl<$Res>
    implements $WarningDetailsErrorCopyWith<$Res> {
  _$WarningDetailsErrorCopyWithImpl(this._self, this._then);

  final WarningDetailsError _self;
  final $Res Function(WarningDetailsError) _then;

/// Create a copy of WarningDetailsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failure = null,Object? cachedWarning = freezed,}) {
  return _then(WarningDetailsError(
failure: null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure,cachedWarning: freezed == cachedWarning ? _self.cachedWarning : cachedWarning // ignore: cast_nullable_to_non_nullable
as Warning?,
  ));
}


}

// dart format on
