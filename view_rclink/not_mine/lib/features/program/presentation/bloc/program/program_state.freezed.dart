// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'program_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProgramState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProgramState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProgramState()';
}


}

/// @nodoc
class $ProgramStateCopyWith<$Res>  {
$ProgramStateCopyWith(ProgramState _, $Res Function(ProgramState) __);
}


/// Adds pattern-matching-related methods to [ProgramState].
extension ProgramStatePatterns on ProgramState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ProgramInitial value)?  initial,TResult Function( ProgramLoading value)?  loading,TResult Function( ProgramLoaded value)?  loaded,TResult Function( ProgramError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ProgramInitial() when initial != null:
return initial(_that);case ProgramLoading() when loading != null:
return loading(_that);case ProgramLoaded() when loaded != null:
return loaded(_that);case ProgramError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ProgramInitial value)  initial,required TResult Function( ProgramLoading value)  loading,required TResult Function( ProgramLoaded value)  loaded,required TResult Function( ProgramError value)  error,}){
final _that = this;
switch (_that) {
case ProgramInitial():
return initial(_that);case ProgramLoading():
return loading(_that);case ProgramLoaded():
return loaded(_that);case ProgramError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ProgramInitial value)?  initial,TResult? Function( ProgramLoading value)?  loading,TResult? Function( ProgramLoaded value)?  loaded,TResult? Function( ProgramError value)?  error,}){
final _that = this;
switch (_that) {
case ProgramInitial() when initial != null:
return initial(_that);case ProgramLoading() when loading != null:
return loading(_that);case ProgramLoaded() when loaded != null:
return loaded(_that);case ProgramError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<ProgramSetting> programSettings,  List<Road>? contractorRoads)?  loaded,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ProgramInitial() when initial != null:
return initial();case ProgramLoading() when loading != null:
return loading();case ProgramLoaded() when loaded != null:
return loaded(_that.programSettings,_that.contractorRoads);case ProgramError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<ProgramSetting> programSettings,  List<Road>? contractorRoads)  loaded,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case ProgramInitial():
return initial();case ProgramLoading():
return loading();case ProgramLoaded():
return loaded(_that.programSettings,_that.contractorRoads);case ProgramError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<ProgramSetting> programSettings,  List<Road>? contractorRoads)?  loaded,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case ProgramInitial() when initial != null:
return initial();case ProgramLoading() when loading != null:
return loading();case ProgramLoaded() when loaded != null:
return loaded(_that.programSettings,_that.contractorRoads);case ProgramError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class ProgramInitial implements ProgramState {
  const ProgramInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProgramInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProgramState.initial()';
}


}




/// @nodoc


class ProgramLoading implements ProgramState {
  const ProgramLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProgramLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProgramState.loading()';
}


}




/// @nodoc


class ProgramLoaded implements ProgramState {
  const ProgramLoaded({required final  List<ProgramSetting> programSettings, final  List<Road>? contractorRoads}): _programSettings = programSettings,_contractorRoads = contractorRoads;
  

 final  List<ProgramSetting> _programSettings;
 List<ProgramSetting> get programSettings {
  if (_programSettings is EqualUnmodifiableListView) return _programSettings;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_programSettings);
}

 final  List<Road>? _contractorRoads;
 List<Road>? get contractorRoads {
  final value = _contractorRoads;
  if (value == null) return null;
  if (_contractorRoads is EqualUnmodifiableListView) return _contractorRoads;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of ProgramState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProgramLoadedCopyWith<ProgramLoaded> get copyWith => _$ProgramLoadedCopyWithImpl<ProgramLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProgramLoaded&&const DeepCollectionEquality().equals(other._programSettings, _programSettings)&&const DeepCollectionEquality().equals(other._contractorRoads, _contractorRoads));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_programSettings),const DeepCollectionEquality().hash(_contractorRoads));

@override
String toString() {
  return 'ProgramState.loaded(programSettings: $programSettings, contractorRoads: $contractorRoads)';
}


}

/// @nodoc
abstract mixin class $ProgramLoadedCopyWith<$Res> implements $ProgramStateCopyWith<$Res> {
  factory $ProgramLoadedCopyWith(ProgramLoaded value, $Res Function(ProgramLoaded) _then) = _$ProgramLoadedCopyWithImpl;
@useResult
$Res call({
 List<ProgramSetting> programSettings, List<Road>? contractorRoads
});




}
/// @nodoc
class _$ProgramLoadedCopyWithImpl<$Res>
    implements $ProgramLoadedCopyWith<$Res> {
  _$ProgramLoadedCopyWithImpl(this._self, this._then);

  final ProgramLoaded _self;
  final $Res Function(ProgramLoaded) _then;

/// Create a copy of ProgramState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? programSettings = null,Object? contractorRoads = freezed,}) {
  return _then(ProgramLoaded(
programSettings: null == programSettings ? _self._programSettings : programSettings // ignore: cast_nullable_to_non_nullable
as List<ProgramSetting>,contractorRoads: freezed == contractorRoads ? _self._contractorRoads : contractorRoads // ignore: cast_nullable_to_non_nullable
as List<Road>?,
  ));
}


}

/// @nodoc


class ProgramError implements ProgramState {
  const ProgramError(this.message);
  

 final  String message;

/// Create a copy of ProgramState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProgramErrorCopyWith<ProgramError> get copyWith => _$ProgramErrorCopyWithImpl<ProgramError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProgramError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ProgramState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $ProgramErrorCopyWith<$Res> implements $ProgramStateCopyWith<$Res> {
  factory $ProgramErrorCopyWith(ProgramError value, $Res Function(ProgramError) _then) = _$ProgramErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ProgramErrorCopyWithImpl<$Res>
    implements $ProgramErrorCopyWith<$Res> {
  _$ProgramErrorCopyWithImpl(this._self, this._then);

  final ProgramError _self;
  final $Res Function(ProgramError) _then;

/// Create a copy of ProgramState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ProgramError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
