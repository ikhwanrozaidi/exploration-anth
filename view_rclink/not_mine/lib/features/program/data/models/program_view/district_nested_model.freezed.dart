// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'district_nested_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DistrictNestedModel {

 int? get id; String? get uid; String? get name; int? get stateID; StateNestedModel? get state;
/// Create a copy of DistrictNestedModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DistrictNestedModelCopyWith<DistrictNestedModel> get copyWith => _$DistrictNestedModelCopyWithImpl<DistrictNestedModel>(this as DistrictNestedModel, _$identity);

  /// Serializes this DistrictNestedModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DistrictNestedModel&&(identical(other.id, id) || other.id == id)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.name, name) || other.name == name)&&(identical(other.stateID, stateID) || other.stateID == stateID)&&(identical(other.state, state) || other.state == state));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,uid,name,stateID,state);

@override
String toString() {
  return 'DistrictNestedModel(id: $id, uid: $uid, name: $name, stateID: $stateID, state: $state)';
}


}

/// @nodoc
abstract mixin class $DistrictNestedModelCopyWith<$Res>  {
  factory $DistrictNestedModelCopyWith(DistrictNestedModel value, $Res Function(DistrictNestedModel) _then) = _$DistrictNestedModelCopyWithImpl;
@useResult
$Res call({
 int? id, String? uid, String? name, int? stateID, StateNestedModel? state
});


$StateNestedModelCopyWith<$Res>? get state;

}
/// @nodoc
class _$DistrictNestedModelCopyWithImpl<$Res>
    implements $DistrictNestedModelCopyWith<$Res> {
  _$DistrictNestedModelCopyWithImpl(this._self, this._then);

  final DistrictNestedModel _self;
  final $Res Function(DistrictNestedModel) _then;

/// Create a copy of DistrictNestedModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? uid = freezed,Object? name = freezed,Object? stateID = freezed,Object? state = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,uid: freezed == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,stateID: freezed == stateID ? _self.stateID : stateID // ignore: cast_nullable_to_non_nullable
as int?,state: freezed == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as StateNestedModel?,
  ));
}
/// Create a copy of DistrictNestedModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StateNestedModelCopyWith<$Res>? get state {
    if (_self.state == null) {
    return null;
  }

  return $StateNestedModelCopyWith<$Res>(_self.state!, (value) {
    return _then(_self.copyWith(state: value));
  });
}
}


/// Adds pattern-matching-related methods to [DistrictNestedModel].
extension DistrictNestedModelPatterns on DistrictNestedModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DistrictNestedModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DistrictNestedModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DistrictNestedModel value)  $default,){
final _that = this;
switch (_that) {
case _DistrictNestedModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DistrictNestedModel value)?  $default,){
final _that = this;
switch (_that) {
case _DistrictNestedModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  String? uid,  String? name,  int? stateID,  StateNestedModel? state)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DistrictNestedModel() when $default != null:
return $default(_that.id,_that.uid,_that.name,_that.stateID,_that.state);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  String? uid,  String? name,  int? stateID,  StateNestedModel? state)  $default,) {final _that = this;
switch (_that) {
case _DistrictNestedModel():
return $default(_that.id,_that.uid,_that.name,_that.stateID,_that.state);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  String? uid,  String? name,  int? stateID,  StateNestedModel? state)?  $default,) {final _that = this;
switch (_that) {
case _DistrictNestedModel() when $default != null:
return $default(_that.id,_that.uid,_that.name,_that.stateID,_that.state);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DistrictNestedModel implements DistrictNestedModel {
  const _DistrictNestedModel({this.id, this.uid, this.name, this.stateID, this.state});
  factory _DistrictNestedModel.fromJson(Map<String, dynamic> json) => _$DistrictNestedModelFromJson(json);

@override final  int? id;
@override final  String? uid;
@override final  String? name;
@override final  int? stateID;
@override final  StateNestedModel? state;

/// Create a copy of DistrictNestedModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DistrictNestedModelCopyWith<_DistrictNestedModel> get copyWith => __$DistrictNestedModelCopyWithImpl<_DistrictNestedModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DistrictNestedModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DistrictNestedModel&&(identical(other.id, id) || other.id == id)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.name, name) || other.name == name)&&(identical(other.stateID, stateID) || other.stateID == stateID)&&(identical(other.state, state) || other.state == state));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,uid,name,stateID,state);

@override
String toString() {
  return 'DistrictNestedModel(id: $id, uid: $uid, name: $name, stateID: $stateID, state: $state)';
}


}

/// @nodoc
abstract mixin class _$DistrictNestedModelCopyWith<$Res> implements $DistrictNestedModelCopyWith<$Res> {
  factory _$DistrictNestedModelCopyWith(_DistrictNestedModel value, $Res Function(_DistrictNestedModel) _then) = __$DistrictNestedModelCopyWithImpl;
@override @useResult
$Res call({
 int? id, String? uid, String? name, int? stateID, StateNestedModel? state
});


@override $StateNestedModelCopyWith<$Res>? get state;

}
/// @nodoc
class __$DistrictNestedModelCopyWithImpl<$Res>
    implements _$DistrictNestedModelCopyWith<$Res> {
  __$DistrictNestedModelCopyWithImpl(this._self, this._then);

  final _DistrictNestedModel _self;
  final $Res Function(_DistrictNestedModel) _then;

/// Create a copy of DistrictNestedModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? uid = freezed,Object? name = freezed,Object? stateID = freezed,Object? state = freezed,}) {
  return _then(_DistrictNestedModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,uid: freezed == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,stateID: freezed == stateID ? _self.stateID : stateID // ignore: cast_nullable_to_non_nullable
as int?,state: freezed == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as StateNestedModel?,
  ));
}

/// Create a copy of DistrictNestedModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StateNestedModelCopyWith<$Res>? get state {
    if (_self.state == null) {
    return null;
  }

  return $StateNestedModelCopyWith<$Res>(_self.state!, (value) {
    return _then(_self.copyWith(state: value));
  });
}
}

// dart format on
