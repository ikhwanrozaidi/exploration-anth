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

 String get name; String get uid; StateModel? get state;
/// Create a copy of DistrictModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DistrictModelCopyWith<DistrictModel> get copyWith => _$DistrictModelCopyWithImpl<DistrictModel>(this as DistrictModel, _$identity);

  /// Serializes this DistrictModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DistrictModel&&(identical(other.name, name) || other.name == name)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.state, state) || other.state == state));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,uid,state);

@override
String toString() {
  return 'DistrictModel(name: $name, uid: $uid, state: $state)';
}


}

/// @nodoc
abstract mixin class $DistrictModelCopyWith<$Res>  {
  factory $DistrictModelCopyWith(DistrictModel value, $Res Function(DistrictModel) _then) = _$DistrictModelCopyWithImpl;
@useResult
$Res call({
 String name, String uid, StateModel? state
});


$StateModelCopyWith<$Res>? get state;

}
/// @nodoc
class _$DistrictModelCopyWithImpl<$Res>
    implements $DistrictModelCopyWith<$Res> {
  _$DistrictModelCopyWithImpl(this._self, this._then);

  final DistrictModel _self;
  final $Res Function(DistrictModel) _then;

/// Create a copy of DistrictModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? uid = null,Object? state = freezed,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,state: freezed == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as StateModel?,
  ));
}
/// Create a copy of DistrictModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StateModelCopyWith<$Res>? get state {
    if (_self.state == null) {
    return null;
  }

  return $StateModelCopyWith<$Res>(_self.state!, (value) {
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String uid,  StateModel? state)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DistrictModel() when $default != null:
return $default(_that.name,_that.uid,_that.state);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String uid,  StateModel? state)  $default,) {final _that = this;
switch (_that) {
case _DistrictModel():
return $default(_that.name,_that.uid,_that.state);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String uid,  StateModel? state)?  $default,) {final _that = this;
switch (_that) {
case _DistrictModel() when $default != null:
return $default(_that.name,_that.uid,_that.state);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DistrictModel implements DistrictModel {
  const _DistrictModel({required this.name, required this.uid, this.state});
  factory _DistrictModel.fromJson(Map<String, dynamic> json) => _$DistrictModelFromJson(json);

@override final  String name;
@override final  String uid;
@override final  StateModel? state;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DistrictModel&&(identical(other.name, name) || other.name == name)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.state, state) || other.state == state));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,uid,state);

@override
String toString() {
  return 'DistrictModel(name: $name, uid: $uid, state: $state)';
}


}

/// @nodoc
abstract mixin class _$DistrictModelCopyWith<$Res> implements $DistrictModelCopyWith<$Res> {
  factory _$DistrictModelCopyWith(_DistrictModel value, $Res Function(_DistrictModel) _then) = __$DistrictModelCopyWithImpl;
@override @useResult
$Res call({
 String name, String uid, StateModel? state
});


@override $StateModelCopyWith<$Res>? get state;

}
/// @nodoc
class __$DistrictModelCopyWithImpl<$Res>
    implements _$DistrictModelCopyWith<$Res> {
  __$DistrictModelCopyWithImpl(this._self, this._then);

  final _DistrictModel _self;
  final $Res Function(_DistrictModel) _then;

/// Create a copy of DistrictModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? uid = null,Object? state = freezed,}) {
  return _then(_DistrictModel(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,state: freezed == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as StateModel?,
  ));
}

/// Create a copy of DistrictModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StateModelCopyWith<$Res>? get state {
    if (_self.state == null) {
    return null;
  }

  return $StateModelCopyWith<$Res>(_self.state!, (value) {
    return _then(_self.copyWith(state: value));
  });
}
}


/// @nodoc
mixin _$StateModel {

 String get name; String get uid; CountryModel? get country;
/// Create a copy of StateModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StateModelCopyWith<StateModel> get copyWith => _$StateModelCopyWithImpl<StateModel>(this as StateModel, _$identity);

  /// Serializes this StateModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StateModel&&(identical(other.name, name) || other.name == name)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.country, country) || other.country == country));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,uid,country);

@override
String toString() {
  return 'StateModel(name: $name, uid: $uid, country: $country)';
}


}

/// @nodoc
abstract mixin class $StateModelCopyWith<$Res>  {
  factory $StateModelCopyWith(StateModel value, $Res Function(StateModel) _then) = _$StateModelCopyWithImpl;
@useResult
$Res call({
 String name, String uid, CountryModel? country
});


$CountryModelCopyWith<$Res>? get country;

}
/// @nodoc
class _$StateModelCopyWithImpl<$Res>
    implements $StateModelCopyWith<$Res> {
  _$StateModelCopyWithImpl(this._self, this._then);

  final StateModel _self;
  final $Res Function(StateModel) _then;

/// Create a copy of StateModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? uid = null,Object? country = freezed,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,country: freezed == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as CountryModel?,
  ));
}
/// Create a copy of StateModel
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


