// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dropdown_option_nested_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DropdownOptionNestedModel {

 int? get id; String? get uid; int? get fieldID; String? get value; int? get displayOrder; bool? get isActive; String? get createdAt; String? get updatedAt;
/// Create a copy of DropdownOptionNestedModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DropdownOptionNestedModelCopyWith<DropdownOptionNestedModel> get copyWith => _$DropdownOptionNestedModelCopyWithImpl<DropdownOptionNestedModel>(this as DropdownOptionNestedModel, _$identity);

  /// Serializes this DropdownOptionNestedModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DropdownOptionNestedModel&&(identical(other.id, id) || other.id == id)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.fieldID, fieldID) || other.fieldID == fieldID)&&(identical(other.value, value) || other.value == value)&&(identical(other.displayOrder, displayOrder) || other.displayOrder == displayOrder)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,uid,fieldID,value,displayOrder,isActive,createdAt,updatedAt);

@override
String toString() {
  return 'DropdownOptionNestedModel(id: $id, uid: $uid, fieldID: $fieldID, value: $value, displayOrder: $displayOrder, isActive: $isActive, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $DropdownOptionNestedModelCopyWith<$Res>  {
  factory $DropdownOptionNestedModelCopyWith(DropdownOptionNestedModel value, $Res Function(DropdownOptionNestedModel) _then) = _$DropdownOptionNestedModelCopyWithImpl;
@useResult
$Res call({
 int? id, String? uid, int? fieldID, String? value, int? displayOrder, bool? isActive, String? createdAt, String? updatedAt
});




}
/// @nodoc
class _$DropdownOptionNestedModelCopyWithImpl<$Res>
    implements $DropdownOptionNestedModelCopyWith<$Res> {
  _$DropdownOptionNestedModelCopyWithImpl(this._self, this._then);

  final DropdownOptionNestedModel _self;
  final $Res Function(DropdownOptionNestedModel) _then;

/// Create a copy of DropdownOptionNestedModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? uid = freezed,Object? fieldID = freezed,Object? value = freezed,Object? displayOrder = freezed,Object? isActive = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,uid: freezed == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String?,fieldID: freezed == fieldID ? _self.fieldID : fieldID // ignore: cast_nullable_to_non_nullable
as int?,value: freezed == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String?,displayOrder: freezed == displayOrder ? _self.displayOrder : displayOrder // ignore: cast_nullable_to_non_nullable
as int?,isActive: freezed == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [DropdownOptionNestedModel].
extension DropdownOptionNestedModelPatterns on DropdownOptionNestedModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DropdownOptionNestedModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DropdownOptionNestedModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DropdownOptionNestedModel value)  $default,){
final _that = this;
switch (_that) {
case _DropdownOptionNestedModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DropdownOptionNestedModel value)?  $default,){
final _that = this;
switch (_that) {
case _DropdownOptionNestedModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  String? uid,  int? fieldID,  String? value,  int? displayOrder,  bool? isActive,  String? createdAt,  String? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DropdownOptionNestedModel() when $default != null:
return $default(_that.id,_that.uid,_that.fieldID,_that.value,_that.displayOrder,_that.isActive,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  String? uid,  int? fieldID,  String? value,  int? displayOrder,  bool? isActive,  String? createdAt,  String? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _DropdownOptionNestedModel():
return $default(_that.id,_that.uid,_that.fieldID,_that.value,_that.displayOrder,_that.isActive,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  String? uid,  int? fieldID,  String? value,  int? displayOrder,  bool? isActive,  String? createdAt,  String? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _DropdownOptionNestedModel() when $default != null:
return $default(_that.id,_that.uid,_that.fieldID,_that.value,_that.displayOrder,_that.isActive,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DropdownOptionNestedModel implements DropdownOptionNestedModel {
  const _DropdownOptionNestedModel({this.id, this.uid, this.fieldID, this.value, this.displayOrder, this.isActive, this.createdAt, this.updatedAt});
  factory _DropdownOptionNestedModel.fromJson(Map<String, dynamic> json) => _$DropdownOptionNestedModelFromJson(json);

@override final  int? id;
@override final  String? uid;
@override final  int? fieldID;
@override final  String? value;
@override final  int? displayOrder;
@override final  bool? isActive;
@override final  String? createdAt;
@override final  String? updatedAt;

/// Create a copy of DropdownOptionNestedModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DropdownOptionNestedModelCopyWith<_DropdownOptionNestedModel> get copyWith => __$DropdownOptionNestedModelCopyWithImpl<_DropdownOptionNestedModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DropdownOptionNestedModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DropdownOptionNestedModel&&(identical(other.id, id) || other.id == id)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.fieldID, fieldID) || other.fieldID == fieldID)&&(identical(other.value, value) || other.value == value)&&(identical(other.displayOrder, displayOrder) || other.displayOrder == displayOrder)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,uid,fieldID,value,displayOrder,isActive,createdAt,updatedAt);

@override
String toString() {
  return 'DropdownOptionNestedModel(id: $id, uid: $uid, fieldID: $fieldID, value: $value, displayOrder: $displayOrder, isActive: $isActive, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$DropdownOptionNestedModelCopyWith<$Res> implements $DropdownOptionNestedModelCopyWith<$Res> {
  factory _$DropdownOptionNestedModelCopyWith(_DropdownOptionNestedModel value, $Res Function(_DropdownOptionNestedModel) _then) = __$DropdownOptionNestedModelCopyWithImpl;
@override @useResult
$Res call({
 int? id, String? uid, int? fieldID, String? value, int? displayOrder, bool? isActive, String? createdAt, String? updatedAt
});




}
/// @nodoc
class __$DropdownOptionNestedModelCopyWithImpl<$Res>
    implements _$DropdownOptionNestedModelCopyWith<$Res> {
  __$DropdownOptionNestedModelCopyWithImpl(this._self, this._then);

  final _DropdownOptionNestedModel _self;
  final $Res Function(_DropdownOptionNestedModel) _then;

/// Create a copy of DropdownOptionNestedModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? uid = freezed,Object? fieldID = freezed,Object? value = freezed,Object? displayOrder = freezed,Object? isActive = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_DropdownOptionNestedModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,uid: freezed == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String?,fieldID: freezed == fieldID ? _self.fieldID : fieldID // ignore: cast_nullable_to_non_nullable
as int?,value: freezed == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String?,displayOrder: freezed == displayOrder ? _self.displayOrder : displayOrder // ignore: cast_nullable_to_non_nullable
as int?,isActive: freezed == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
