// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'road_nested_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RoadNestedModel {

 int? get id; String? get uid; String? get name; String? get roadNo; String? get sectionStart; String? get sectionFinish; int? get mainCategoryID; int? get secondaryCategoryID; int? get districtID; String? get createdAt; String? get updatedAt; DistrictNestedModel? get district;
/// Create a copy of RoadNestedModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RoadNestedModelCopyWith<RoadNestedModel> get copyWith => _$RoadNestedModelCopyWithImpl<RoadNestedModel>(this as RoadNestedModel, _$identity);

  /// Serializes this RoadNestedModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RoadNestedModel&&(identical(other.id, id) || other.id == id)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.name, name) || other.name == name)&&(identical(other.roadNo, roadNo) || other.roadNo == roadNo)&&(identical(other.sectionStart, sectionStart) || other.sectionStart == sectionStart)&&(identical(other.sectionFinish, sectionFinish) || other.sectionFinish == sectionFinish)&&(identical(other.mainCategoryID, mainCategoryID) || other.mainCategoryID == mainCategoryID)&&(identical(other.secondaryCategoryID, secondaryCategoryID) || other.secondaryCategoryID == secondaryCategoryID)&&(identical(other.districtID, districtID) || other.districtID == districtID)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.district, district) || other.district == district));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,uid,name,roadNo,sectionStart,sectionFinish,mainCategoryID,secondaryCategoryID,districtID,createdAt,updatedAt,district);

@override
String toString() {
  return 'RoadNestedModel(id: $id, uid: $uid, name: $name, roadNo: $roadNo, sectionStart: $sectionStart, sectionFinish: $sectionFinish, mainCategoryID: $mainCategoryID, secondaryCategoryID: $secondaryCategoryID, districtID: $districtID, createdAt: $createdAt, updatedAt: $updatedAt, district: $district)';
}


}

/// @nodoc
abstract mixin class $RoadNestedModelCopyWith<$Res>  {
  factory $RoadNestedModelCopyWith(RoadNestedModel value, $Res Function(RoadNestedModel) _then) = _$RoadNestedModelCopyWithImpl;
@useResult
$Res call({
 int? id, String? uid, String? name, String? roadNo, String? sectionStart, String? sectionFinish, int? mainCategoryID, int? secondaryCategoryID, int? districtID, String? createdAt, String? updatedAt, DistrictNestedModel? district
});


$DistrictNestedModelCopyWith<$Res>? get district;

}
/// @nodoc
class _$RoadNestedModelCopyWithImpl<$Res>
    implements $RoadNestedModelCopyWith<$Res> {
  _$RoadNestedModelCopyWithImpl(this._self, this._then);

  final RoadNestedModel _self;
  final $Res Function(RoadNestedModel) _then;

/// Create a copy of RoadNestedModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? uid = freezed,Object? name = freezed,Object? roadNo = freezed,Object? sectionStart = freezed,Object? sectionFinish = freezed,Object? mainCategoryID = freezed,Object? secondaryCategoryID = freezed,Object? districtID = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? district = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,uid: freezed == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,roadNo: freezed == roadNo ? _self.roadNo : roadNo // ignore: cast_nullable_to_non_nullable
as String?,sectionStart: freezed == sectionStart ? _self.sectionStart : sectionStart // ignore: cast_nullable_to_non_nullable
as String?,sectionFinish: freezed == sectionFinish ? _self.sectionFinish : sectionFinish // ignore: cast_nullable_to_non_nullable
as String?,mainCategoryID: freezed == mainCategoryID ? _self.mainCategoryID : mainCategoryID // ignore: cast_nullable_to_non_nullable
as int?,secondaryCategoryID: freezed == secondaryCategoryID ? _self.secondaryCategoryID : secondaryCategoryID // ignore: cast_nullable_to_non_nullable
as int?,districtID: freezed == districtID ? _self.districtID : districtID // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,district: freezed == district ? _self.district : district // ignore: cast_nullable_to_non_nullable
as DistrictNestedModel?,
  ));
}
/// Create a copy of RoadNestedModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DistrictNestedModelCopyWith<$Res>? get district {
    if (_self.district == null) {
    return null;
  }

  return $DistrictNestedModelCopyWith<$Res>(_self.district!, (value) {
    return _then(_self.copyWith(district: value));
  });
}
}


