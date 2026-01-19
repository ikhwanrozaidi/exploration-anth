// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'state_nested_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$StateNestedModel {

 int? get id; String? get uid; String? get name; String? get code; int? get countryID; String? get createdAt; String? get updatedAt; CountryNestedModel? get country;
/// Create a copy of StateNestedModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StateNestedModelCopyWith<StateNestedModel> get copyWith => _$StateNestedModelCopyWithImpl<StateNestedModel>(this as StateNestedModel, _$identity);

  /// Serializes this StateNestedModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StateNestedModel&&(identical(other.id, id) || other.id == id)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.name, name) || other.name == name)&&(identical(other.code, code) || other.code == code)&&(identical(other.countryID, countryID) || other.countryID == countryID)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.country, country) || other.country == country));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,uid,name,code,countryID,createdAt,updatedAt,country);

@override
String toString() {
  return 'StateNestedModel(id: $id, uid: $uid, name: $name, code: $code, countryID: $countryID, createdAt: $createdAt, updatedAt: $updatedAt, country: $country)';
}


}

/// @nodoc
abstract mixin class $StateNestedModelCopyWith<$Res>  {
  factory $StateNestedModelCopyWith(StateNestedModel value, $Res Function(StateNestedModel) _then) = _$StateNestedModelCopyWithImpl;
@useResult
$Res call({
 int? id, String? uid, String? name, String? code, int? countryID, String? createdAt, String? updatedAt, CountryNestedModel? country
});


$CountryNestedModelCopyWith<$Res>? get country;

}
/// @nodoc
class _$StateNestedModelCopyWithImpl<$Res>
    implements $StateNestedModelCopyWith<$Res> {
  _$StateNestedModelCopyWithImpl(this._self, this._then);

  final StateNestedModel _self;
  final $Res Function(StateNestedModel) _then;

/// Create a copy of StateNestedModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? uid = freezed,Object? name = freezed,Object? code = freezed,Object? countryID = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? country = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,uid: freezed == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String?,countryID: freezed == countryID ? _self.countryID : countryID // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,country: freezed == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as CountryNestedModel?,
  ));
}
/// Create a copy of StateNestedModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CountryNestedModelCopyWith<$Res>? get country {
    if (_self.country == null) {
    return null;
  }

  return $CountryNestedModelCopyWith<$Res>(_self.country!, (value) {
    return _then(_self.copyWith(country: value));
  });
}
}


/// Adds pattern-matching-related methods to [StateNestedModel].
extension StateNestedModelPatterns on StateNestedModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StateNestedModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StateNestedModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StateNestedModel value)  $default,){
final _that = this;
switch (_that) {
case _StateNestedModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StateNestedModel value)?  $default,){
final _that = this;
switch (_that) {
case _StateNestedModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  String? uid,  String? name,  String? code,  int? countryID,  String? createdAt,  String? updatedAt,  CountryNestedModel? country)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StateNestedModel() when $default != null:
return $default(_that.id,_that.uid,_that.name,_that.code,_that.countryID,_that.createdAt,_that.updatedAt,_that.country);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  String? uid,  String? name,  String? code,  int? countryID,  String? createdAt,  String? updatedAt,  CountryNestedModel? country)  $default,) {final _that = this;
switch (_that) {
case _StateNestedModel():
return $default(_that.id,_that.uid,_that.name,_that.code,_that.countryID,_that.createdAt,_that.updatedAt,_that.country);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  String? uid,  String? name,  String? code,  int? countryID,  String? createdAt,  String? updatedAt,  CountryNestedModel? country)?  $default,) {final _that = this;
switch (_that) {
case _StateNestedModel() when $default != null:
return $default(_that.id,_that.uid,_that.name,_that.code,_that.countryID,_that.createdAt,_that.updatedAt,_that.country);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StateNestedModel implements StateNestedModel {
  const _StateNestedModel({this.id, this.uid, this.name, this.code, this.countryID, this.createdAt, this.updatedAt, this.country});
  factory _StateNestedModel.fromJson(Map<String, dynamic> json) => _$StateNestedModelFromJson(json);

@override final  int? id;
@override final  String? uid;
@override final  String? name;
@override final  String? code;
@override final  int? countryID;
@override final  String? createdAt;
@override final  String? updatedAt;
@override final  CountryNestedModel? country;

/// Create a copy of StateNestedModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StateNestedModelCopyWith<_StateNestedModel> get copyWith => __$StateNestedModelCopyWithImpl<_StateNestedModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StateNestedModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StateNestedModel&&(identical(other.id, id) || other.id == id)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.name, name) || other.name == name)&&(identical(other.code, code) || other.code == code)&&(identical(other.countryID, countryID) || other.countryID == countryID)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.country, country) || other.country == country));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,uid,name,code,countryID,createdAt,updatedAt,country);

@override
String toString() {
  return 'StateNestedModel(id: $id, uid: $uid, name: $name, code: $code, countryID: $countryID, createdAt: $createdAt, updatedAt: $updatedAt, country: $country)';
}


}

/// @nodoc
abstract mixin class _$StateNestedModelCopyWith<$Res> implements $StateNestedModelCopyWith<$Res> {
  factory _$StateNestedModelCopyWith(_StateNestedModel value, $Res Function(_StateNestedModel) _then) = __$StateNestedModelCopyWithImpl;
@override @useResult
$Res call({
 int? id, String? uid, String? name, String? code, int? countryID, String? createdAt, String? updatedAt, CountryNestedModel? country
});


@override $CountryNestedModelCopyWith<$Res>? get country;

}
/// @nodoc
class __$StateNestedModelCopyWithImpl<$Res>
    implements _$StateNestedModelCopyWith<$Res> {
  __$StateNestedModelCopyWithImpl(this._self, this._then);

  final _StateNestedModel _self;
  final $Res Function(_StateNestedModel) _then;

/// Create a copy of StateNestedModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? uid = freezed,Object? name = freezed,Object? code = freezed,Object? countryID = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? country = freezed,}) {
  return _then(_StateNestedModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,uid: freezed == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String?,countryID: freezed == countryID ? _self.countryID : countryID // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,country: freezed == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as CountryNestedModel?,
  ));
}

/// Create a copy of StateNestedModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CountryNestedModelCopyWith<$Res>? get country {
    if (_self.country == null) {
    return null;
  }

  return $CountryNestedModelCopyWith<$Res>(_self.country!, (value) {
    return _then(_self.copyWith(country: value));
  });
}
}

// dart format on
