// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'road_edit_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RoadEditModel {

 int? get id; String? get uid; String? get name; String? get roadNo; String? get sectionStart; String? get sectionFinish; int? get districtId; String? get districtName;
/// Create a copy of RoadEditModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RoadEditModelCopyWith<RoadEditModel> get copyWith => _$RoadEditModelCopyWithImpl<RoadEditModel>(this as RoadEditModel, _$identity);

  /// Serializes this RoadEditModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RoadEditModel&&(identical(other.id, id) || other.id == id)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.name, name) || other.name == name)&&(identical(other.roadNo, roadNo) || other.roadNo == roadNo)&&(identical(other.sectionStart, sectionStart) || other.sectionStart == sectionStart)&&(identical(other.sectionFinish, sectionFinish) || other.sectionFinish == sectionFinish)&&(identical(other.districtId, districtId) || other.districtId == districtId)&&(identical(other.districtName, districtName) || other.districtName == districtName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,uid,name,roadNo,sectionStart,sectionFinish,districtId,districtName);

@override
String toString() {
  return 'RoadEditModel(id: $id, uid: $uid, name: $name, roadNo: $roadNo, sectionStart: $sectionStart, sectionFinish: $sectionFinish, districtId: $districtId, districtName: $districtName)';
}


}

/// @nodoc
abstract mixin class $RoadEditModelCopyWith<$Res>  {
  factory $RoadEditModelCopyWith(RoadEditModel value, $Res Function(RoadEditModel) _then) = _$RoadEditModelCopyWithImpl;
@useResult
$Res call({
 int? id, String? uid, String? name, String? roadNo, String? sectionStart, String? sectionFinish, int? districtId, String? districtName
});




}
/// @nodoc
class _$RoadEditModelCopyWithImpl<$Res>
    implements $RoadEditModelCopyWith<$Res> {
  _$RoadEditModelCopyWithImpl(this._self, this._then);

  final RoadEditModel _self;
  final $Res Function(RoadEditModel) _then;

/// Create a copy of RoadEditModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? uid = freezed,Object? name = freezed,Object? roadNo = freezed,Object? sectionStart = freezed,Object? sectionFinish = freezed,Object? districtId = freezed,Object? districtName = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,uid: freezed == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,roadNo: freezed == roadNo ? _self.roadNo : roadNo // ignore: cast_nullable_to_non_nullable
as String?,sectionStart: freezed == sectionStart ? _self.sectionStart : sectionStart // ignore: cast_nullable_to_non_nullable
as String?,sectionFinish: freezed == sectionFinish ? _self.sectionFinish : sectionFinish // ignore: cast_nullable_to_non_nullable
as String?,districtId: freezed == districtId ? _self.districtId : districtId // ignore: cast_nullable_to_non_nullable
as int?,districtName: freezed == districtName ? _self.districtName : districtName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [RoadEditModel].
extension RoadEditModelPatterns on RoadEditModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RoadEditModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RoadEditModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RoadEditModel value)  $default,){
final _that = this;
switch (_that) {
case _RoadEditModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RoadEditModel value)?  $default,){
final _that = this;
switch (_that) {
case _RoadEditModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  String? uid,  String? name,  String? roadNo,  String? sectionStart,  String? sectionFinish,  int? districtId,  String? districtName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RoadEditModel() when $default != null:
return $default(_that.id,_that.uid,_that.name,_that.roadNo,_that.sectionStart,_that.sectionFinish,_that.districtId,_that.districtName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  String? uid,  String? name,  String? roadNo,  String? sectionStart,  String? sectionFinish,  int? districtId,  String? districtName)  $default,) {final _that = this;
switch (_that) {
case _RoadEditModel():
return $default(_that.id,_that.uid,_that.name,_that.roadNo,_that.sectionStart,_that.sectionFinish,_that.districtId,_that.districtName);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  String? uid,  String? name,  String? roadNo,  String? sectionStart,  String? sectionFinish,  int? districtId,  String? districtName)?  $default,) {final _that = this;
switch (_that) {
case _RoadEditModel() when $default != null:
return $default(_that.id,_that.uid,_that.name,_that.roadNo,_that.sectionStart,_that.sectionFinish,_that.districtId,_that.districtName);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RoadEditModel extends RoadEditModel {
  const _RoadEditModel({this.id, this.uid, this.name, this.roadNo, this.sectionStart, this.sectionFinish, this.districtId, this.districtName}): super._();
  factory _RoadEditModel.fromJson(Map<String, dynamic> json) => _$RoadEditModelFromJson(json);

@override final  int? id;
@override final  String? uid;
@override final  String? name;
@override final  String? roadNo;
@override final  String? sectionStart;
@override final  String? sectionFinish;
@override final  int? districtId;
@override final  String? districtName;

/// Create a copy of RoadEditModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RoadEditModelCopyWith<_RoadEditModel> get copyWith => __$RoadEditModelCopyWithImpl<_RoadEditModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RoadEditModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RoadEditModel&&(identical(other.id, id) || other.id == id)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.name, name) || other.name == name)&&(identical(other.roadNo, roadNo) || other.roadNo == roadNo)&&(identical(other.sectionStart, sectionStart) || other.sectionStart == sectionStart)&&(identical(other.sectionFinish, sectionFinish) || other.sectionFinish == sectionFinish)&&(identical(other.districtId, districtId) || other.districtId == districtId)&&(identical(other.districtName, districtName) || other.districtName == districtName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,uid,name,roadNo,sectionStart,sectionFinish,districtId,districtName);

@override
String toString() {
  return 'RoadEditModel(id: $id, uid: $uid, name: $name, roadNo: $roadNo, sectionStart: $sectionStart, sectionFinish: $sectionFinish, districtId: $districtId, districtName: $districtName)';
}


}

/// @nodoc
abstract mixin class _$RoadEditModelCopyWith<$Res> implements $RoadEditModelCopyWith<$Res> {
  factory _$RoadEditModelCopyWith(_RoadEditModel value, $Res Function(_RoadEditModel) _then) = __$RoadEditModelCopyWithImpl;
@override @useResult
$Res call({
 int? id, String? uid, String? name, String? roadNo, String? sectionStart, String? sectionFinish, int? districtId, String? districtName
});




}
/// @nodoc
class __$RoadEditModelCopyWithImpl<$Res>
    implements _$RoadEditModelCopyWith<$Res> {
  __$RoadEditModelCopyWithImpl(this._self, this._then);

  final _RoadEditModel _self;
  final $Res Function(_RoadEditModel) _then;

/// Create a copy of RoadEditModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? uid = freezed,Object? name = freezed,Object? roadNo = freezed,Object? sectionStart = freezed,Object? sectionFinish = freezed,Object? districtId = freezed,Object? districtName = freezed,}) {
  return _then(_RoadEditModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,uid: freezed == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,roadNo: freezed == roadNo ? _self.roadNo : roadNo // ignore: cast_nullable_to_non_nullable
as String?,sectionStart: freezed == sectionStart ? _self.sectionStart : sectionStart // ignore: cast_nullable_to_non_nullable
as String?,sectionFinish: freezed == sectionFinish ? _self.sectionFinish : sectionFinish // ignore: cast_nullable_to_non_nullable
as String?,districtId: freezed == districtId ? _self.districtId : districtId // ignore: cast_nullable_to_non_nullable
as int?,districtName: freezed == districtName ? _self.districtName : districtName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
