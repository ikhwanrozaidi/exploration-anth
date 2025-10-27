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

 int? get id; String? get uid; String? get name; String? get roadNo; double? get sectionStart; double? get sectionFinish; int? get mainCategoryID; int? get secondaryCategoryID; int? get districtID; String? get createdAt; String? get updatedAt; DistrictModel? get district; RoadCategoryModel? get mainCategory; RoadCategoryModel? get secondaryCategory;
/// Create a copy of RoadModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RoadModelCopyWith<RoadModel> get copyWith => _$RoadModelCopyWithImpl<RoadModel>(this as RoadModel, _$identity);

  /// Serializes this RoadModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RoadModel&&(identical(other.id, id) || other.id == id)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.name, name) || other.name == name)&&(identical(other.roadNo, roadNo) || other.roadNo == roadNo)&&(identical(other.sectionStart, sectionStart) || other.sectionStart == sectionStart)&&(identical(other.sectionFinish, sectionFinish) || other.sectionFinish == sectionFinish)&&(identical(other.mainCategoryID, mainCategoryID) || other.mainCategoryID == mainCategoryID)&&(identical(other.secondaryCategoryID, secondaryCategoryID) || other.secondaryCategoryID == secondaryCategoryID)&&(identical(other.districtID, districtID) || other.districtID == districtID)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.district, district) || other.district == district)&&(identical(other.mainCategory, mainCategory) || other.mainCategory == mainCategory)&&(identical(other.secondaryCategory, secondaryCategory) || other.secondaryCategory == secondaryCategory));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,uid,name,roadNo,sectionStart,sectionFinish,mainCategoryID,secondaryCategoryID,districtID,createdAt,updatedAt,district,mainCategory,secondaryCategory);

@override
String toString() {
  return 'RoadModel(id: $id, uid: $uid, name: $name, roadNo: $roadNo, sectionStart: $sectionStart, sectionFinish: $sectionFinish, mainCategoryID: $mainCategoryID, secondaryCategoryID: $secondaryCategoryID, districtID: $districtID, createdAt: $createdAt, updatedAt: $updatedAt, district: $district, mainCategory: $mainCategory, secondaryCategory: $secondaryCategory)';
}


}

