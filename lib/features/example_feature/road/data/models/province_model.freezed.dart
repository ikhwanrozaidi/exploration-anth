// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'province_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProvinceModel {

 int? get id; String? get uid; String? get name; int? get countryID; String? get countryUID; String? get createdAt; String? get updatedAt; CountryModel? get country;
/// Create a copy of ProvinceModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProvinceModelCopyWith<ProvinceModel> get copyWith => _$ProvinceModelCopyWithImpl<ProvinceModel>(this as ProvinceModel, _$identity);

  /// Serializes this ProvinceModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProvinceModel&&(identical(other.id, id) || other.id == id)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.name, name) || other.name == name)&&(identical(other.countryID, countryID) || other.countryID == countryID)&&(identical(other.countryUID, countryUID) || other.countryUID == countryUID)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.country, country) || other.country == country));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,uid,name,countryID,countryUID,createdAt,updatedAt,country);

@override
String toString() {
  return 'ProvinceModel(id: $id, uid: $uid, name: $name, countryID: $countryID, countryUID: $countryUID, createdAt: $createdAt, updatedAt: $updatedAt, country: $country)';
}


}

/// @nodoc
abstract mixin class $ProvinceModelCopyWith<$Res>  {
  factory $ProvinceModelCopyWith(ProvinceModel value, $Res Function(ProvinceModel) _then) = _$ProvinceModelCopyWithImpl;
@useResult
$Res call({
 int? id, String? uid, String? name, int? countryID, String? countryUID, String? createdAt, String? updatedAt, CountryModel? country
});


$CountryModelCopyWith<$Res>? get country;

}
/// @nodoc
class _$ProvinceModelCopyWithImpl<$Res>
    implements $ProvinceModelCopyWith<$Res> {
  _$ProvinceModelCopyWithImpl(this._self, this._then);

  final ProvinceModel _self;
  final $Res Function(ProvinceModel) _then;

/// Create a copy of ProvinceModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? uid = freezed,Object? name = freezed,Object? countryID = freezed,Object? countryUID = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? country = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,uid: freezed == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,countryID: freezed == countryID ? _self.countryID : countryID // ignore: cast_nullable_to_non_nullable
as int?,countryUID: freezed == countryUID ? _self.countryUID : countryUID // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,country: freezed == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as CountryModel?,
  ));
}
/// Create a copy of ProvinceModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CountryModelCopyWith<$Res>? get country {
    if (_self.country == null) {
    return null;
  }

  return $CountryModelCopyWith<$Res>(_self.country!, (value) {
    return _then(_self.copyWith(country: value));
  });
}
}


/// Adds pattern-matching-related methods to [ProvinceModel].
extension ProvinceModelPatterns on ProvinceModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProvinceModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProvinceModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProvinceModel value)  $default,){
final _that = this;
switch (_that) {
case _ProvinceModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProvinceModel value)?  $default,){
final _that = this;
switch (_that) {
case _ProvinceModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  String? uid,  String? name,  int? countryID,  String? countryUID,  String? createdAt,  String? updatedAt,  CountryModel? country)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProvinceModel() when $default != null:
return $default(_that.id,_that.uid,_that.name,_that.countryID,_that.countryUID,_that.createdAt,_that.updatedAt,_that.country);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  String? uid,  String? name,  int? countryID,  String? countryUID,  String? createdAt,  String? updatedAt,  CountryModel? country)  $default,) {final _that = this;
switch (_that) {
case _ProvinceModel():
return $default(_that.id,_that.uid,_that.name,_that.countryID,_that.countryUID,_that.createdAt,_that.updatedAt,_that.country);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  String? uid,  String? name,  int? countryID,  String? countryUID,  String? createdAt,  String? updatedAt,  CountryModel? country)?  $default,) {final _that = this;
switch (_that) {
case _ProvinceModel() when $default != null:
return $default(_that.id,_that.uid,_that.name,_that.countryID,_that.countryUID,_that.createdAt,_that.updatedAt,_that.country);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProvinceModel extends ProvinceModel {
  const _ProvinceModel({this.id, this.uid, this.name, this.countryID, this.countryUID, this.createdAt, this.updatedAt, this.country}): super._();
  factory _ProvinceModel.fromJson(Map<String, dynamic> json) => _$ProvinceModelFromJson(json);

@override final  int? id;
@override final  String? uid;
@override final  String? name;
@override final  int? countryID;
@override final  String? countryUID;
@override final  String? createdAt;
@override final  String? updatedAt;
@override final  CountryModel? country;

/// Create a copy of ProvinceModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProvinceModelCopyWith<_ProvinceModel> get copyWith => __$ProvinceModelCopyWithImpl<_ProvinceModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProvinceModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProvinceModel&&(identical(other.id, id) || other.id == id)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.name, name) || other.name == name)&&(identical(other.countryID, countryID) || other.countryID == countryID)&&(identical(other.countryUID, countryUID) || other.countryUID == countryUID)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.country, country) || other.country == country));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,uid,name,countryID,countryUID,createdAt,updatedAt,country);

@override
String toString() {
  return 'ProvinceModel(id: $id, uid: $uid, name: $name, countryID: $countryID, countryUID: $countryUID, createdAt: $createdAt, updatedAt: $updatedAt, country: $country)';
}


}

/// @nodoc
abstract mixin class _$ProvinceModelCopyWith<$Res> implements $ProvinceModelCopyWith<$Res> {
  factory _$ProvinceModelCopyWith(_ProvinceModel value, $Res Function(_ProvinceModel) _then) = __$ProvinceModelCopyWithImpl;
@override @useResult
$Res call({
 int? id, String? uid, String? name, int? countryID, String? countryUID, String? createdAt, String? updatedAt, CountryModel? country
});


@override $CountryModelCopyWith<$Res>? get country;

}
/// @nodoc
class __$ProvinceModelCopyWithImpl<$Res>
    implements _$ProvinceModelCopyWith<$Res> {
  __$ProvinceModelCopyWithImpl(this._self, this._then);

  final _ProvinceModel _self;
  final $Res Function(_ProvinceModel) _then;

/// Create a copy of ProvinceModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? uid = freezed,Object? name = freezed,Object? countryID = freezed,Object? countryUID = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? country = freezed,}) {
  return _then(_ProvinceModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,uid: freezed == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,countryID: freezed == countryID ? _self.countryID : countryID // ignore: cast_nullable_to_non_nullable
as int?,countryUID: freezed == countryUID ? _self.countryUID : countryUID // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,country: freezed == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as CountryModel?,
  ));
}

/// Create a copy of ProvinceModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CountryModelCopyWith<$Res>? get country {
    if (_self.country == null) {
    return null;
  }

  return $CountryModelCopyWith<$Res>(_self.country!, (value) {
    return _then(_self.copyWith(country: value));
  });
}
}

// dart format on
