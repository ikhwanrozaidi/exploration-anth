// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'road_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RoadModel {

 String get name; String get roadNo; String get uid; DistrictModel? get district;
/// Create a copy of RoadModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RoadModelCopyWith<RoadModel> get copyWith => _$RoadModelCopyWithImpl<RoadModel>(this as RoadModel, _$identity);

  /// Serializes this RoadModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RoadModel&&(identical(other.name, name) || other.name == name)&&(identical(other.roadNo, roadNo) || other.roadNo == roadNo)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.district, district) || other.district == district));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,roadNo,uid,district);

@override
String toString() {
  return 'RoadModel(name: $name, roadNo: $roadNo, uid: $uid, district: $district)';
}


}

/// @nodoc
abstract mixin class $RoadModelCopyWith<$Res>  {
  factory $RoadModelCopyWith(RoadModel value, $Res Function(RoadModel) _then) = _$RoadModelCopyWithImpl;
@useResult
$Res call({
 String name, String roadNo, String uid, DistrictModel? district
});


$DistrictModelCopyWith<$Res>? get district;

}
/// @nodoc
class _$RoadModelCopyWithImpl<$Res>
    implements $RoadModelCopyWith<$Res> {
  _$RoadModelCopyWithImpl(this._self, this._then);

  final RoadModel _self;
  final $Res Function(RoadModel) _then;

/// Create a copy of RoadModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? roadNo = null,Object? uid = null,Object? district = freezed,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,roadNo: null == roadNo ? _self.roadNo : roadNo // ignore: cast_nullable_to_non_nullable
as String,uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,district: freezed == district ? _self.district : district // ignore: cast_nullable_to_non_nullable
as DistrictModel?,
  ));
}
/// Create a copy of RoadModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DistrictModelCopyWith<$Res>? get district {
    if (_self.district == null) {
    return null;
  }

  return $DistrictModelCopyWith<$Res>(_self.district!, (value) {
    return _then(_self.copyWith(district: value));
  });
}
}


/// Adds pattern-matching-related methods to [RoadModel].
extension RoadModelPatterns on RoadModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RoadModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RoadModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RoadModel value)  $default,){
final _that = this;
switch (_that) {
case _RoadModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RoadModel value)?  $default,){
final _that = this;
switch (_that) {
case _RoadModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String roadNo,  String uid,  DistrictModel? district)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RoadModel() when $default != null:
return $default(_that.name,_that.roadNo,_that.uid,_that.district);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String roadNo,  String uid,  DistrictModel? district)  $default,) {final _that = this;
switch (_that) {
case _RoadModel():
return $default(_that.name,_that.roadNo,_that.uid,_that.district);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String roadNo,  String uid,  DistrictModel? district)?  $default,) {final _that = this;
switch (_that) {
case _RoadModel() when $default != null:
return $default(_that.name,_that.roadNo,_that.uid,_that.district);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RoadModel extends RoadModel {
  const _RoadModel({required this.name, required this.roadNo, required this.uid, this.district}): super._();
  factory _RoadModel.fromJson(Map<String, dynamic> json) => _$RoadModelFromJson(json);

@override final  String name;
@override final  String roadNo;
@override final  String uid;
@override final  DistrictModel? district;

/// Create a copy of RoadModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RoadModelCopyWith<_RoadModel> get copyWith => __$RoadModelCopyWithImpl<_RoadModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RoadModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RoadModel&&(identical(other.name, name) || other.name == name)&&(identical(other.roadNo, roadNo) || other.roadNo == roadNo)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.district, district) || other.district == district));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,roadNo,uid,district);

@override
String toString() {
  return 'RoadModel(name: $name, roadNo: $roadNo, uid: $uid, district: $district)';
}


}

/// @nodoc
abstract mixin class _$RoadModelCopyWith<$Res> implements $RoadModelCopyWith<$Res> {
  factory _$RoadModelCopyWith(_RoadModel value, $Res Function(_RoadModel) _then) = __$RoadModelCopyWithImpl;
@override @useResult
$Res call({
 String name, String roadNo, String uid, DistrictModel? district
});


@override $DistrictModelCopyWith<$Res>? get district;

}
/// @nodoc
class __$RoadModelCopyWithImpl<$Res>
    implements _$RoadModelCopyWith<$Res> {
  __$RoadModelCopyWithImpl(this._self, this._then);

  final _RoadModel _self;
  final $Res Function(_RoadModel) _then;

/// Create a copy of RoadModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? roadNo = null,Object? uid = null,Object? district = freezed,}) {
  return _then(_RoadModel(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,roadNo: null == roadNo ? _self.roadNo : roadNo // ignore: cast_nullable_to_non_nullable
as String,uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,district: freezed == district ? _self.district : district // ignore: cast_nullable_to_non_nullable
as DistrictModel?,
  ));
}

/// Create a copy of RoadModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DistrictModelCopyWith<$Res>? get district {
    if (_self.district == null) {
    return null;
  }

  return $DistrictModelCopyWith<$Res>(_self.district!, (value) {
    return _then(_self.copyWith(district: value));
  });
}
}

// dart format on
