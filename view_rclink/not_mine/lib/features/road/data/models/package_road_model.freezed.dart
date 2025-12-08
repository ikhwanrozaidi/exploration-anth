// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'package_road_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PackageRoadModel {

 String? get uid; String? get roadUID; double? get sectionStart; double? get sectionFinish;
/// Create a copy of PackageRoadModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PackageRoadModelCopyWith<PackageRoadModel> get copyWith => _$PackageRoadModelCopyWithImpl<PackageRoadModel>(this as PackageRoadModel, _$identity);

  /// Serializes this PackageRoadModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PackageRoadModel&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.roadUID, roadUID) || other.roadUID == roadUID)&&(identical(other.sectionStart, sectionStart) || other.sectionStart == sectionStart)&&(identical(other.sectionFinish, sectionFinish) || other.sectionFinish == sectionFinish));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,uid,roadUID,sectionStart,sectionFinish);

@override
String toString() {
  return 'PackageRoadModel(uid: $uid, roadUID: $roadUID, sectionStart: $sectionStart, sectionFinish: $sectionFinish)';
}


}

/// @nodoc
abstract mixin class $PackageRoadModelCopyWith<$Res>  {
  factory $PackageRoadModelCopyWith(PackageRoadModel value, $Res Function(PackageRoadModel) _then) = _$PackageRoadModelCopyWithImpl;
@useResult
$Res call({
 String? uid, String? roadUID, double? sectionStart, double? sectionFinish
});




}
/// @nodoc
class _$PackageRoadModelCopyWithImpl<$Res>
    implements $PackageRoadModelCopyWith<$Res> {
  _$PackageRoadModelCopyWithImpl(this._self, this._then);

  final PackageRoadModel _self;
  final $Res Function(PackageRoadModel) _then;

/// Create a copy of PackageRoadModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? uid = freezed,Object? roadUID = freezed,Object? sectionStart = freezed,Object? sectionFinish = freezed,}) {
  return _then(_self.copyWith(
uid: freezed == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String?,roadUID: freezed == roadUID ? _self.roadUID : roadUID // ignore: cast_nullable_to_non_nullable
as String?,sectionStart: freezed == sectionStart ? _self.sectionStart : sectionStart // ignore: cast_nullable_to_non_nullable
as double?,sectionFinish: freezed == sectionFinish ? _self.sectionFinish : sectionFinish // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [PackageRoadModel].
extension PackageRoadModelPatterns on PackageRoadModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PackageRoadModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PackageRoadModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PackageRoadModel value)  $default,){
final _that = this;
switch (_that) {
case _PackageRoadModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PackageRoadModel value)?  $default,){
final _that = this;
switch (_that) {
case _PackageRoadModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? uid,  String? roadUID,  double? sectionStart,  double? sectionFinish)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PackageRoadModel() when $default != null:
return $default(_that.uid,_that.roadUID,_that.sectionStart,_that.sectionFinish);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? uid,  String? roadUID,  double? sectionStart,  double? sectionFinish)  $default,) {final _that = this;
switch (_that) {
case _PackageRoadModel():
return $default(_that.uid,_that.roadUID,_that.sectionStart,_that.sectionFinish);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? uid,  String? roadUID,  double? sectionStart,  double? sectionFinish)?  $default,) {final _that = this;
switch (_that) {
case _PackageRoadModel() when $default != null:
return $default(_that.uid,_that.roadUID,_that.sectionStart,_that.sectionFinish);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PackageRoadModel extends PackageRoadModel {
  const _PackageRoadModel({this.uid, this.roadUID, this.sectionStart, this.sectionFinish}): super._();
  factory _PackageRoadModel.fromJson(Map<String, dynamic> json) => _$PackageRoadModelFromJson(json);

@override final  String? uid;
@override final  String? roadUID;
@override final  double? sectionStart;
@override final  double? sectionFinish;

/// Create a copy of PackageRoadModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PackageRoadModelCopyWith<_PackageRoadModel> get copyWith => __$PackageRoadModelCopyWithImpl<_PackageRoadModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PackageRoadModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PackageRoadModel&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.roadUID, roadUID) || other.roadUID == roadUID)&&(identical(other.sectionStart, sectionStart) || other.sectionStart == sectionStart)&&(identical(other.sectionFinish, sectionFinish) || other.sectionFinish == sectionFinish));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,uid,roadUID,sectionStart,sectionFinish);

@override
String toString() {
  return 'PackageRoadModel(uid: $uid, roadUID: $roadUID, sectionStart: $sectionStart, sectionFinish: $sectionFinish)';
}


}

/// @nodoc
abstract mixin class _$PackageRoadModelCopyWith<$Res> implements $PackageRoadModelCopyWith<$Res> {
  factory _$PackageRoadModelCopyWith(_PackageRoadModel value, $Res Function(_PackageRoadModel) _then) = __$PackageRoadModelCopyWithImpl;
@override @useResult
$Res call({
 String? uid, String? roadUID, double? sectionStart, double? sectionFinish
});




}
/// @nodoc
class __$PackageRoadModelCopyWithImpl<$Res>
    implements _$PackageRoadModelCopyWith<$Res> {
  __$PackageRoadModelCopyWithImpl(this._self, this._then);

  final _PackageRoadModel _self;
  final $Res Function(_PackageRoadModel) _then;

/// Create a copy of PackageRoadModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? uid = freezed,Object? roadUID = freezed,Object? sectionStart = freezed,Object? sectionFinish = freezed,}) {
  return _then(_PackageRoadModel(
uid: freezed == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String?,roadUID: freezed == roadUID ? _self.roadUID : roadUID // ignore: cast_nullable_to_non_nullable
as String?,sectionStart: freezed == sectionStart ? _self.sectionStart : sectionStart // ignore: cast_nullable_to_non_nullable
as double?,sectionFinish: freezed == sectionFinish ? _self.sectionFinish : sectionFinish // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

// dart format on