/// @nodoc
abstract mixin class $RoadModelCopyWith<$Res>  {
  factory $RoadModelCopyWith(RoadModel value, $Res Function(RoadModel) _then) = _$RoadModelCopyWithImpl;
@useResult
$Res call({
 int? id, String? uid, String? name, String? roadNo, double? sectionStart, double? sectionFinish, int? mainCategoryID, int? secondaryCategoryID, int? districtID, String? createdAt, String? updatedAt, DistrictModel? district, RoadCategoryModel? mainCategory, RoadCategoryModel? secondaryCategory
});


$DistrictModelCopyWith<$Res>? get district;$RoadCategoryModelCopyWith<$Res>? get mainCategory;$RoadCategoryModelCopyWith<$Res>? get secondaryCategory;

}
/// @nodoc
class _$RoadModelCopyWithImpl<$Res>
    implements $RoadModelCopyWith<$Res> {
  _$RoadModelCopyWithImpl(this._self, this._then);

  final RoadModel _self;
  final $Res Function(RoadModel) _then;

/// Create a copy of RoadModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? uid = freezed,Object? name = freezed,Object? roadNo = freezed,Object? sectionStart = freezed,Object? sectionFinish = freezed,Object? mainCategoryID = freezed,Object? secondaryCategoryID = freezed,Object? districtID = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? district = freezed,Object? mainCategory = freezed,Object? secondaryCategory = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,uid: freezed == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,roadNo: freezed == roadNo ? _self.roadNo : roadNo // ignore: cast_nullable_to_non_nullable
as String?,sectionStart: freezed == sectionStart ? _self.sectionStart : sectionStart // ignore: cast_nullable_to_non_nullable
as double?,sectionFinish: freezed == sectionFinish ? _self.sectionFinish : sectionFinish // ignore: cast_nullable_to_non_nullable
as double?,mainCategoryID: freezed == mainCategoryID ? _self.mainCategoryID : mainCategoryID // ignore: cast_nullable_to_non_nullable
as int?,secondaryCategoryID: freezed == secondaryCategoryID ? _self.secondaryCategoryID : secondaryCategoryID // ignore: cast_nullable_to_non_nullable
as int?,districtID: freezed == districtID ? _self.districtID : districtID // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,district: freezed == district ? _self.district : district // ignore: cast_nullable_to_non_nullable
as DistrictModel?,mainCategory: freezed == mainCategory ? _self.mainCategory : mainCategory // ignore: cast_nullable_to_non_nullable
as RoadCategoryModel?,secondaryCategory: freezed == secondaryCategory ? _self.secondaryCategory : secondaryCategory // ignore: cast_nullable_to_non_nullable
as RoadCategoryModel?,
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
}/// Create a copy of RoadModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RoadCategoryModelCopyWith<$Res>? get mainCategory {
    if (_self.mainCategory == null) {
    return null;
  }

  return $RoadCategoryModelCopyWith<$Res>(_self.mainCategory!, (value) {
    return _then(_self.copyWith(mainCategory: value));
  });
}/// Create a copy of RoadModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RoadCategoryModelCopyWith<$Res>? get secondaryCategory {
    if (_self.secondaryCategory == null) {
    return null;
  }

  return $RoadCategoryModelCopyWith<$Res>(_self.secondaryCategory!, (value) {
    return _then(_self.copyWith(secondaryCategory: value));
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  String? uid,  String? name,  String? roadNo,  double? sectionStart,  double? sectionFinish,  int? mainCategoryID,  int? secondaryCategoryID,  int? districtID,  String? createdAt,  String? updatedAt,  DistrictModel? district,  RoadCategoryModel? mainCategory,  RoadCategoryModel? secondaryCategory)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RoadModel() when $default != null:
return $default(_that.id,_that.uid,_that.name,_that.roadNo,_that.sectionStart,_that.sectionFinish,_that.mainCategoryID,_that.secondaryCategoryID,_that.districtID,_that.createdAt,_that.updatedAt,_that.district,_that.mainCategory,_that.secondaryCategory);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  String? uid,  String? name,  String? roadNo,  double? sectionStart,  double? sectionFinish,  int? mainCategoryID,  int? secondaryCategoryID,  int? districtID,  String? createdAt,  String? updatedAt,  DistrictModel? district,  RoadCategoryModel? mainCategory,  RoadCategoryModel? secondaryCategory)  $default,) {final _that = this;
switch (_that) {
case _RoadModel():
return $default(_that.id,_that.uid,_that.name,_that.roadNo,_that.sectionStart,_that.sectionFinish,_that.mainCategoryID,_that.secondaryCategoryID,_that.districtID,_that.createdAt,_that.updatedAt,_that.district,_that.mainCategory,_that.secondaryCategory);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  String? uid,  String? name,  String? roadNo,  double? sectionStart,  double? sectionFinish,  int? mainCategoryID,  int? secondaryCategoryID,  int? districtID,  String? createdAt,  String? updatedAt,  DistrictModel? district,  RoadCategoryModel? mainCategory,  RoadCategoryModel? secondaryCategory)?  $default,) {final _that = this;
switch (_that) {
case _RoadModel() when $default != null:
return $default(_that.id,_that.uid,_that.name,_that.roadNo,_that.sectionStart,_that.sectionFinish,_that.mainCategoryID,_that.secondaryCategoryID,_that.districtID,_that.createdAt,_that.updatedAt,_that.district,_that.mainCategory,_that.secondaryCategory);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RoadModel extends RoadModel {
  const _RoadModel({this.id, this.uid, this.name, this.roadNo, this.sectionStart, this.sectionFinish, this.mainCategoryID, this.secondaryCategoryID, this.districtID, this.createdAt, this.updatedAt, this.district, this.mainCategory, this.secondaryCategory}): super._();
  factory _RoadModel.fromJson(Map<String, dynamic> json) => _$RoadModelFromJson(json);

@override final  int? id;
@override final  String? uid;
@override final  String? name;
@override final  String? roadNo;
@override final  double? sectionStart;
@override final  double? sectionFinish;
@override final  int? mainCategoryID;
@override final  int? secondaryCategoryID;
@override final  int? districtID;
@override final  String? createdAt;
@override final  String? updatedAt;
@override final  DistrictModel? district;
@override final  RoadCategoryModel? mainCategory;
@override final  RoadCategoryModel? secondaryCategory;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RoadModel&&(identical(other.id, id) || other.id == id)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.name, name) || other.name == name)&&(identical(other.roadNo, roadNo) || other.roadNo == roadNo)&&(identical(other.sectionStart, sectionStart) || other.sectionStart == sectionStart)&&(identical(other.sectionFinish, sectionFinish) || other.sectionFinish == sectionFinish)&&(identical(other.mainCategoryID, mainCategoryID) || other.mainCategoryID == mainCategoryID)&&(identical(other.secondaryCategoryID, secondaryCategoryID) || other.secondaryCategoryID == secondaryCategoryID)&&(identical(other.districtID, districtID) || other.districtID == districtID)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.district, district) || other.district == district)&&(identical(other.mainCategory, mainCategory) || other.mainCategory == mainCategory)&&(identical(other.secondaryCategory, secondaryCategory) || other.secondaryCategory == secondaryCategory));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,uid,name,roadNo,sectionStart,sectionFinish,mainCategoryID,secondaryCategoryID,districtID,createdAt,updatedAt,district,mainCategory,secondaryCategory);

