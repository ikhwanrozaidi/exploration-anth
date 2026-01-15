// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_program_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CreateProgramState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateProgramState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CreateProgramState()';
}


}

/// @nodoc
class $CreateProgramStateCopyWith<$Res>  {
$CreateProgramStateCopyWith(CreateProgramState _, $Res Function(CreateProgramState) __);
}


/// Adds pattern-matching-related methods to [CreateProgramState].
extension CreateProgramStatePatterns on CreateProgramState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( CreateProgramInitial value)?  initial,TResult Function( CreateProgramSubmitting value)?  submitting,TResult Function( CreateProgramSuccess value)?  success,TResult Function( CreateProgramError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case CreateProgramInitial() when initial != null:
return initial(_that);case CreateProgramSubmitting() when submitting != null:
return submitting(_that);case CreateProgramSuccess() when success != null:
return success(_that);case CreateProgramError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( CreateProgramInitial value)  initial,required TResult Function( CreateProgramSubmitting value)  submitting,required TResult Function( CreateProgramSuccess value)  success,required TResult Function( CreateProgramError value)  error,}){
final _that = this;
switch (_that) {
case CreateProgramInitial():
return initial(_that);case CreateProgramSubmitting():
return submitting(_that);case CreateProgramSuccess():
return success(_that);case CreateProgramError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( CreateProgramInitial value)?  initial,TResult? Function( CreateProgramSubmitting value)?  submitting,TResult? Function( CreateProgramSuccess value)?  success,TResult? Function( CreateProgramError value)?  error,}){
final _that = this;
switch (_that) {
case CreateProgramInitial() when initial != null:
return initial(_that);case CreateProgramSubmitting() when submitting != null:
return submitting(_that);case CreateProgramSuccess() when success != null:
return success(_that);case CreateProgramError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  submitting,TResult Function( Program program)?  success,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case CreateProgramInitial() when initial != null:
return initial();case CreateProgramSubmitting() when submitting != null:
return submitting();case CreateProgramSuccess() when success != null:
return success(_that.program);case CreateProgramError() when error != null:
return error(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  submitting,required TResult Function( Program program)  success,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case CreateProgramInitial():
return initial();case CreateProgramSubmitting():
return submitting();case CreateProgramSuccess():
return success(_that.program);case CreateProgramError():
return error(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  submitting,TResult? Function( Program program)?  success,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case CreateProgramInitial() when initial != null:
return initial();case CreateProgramSubmitting() when submitting != null:
return submitting();case CreateProgramSuccess() when success != null:
return success(_that.program);case CreateProgramError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class CreateProgramInitial implements CreateProgramState {
  const CreateProgramInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateProgramInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CreateProgramState.initial()';
}


}




/// @nodoc


class CreateProgramSubmitting implements CreateProgramState {
  const CreateProgramSubmitting();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateProgramSubmitting);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CreateProgramState.submitting()';
}


}




/// @nodoc


class CreateProgramSuccess implements CreateProgramState {
  const CreateProgramSuccess(this.program);
  

 final  Program program;

/// Create a copy of CreateProgramState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateProgramSuccessCopyWith<CreateProgramSuccess> get copyWith => _$CreateProgramSuccessCopyWithImpl<CreateProgramSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateProgramSuccess&&(identical(other.program, program) || other.program == program));
}


@override
int get hashCode => Object.hash(runtimeType,program);

@override
String toString() {
  return 'CreateProgramState.success(program: $program)';
}


}

/// @nodoc
abstract mixin class $CreateProgramSuccessCopyWith<$Res> implements $CreateProgramStateCopyWith<$Res> {
  factory $CreateProgramSuccessCopyWith(CreateProgramSuccess value, $Res Function(CreateProgramSuccess) _then) = _$CreateProgramSuccessCopyWithImpl;
@useResult
$Res call({
 Program program
});




}
/// @nodoc
class _$CreateProgramSuccessCopyWithImpl<$Res>
    implements $CreateProgramSuccessCopyWith<$Res> {
  _$CreateProgramSuccessCopyWithImpl(this._self, this._then);

  final CreateProgramSuccess _self;
  final $Res Function(CreateProgramSuccess) _then;

/// Create a copy of CreateProgramState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? program = null,}) {
  return _then(CreateProgramSuccess(
null == program ? _self.program : program // ignore: cast_nullable_to_non_nullable
as Program,
  ));
}


}

/// @nodoc


class CreateProgramError implements CreateProgramState {
  const CreateProgramError(this.message);
  

 final  String message;

/// Create a copy of CreateProgramState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateProgramErrorCopyWith<CreateProgramError> get copyWith => _$CreateProgramErrorCopyWithImpl<CreateProgramError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateProgramError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'CreateProgramState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $CreateProgramErrorCopyWith<$Res> implements $CreateProgramStateCopyWith<$Res> {
  factory $CreateProgramErrorCopyWith(CreateProgramError value, $Res Function(CreateProgramError) _then) = _$CreateProgramErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$CreateProgramErrorCopyWithImpl<$Res>
    implements $CreateProgramErrorCopyWith<$Res> {
  _$CreateProgramErrorCopyWithImpl(this._self, this._then);

  final CreateProgramError _self;
  final $Res Function(CreateProgramError) _then;

/// Create a copy of CreateProgramState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(CreateProgramError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
