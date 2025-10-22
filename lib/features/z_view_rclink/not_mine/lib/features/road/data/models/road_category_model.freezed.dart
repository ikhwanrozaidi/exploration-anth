// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'road_category_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RoadCategoryModel {

 int? get id; String? get uid; String? get name; String? get createdAt; String? get updatedAt;
/// Create a copy of RoadCategoryModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RoadCategoryModelCopyWith<RoadCategoryModel> get copyWith => _$RoadCategoryModelCopyWithImpl<RoadCategoryModel>(this as RoadCategoryModel, _$identity);

  /// Serializes this RoadCategoryModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RoadCategoryModel&&(identical(other.id, id) || other.id == id)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.name, name) || other.name == name)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,uid,name,createdAt,updatedAt);

@override
String toString() {
  return 'RoadCategoryModel(id: $id, uid: $uid, name: $name, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $RoadCategoryModelCopyWith<$Res>  {
  factory $RoadCategoryModelCopyWith(RoadCategoryModel value, $Res Function(RoadCategoryModel) _then) = _$RoadCategoryModelCopyWithImpl;
@useResult
$Res call({
 int? id, String? uid, String? name, String? createdAt, String? updatedAt
});




}
/// @nodoc
class _$RoadCategoryModelCopyWithImpl<$Res>
    implements $RoadCategoryModelCopyWith<$Res> {
  _$RoadCategoryModelCopyWithImpl(this._self, this._then);

  final RoadCategoryModel _self;
  final $Res Function(RoadCategoryModel) _then;

/// Create a copy of RoadCategoryModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? uid = freezed,Object? name = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,uid: freezed == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [RoadCategoryModel].
extension RoadCategoryModelPatterns on RoadCategoryModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RoadCategoryModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RoadCategoryModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RoadCategoryModel value)  $default,){
final _that = this;
switch (_that) {
case _RoadCategoryModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RoadCategoryModel value)?  $default,){
final _that = this;
switch (_that) {
case _RoadCategoryModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  String? uid,  String? name,  String? createdAt,  String? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RoadCategoryModel() when $default != null:
return $default(_that.id,_that.uid,_that.name,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  String? uid,  String? name,  String? createdAt,  String? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _RoadCategoryModel():
return $default(_that.id,_that.uid,_that.name,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  String? uid,  String? name,  String? createdAt,  String? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _RoadCategoryModel() when $default != null:
return $default(_that.id,_that.uid,_that.name,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RoadCategoryModel extends RoadCategoryModel {
  const _RoadCategoryModel({this.id, this.uid, this.name, this.createdAt, this.updatedAt}): super._();
  factory _RoadCategoryModel.fromJson(Map<String, dynamic> json) => _$RoadCategoryModelFromJson(json);

@override final  int? id;
@override final  String? uid;
@override final  String? name;
@override final  String? createdAt;
@override final  String? updatedAt;

/// Create a copy of RoadCategoryModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RoadCategoryModelCopyWith<_RoadCategoryModel> get copyWith => __$RoadCategoryModelCopyWithImpl<_RoadCategoryModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RoadCategoryModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RoadCategoryModel&&(identical(other.id, id) || other.id == id)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.name, name) || other.name == name)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,uid,name,createdAt,updatedAt);

@override
String toString() {
  return 'RoadCategoryModel(id: $id, uid: $uid, name: $name, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$RoadCategoryModelCopyWith<$Res> implements $RoadCategoryModelCopyWith<$Res> {
  factory _$RoadCategoryModelCopyWith(_RoadCategoryModel value, $Res Function(_RoadCategoryModel) _then) = __$RoadCategoryModelCopyWithImpl;
@override @useResult
$Res call({
 int? id, String? uid, String? name, String? createdAt, String? updatedAt
});




}
/// @nodoc
class __$RoadCategoryModelCopyWithImpl<$Res>
    implements _$RoadCategoryModelCopyWith<$Res> {
  __$RoadCategoryModelCopyWithImpl(this._self, this._then);

  final _RoadCategoryModel _self;
  final $Res Function(_RoadCategoryModel) _then;

/// Create a copy of RoadCategoryModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? uid = freezed,Object? name = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_RoadCategoryModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,uid: freezed == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
