// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quantity_field_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$QuantityFieldModel {

 String get name; String get fieldType; String? get unit; String get uid;
/// Create a copy of QuantityFieldModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuantityFieldModelCopyWith<QuantityFieldModel> get copyWith => _$QuantityFieldModelCopyWithImpl<QuantityFieldModel>(this as QuantityFieldModel, _$identity);

  /// Serializes this QuantityFieldModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuantityFieldModel&&(identical(other.name, name) || other.name == name)&&(identical(other.fieldType, fieldType) || other.fieldType == fieldType)&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.uid, uid) || other.uid == uid));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,fieldType,unit,uid);

@override
String toString() {
  return 'QuantityFieldModel(name: $name, fieldType: $fieldType, unit: $unit, uid: $uid)';
}


}

/// @nodoc
abstract mixin class $QuantityFieldModelCopyWith<$Res>  {
  factory $QuantityFieldModelCopyWith(QuantityFieldModel value, $Res Function(QuantityFieldModel) _then) = _$QuantityFieldModelCopyWithImpl;
@useResult
$Res call({
 String name, String fieldType, String? unit, String uid
});




}
/// @nodoc
class _$QuantityFieldModelCopyWithImpl<$Res>
    implements $QuantityFieldModelCopyWith<$Res> {
  _$QuantityFieldModelCopyWithImpl(this._self, this._then);

  final QuantityFieldModel _self;
  final $Res Function(QuantityFieldModel) _then;

/// Create a copy of QuantityFieldModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? fieldType = null,Object? unit = freezed,Object? uid = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,fieldType: null == fieldType ? _self.fieldType : fieldType // ignore: cast_nullable_to_non_nullable
as String,unit: freezed == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as String?,uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [QuantityFieldModel].
extension QuantityFieldModelPatterns on QuantityFieldModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QuantityFieldModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QuantityFieldModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QuantityFieldModel value)  $default,){
final _that = this;
switch (_that) {
case _QuantityFieldModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QuantityFieldModel value)?  $default,){
final _that = this;
switch (_that) {
case _QuantityFieldModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String fieldType,  String? unit,  String uid)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QuantityFieldModel() when $default != null:
return $default(_that.name,_that.fieldType,_that.unit,_that.uid);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String fieldType,  String? unit,  String uid)  $default,) {final _that = this;
switch (_that) {
case _QuantityFieldModel():
return $default(_that.name,_that.fieldType,_that.unit,_that.uid);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String fieldType,  String? unit,  String uid)?  $default,) {final _that = this;
switch (_that) {
case _QuantityFieldModel() when $default != null:
return $default(_that.name,_that.fieldType,_that.unit,_that.uid);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _QuantityFieldModel extends QuantityFieldModel {
  const _QuantityFieldModel({required this.name, required this.fieldType, this.unit, required this.uid}): super._();
  factory _QuantityFieldModel.fromJson(Map<String, dynamic> json) => _$QuantityFieldModelFromJson(json);

@override final  String name;
@override final  String fieldType;
@override final  String? unit;
@override final  String uid;

/// Create a copy of QuantityFieldModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuantityFieldModelCopyWith<_QuantityFieldModel> get copyWith => __$QuantityFieldModelCopyWithImpl<_QuantityFieldModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$QuantityFieldModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QuantityFieldModel&&(identical(other.name, name) || other.name == name)&&(identical(other.fieldType, fieldType) || other.fieldType == fieldType)&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.uid, uid) || other.uid == uid));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,fieldType,unit,uid);

@override
String toString() {
  return 'QuantityFieldModel(name: $name, fieldType: $fieldType, unit: $unit, uid: $uid)';
}


}

/// @nodoc
abstract mixin class _$QuantityFieldModelCopyWith<$Res> implements $QuantityFieldModelCopyWith<$Res> {
  factory _$QuantityFieldModelCopyWith(_QuantityFieldModel value, $Res Function(_QuantityFieldModel) _then) = __$QuantityFieldModelCopyWithImpl;
@override @useResult
$Res call({
 String name, String fieldType, String? unit, String uid
});




}
/// @nodoc
class __$QuantityFieldModelCopyWithImpl<$Res>
    implements _$QuantityFieldModelCopyWith<$Res> {
  __$QuantityFieldModelCopyWithImpl(this._self, this._then);

  final _QuantityFieldModel _self;
  final $Res Function(_QuantityFieldModel) _then;

/// Create a copy of QuantityFieldModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? fieldType = null,Object? unit = freezed,Object? uid = null,}) {
  return _then(_QuantityFieldModel(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,fieldType: null == fieldType ? _self.fieldType : fieldType // ignore: cast_nullable_to_non_nullable
as String,unit: freezed == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as String?,uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
