// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'work_scope_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WorkScopeState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WorkScopeState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WorkScopeState()';
}


}

/// @nodoc
class $WorkScopeStateCopyWith<$Res>  {
$WorkScopeStateCopyWith(WorkScopeState _, $Res Function(WorkScopeState) __);
}


/// Adds pattern-matching-related methods to [WorkScopeState].
extension WorkScopeStatePatterns on WorkScopeState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( WorkScopeInitial value)?  initial,TResult Function( WorkScopeLoading value)?  loading,TResult Function( WorkScopeLoaded value)?  loaded,TResult Function( WorkScopeError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case WorkScopeInitial() when initial != null:
return initial(_that);case WorkScopeLoading() when loading != null:
return loading(_that);case WorkScopeLoaded() when loaded != null:
return loaded(_that);case WorkScopeError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( WorkScopeInitial value)  initial,required TResult Function( WorkScopeLoading value)  loading,required TResult Function( WorkScopeLoaded value)  loaded,required TResult Function( WorkScopeError value)  error,}){
final _that = this;
switch (_that) {
case WorkScopeInitial():
return initial(_that);case WorkScopeLoading():
return loading(_that);case WorkScopeLoaded():
return loaded(_that);case WorkScopeError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( WorkScopeInitial value)?  initial,TResult? Function( WorkScopeLoading value)?  loading,TResult? Function( WorkScopeLoaded value)?  loaded,TResult? Function( WorkScopeError value)?  error,}){
final _that = this;
switch (_that) {
case WorkScopeInitial() when initial != null:
return initial(_that);case WorkScopeLoading() when loading != null:
return loading(_that);case WorkScopeLoaded() when loaded != null:
return loaded(_that);case WorkScopeError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<WorkScope> workScopes)?  loaded,TResult Function( Failure failure)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case WorkScopeInitial() when initial != null:
return initial();case WorkScopeLoading() when loading != null:
return loading();case WorkScopeLoaded() when loaded != null:
return loaded(_that.workScopes);case WorkScopeError() when error != null:
return error(_that.failure);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<WorkScope> workScopes)  loaded,required TResult Function( Failure failure)  error,}) {final _that = this;
switch (_that) {
case WorkScopeInitial():
return initial();case WorkScopeLoading():
return loading();case WorkScopeLoaded():
return loaded(_that.workScopes);case WorkScopeError():
return error(_that.failure);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<WorkScope> workScopes)?  loaded,TResult? Function( Failure failure)?  error,}) {final _that = this;
switch (_that) {
case WorkScopeInitial() when initial != null:
return initial();case WorkScopeLoading() when loading != null:
return loading();case WorkScopeLoaded() when loaded != null:
return loaded(_that.workScopes);case WorkScopeError() when error != null:
return error(_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class WorkScopeInitial implements WorkScopeState {
  const WorkScopeInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WorkScopeInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WorkScopeState.initial()';
}


}




/// @nodoc


class WorkScopeLoading implements WorkScopeState {
  const WorkScopeLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WorkScopeLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WorkScopeState.loading()';
}


}




/// @nodoc


class WorkScopeLoaded implements WorkScopeState {
  const WorkScopeLoaded(final  List<WorkScope> workScopes): _workScopes = workScopes;
  

 final  List<WorkScope> _workScopes;
 List<WorkScope> get workScopes {
  if (_workScopes is EqualUnmodifiableListView) return _workScopes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_workScopes);
}


/// Create a copy of WorkScopeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WorkScopeLoadedCopyWith<WorkScopeLoaded> get copyWith => _$WorkScopeLoadedCopyWithImpl<WorkScopeLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WorkScopeLoaded&&const DeepCollectionEquality().equals(other._workScopes, _workScopes));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_workScopes));

@override
String toString() {
  return 'WorkScopeState.loaded(workScopes: $workScopes)';
}


}

/// @nodoc
abstract mixin class $WorkScopeLoadedCopyWith<$Res> implements $WorkScopeStateCopyWith<$Res> {
  factory $WorkScopeLoadedCopyWith(WorkScopeLoaded value, $Res Function(WorkScopeLoaded) _then) = _$WorkScopeLoadedCopyWithImpl;
@useResult
$Res call({
 List<WorkScope> workScopes
});




}
/// @nodoc
class _$WorkScopeLoadedCopyWithImpl<$Res>
    implements $WorkScopeLoadedCopyWith<$Res> {
  _$WorkScopeLoadedCopyWithImpl(this._self, this._then);

  final WorkScopeLoaded _self;
  final $Res Function(WorkScopeLoaded) _then;

/// Create a copy of WorkScopeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? workScopes = null,}) {
  return _then(WorkScopeLoaded(
null == workScopes ? _self._workScopes : workScopes // ignore: cast_nullable_to_non_nullable
as List<WorkScope>,
  ));
}


}

/// @nodoc


class WorkScopeError implements WorkScopeState {
  const WorkScopeError(this.failure);
  

 final  Failure failure;

/// Create a copy of WorkScopeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WorkScopeErrorCopyWith<WorkScopeError> get copyWith => _$WorkScopeErrorCopyWithImpl<WorkScopeError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WorkScopeError&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,failure);

@override
String toString() {
  return 'WorkScopeState.error(failure: $failure)';
}


}

/// @nodoc
abstract mixin class $WorkScopeErrorCopyWith<$Res> implements $WorkScopeStateCopyWith<$Res> {
  factory $WorkScopeErrorCopyWith(WorkScopeError value, $Res Function(WorkScopeError) _then) = _$WorkScopeErrorCopyWithImpl;
@useResult
$Res call({
 Failure failure
});




}
/// @nodoc
class _$WorkScopeErrorCopyWithImpl<$Res>
    implements $WorkScopeErrorCopyWith<$Res> {
  _$WorkScopeErrorCopyWithImpl(this._self, this._then);

  final WorkScopeError _self;
  final $Res Function(WorkScopeError) _then;

/// Create a copy of WorkScopeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failure = null,}) {
  return _then(WorkScopeError(
null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure,
  ));
}


}

// dart format on