@override
String toString() {
  return 'RoadModel(id: $id, uid: $uid, name: $name, roadNo: $roadNo, sectionStart: $sectionStart, sectionFinish: $sectionFinish, mainCategoryID: $mainCategoryID, secondaryCategoryID: $secondaryCategoryID, districtID: $districtID, createdAt: $createdAt, updatedAt: $updatedAt, district: $district, mainCategory: $mainCategory, secondaryCategory: $secondaryCategory)';
}


}

/// @nodoc
abstract mixin class _$RoadModelCopyWith<$Res> implements $RoadModelCopyWith<$Res> {
  factory _$RoadModelCopyWith(_RoadModel value, $Res Function(_RoadModel) _then) = __$RoadModelCopyWithImpl;
@override @useResult
$Res call({
 int? id, String? uid, String? name, String? roadNo, double? sectionStart, double? sectionFinish, int? mainCategoryID, int? secondaryCategoryID, int? districtID, String? createdAt, String? updatedAt, DistrictModel? district, RoadCategoryModel? mainCategory, RoadCategoryModel? secondaryCategory
});


@override $DistrictModelCopyWith<$Res>? get district;@override $RoadCategoryModelCopyWith<$Res>? get mainCategory;@override $RoadCategoryModelCopyWith<$Res>? get secondaryCategory;

}
/// @nodoc
class __$RoadModelCopyWithImpl<$Res>
    implements _$RoadModelCopyWith<$Res> {
  __$RoadModelCopyWithImpl(this._self, this._then);

  final _RoadModel _self;
  final $Res Function(_RoadModel) _then;

/// Create a copy of RoadModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? uid = freezed,Object? name = freezed,Object? roadNo = freezed,Object? sectionStart = freezed,Object? sectionFinish = freezed,Object? mainCategoryID = freezed,Object? secondaryCategoryID = freezed,Object? districtID = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? district = freezed,Object? mainCategory = freezed,Object? secondaryCategory = freezed,}) {
  return _then(_RoadModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,uid: freezed == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,roadNo: freezed == roadNo ? _self.roadNo : roadNo // ignore: cast_nullable_to_non_nullable
as String?,sectionStart: freezed == sectionStart ? _self.sectionStart : sectionStart // ignore: cast_nullable_to_non_nullable
as double?,sectionFinish: freezed == sectionFinish ? _self.sectionFinish : sectionFinish // ignore: cast_nullable_to_non_nullable
as double?,mainCategoryID: freezed == mainCategoryID ? _self.mainCategoryID : mainCategoryID // ignore: cast_nullable_to_non_nullable
as int?,secondaryCategoryID: freezed == secondaryCategoryID ? _self.secondaryCategoryID : secondaryCategoryID // ignore: cast_nullable_to_non_nullable
as int?,districtID: freezed == districtID ? _self.districtID : districtID // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,district: freezed == district ? _self.district : district // ignore: cast_nullable_to_non_nullable
as DistrictModel?,mainCategory: freezed == mainCategory ? _self.mainCategory : mainCategory // ignore: cast_nullable_to_non_nullable
as RoadCategoryModel?,secondaryCategory: freezed == secondaryCategory ? _self.secondaryCategory : secondaryCategory // ignore: cast_nullable_to_non_nullable
as RoadCategoryModel?,
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
}/// Create a copy of RoadModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RoadCategoryModelCopyWith<$Res>? get mainCategory {
    if (_self.mainCategory == null) {
    return null;
  }

  return $RoadCategoryModelCopyWith<$Res>(_self.mainCategory!, (value) {
    return _then(_self.copyWith(mainCategory: value));
  });
}/// Create a copy of RoadModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RoadCategoryModelCopyWith<$Res>? get secondaryCategory {
    if (_self.secondaryCategory == null) {
    return null;
  }

  return $RoadCategoryModelCopyWith<$Res>(_self.secondaryCategory!, (value) {
    return _then(_self.copyWith(secondaryCategory: value));
  });
}
}

// dart format on
