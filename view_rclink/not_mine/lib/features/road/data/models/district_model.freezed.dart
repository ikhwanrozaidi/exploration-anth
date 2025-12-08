// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'district_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DistrictModel {

 int? get id; String? get uid; String? get name; int? get stateID; String? get stateUID; String? get createdAt; String? get updatedAt; ProvinceModel? get state;
/// Create a copy of DistrictModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DistrictModelCopyWith<DistrictModel> get copyWith => _$DistrictModelCopyWithImpl<DistrictModel>(this as DistrictModel, _$identity);

  /// Serializes this DistrictModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DistrictModel&&(identical(other.id, id) || other.id == id)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.name, name) || other.name == name)&&(identical(other.stateID, stateID) || other.stateID == stateID)&&(identical(other.stateUID, stateUID) || other.stateUID == stateUID)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.state, state) || other.state == state));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,uid,name,stateID,stateUID,createdAt,updatedAt,state);

@override
String toString() {
  return 'DistrictModel(id: $id, uid: $uid, name: $name, stateID: $stateID, stateUID: $stateUID, createdAt: $createdAt, updatedAt: $updatedAt, state: $state)';
}


}

/// @nodoc
abstract mixin class $DistrictModelCopyWith<$Res>  {
  factory $DistrictModelCopyWith(DistrictModel value, $Res Function(DistrictModel) _then) = _$DistrictModelCopyWithImpl;
@useResult
$Res call({
 int? id, String? uid, String? name, int? stateID, String? stateUID, String? createdAt, String? updatedAt, ProvinceModel? state
});


$ProvinceModelCopyWith<$Res>? get state;

}
/// @nodoc
class _$DistrictModelCopyWithImpl<$Res>
    implements $DistrictModelCopyWith<$Res> {
  _$DistrictModelCopyWithImpl(this._self, this._then);

  final DistrictModel _self;
  final $Res Function(DistrictModel) _then;

/// Create a copy of DistrictModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? uid = freezed,Object? name = freezed,Object? stateID = freezed,Object? stateUID = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? state = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,uid: freezed == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,stateID: freezed == stateID ? _self.stateID : stateID // ignore: cast_nullable_to_non_nullable
as int?,stateUID: freezed == stateUID ? _self.stateUID : stateUID // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,state: freezed == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as ProvinceModel?,
  ));
}
/// Create a copy of DistrictModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProvinceModelCopyWith<$Res>? get state {
    if (_self.state == null) {
    return null;
  }

  return $ProvinceModelCopyWith<$Res>(_self.state!, (value) {
    return _then(_self.copyWith(state: value));
  });
}
}


/// Adds pattern-matching-related methods to [DistrictModel].
extension DistrictModelPatterns on DistrictModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DistrictModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DistrictModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DistrictModel value)  $default,){
final _that = this;
switch (_that) {
case _DistrictModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DistrictModel value)?  $default,){
final _that = this;
switch (_that) {
case _DistrictModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  String? uid,  String? name,  int? stateID,  String? stateUID,  String? createdAt,  String? updatedAt,  ProvinceModel? state)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DistrictModel() when $default != null:
return $default(_that.id,_that.uid,_that.name,_that.stateID,_that.stateUID,_that.createdAt,_that.updatedAt,_that.state);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  String? uid,  String? name,  int? stateID,  String? stateUID,  String? createdAt,  String? updatedAt,  ProvinceModel? state)  $default,) {final _that = this;
switch (_that) {
case _DistrictModel():
return $default(_that.id,_that.uid,_that.name,_that.stateID,_that.stateUID,_that.createdAt,_that.updatedAt,_that.state);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  String? uid,  String? name,  int? stateID,  String? stateUID,  String? createdAt,  String? updatedAt,  ProvinceModel? state)?  $default,) {final _that = this;
switch (_that) {
case _DistrictModel() when $default != null:
return $default(_that.id,_that.uid,_that.name,_that.stateID,_that.stateUID,_that.createdAt,_that.updatedAt,_that.state);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DistrictModel extends DistrictModel {
  const _DistrictModel({this.id, this.uid, this.name, this.stateID, this.stateUID, this.createdAt, this.updatedAt, this.state}): super._();
  factory _DistrictModel.fromJson(Map<String, dynamic> json) => _$DistrictModelFromJson(json);

@override final  int? id;
@override final  String? uid;
@override final  String? name;
@override final  int? stateID;
@override final  String? stateUID;
@override final  String? createdAt;
@override final  String? updatedAt;
@override final  ProvinceModel? state;

/// Create a copy of DistrictModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DistrictModelCopyWith<_DistrictModel> get copyWith => __$DistrictModelCopyWithImpl<_DistrictModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DistrictModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DistrictModel&&(identical(other.id, id) || other.id == id)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.name, name) || other.name == name)&&(identical(other.stateID, stateID) || other.stateID == stateID)&&(identical(other.stateUID, stateUID) || other.stateUID == stateUID)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.state, state) || other.state == state));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,uid,name,stateID,stateUID,createdAt,updatedAt,state);

@override
String toString() {
  return 'DistrictModel(id: $id, uid: $uid, name: $name, stateID: $stateID, stateUID: $stateUID, createdAt: $createdAt, updatedAt: $updatedAt, state: $state)';
}


}

/// @nodoc
abstract mixin class _$DistrictModelCopyWith<$Res> implements $DistrictModelCopyWith<$Res> {
  factory _$DistrictModelCopyWith(_DistrictModel value, $Res Function(_DistrictModel) _then) = __$DistrictModelCopyWithImpl;
@override @useResult
$Res call({
 int? id, String? uid, String? name, int? stateID, String? stateUID, String? createdAt, String? updatedAt, ProvinceModel? state
});


@override $ProvinceModelCopyWith<$Res>? get state;

}
/// @nodoc
class __$DistrictModelCopyWithImpl<$Res>
    implements _$DistrictModelCopyWith<$Res> {
  __$DistrictModelCopyWithImpl(this._self, this._then);

  final _DistrictModel _self;
  final $Res Function(_DistrictModel) _then;

/// Create a copy of DistrictModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? uid = freezed,Object? name = freezed,Object? stateID = freezed,Object? stateUID = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? state = freezed,}) {
  return _then(_DistrictModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,uid: freezed == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,stateID: freezed == stateID ? _self.stateID : stateID // ignore: cast_nullable_to_non_nullable
as int?,stateUID: freezed == stateUID ? _self.stateUID : stateUID // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,state: freezed == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as ProvinceModel?,
  ));
}

/// Create a copy of DistrictModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProvinceModelCopyWith<$Res>? get state {
    if (_self.state == null) {
    return null;
  }

  return $ProvinceModelCopyWith<$Res>(_self.state!, (value) {
    return _then(_self.copyWith(state: value));
  });
}
}

// dart format on
