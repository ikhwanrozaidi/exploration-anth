// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'program_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProgramDetailState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProgramDetailState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProgramDetailState()';
}


}

/// @nodoc
class $ProgramDetailStateCopyWith<$Res>  {
$ProgramDetailStateCopyWith(ProgramDetailState _, $Res Function(ProgramDetailState) __);
}


/// Adds pattern-matching-related methods to [ProgramDetailState].
extension ProgramDetailStatePatterns on ProgramDetailState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ProgramDetailInitial value)?  initial,TResult Function( ProgramDetailLoading value)?  loading,TResult Function( ProgramDetailLoaded value)?  loaded,TResult Function( ProgramDetailFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ProgramDetailInitial() when initial != null:
return initial(_that);case ProgramDetailLoading() when loading != null:
return loading(_that);case ProgramDetailLoaded() when loaded != null:
return loaded(_that);case ProgramDetailFailure() when failure != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ProgramDetailInitial value)  initial,required TResult Function( ProgramDetailLoading value)  loading,required TResult Function( ProgramDetailLoaded value)  loaded,required TResult Function( ProgramDetailFailure value)  failure,}){
final _that = this;
switch (_that) {
case ProgramDetailInitial():
return initial(_that);case ProgramDetailLoading():
return loading(_that);case ProgramDetailLoaded():
return loaded(_that);case ProgramDetailFailure():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ProgramDetailInitial value)?  initial,TResult? Function( ProgramDetailLoading value)?  loading,TResult? Function( ProgramDetailLoaded value)?  loaded,TResult? Function( ProgramDetailFailure value)?  failure,}){
final _that = this;
switch (_that) {
case ProgramDetailInitial() when initial != null:
return initial(_that);case ProgramDetailLoading() when loading != null:
return loading(_that);case ProgramDetailLoaded() when loaded != null:
return loaded(_that);case ProgramDetailFailure() when failure != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( Program program)?  loaded,TResult Function( String message)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ProgramDetailInitial() when initial != null:
return initial();case ProgramDetailLoading() when loading != null:
return loading();case ProgramDetailLoaded() when loaded != null:
return loaded(_that.program);case ProgramDetailFailure() when failure != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( Program program)  loaded,required TResult Function( String message)  failure,}) {final _that = this;
switch (_that) {
case ProgramDetailInitial():
return initial();case ProgramDetailLoading():
return loading();case ProgramDetailLoaded():
return loaded(_that.program);case ProgramDetailFailure():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( Program program)?  loaded,TResult? Function( String message)?  failure,}) {final _that = this;
switch (_that) {
case ProgramDetailInitial() when initial != null:
return initial();case ProgramDetailLoading() when loading != null:
return loading();case ProgramDetailLoaded() when loaded != null:
return loaded(_that.program);case ProgramDetailFailure() when failure != null:
return failure(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class ProgramDetailInitial implements ProgramDetailState {
  const ProgramDetailInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProgramDetailInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProgramDetailState.initial()';
}


}




/// @nodoc


class ProgramDetailLoading implements ProgramDetailState {
  const ProgramDetailLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProgramDetailLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProgramDetailState.loading()';
}


}




/// @nodoc


class ProgramDetailLoaded implements ProgramDetailState {
  const ProgramDetailLoaded({required this.program});
  

 final  Program program;

/// Create a copy of ProgramDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProgramDetailLoadedCopyWith<ProgramDetailLoaded> get copyWith => _$ProgramDetailLoadedCopyWithImpl<ProgramDetailLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProgramDetailLoaded&&(identical(other.program, program) || other.program == program));
}


@override
int get hashCode => Object.hash(runtimeType,program);

@override
String toString() {
  return 'ProgramDetailState.loaded(program: $program)';
}


}

/// @nodoc
abstract mixin class $ProgramDetailLoadedCopyWith<$Res> implements $ProgramDetailStateCopyWith<$Res> {
  factory $ProgramDetailLoadedCopyWith(ProgramDetailLoaded value, $Res Function(ProgramDetailLoaded) _then) = _$ProgramDetailLoadedCopyWithImpl;
@useResult
$Res call({
 Program program
});




}
/// @nodoc
class _$ProgramDetailLoadedCopyWithImpl<$Res>
    implements $ProgramDetailLoadedCopyWith<$Res> {
  _$ProgramDetailLoadedCopyWithImpl(this._self, this._then);

  final ProgramDetailLoaded _self;
  final $Res Function(ProgramDetailLoaded) _then;

/// Create a copy of ProgramDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? program = null,}) {
  return _then(ProgramDetailLoaded(
program: null == program ? _self.program : program // ignore: cast_nullable_to_non_nullable
as Program,
  ));
}


}

/// @nodoc


class ProgramDetailFailure implements ProgramDetailState {
  const ProgramDetailFailure(this.message);
  

 final  String message;

/// Create a copy of ProgramDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProgramDetailFailureCopyWith<ProgramDetailFailure> get copyWith => _$ProgramDetailFailureCopyWithImpl<ProgramDetailFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProgramDetailFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ProgramDetailState.failure(message: $message)';
}


}

/// @nodoc
abstract mixin class $ProgramDetailFailureCopyWith<$Res> implements $ProgramDetailStateCopyWith<$Res> {
  factory $ProgramDetailFailureCopyWith(ProgramDetailFailure value, $Res Function(ProgramDetailFailure) _then) = _$ProgramDetailFailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ProgramDetailFailureCopyWithImpl<$Res>
    implements $ProgramDetailFailureCopyWith<$Res> {
  _$ProgramDetailFailureCopyWithImpl(this._self, this._then);

  final ProgramDetailFailure _self;
  final $Res Function(ProgramDetailFailure) _then;

/// Create a copy of ProgramDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ProgramDetailFailure(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
