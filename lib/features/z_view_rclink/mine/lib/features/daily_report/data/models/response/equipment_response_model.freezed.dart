// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'equipment_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EquipmentResponseModel {

 String? get name; String? get uid;
/// Create a copy of EquipmentResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EquipmentResponseModelCopyWith<EquipmentResponseModel> get copyWith => _$EquipmentResponseModelCopyWithImpl<EquipmentResponseModel>(this as EquipmentResponseModel, _$identity);

  /// Serializes this EquipmentResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EquipmentResponseModel&&(identical(other.name, name) || other.name == name)&&(identical(other.uid, uid) || other.uid == uid));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,uid);

@override
String toString() {
  return 'EquipmentResponseModel(name: $name, uid: $uid)';
}


}

/// @nodoc
abstract mixin class $EquipmentResponseModelCopyWith<$Res>  {
  factory $EquipmentResponseModelCopyWith(EquipmentResponseModel value, $Res Function(EquipmentResponseModel) _then) = _$EquipmentResponseModelCopyWithImpl;
@useResult
$Res call({
 String? name, String? uid
});




}
/// @nodoc
class _$EquipmentResponseModelCopyWithImpl<$Res>
    implements $EquipmentResponseModelCopyWith<$Res> {
  _$EquipmentResponseModelCopyWithImpl(this._self, this._then);

  final EquipmentResponseModel _self;
  final $Res Function(EquipmentResponseModel) _then;

/// Create a copy of EquipmentResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = freezed,Object? uid = freezed,}) {
  return _then(_self.copyWith(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,uid: freezed == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [EquipmentResponseModel].
extension EquipmentResponseModelPatterns on EquipmentResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EquipmentResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EquipmentResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EquipmentResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _EquipmentResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EquipmentResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _EquipmentResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? name,  String? uid)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EquipmentResponseModel() when $default != null:
return $default(_that.name,_that.uid);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? name,  String? uid)  $default,) {final _that = this;
switch (_that) {
case _EquipmentResponseModel():
return $default(_that.name,_that.uid);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? name,  String? uid)?  $default,) {final _that = this;
switch (_that) {
case _EquipmentResponseModel() when $default != null:
return $default(_that.name,_that.uid);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EquipmentResponseModel extends EquipmentResponseModel {
  const _EquipmentResponseModel({this.name, this.uid}): super._();
  factory _EquipmentResponseModel.fromJson(Map<String, dynamic> json) => _$EquipmentResponseModelFromJson(json);

@override final  String? name;
@override final  String? uid;

/// Create a copy of EquipmentResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EquipmentResponseModelCopyWith<_EquipmentResponseModel> get copyWith => __$EquipmentResponseModelCopyWithImpl<_EquipmentResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EquipmentResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EquipmentResponseModel&&(identical(other.name, name) || other.name == name)&&(identical(other.uid, uid) || other.uid == uid));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,uid);

@override
String toString() {
  return 'EquipmentResponseModel(name: $name, uid: $uid)';
}


}

/// @nodoc
abstract mixin class _$EquipmentResponseModelCopyWith<$Res> implements $EquipmentResponseModelCopyWith<$Res> {
  factory _$EquipmentResponseModelCopyWith(_EquipmentResponseModel value, $Res Function(_EquipmentResponseModel) _then) = __$EquipmentResponseModelCopyWithImpl;
@override @useResult
$Res call({
 String? name, String? uid
});




}
/// @nodoc
class __$EquipmentResponseModelCopyWithImpl<$Res>
    implements _$EquipmentResponseModelCopyWith<$Res> {
  __$EquipmentResponseModelCopyWithImpl(this._self, this._then);

  final _EquipmentResponseModel _self;
  final $Res Function(_EquipmentResponseModel) _then;

/// Create a copy of EquipmentResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = freezed,Object? uid = freezed,}) {
  return _then(_EquipmentResponseModel(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,uid: freezed == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
