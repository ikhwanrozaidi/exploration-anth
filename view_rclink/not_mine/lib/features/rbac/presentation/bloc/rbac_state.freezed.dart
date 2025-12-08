// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rbac_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RbacState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RbacState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RbacState()';
}


}

/// @nodoc
class $RbacStateCopyWith<$Res>  {
$RbacStateCopyWith(RbacState _, $Res Function(RbacState) __);
}


/// Adds pattern-matching-related methods to [RbacState].
extension RbacStatePatterns on RbacState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( RbacInitial value)?  initial,TResult Function( RbacLoading value)?  loading,TResult Function( RbacLoaded value)?  loaded,TResult Function( RbacNoPermissions value)?  noPermissions,TResult Function( RbacError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case RbacInitial() when initial != null:
return initial(_that);case RbacLoading() when loading != null:
return loading(_that);case RbacLoaded() when loaded != null:
return loaded(_that);case RbacNoPermissions() when noPermissions != null:
return noPermissions(_that);case RbacError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( RbacInitial value)  initial,required TResult Function( RbacLoading value)  loading,required TResult Function( RbacLoaded value)  loaded,required TResult Function( RbacNoPermissions value)  noPermissions,required TResult Function( RbacError value)  error,}){
final _that = this;
switch (_that) {
case RbacInitial():
return initial(_that);case RbacLoading():
return loading(_that);case RbacLoaded():
return loaded(_that);case RbacNoPermissions():
return noPermissions(_that);case RbacError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( RbacInitial value)?  initial,TResult? Function( RbacLoading value)?  loading,TResult? Function( RbacLoaded value)?  loaded,TResult? Function( RbacNoPermissions value)?  noPermissions,TResult? Function( RbacError value)?  error,}){
final _that = this;
switch (_that) {
case RbacInitial() when initial != null:
return initial(_that);case RbacLoading() when loading != null:
return loading(_that);case RbacLoaded() when loaded != null:
return loaded(_that);case RbacNoPermissions() when noPermissions != null:
return noPermissions(_that);case RbacError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( Role role,  List<Permission> permissions)?  loaded,TResult Function()?  noPermissions,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case RbacInitial() when initial != null:
return initial();case RbacLoading() when loading != null:
return loading();case RbacLoaded() when loaded != null:
return loaded(_that.role,_that.permissions);case RbacNoPermissions() when noPermissions != null:
return noPermissions();case RbacError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( Role role,  List<Permission> permissions)  loaded,required TResult Function()  noPermissions,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case RbacInitial():
return initial();case RbacLoading():
return loading();case RbacLoaded():
return loaded(_that.role,_that.permissions);case RbacNoPermissions():
return noPermissions();case RbacError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( Role role,  List<Permission> permissions)?  loaded,TResult? Function()?  noPermissions,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case RbacInitial() when initial != null:
return initial();case RbacLoading() when loading != null:
return loading();case RbacLoaded() when loaded != null:
return loaded(_that.role,_that.permissions);case RbacNoPermissions() when noPermissions != null:
return noPermissions();case RbacError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class RbacInitial implements RbacState {
  const RbacInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RbacInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RbacState.initial()';
}


}




/// @nodoc


class RbacLoading implements RbacState {
  const RbacLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RbacLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RbacState.loading()';
}


}




/// @nodoc


class RbacLoaded implements RbacState {
  const RbacLoaded({required this.role, required final  List<Permission> permissions}): _permissions = permissions;
  

 final  Role role;
 final  List<Permission> _permissions;
 List<Permission> get permissions {
  if (_permissions is EqualUnmodifiableListView) return _permissions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_permissions);
}


/// Create a copy of RbacState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RbacLoadedCopyWith<RbacLoaded> get copyWith => _$RbacLoadedCopyWithImpl<RbacLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RbacLoaded&&(identical(other.role, role) || other.role == role)&&const DeepCollectionEquality().equals(other._permissions, _permissions));
}


@override
int get hashCode => Object.hash(runtimeType,role,const DeepCollectionEquality().hash(_permissions));

@override
String toString() {
  return 'RbacState.loaded(role: $role, permissions: $permissions)';
}


}

/// @nodoc
abstract mixin class $RbacLoadedCopyWith<$Res> implements $RbacStateCopyWith<$Res> {
  factory $RbacLoadedCopyWith(RbacLoaded value, $Res Function(RbacLoaded) _then) = _$RbacLoadedCopyWithImpl;
@useResult
$Res call({
 Role role, List<Permission> permissions
});




}
/// @nodoc
class _$RbacLoadedCopyWithImpl<$Res>
    implements $RbacLoadedCopyWith<$Res> {
  _$RbacLoadedCopyWithImpl(this._self, this._then);

  final RbacLoaded _self;
  final $Res Function(RbacLoaded) _then;

/// Create a copy of RbacState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? role = null,Object? permissions = null,}) {
  return _then(RbacLoaded(
role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as Role,permissions: null == permissions ? _self._permissions : permissions // ignore: cast_nullable_to_non_nullable
as List<Permission>,
  ));
}


}

/// @nodoc


class RbacNoPermissions implements RbacState {
  const RbacNoPermissions();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RbacNoPermissions);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RbacState.noPermissions()';
}


}




/// @nodoc


class RbacError implements RbacState {
  const RbacError(this.message);
  

 final  String message;

/// Create a copy of RbacState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RbacErrorCopyWith<RbacError> get copyWith => _$RbacErrorCopyWithImpl<RbacError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RbacError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'RbacState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $RbacErrorCopyWith<$Res> implements $RbacStateCopyWith<$Res> {
  factory $RbacErrorCopyWith(RbacError value, $Res Function(RbacError) _then) = _$RbacErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$RbacErrorCopyWithImpl<$Res>
    implements $RbacErrorCopyWith<$Res> {
  _$RbacErrorCopyWithImpl(this._self, this._then);

  final RbacError _self;
  final $Res Function(RbacError) _then;

/// Create a copy of RbacState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(RbacError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
