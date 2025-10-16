// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rbac_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RbacEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RbacEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RbacEvent()';
}


}

/// @nodoc
class $RbacEventCopyWith<$Res>  {
$RbacEventCopyWith(RbacEvent _, $Res Function(RbacEvent) __);
}


/// Adds pattern-matching-related methods to [RbacEvent].
extension RbacEventPatterns on RbacEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoadPermissions value)?  loadPermissions,TResult Function( ClearPermissions value)?  clearPermissions,TResult Function( CheckPermission value)?  checkPermission,TResult Function( CheckAnyPermission value)?  checkAnyPermission,TResult Function( CheckAllPermissions value)?  checkAllPermissions,TResult Function( CheckModuleAccess value)?  checkModuleAccess,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoadPermissions() when loadPermissions != null:
return loadPermissions(_that);case ClearPermissions() when clearPermissions != null:
return clearPermissions(_that);case CheckPermission() when checkPermission != null:
return checkPermission(_that);case CheckAnyPermission() when checkAnyPermission != null:
return checkAnyPermission(_that);case CheckAllPermissions() when checkAllPermissions != null:
return checkAllPermissions(_that);case CheckModuleAccess() when checkModuleAccess != null:
return checkModuleAccess(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoadPermissions value)  loadPermissions,required TResult Function( ClearPermissions value)  clearPermissions,required TResult Function( CheckPermission value)  checkPermission,required TResult Function( CheckAnyPermission value)  checkAnyPermission,required TResult Function( CheckAllPermissions value)  checkAllPermissions,required TResult Function( CheckModuleAccess value)  checkModuleAccess,}){
final _that = this;
switch (_that) {
case LoadPermissions():
return loadPermissions(_that);case ClearPermissions():
return clearPermissions(_that);case CheckPermission():
return checkPermission(_that);case CheckAnyPermission():
return checkAnyPermission(_that);case CheckAllPermissions():
return checkAllPermissions(_that);case CheckModuleAccess():
return checkModuleAccess(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoadPermissions value)?  loadPermissions,TResult? Function( ClearPermissions value)?  clearPermissions,TResult? Function( CheckPermission value)?  checkPermission,TResult? Function( CheckAnyPermission value)?  checkAnyPermission,TResult? Function( CheckAllPermissions value)?  checkAllPermissions,TResult? Function( CheckModuleAccess value)?  checkModuleAccess,}){
final _that = this;
switch (_that) {
case LoadPermissions() when loadPermissions != null:
return loadPermissions(_that);case ClearPermissions() when clearPermissions != null:
return clearPermissions(_that);case CheckPermission() when checkPermission != null:
return checkPermission(_that);case CheckAnyPermission() when checkAnyPermission != null:
return checkAnyPermission(_that);case CheckAllPermissions() when checkAllPermissions != null:
return checkAllPermissions(_that);case CheckModuleAccess() when checkModuleAccess != null:
return checkModuleAccess(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String roleUID)?  loadPermissions,TResult Function()?  clearPermissions,TResult Function( String permissionCode)?  checkPermission,TResult Function( List<String> permissionCodes)?  checkAnyPermission,TResult Function( List<String> permissionCodes)?  checkAllPermissions,TResult Function( String category)?  checkModuleAccess,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LoadPermissions() when loadPermissions != null:
return loadPermissions(_that.roleUID);case ClearPermissions() when clearPermissions != null:
return clearPermissions();case CheckPermission() when checkPermission != null:
return checkPermission(_that.permissionCode);case CheckAnyPermission() when checkAnyPermission != null:
return checkAnyPermission(_that.permissionCodes);case CheckAllPermissions() when checkAllPermissions != null:
return checkAllPermissions(_that.permissionCodes);case CheckModuleAccess() when checkModuleAccess != null:
return checkModuleAccess(_that.category);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String roleUID)  loadPermissions,required TResult Function()  clearPermissions,required TResult Function( String permissionCode)  checkPermission,required TResult Function( List<String> permissionCodes)  checkAnyPermission,required TResult Function( List<String> permissionCodes)  checkAllPermissions,required TResult Function( String category)  checkModuleAccess,}) {final _that = this;
switch (_that) {
case LoadPermissions():
return loadPermissions(_that.roleUID);case ClearPermissions():
return clearPermissions();case CheckPermission():
return checkPermission(_that.permissionCode);case CheckAnyPermission():
return checkAnyPermission(_that.permissionCodes);case CheckAllPermissions():
return checkAllPermissions(_that.permissionCodes);case CheckModuleAccess():
return checkModuleAccess(_that.category);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String roleUID)?  loadPermissions,TResult? Function()?  clearPermissions,TResult? Function( String permissionCode)?  checkPermission,TResult? Function( List<String> permissionCodes)?  checkAnyPermission,TResult? Function( List<String> permissionCodes)?  checkAllPermissions,TResult? Function( String category)?  checkModuleAccess,}) {final _that = this;
switch (_that) {
case LoadPermissions() when loadPermissions != null:
return loadPermissions(_that.roleUID);case ClearPermissions() when clearPermissions != null:
return clearPermissions();case CheckPermission() when checkPermission != null:
return checkPermission(_that.permissionCode);case CheckAnyPermission() when checkAnyPermission != null:
return checkAnyPermission(_that.permissionCodes);case CheckAllPermissions() when checkAllPermissions != null:
return checkAllPermissions(_that.permissionCodes);case CheckModuleAccess() when checkModuleAccess != null:
return checkModuleAccess(_that.category);case _:
  return null;

}
}

}

