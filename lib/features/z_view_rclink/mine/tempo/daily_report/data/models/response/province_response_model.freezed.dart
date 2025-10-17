// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'province_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$StateResponseModel {

 String? get name; String? get uid; CountryResponseModel? get country;
/// Create a copy of StateResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StateResponseModelCopyWith<StateResponseModel> get copyWith => _$StateResponseModelCopyWithImpl<StateResponseModel>(this as StateResponseModel, _$identity);

  /// Serializes this StateResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StateResponseModel&&(identical(other.name, name) || other.name == name)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.country, country) || other.country == country));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,uid,country);

@override
String toString() {
  return 'StateResponseModel(name: $name, uid: $uid, country: $country)';
}


}

/// @nodoc
abstract mixin class $StateResponseModelCopyWith<$Res>  {
  factory $StateResponseModelCopyWith(StateResponseModel value, $Res Function(StateResponseModel) _then) = _$StateResponseModelCopyWithImpl;
@useResult
$Res call({
 String? name, String? uid, CountryResponseModel? country
});


$CountryResponseModelCopyWith<$Res>? get country;

}
/// @nodoc
class _$StateResponseModelCopyWithImpl<$Res>
    implements $StateResponseModelCopyWith<$Res> {
  _$StateResponseModelCopyWithImpl(this._self, this._then);

  final StateResponseModel _self;
  final $Res Function(StateResponseModel) _then;

/// Create a copy of StateResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = freezed,Object? uid = freezed,Object? country = freezed,}) {
  return _then(_self.copyWith(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,uid: freezed == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String?,country: freezed == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as CountryResponseModel?,
  ));
}
/// Create a copy of StateResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CountryResponseModelCopyWith<$Res>? get country {
    if (_self.country == null) {
    return null;
  }

  return $CountryResponseModelCopyWith<$Res>(_self.country!, (value) {
    return _then(_self.copyWith(country: value));
  });
}
}


/// Adds pattern-matching-related methods to [StateResponseModel].
extension StateResponseModelPatterns on StateResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StateResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StateResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StateResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _StateResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StateResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _StateResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? name,  String? uid,  CountryResponseModel? country)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StateResponseModel() when $default != null:
return $default(_that.name,_that.uid,_that.country);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? name,  String? uid,  CountryResponseModel? country)  $default,) {final _that = this;
switch (_that) {
case _StateResponseModel():
return $default(_that.name,_that.uid,_that.country);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? name,  String? uid,  CountryResponseModel? country)?  $default,) {final _that = this;
switch (_that) {
case _StateResponseModel() when $default != null:
return $default(_that.name,_that.uid,_that.country);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StateResponseModel extends StateResponseModel {
  const _StateResponseModel({this.name, this.uid, this.country}): super._();
  factory _StateResponseModel.fromJson(Map<String, dynamic> json) => _$StateResponseModelFromJson(json);

@override final  String? name;
@override final  String? uid;
@override final  CountryResponseModel? country;

/// Create a copy of StateResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StateResponseModelCopyWith<_StateResponseModel> get copyWith => __$StateResponseModelCopyWithImpl<_StateResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StateResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StateResponseModel&&(identical(other.name, name) || other.name == name)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.country, country) || other.country == country));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,uid,country);

@override
String toString() {
  return 'StateResponseModel(name: $name, uid: $uid, country: $country)';
}


}

/// @nodoc
abstract mixin class _$StateResponseModelCopyWith<$Res> implements $StateResponseModelCopyWith<$Res> {
  factory _$StateResponseModelCopyWith(_StateResponseModel value, $Res Function(_StateResponseModel) _then) = __$StateResponseModelCopyWithImpl;
@override @useResult
$Res call({
 String? name, String? uid, CountryResponseModel? country
});


@override $CountryResponseModelCopyWith<$Res>? get country;

}
/// @nodoc
class __$StateResponseModelCopyWithImpl<$Res>
    implements _$StateResponseModelCopyWith<$Res> {
  __$StateResponseModelCopyWithImpl(this._self, this._then);

  final _StateResponseModel _self;
  final $Res Function(_StateResponseModel) _then;

/// Create a copy of StateResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = freezed,Object? uid = freezed,Object? country = freezed,}) {
  return _then(_StateResponseModel(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,uid: freezed == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String?,country: freezed == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as CountryResponseModel?,
  ));
}

/// Create a copy of StateResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CountryResponseModelCopyWith<$Res>? get country {
    if (_self.country == null) {
    return null;
  }

  return $CountryResponseModelCopyWith<$Res>(_self.country!, (value) {
    return _then(_self.copyWith(country: value));
  });
}
}

// dart format on
