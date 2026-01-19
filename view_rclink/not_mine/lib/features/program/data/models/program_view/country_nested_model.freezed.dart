// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'country_nested_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CountryNestedModel {

 int? get id; String? get uid; String? get name; String? get code; String? get createdAt; String? get updatedAt;
/// Create a copy of CountryNestedModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CountryNestedModelCopyWith<CountryNestedModel> get copyWith => _$CountryNestedModelCopyWithImpl<CountryNestedModel>(this as CountryNestedModel, _$identity);

  /// Serializes this CountryNestedModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CountryNestedModel&&(identical(other.id, id) || other.id == id)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.name, name) || other.name == name)&&(identical(other.code, code) || other.code == code)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,uid,name,code,createdAt,updatedAt);

@override
String toString() {
  return 'CountryNestedModel(id: $id, uid: $uid, name: $name, code: $code, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $CountryNestedModelCopyWith<$Res>  {
  factory $CountryNestedModelCopyWith(CountryNestedModel value, $Res Function(CountryNestedModel) _then) = _$CountryNestedModelCopyWithImpl;
@useResult
$Res call({
 int? id, String? uid, String? name, String? code, String? createdAt, String? updatedAt
});




}
/// @nodoc
class _$CountryNestedModelCopyWithImpl<$Res>
    implements $CountryNestedModelCopyWith<$Res> {
  _$CountryNestedModelCopyWithImpl(this._self, this._then);

  final CountryNestedModel _self;
  final $Res Function(CountryNestedModel) _then;

/// Create a copy of CountryNestedModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? uid = freezed,Object? name = freezed,Object? code = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,uid: freezed == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CountryNestedModel].
extension CountryNestedModelPatterns on CountryNestedModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CountryNestedModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CountryNestedModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CountryNestedModel value)  $default,){
final _that = this;
switch (_that) {
case _CountryNestedModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CountryNestedModel value)?  $default,){
final _that = this;
switch (_that) {
case _CountryNestedModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  String? uid,  String? name,  String? code,  String? createdAt,  String? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CountryNestedModel() when $default != null:
return $default(_that.id,_that.uid,_that.name,_that.code,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  String? uid,  String? name,  String? code,  String? createdAt,  String? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _CountryNestedModel():
return $default(_that.id,_that.uid,_that.name,_that.code,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  String? uid,  String? name,  String? code,  String? createdAt,  String? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _CountryNestedModel() when $default != null:
return $default(_that.id,_that.uid,_that.name,_that.code,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CountryNestedModel implements CountryNestedModel {
  const _CountryNestedModel({this.id, this.uid, this.name, this.code, this.createdAt, this.updatedAt});
  factory _CountryNestedModel.fromJson(Map<String, dynamic> json) => _$CountryNestedModelFromJson(json);

@override final  int? id;
@override final  String? uid;
@override final  String? name;
@override final  String? code;
@override final  String? createdAt;
@override final  String? updatedAt;

/// Create a copy of CountryNestedModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CountryNestedModelCopyWith<_CountryNestedModel> get copyWith => __$CountryNestedModelCopyWithImpl<_CountryNestedModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CountryNestedModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CountryNestedModel&&(identical(other.id, id) || other.id == id)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.name, name) || other.name == name)&&(identical(other.code, code) || other.code == code)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,uid,name,code,createdAt,updatedAt);

@override
String toString() {
  return 'CountryNestedModel(id: $id, uid: $uid, name: $name, code: $code, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$CountryNestedModelCopyWith<$Res> implements $CountryNestedModelCopyWith<$Res> {
  factory _$CountryNestedModelCopyWith(_CountryNestedModel value, $Res Function(_CountryNestedModel) _then) = __$CountryNestedModelCopyWithImpl;
@override @useResult
$Res call({
 int? id, String? uid, String? name, String? code, String? createdAt, String? updatedAt
});




}
/// @nodoc
class __$CountryNestedModelCopyWithImpl<$Res>
    implements _$CountryNestedModelCopyWith<$Res> {
  __$CountryNestedModelCopyWithImpl(this._self, this._then);

  final _CountryNestedModel _self;
  final $Res Function(_CountryNestedModel) _then;

/// Create a copy of CountryNestedModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? uid = freezed,Object? name = freezed,Object? code = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_CountryNestedModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,uid: freezed == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
