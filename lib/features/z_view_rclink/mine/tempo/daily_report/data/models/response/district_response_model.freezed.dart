// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'district_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DistrictResponseModel {

 String? get name; String? get uid; StateResponseModel? get state;
/// Create a copy of DistrictResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DistrictResponseModelCopyWith<DistrictResponseModel> get copyWith => _$DistrictResponseModelCopyWithImpl<DistrictResponseModel>(this as DistrictResponseModel, _$identity);

  /// Serializes this DistrictResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DistrictResponseModel&&(identical(other.name, name) || other.name == name)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.state, state) || other.state == state));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,uid,state);

@override
String toString() {
  return 'DistrictResponseModel(name: $name, uid: $uid, state: $state)';
}


}

/// @nodoc
abstract mixin class $DistrictResponseModelCopyWith<$Res>  {
  factory $DistrictResponseModelCopyWith(DistrictResponseModel value, $Res Function(DistrictResponseModel) _then) = _$DistrictResponseModelCopyWithImpl;
@useResult
$Res call({
 String? name, String? uid, StateResponseModel? state
});


$StateResponseModelCopyWith<$Res>? get state;

}
/// @nodoc
class _$DistrictResponseModelCopyWithImpl<$Res>
    implements $DistrictResponseModelCopyWith<$Res> {
  _$DistrictResponseModelCopyWithImpl(this._self, this._then);

  final DistrictResponseModel _self;
  final $Res Function(DistrictResponseModel) _then;

/// Create a copy of DistrictResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = freezed,Object? uid = freezed,Object? state = freezed,}) {
  return _then(_self.copyWith(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,uid: freezed == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String?,state: freezed == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as StateResponseModel?,
  ));
}
/// Create a copy of DistrictResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StateResponseModelCopyWith<$Res>? get state {
    if (_self.state == null) {
    return null;
  }

  return $StateResponseModelCopyWith<$Res>(_self.state!, (value) {
    return _then(_self.copyWith(state: value));
  });
}
}


/// Adds pattern-matching-related methods to [DistrictResponseModel].
extension DistrictResponseModelPatterns on DistrictResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DistrictResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DistrictResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DistrictResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _DistrictResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DistrictResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _DistrictResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? name,  String? uid,  StateResponseModel? state)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DistrictResponseModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? name,  String? uid,  StateResponseModel? state)  $default,) {final _that = this;
switch (_that) {
case _DistrictResponseModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? name,  String? uid,  StateResponseModel? state)?  $default,) {final _that = this;
switch (_that) {
case _DistrictResponseModel() when $default != null:
return $default(_that.name,_that.uid,_that.state);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DistrictResponseModel extends DistrictResponseModel {
  const _DistrictResponseModel({this.name, this.uid, this.state}): super._();
  factory _DistrictResponseModel.fromJson(Map<String, dynamic> json) => _$DistrictResponseModelFromJson(json);

@override final  String? name;
@override final  String? uid;
@override final  StateResponseModel? state;

/// Create a copy of DistrictResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DistrictResponseModelCopyWith<_DistrictResponseModel> get copyWith => __$DistrictResponseModelCopyWithImpl<_DistrictResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DistrictResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DistrictResponseModel&&(identical(other.name, name) || other.name == name)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.state, state) || other.state == state));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,uid,state);

@override
String toString() {
  return 'DistrictResponseModel(name: $name, uid: $uid, state: $state)';
}


}

/// @nodoc
abstract mixin class _$DistrictResponseModelCopyWith<$Res> implements $DistrictResponseModelCopyWith<$Res> {
  factory _$DistrictResponseModelCopyWith(_DistrictResponseModel value, $Res Function(_DistrictResponseModel) _then) = __$DistrictResponseModelCopyWithImpl;
@override @useResult
$Res call({
 String? name, String? uid, StateResponseModel? state
});


@override $StateResponseModelCopyWith<$Res>? get state;

}
/// @nodoc
class __$DistrictResponseModelCopyWithImpl<$Res>
    implements _$DistrictResponseModelCopyWith<$Res> {
  __$DistrictResponseModelCopyWithImpl(this._self, this._then);

  final _DistrictResponseModel _self;
  final $Res Function(_DistrictResponseModel) _then;

/// Create a copy of DistrictResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = freezed,Object? uid = freezed,Object? state = freezed,}) {
  return _then(_DistrictResponseModel(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,uid: freezed == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String?,state: freezed == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as StateResponseModel?,
  ));
}

/// Create a copy of DistrictResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StateResponseModelCopyWith<$Res>? get state {
    if (_self.state == null) {
    return null;
  }

  return $StateResponseModelCopyWith<$Res>(_self.state!, (value) {
    return _then(_self.copyWith(state: value));
  });
}
}

// dart format on