/// Adds pattern-matching-related methods to [RoadNestedModel].
extension RoadNestedModelPatterns on RoadNestedModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RoadNestedModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RoadNestedModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RoadNestedModel value)  $default,){
final _that = this;
switch (_that) {
case _RoadNestedModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RoadNestedModel value)?  $default,){
final _that = this;
switch (_that) {
case _RoadNestedModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  String? uid,  String? name,  String? roadNo,  String? sectionStart,  String? sectionFinish,  int? mainCategoryID,  int? secondaryCategoryID,  int? districtID,  String? createdAt,  String? updatedAt,  DistrictNestedModel? district)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RoadNestedModel() when $default != null:
return $default(_that.id,_that.uid,_that.name,_that.roadNo,_that.sectionStart,_that.sectionFinish,_that.mainCategoryID,_that.secondaryCategoryID,_that.districtID,_that.createdAt,_that.updatedAt,_that.district);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  String? uid,  String? name,  String? roadNo,  String? sectionStart,  String? sectionFinish,  int? mainCategoryID,  int? secondaryCategoryID,  int? districtID,  String? createdAt,  String? updatedAt,  DistrictNestedModel? district)  $default,) {final _that = this;
switch (_that) {
case _RoadNestedModel():
return $default(_that.id,_that.uid,_that.name,_that.roadNo,_that.sectionStart,_that.sectionFinish,_that.mainCategoryID,_that.secondaryCategoryID,_that.districtID,_that.createdAt,_that.updatedAt,_that.district);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  String? uid,  String? name,  String? roadNo,  String? sectionStart,  String? sectionFinish,  int? mainCategoryID,  int? secondaryCategoryID,  int? districtID,  String? createdAt,  String? updatedAt,  DistrictNestedModel? district)?  $default,) {final _that = this;
switch (_that) {
case _RoadNestedModel() when $default != null:
return $default(_that.id,_that.uid,_that.name,_that.roadNo,_that.sectionStart,_that.sectionFinish,_that.mainCategoryID,_that.secondaryCategoryID,_that.districtID,_that.createdAt,_that.updatedAt,_that.district);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RoadNestedModel implements RoadNestedModel {
  const _RoadNestedModel({this.id, this.uid, this.name, this.roadNo, this.sectionStart, this.sectionFinish, this.mainCategoryID, this.secondaryCategoryID, this.districtID, this.createdAt, this.updatedAt, this.district});
  factory _RoadNestedModel.fromJson(Map<String, dynamic> json) => _$RoadNestedModelFromJson(json);

@override final  int? id;
@override final  String? uid;
@override final  String? name;
@override final  String? roadNo;
@override final  String? sectionStart;
@override final  String? sectionFinish;
@override final  int? mainCategoryID;
@override final  int? secondaryCategoryID;
@override final  int? districtID;
@override final  String? createdAt;
@override final  String? updatedAt;
@override final  DistrictNestedModel? district;

/// Create a copy of RoadNestedModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RoadNestedModelCopyWith<_RoadNestedModel> get copyWith => __$RoadNestedModelCopyWithImpl<_RoadNestedModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RoadNestedModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RoadNestedModel&&(identical(other.id, id) || other.id == id)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.name, name) || other.name == name)&&(identical(other.roadNo, roadNo) || other.roadNo == roadNo)&&(identical(other.sectionStart, sectionStart) || other.sectionStart == sectionStart)&&(identical(other.sectionFinish, sectionFinish) || other.sectionFinish == sectionFinish)&&(identical(other.mainCategoryID, mainCategoryID) || other.mainCategoryID == mainCategoryID)&&(identical(other.secondaryCategoryID, secondaryCategoryID) || other.secondaryCategoryID == secondaryCategoryID)&&(identical(other.districtID, districtID) || other.districtID == districtID)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.district, district) || other.district == district));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,uid,name,roadNo,sectionStart,sectionFinish,mainCategoryID,secondaryCategoryID,districtID,createdAt,updatedAt,district);

@override
String toString() {
  return 'RoadNestedModel(id: $id, uid: $uid, name: $name, roadNo: $roadNo, sectionStart: $sectionStart, sectionFinish: $sectionFinish, mainCategoryID: $mainCategoryID, secondaryCategoryID: $secondaryCategoryID, districtID: $districtID, createdAt: $createdAt, updatedAt: $updatedAt, district: $district)';
}


}

/// @nodoc
abstract mixin class _$RoadNestedModelCopyWith<$Res> implements $RoadNestedModelCopyWith<$Res> {
  factory _$RoadNestedModelCopyWith(_RoadNestedModel value, $Res Function(_RoadNestedModel) _then) = __$RoadNestedModelCopyWithImpl;
@override @useResult
$Res call({
 int? id, String? uid, String? name, String? roadNo, String? sectionStart, String? sectionFinish, int? mainCategoryID, int? secondaryCategoryID, int? districtID, String? createdAt, String? updatedAt, DistrictNestedModel? district
});


@override $DistrictNestedModelCopyWith<$Res>? get district;

}
/// @nodoc
class __$RoadNestedModelCopyWithImpl<$Res>
    implements _$RoadNestedModelCopyWith<$Res> {
  __$RoadNestedModelCopyWithImpl(this._self, this._then);

  final _RoadNestedModel _self;
  final $Res Function(_RoadNestedModel) _then;

/// Create a copy of RoadNestedModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? uid = freezed,Object? name = freezed,Object? roadNo = freezed,Object? sectionStart = freezed,Object? sectionFinish = freezed,Object? mainCategoryID = freezed,Object? secondaryCategoryID = freezed,Object? districtID = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? district = freezed,}) {
  return _then(_RoadNestedModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,uid: freezed == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,roadNo: freezed == roadNo ? _self.roadNo : roadNo // ignore: cast_nullable_to_non_nullable
as String?,sectionStart: freezed == sectionStart ? _self.sectionStart : sectionStart // ignore: cast_nullable_to_non_nullable
as String?,sectionFinish: freezed == sectionFinish ? _self.sectionFinish : sectionFinish // ignore: cast_nullable_to_non_nullable
as String?,mainCategoryID: freezed == mainCategoryID ? _self.mainCategoryID : mainCategoryID // ignore: cast_nullable_to_non_nullable
as int?,secondaryCategoryID: freezed == secondaryCategoryID ? _self.secondaryCategoryID : secondaryCategoryID // ignore: cast_nullable_to_non_nullable
as int?,districtID: freezed == districtID ? _self.districtID : districtID // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,district: freezed == district ? _self.district : district // ignore: cast_nullable_to_non_nullable
as DistrictNestedModel?,
  ));
}

/// Create a copy of RoadNestedModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DistrictNestedModelCopyWith<$Res>? get district {
    if (_self.district == null) {
    return null;
  }

  return $DistrictNestedModelCopyWith<$Res>(_self.district!, (value) {
    return _then(_self.copyWith(district: value));
  });
}
}

// dart format on