/// @nodoc


class LoadPermissions implements RbacEvent {
  const LoadPermissions(this.roleUID);
  

 final  String roleUID;

/// Create a copy of RbacEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadPermissionsCopyWith<LoadPermissions> get copyWith => _$LoadPermissionsCopyWithImpl<LoadPermissions>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadPermissions&&(identical(other.roleUID, roleUID) || other.roleUID == roleUID));
}


@override
int get hashCode => Object.hash(runtimeType,roleUID);

@override
String toString() {
  return 'RbacEvent.loadPermissions(roleUID: $roleUID)';
}


}

/// @nodoc
abstract mixin class $LoadPermissionsCopyWith<$Res> implements $RbacEventCopyWith<$Res> {
  factory $LoadPermissionsCopyWith(LoadPermissions value, $Res Function(LoadPermissions) _then) = _$LoadPermissionsCopyWithImpl;
@useResult
$Res call({
 String roleUID
});




}
/// @nodoc
class _$LoadPermissionsCopyWithImpl<$Res>
    implements $LoadPermissionsCopyWith<$Res> {
  _$LoadPermissionsCopyWithImpl(this._self, this._then);

  final LoadPermissions _self;
  final $Res Function(LoadPermissions) _then;

/// Create a copy of RbacEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? roleUID = null,}) {
  return _then(LoadPermissions(
null == roleUID ? _self.roleUID : roleUID // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ClearPermissions implements RbacEvent {
  const ClearPermissions();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClearPermissions);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RbacEvent.clearPermissions()';
}


}




/// @nodoc


class CheckPermission implements RbacEvent {
  const CheckPermission(this.permissionCode);
  

 final  String permissionCode;

/// Create a copy of RbacEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CheckPermissionCopyWith<CheckPermission> get copyWith => _$CheckPermissionCopyWithImpl<CheckPermission>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheckPermission&&(identical(other.permissionCode, permissionCode) || other.permissionCode == permissionCode));
}


@override
int get hashCode => Object.hash(runtimeType,permissionCode);

@override
String toString() {
  return 'RbacEvent.checkPermission(permissionCode: $permissionCode)';
}


}

