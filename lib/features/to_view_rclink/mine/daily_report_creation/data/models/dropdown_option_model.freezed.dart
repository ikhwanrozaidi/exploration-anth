// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dropdown_option_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DropdownOptionModel {

 int get id; String get uid; String get value; int get displayOrder;
/// Create a copy of DropdownOptionModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DropdownOptionModelCopyWith<DropdownOptionModel> get copyWith => _$DropdownOptionModelCopyWithImpl<DropdownOptionModel>(this as DropdownOptionModel, _$identity);

  /// Serializes this DropdownOptionModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DropdownOptionModel&&(identical(other.id, id) || other.id == id)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.value, value) || other.value == value)&&(identical(other.displayOrder, displayOrder) || other.displayOrder == displayOrder));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,uid,value,displayOrder);

@override
String toString() {
  return 'DropdownOptionModel(id: $id, uid: $uid, value: $value, displayOrder: $displayOrder)';
}


}

/// @nodoc
abstract mixin class $DropdownOptionModelCopyWith<$Res>  {
  factory $DropdownOptionModelCopyWith(DropdownOptionModel value, $Res Function(DropdownOptionModel) _then) = _$DropdownOptionModelCopyWithImpl;
@useResult
$Res call({
 int id, String uid, String value, int displayOrder
});




}
/// @nodoc
class _$DropdownOptionModelCopyWithImpl<$Res>
    implements $DropdownOptionModelCopyWith<$Res> {
  _$DropdownOptionModelCopyWithImpl(this._self, this._then);

  final DropdownOptionModel _self;
  final $Res Function(DropdownOptionModel) _then;

/// Create a copy of DropdownOptionModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? uid = null,Object? value = null,Object? displayOrder = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,displayOrder: null == displayOrder ? _self.displayOrder : displayOrder // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [DropdownOptionModel].
extension DropdownOptionModelPatterns on DropdownOptionModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DropdownOptionModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DropdownOptionModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DropdownOptionModel value)  $default,){
final _that = this;
switch (_that) {
case _DropdownOptionModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DropdownOptionModel value)?  $default,){
final _that = this;
switch (_that) {
case _DropdownOptionModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String uid,  String value,  int displayOrder)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DropdownOptionModel() when $default != null:
return $default(_that.id,_that.uid,_that.value,_that.displayOrder);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String uid,  String value,  int displayOrder)  $default,) {final _that = this;
switch (_that) {
case _DropdownOptionModel():
return $default(_that.id,_that.uid,_that.value,_that.displayOrder);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String uid,  String value,  int displayOrder)?  $default,) {final _that = this;
switch (_that) {
case _DropdownOptionModel() when $default != null:
return $default(_that.id,_that.uid,_that.value,_that.displayOrder);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DropdownOptionModel extends DropdownOptionModel {
  const _DropdownOptionModel({required this.id, required this.uid, required this.value, required this.displayOrder}): super._();
  factory _DropdownOptionModel.fromJson(Map<String, dynamic> json) => _$DropdownOptionModelFromJson(json);

@override final  int id;
@override final  String uid;
@override final  String value;
@override final  int displayOrder;

/// Create a copy of DropdownOptionModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DropdownOptionModelCopyWith<_DropdownOptionModel> get copyWith => __$DropdownOptionModelCopyWithImpl<_DropdownOptionModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DropdownOptionModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DropdownOptionModel&&(identical(other.id, id) || other.id == id)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.value, value) || other.value == value)&&(identical(other.displayOrder, displayOrder) || other.displayOrder == displayOrder));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,uid,value,displayOrder);

@override
String toString() {
  return 'DropdownOptionModel(id: $id, uid: $uid, value: $value, displayOrder: $displayOrder)';
}


}

/// @nodoc
abstract mixin class _$DropdownOptionModelCopyWith<$Res> implements $DropdownOptionModelCopyWith<$Res> {
  factory _$DropdownOptionModelCopyWith(_DropdownOptionModel value, $Res Function(_DropdownOptionModel) _then) = __$DropdownOptionModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String uid, String value, int displayOrder
});




}
/// @nodoc
class __$DropdownOptionModelCopyWithImpl<$Res>
    implements _$DropdownOptionModelCopyWith<$Res> {
  __$DropdownOptionModelCopyWithImpl(this._self, this._then);

  final _DropdownOptionModel _self;
  final $Res Function(_DropdownOptionModel) _then;

/// Create a copy of DropdownOptionModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? uid = null,Object? value = null,Object? displayOrder = null,}) {
  return _then(_DropdownOptionModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,displayOrder: null == displayOrder ? _self.displayOrder : displayOrder // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
