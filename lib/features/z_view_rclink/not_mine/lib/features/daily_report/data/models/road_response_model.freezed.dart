// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'road_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RoadResponseModel {

 String get uid; String get name; String get roadNo; DistrictResponseModel? get district;
/// Create a copy of RoadResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RoadResponseModelCopyWith<RoadResponseModel> get copyWith => _$RoadResponseModelCopyWithImpl<RoadResponseModel>(this as RoadResponseModel, _$identity);

  /// Serializes this RoadResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RoadResponseModel&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.name, name) || other.name == name)&&(identical(other.roadNo, roadNo) || other.roadNo == roadNo)&&(identical(other.district, district) || other.district == district));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,uid,name,roadNo,district);

@override
String toString() {
  return 'RoadResponseModel(uid: $uid, name: $name, roadNo: $roadNo, district: $district)';
}


}

/// @nodoc
abstract mixin class $RoadResponseModelCopyWith<$Res>  {
  factory $RoadResponseModelCopyWith(RoadResponseModel value, $Res Function(RoadResponseModel) _then) = _$RoadResponseModelCopyWithImpl;
@useResult
$Res call({
 String uid, String name, String roadNo, DistrictResponseModel? district
});


$DistrictResponseModelCopyWith<$Res>? get district;

}
/// @nodoc
class _$RoadResponseModelCopyWithImpl<$Res>
    implements $RoadResponseModelCopyWith<$Res> {
  _$RoadResponseModelCopyWithImpl(this._self, this._then);

  final RoadResponseModel _self;
  final $Res Function(RoadResponseModel) _then;

/// Create a copy of RoadResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? uid = null,Object? name = null,Object? roadNo = null,Object? district = freezed,}) {
  return _then(_self.copyWith(
uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,roadNo: null == roadNo ? _self.roadNo : roadNo // ignore: cast_nullable_to_non_nullable
as String,district: freezed == district ? _self.district : district // ignore: cast_nullable_to_non_nullable
as DistrictResponseModel?,
  ));
}
/// Create a copy of RoadResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DistrictResponseModelCopyWith<$Res>? get district {
    if (_self.district == null) {
    return null;
  }

  return $DistrictResponseModelCopyWith<$Res>(_self.district!, (value) {
    return _then(_self.copyWith(district: value));
  });
}
}


/// Adds pattern-matching-related methods to [RoadResponseModel].
extension RoadResponseModelPatterns on RoadResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RoadResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RoadResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RoadResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _RoadResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RoadResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _RoadResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String uid,  String name,  String roadNo,  DistrictResponseModel? district)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RoadResponseModel() when $default != null:
return $default(_that.uid,_that.name,_that.roadNo,_that.district);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String uid,  String name,  String roadNo,  DistrictResponseModel? district)  $default,) {final _that = this;
switch (_that) {
case _RoadResponseModel():
return $default(_that.uid,_that.name,_that.roadNo,_that.district);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String uid,  String name,  String roadNo,  DistrictResponseModel? district)?  $default,) {final _that = this;
switch (_that) {
case _RoadResponseModel() when $default != null:
return $default(_that.uid,_that.name,_that.roadNo,_that.district);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RoadResponseModel extends RoadResponseModel {
  const _RoadResponseModel({required this.uid, required this.name, required this.roadNo, this.district}): super._();
  factory _RoadResponseModel.fromJson(Map<String, dynamic> json) => _$RoadResponseModelFromJson(json);

@override final  String uid;
@override final  String name;
@override final  String roadNo;
@override final  DistrictResponseModel? district;

/// Create a copy of RoadResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RoadResponseModelCopyWith<_RoadResponseModel> get copyWith => __$RoadResponseModelCopyWithImpl<_RoadResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RoadResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RoadResponseModel&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.name, name) || other.name == name)&&(identical(other.roadNo, roadNo) || other.roadNo == roadNo)&&(identical(other.district, district) || other.district == district));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,uid,name,roadNo,district);

@override
String toString() {
  return 'RoadResponseModel(uid: $uid, name: $name, roadNo: $roadNo, district: $district)';
}


}

/// @nodoc
abstract mixin class _$RoadResponseModelCopyWith<$Res> implements $RoadResponseModelCopyWith<$Res> {
  factory _$RoadResponseModelCopyWith(_RoadResponseModel value, $Res Function(_RoadResponseModel) _then) = __$RoadResponseModelCopyWithImpl;
@override @useResult
$Res call({
 String uid, String name, String roadNo, DistrictResponseModel? district
});


@override $DistrictResponseModelCopyWith<$Res>? get district;

}
/// @nodoc
class __$RoadResponseModelCopyWithImpl<$Res>
    implements _$RoadResponseModelCopyWith<$Res> {
  __$RoadResponseModelCopyWithImpl(this._self, this._then);

  final _RoadResponseModel _self;
  final $Res Function(_RoadResponseModel) _then;

/// Create a copy of RoadResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? uid = null,Object? name = null,Object? roadNo = null,Object? district = freezed,}) {
  return _then(_RoadResponseModel(
uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,roadNo: null == roadNo ? _self.roadNo : roadNo // ignore: cast_nullable_to_non_nullable
as String,district: freezed == district ? _self.district : district // ignore: cast_nullable_to_non_nullable
as DistrictResponseModel?,
  ));
}

/// Create a copy of RoadResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DistrictResponseModelCopyWith<$Res>? get district {
    if (_self.district == null) {
    return null;
  }

  return $DistrictResponseModelCopyWith<$Res>(_self.district!, (value) {
    return _then(_self.copyWith(district: value));
  });
}
}

// dart format on