/// Adds pattern-matching-related methods to [StateModel].
extension StateModelPatterns on StateModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StateModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StateModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StateModel value)  $default,){
final _that = this;
switch (_that) {
case _StateModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StateModel value)?  $default,){
final _that = this;
switch (_that) {
case _StateModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String uid,  CountryModel? country)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StateModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String uid,  CountryModel? country)  $default,) {final _that = this;
switch (_that) {
case _StateModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String uid,  CountryModel? country)?  $default,) {final _that = this;
switch (_that) {
case _StateModel() when $default != null:
return $default(_that.name,_that.uid,_that.country);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StateModel implements StateModel {
  const _StateModel({required this.name, required this.uid, this.country});
  factory _StateModel.fromJson(Map<String, dynamic> json) => _$StateModelFromJson(json);

@override final  String name;
@override final  String uid;
@override final  CountryModel? country;

/// Create a copy of StateModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StateModelCopyWith<_StateModel> get copyWith => __$StateModelCopyWithImpl<_StateModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StateModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StateModel&&(identical(other.name, name) || other.name == name)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.country, country) || other.country == country));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,uid,country);

@override
String toString() {
  return 'StateModel(name: $name, uid: $uid, country: $country)';
}


}

/// @nodoc
abstract mixin class _$StateModelCopyWith<$Res> implements $StateModelCopyWith<$Res> {
  factory _$StateModelCopyWith(_StateModel value, $Res Function(_StateModel) _then) = __$StateModelCopyWithImpl;
@override @useResult
$Res call({
 String name, String uid, CountryModel? country
});


@override $CountryModelCopyWith<$Res>? get country;

}
/// @nodoc
class __$StateModelCopyWithImpl<$Res>
    implements _$StateModelCopyWith<$Res> {
  __$StateModelCopyWithImpl(this._self, this._then);

  final _StateModel _self;
  final $Res Function(_StateModel) _then;

/// Create a copy of StateModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? uid = null,Object? country = freezed,}) {
  return _then(_StateModel(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,country: freezed == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as CountryModel?,
  ));
}

/// Create a copy of StateModel
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


/// @nodoc
mixin _$CountryModel {

 String get name; String get uid;
/// Create a copy of CountryModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CountryModelCopyWith<CountryModel> get copyWith => _$CountryModelCopyWithImpl<CountryModel>(this as CountryModel, _$identity);

  /// Serializes this CountryModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CountryModel&&(identical(other.name, name) || other.name == name)&&(identical(other.uid, uid) || other.uid == uid));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,uid);

@override
String toString() {
  return 'CountryModel(name: $name, uid: $uid)';
}


}

/// @nodoc
abstract mixin class $CountryModelCopyWith<$Res>  {
  factory $CountryModelCopyWith(CountryModel value, $Res Function(CountryModel) _then) = _$CountryModelCopyWithImpl;
@useResult
$Res call({
 String name, String uid
});




}
/// @nodoc
class _$CountryModelCopyWithImpl<$Res>
    implements $CountryModelCopyWith<$Res> {
  _$CountryModelCopyWithImpl(this._self, this._then);

  final CountryModel _self;
  final $Res Function(CountryModel) _then;

/// Create a copy of CountryModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? uid = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CountryModel].
extension CountryModelPatterns on CountryModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CountryModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CountryModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CountryModel value)  $default,){
final _that = this;
switch (_that) {
case _CountryModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CountryModel value)?  $default,){
final _that = this;
switch (_that) {
case _CountryModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String uid)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CountryModel() when $default != null:
return $default(_that.name,_that.uid);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String uid)  $default,) {final _that = this;
switch (_that) {
case _CountryModel():
return $default(_that.name,_that.uid);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String uid)?  $default,) {final _that = this;
switch (_that) {
case _CountryModel() when $default != null:
return $default(_that.name,_that.uid);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CountryModel implements CountryModel {
  const _CountryModel({required this.name, required this.uid});
  factory _CountryModel.fromJson(Map<String, dynamic> json) => _$CountryModelFromJson(json);

@override final  String name;
@override final  String uid;

/// Create a copy of CountryModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CountryModelCopyWith<_CountryModel> get copyWith => __$CountryModelCopyWithImpl<_CountryModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CountryModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CountryModel&&(identical(other.name, name) || other.name == name)&&(identical(other.uid, uid) || other.uid == uid));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,uid);

@override
String toString() {
  return 'CountryModel(name: $name, uid: $uid)';
}


}

/// @nodoc
abstract mixin class _$CountryModelCopyWith<$Res> implements $CountryModelCopyWith<$Res> {
  factory _$CountryModelCopyWith(_CountryModel value, $Res Function(_CountryModel) _then) = __$CountryModelCopyWithImpl;
@override @useResult
$Res call({
 String name, String uid
});




}
/// @nodoc
class __$CountryModelCopyWithImpl<$Res>
    implements _$CountryModelCopyWith<$Res> {
  __$CountryModelCopyWithImpl(this._self, this._then);

  final _CountryModel _self;
  final $Res Function(_CountryModel) _then;

/// Create a copy of CountryModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? uid = null,}) {
  return _then(_CountryModel(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
