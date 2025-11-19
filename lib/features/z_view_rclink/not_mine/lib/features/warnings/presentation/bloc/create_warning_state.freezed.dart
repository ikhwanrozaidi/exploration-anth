// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_warning_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CreateWarningState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateWarningState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CreateWarningState()';
}


}

/// @nodoc
class $CreateWarningStateCopyWith<$Res>  {
$CreateWarningStateCopyWith(CreateWarningState _, $Res Function(CreateWarningState) __);
}


/// Adds pattern-matching-related methods to [CreateWarningState].
extension CreateWarningStatePatterns on CreateWarningState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( CreateWarningInitial value)?  initial,TResult Function( CreateWarningLoading value)?  loading,TResult Function( CreateWarningSuccess value)?  success,TResult Function( CreateWarningError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case CreateWarningInitial() when initial != null:
return initial(_that);case CreateWarningLoading() when loading != null:
return loading(_that);case CreateWarningSuccess() when success != null:
return success(_that);case CreateWarningError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( CreateWarningInitial value)  initial,required TResult Function( CreateWarningLoading value)  loading,required TResult Function( CreateWarningSuccess value)  success,required TResult Function( CreateWarningError value)  error,}){
final _that = this;
switch (_that) {
case CreateWarningInitial():
return initial(_that);case CreateWarningLoading():
return loading(_that);case CreateWarningSuccess():
return success(_that);case CreateWarningError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( CreateWarningInitial value)?  initial,TResult? Function( CreateWarningLoading value)?  loading,TResult? Function( CreateWarningSuccess value)?  success,TResult? Function( CreateWarningError value)?  error,}){
final _that = this;
switch (_that) {
case CreateWarningInitial() when initial != null:
return initial(_that);case CreateWarningLoading() when loading != null:
return loading(_that);case CreateWarningSuccess() when success != null:
return success(_that);case CreateWarningError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( Warning warning)?  success,TResult Function( Failure failure)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case CreateWarningInitial() when initial != null:
return initial();case CreateWarningLoading() when loading != null:
return loading();case CreateWarningSuccess() when success != null:
return success(_that.warning);case CreateWarningError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( Warning warning)  success,required TResult Function( Failure failure)  error,}) {final _that = this;
switch (_that) {
case CreateWarningInitial():
return initial();case CreateWarningLoading():
return loading();case CreateWarningSuccess():
return success(_that.warning);case CreateWarningError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( Warning warning)?  success,TResult? Function( Failure failure)?  error,}) {final _that = this;
switch (_that) {
case CreateWarningInitial() when initial != null:
return initial();case CreateWarningLoading() when loading != null:
return loading();case CreateWarningSuccess() when success != null:
return success(_that.warning);case CreateWarningError() when error != null:
return error(_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class CreateWarningInitial implements CreateWarningState {
  const CreateWarningInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateWarningInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CreateWarningState.initial()';
}


}




/// @nodoc


class CreateWarningLoading implements CreateWarningState {
  const CreateWarningLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateWarningLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CreateWarningState.loading()';
}


}




/// @nodoc


class CreateWarningSuccess implements CreateWarningState {
  const CreateWarningSuccess(this.warning);
  

 final  Warning warning;

/// Create a copy of CreateWarningState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateWarningSuccessCopyWith<CreateWarningSuccess> get copyWith => _$CreateWarningSuccessCopyWithImpl<CreateWarningSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateWarningSuccess&&(identical(other.warning, warning) || other.warning == warning));
}


@override
int get hashCode => Object.hash(runtimeType,warning);

@override
String toString() {
  return 'CreateWarningState.success(warning: $warning)';
}


}

/// @nodoc
abstract mixin class $CreateWarningSuccessCopyWith<$Res> implements $CreateWarningStateCopyWith<$Res> {
  factory $CreateWarningSuccessCopyWith(CreateWarningSuccess value, $Res Function(CreateWarningSuccess) _then) = _$CreateWarningSuccessCopyWithImpl;
@useResult
$Res call({
 Warning warning
});




}
/// @nodoc
class _$CreateWarningSuccessCopyWithImpl<$Res>
    implements $CreateWarningSuccessCopyWith<$Res> {
  _$CreateWarningSuccessCopyWithImpl(this._self, this._then);

  final CreateWarningSuccess _self;
  final $Res Function(CreateWarningSuccess) _then;

/// Create a copy of CreateWarningState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? warning = null,}) {
  return _then(CreateWarningSuccess(
null == warning ? _self.warning : warning // ignore: cast_nullable_to_non_nullable
as Warning,
  ));
}


}

/// @nodoc


class CreateWarningError implements CreateWarningState {
  const CreateWarningError(this.failure);
  

 final  Failure failure;

/// Create a copy of CreateWarningState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateWarningErrorCopyWith<CreateWarningError> get copyWith => _$CreateWarningErrorCopyWithImpl<CreateWarningError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateWarningError&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,failure);

@override
String toString() {
  return 'CreateWarningState.error(failure: $failure)';
}


}

/// @nodoc
abstract mixin class $CreateWarningErrorCopyWith<$Res> implements $CreateWarningStateCopyWith<$Res> {
  factory $CreateWarningErrorCopyWith(CreateWarningError value, $Res Function(CreateWarningError) _then) = _$CreateWarningErrorCopyWithImpl;
@useResult
$Res call({
 Failure failure
});




}
/// @nodoc
class _$CreateWarningErrorCopyWithImpl<$Res>
    implements $CreateWarningErrorCopyWith<$Res> {
  _$CreateWarningErrorCopyWithImpl(this._self, this._then);

  final CreateWarningError _self;
  final $Res Function(CreateWarningError) _then;

/// Create a copy of CreateWarningState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failure = null,}) {
  return _then(CreateWarningError(
null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure,
  ));
}


}

// dart format on
