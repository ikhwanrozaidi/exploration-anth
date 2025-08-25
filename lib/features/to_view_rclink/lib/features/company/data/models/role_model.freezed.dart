// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'role_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RoleModel {

 int get id; String get uid; String get name; String get description; int get companyID; bool get isSystemRole; bool get isActive; DateTime get createdAt; DateTime get updatedAt; DateTime? get deletedAt; List<PermissionModel> get permissions;
/// Create a copy of RoleModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RoleModelCopyWith<RoleModel> get copyWith => _$RoleModelCopyWithImpl<RoleModel>(this as RoleModel, _$identity);

  /// Serializes this RoleModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RoleModel&&(identical(other.id, id) || other.id == id)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.companyID, companyID) || other.companyID == companyID)&&(identical(other.isSystemRole, isSystemRole) || other.isSystemRole == isSystemRole)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt)&&const DeepCollectionEquality().equals(other.permissions, permissions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,uid,name,description,companyID,isSystemRole,isActive,createdAt,updatedAt,deletedAt,const DeepCollectionEquality().hash(permissions));

@override
String toString() {
  return 'RoleModel(id: $id, uid: $uid, name: $name, description: $description, companyID: $companyID, isSystemRole: $isSystemRole, isActive: $isActive, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt, permissions: $permissions)';
}


}

/// @nodoc
abstract mixin class $RoleModelCopyWith<$Res>  {
  factory $RoleModelCopyWith(RoleModel value, $Res Function(RoleModel) _then) = _$RoleModelCopyWithImpl;
@useResult
$Res call({
 int id, String uid, String name, String description, int companyID, bool isSystemRole, bool isActive, DateTime createdAt, DateTime updatedAt, DateTime? deletedAt, List<PermissionModel> permissions
});




}
/// @nodoc
class _$RoleModelCopyWithImpl<$Res>
    implements $RoleModelCopyWith<$Res> {
  _$RoleModelCopyWithImpl(this._self, this._then);

  final RoleModel _self;
  final $Res Function(RoleModel) _then;

/// Create a copy of RoleModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? uid = null,Object? name = null,Object? description = null,Object? companyID = null,Object? isSystemRole = null,Object? isActive = null,Object? createdAt = null,Object? updatedAt = null,Object? deletedAt = freezed,Object? permissions = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,companyID: null == companyID ? _self.companyID : companyID // ignore: cast_nullable_to_non_nullable
as int,isSystemRole: null == isSystemRole ? _self.isSystemRole : isSystemRole // ignore: cast_nullable_to_non_nullable
as bool,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,permissions: null == permissions ? _self.permissions : permissions // ignore: cast_nullable_to_non_nullable
as List<PermissionModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [RoleModel].
extension RoleModelPatterns on RoleModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RoleModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RoleModel() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RoleModel value)  $default,){
final _that = this;
switch (_that) {
case _RoleModel():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RoleModel value)?  $default,){
final _that = this;
switch (_that) {
case _RoleModel() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String uid,  String name,  String description,  int companyID,  bool isSystemRole,  bool isActive,  DateTime createdAt,  DateTime updatedAt,  DateTime? deletedAt,  List<PermissionModel> permissions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RoleModel() when $default != null:
return $default(_that.id,_that.uid,_that.name,_that.description,_that.companyID,_that.isSystemRole,_that.isActive,_that.createdAt,_that.updatedAt,_that.deletedAt,_that.permissions);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String uid,  String name,  String description,  int companyID,  bool isSystemRole,  bool isActive,  DateTime createdAt,  DateTime updatedAt,  DateTime? deletedAt,  List<PermissionModel> permissions)  $default,) {final _that = this;
switch (_that) {
case _RoleModel():
return $default(_that.id,_that.uid,_that.name,_that.description,_that.companyID,_that.isSystemRole,_that.isActive,_that.createdAt,_that.updatedAt,_that.deletedAt,_that.permissions);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String uid,  String name,  String description,  int companyID,  bool isSystemRole,  bool isActive,  DateTime createdAt,  DateTime updatedAt,  DateTime? deletedAt,  List<PermissionModel> permissions)?  $default,) {final _that = this;
switch (_that) {
case _RoleModel() when $default != null:
return $default(_that.id,_that.uid,_that.name,_that.description,_that.companyID,_that.isSystemRole,_that.isActive,_that.createdAt,_that.updatedAt,_that.deletedAt,_that.permissions);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RoleModel extends RoleModel {
  const _RoleModel({required this.id, required this.uid, required this.name, required this.description, required this.companyID, required this.isSystemRole, required this.isActive, required this.createdAt, required this.updatedAt, this.deletedAt, required final  List<PermissionModel> permissions}): _permissions = permissions,super._();
  factory _RoleModel.fromJson(Map<String, dynamic> json) => _$RoleModelFromJson(json);

@override final  int id;
@override final  String uid;
@override final  String name;
@override final  String description;
@override final  int companyID;
@override final  bool isSystemRole;
@override final  bool isActive;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;
@override final  DateTime? deletedAt;
 final  List<PermissionModel> _permissions;
@override List<PermissionModel> get permissions {
  if (_permissions is EqualUnmodifiableListView) return _permissions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_permissions);
}


/// Create a copy of RoleModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RoleModelCopyWith<_RoleModel> get copyWith => __$RoleModelCopyWithImpl<_RoleModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RoleModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RoleModel&&(identical(other.id, id) || other.id == id)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.companyID, companyID) || other.companyID == companyID)&&(identical(other.isSystemRole, isSystemRole) || other.isSystemRole == isSystemRole)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt)&&const DeepCollectionEquality().equals(other._permissions, _permissions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,uid,name,description,companyID,isSystemRole,isActive,createdAt,updatedAt,deletedAt,const DeepCollectionEquality().hash(_permissions));

@override
String toString() {
  return 'RoleModel(id: $id, uid: $uid, name: $name, description: $description, companyID: $companyID, isSystemRole: $isSystemRole, isActive: $isActive, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt, permissions: $permissions)';
}


}

/// @nodoc
abstract mixin class _$RoleModelCopyWith<$Res> implements $RoleModelCopyWith<$Res> {
  factory _$RoleModelCopyWith(_RoleModel value, $Res Function(_RoleModel) _then) = __$RoleModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String uid, String name, String description, int companyID, bool isSystemRole, bool isActive, DateTime createdAt, DateTime updatedAt, DateTime? deletedAt, List<PermissionModel> permissions
});




}
/// @nodoc
class __$RoleModelCopyWithImpl<$Res>
    implements _$RoleModelCopyWith<$Res> {
  __$RoleModelCopyWithImpl(this._self, this._then);

  final _RoleModel _self;
  final $Res Function(_RoleModel) _then;

/// Create a copy of RoleModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? uid = null,Object? name = null,Object? description = null,Object? companyID = null,Object? isSystemRole = null,Object? isActive = null,Object? createdAt = null,Object? updatedAt = null,Object? deletedAt = freezed,Object? permissions = null,}) {
  return _then(_RoleModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,companyID: null == companyID ? _self.companyID : companyID // ignore: cast_nullable_to_non_nullable
as int,isSystemRole: null == isSystemRole ? _self.isSystemRole : isSystemRole // ignore: cast_nullable_to_non_nullable
as bool,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,permissions: null == permissions ? _self._permissions : permissions // ignore: cast_nullable_to_non_nullable
as List<PermissionModel>,
  ));
}


}

// dart format on
