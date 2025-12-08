// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'warning_category_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WarningCategoryModel {

 int get id; String get uid; String get name; String get warningType;// Stored as string in API/DB
 DateTime get createdAt; DateTime get updatedAt;
/// Create a copy of WarningCategoryModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WarningCategoryModelCopyWith<WarningCategoryModel> get copyWith => _$WarningCategoryModelCopyWithImpl<WarningCategoryModel>(this as WarningCategoryModel, _$identity);

  /// Serializes this WarningCategoryModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WarningCategoryModel&&(identical(other.id, id) || other.id == id)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.name, name) || other.name == name)&&(identical(other.warningType, warningType) || other.warningType == warningType)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,uid,name,warningType,createdAt,updatedAt);

@override
String toString() {
  return 'WarningCategoryModel(id: $id, uid: $uid, name: $name, warningType: $warningType, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $WarningCategoryModelCopyWith<$Res>  {
  factory $WarningCategoryModelCopyWith(WarningCategoryModel value, $Res Function(WarningCategoryModel) _then) = _$WarningCategoryModelCopyWithImpl;
@useResult
$Res call({
 int id, String uid, String name, String warningType, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class _$WarningCategoryModelCopyWithImpl<$Res>
    implements $WarningCategoryModelCopyWith<$Res> {
  _$WarningCategoryModelCopyWithImpl(this._self, this._then);

  final WarningCategoryModel _self;
  final $Res Function(WarningCategoryModel) _then;

/// Create a copy of WarningCategoryModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? uid = null,Object? name = null,Object? warningType = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,warningType: null == warningType ? _self.warningType : warningType // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [WarningCategoryModel].
extension WarningCategoryModelPatterns on WarningCategoryModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WarningCategoryModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WarningCategoryModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WarningCategoryModel value)  $default,){
final _that = this;
switch (_that) {
case _WarningCategoryModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WarningCategoryModel value)?  $default,){
final _that = this;
switch (_that) {
case _WarningCategoryModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String uid,  String name,  String warningType,  DateTime createdAt,  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WarningCategoryModel() when $default != null:
return $default(_that.id,_that.uid,_that.name,_that.warningType,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String uid,  String name,  String warningType,  DateTime createdAt,  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _WarningCategoryModel():
return $default(_that.id,_that.uid,_that.name,_that.warningType,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String uid,  String name,  String warningType,  DateTime createdAt,  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _WarningCategoryModel() when $default != null:
return $default(_that.id,_that.uid,_that.name,_that.warningType,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WarningCategoryModel extends WarningCategoryModel {
  const _WarningCategoryModel({required this.id, required this.uid, required this.name, required this.warningType, required this.createdAt, required this.updatedAt}): super._();
  factory _WarningCategoryModel.fromJson(Map<String, dynamic> json) => _$WarningCategoryModelFromJson(json);

@override final  int id;
@override final  String uid;
@override final  String name;
@override final  String warningType;
// Stored as string in API/DB
@override final  DateTime createdAt;
@override final  DateTime updatedAt;

/// Create a copy of WarningCategoryModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WarningCategoryModelCopyWith<_WarningCategoryModel> get copyWith => __$WarningCategoryModelCopyWithImpl<_WarningCategoryModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WarningCategoryModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WarningCategoryModel&&(identical(other.id, id) || other.id == id)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.name, name) || other.name == name)&&(identical(other.warningType, warningType) || other.warningType == warningType)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,uid,name,warningType,createdAt,updatedAt);

@override
String toString() {
  return 'WarningCategoryModel(id: $id, uid: $uid, name: $name, warningType: $warningType, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$WarningCategoryModelCopyWith<$Res> implements $WarningCategoryModelCopyWith<$Res> {
  factory _$WarningCategoryModelCopyWith(_WarningCategoryModel value, $Res Function(_WarningCategoryModel) _then) = __$WarningCategoryModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String uid, String name, String warningType, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class __$WarningCategoryModelCopyWithImpl<$Res>
    implements _$WarningCategoryModelCopyWith<$Res> {
  __$WarningCategoryModelCopyWithImpl(this._self, this._then);

  final _WarningCategoryModel _self;
  final $Res Function(_WarningCategoryModel) _then;

/// Create a copy of WarningCategoryModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? uid = null,Object? name = null,Object? warningType = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_WarningCategoryModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,warningType: null == warningType ? _self.warningType : warningType // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