/// @nodoc
abstract mixin class $CheckPermissionCopyWith<$Res> implements $RbacEventCopyWith<$Res> {
  factory $CheckPermissionCopyWith(CheckPermission value, $Res Function(CheckPermission) _then) = _$CheckPermissionCopyWithImpl;
@useResult
$Res call({
 String permissionCode
});




}
/// @nodoc
class _$CheckPermissionCopyWithImpl<$Res>
    implements $CheckPermissionCopyWith<$Res> {
  _$CheckPermissionCopyWithImpl(this._self, this._then);

  final CheckPermission _self;
  final $Res Function(CheckPermission) _then;

/// Create a copy of RbacEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? permissionCode = null,}) {
  return _then(CheckPermission(
null == permissionCode ? _self.permissionCode : permissionCode // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class CheckAnyPermission implements RbacEvent {
  const CheckAnyPermission(final  List<String> permissionCodes): _permissionCodes = permissionCodes;
  

 final  List<String> _permissionCodes;
 List<String> get permissionCodes {
  if (_permissionCodes is EqualUnmodifiableListView) return _permissionCodes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_permissionCodes);
}


/// Create a copy of RbacEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CheckAnyPermissionCopyWith<CheckAnyPermission> get copyWith => _$CheckAnyPermissionCopyWithImpl<CheckAnyPermission>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheckAnyPermission&&const DeepCollectionEquality().equals(other._permissionCodes, _permissionCodes));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_permissionCodes));

@override
String toString() {
  return 'RbacEvent.checkAnyPermission(permissionCodes: $permissionCodes)';
}


}

/// @nodoc
abstract mixin class $CheckAnyPermissionCopyWith<$Res> implements $RbacEventCopyWith<$Res> {
  factory $CheckAnyPermissionCopyWith(CheckAnyPermission value, $Res Function(CheckAnyPermission) _then) = _$CheckAnyPermissionCopyWithImpl;
@useResult
$Res call({
 List<String> permissionCodes
});




}
/// @nodoc
class _$CheckAnyPermissionCopyWithImpl<$Res>
    implements $CheckAnyPermissionCopyWith<$Res> {
  _$CheckAnyPermissionCopyWithImpl(this._self, this._then);

  final CheckAnyPermission _self;
  final $Res Function(CheckAnyPermission) _then;

/// Create a copy of RbacEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? permissionCodes = null,}) {
  return _then(CheckAnyPermission(
null == permissionCodes ? _self._permissionCodes : permissionCodes // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

/// @nodoc


class CheckAllPermissions implements RbacEvent {
  const CheckAllPermissions(final  List<String> permissionCodes): _permissionCodes = permissionCodes;
  

 final  List<String> _permissionCodes;
 List<String> get permissionCodes {
  if (_permissionCodes is EqualUnmodifiableListView) return _permissionCodes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_permissionCodes);
}


/// Create a copy of RbacEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CheckAllPermissionsCopyWith<CheckAllPermissions> get copyWith => _$CheckAllPermissionsCopyWithImpl<CheckAllPermissions>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheckAllPermissions&&const DeepCollectionEquality().equals(other._permissionCodes, _permissionCodes));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_permissionCodes));

@override
String toString() {
  return 'RbacEvent.checkAllPermissions(permissionCodes: $permissionCodes)';
}


}

/// @nodoc
abstract mixin class $CheckAllPermissionsCopyWith<$Res> implements $RbacEventCopyWith<$Res> {
  factory $CheckAllPermissionsCopyWith(CheckAllPermissions value, $Res Function(CheckAllPermissions) _then) = _$CheckAllPermissionsCopyWithImpl;
@useResult
$Res call({
 List<String> permissionCodes
});




}
/// @nodoc
class _$CheckAllPermissionsCopyWithImpl<$Res>
    implements $CheckAllPermissionsCopyWith<$Res> {
  _$CheckAllPermissionsCopyWithImpl(this._self, this._then);

  final CheckAllPermissions _self;
  final $Res Function(CheckAllPermissions) _then;

/// Create a copy of RbacEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? permissionCodes = null,}) {
  return _then(CheckAllPermissions(
null == permissionCodes ? _self._permissionCodes : permissionCodes // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

/// @nodoc


class CheckModuleAccess implements RbacEvent {
  const CheckModuleAccess(this.category);
  

 final  String category;

/// Create a copy of RbacEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CheckModuleAccessCopyWith<CheckModuleAccess> get copyWith => _$CheckModuleAccessCopyWithImpl<CheckModuleAccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheckModuleAccess&&(identical(other.category, category) || other.category == category));
}


@override
int get hashCode => Object.hash(runtimeType,category);

@override
String toString() {
  return 'RbacEvent.checkModuleAccess(category: $category)';
}


}

/// @nodoc
abstract mixin class $CheckModuleAccessCopyWith<$Res> implements $RbacEventCopyWith<$Res> {
  factory $CheckModuleAccessCopyWith(CheckModuleAccess value, $Res Function(CheckModuleAccess) _then) = _$CheckModuleAccessCopyWithImpl;
@useResult
$Res call({
 String category
});




}
/// @nodoc
class _$CheckModuleAccessCopyWithImpl<$Res>
    implements $CheckModuleAccessCopyWith<$Res> {
  _$CheckModuleAccessCopyWithImpl(this._self, this._then);

  final CheckModuleAccess _self;
  final $Res Function(CheckModuleAccess) _then;

/// Create a copy of RbacEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? category = null,}) {
  return _then(CheckModuleAccess(
null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
