// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quantityvalue_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$QuantityValueResponseModel {

 String? get value; QuantityFieldResponseModel? get quantityField;
/// Create a copy of QuantityValueResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuantityValueResponseModelCopyWith<QuantityValueResponseModel> get copyWith => _$QuantityValueResponseModelCopyWithImpl<QuantityValueResponseModel>(this as QuantityValueResponseModel, _$identity);

  /// Serializes this QuantityValueResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuantityValueResponseModel&&(identical(other.value, value) || other.value == value)&&(identical(other.quantityField, quantityField) || other.quantityField == quantityField));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,value,quantityField);

@override
String toString() {
  return 'QuantityValueResponseModel(value: $value, quantityField: $quantityField)';
}


}

/// @nodoc
abstract mixin class $QuantityValueResponseModelCopyWith<$Res>  {
  factory $QuantityValueResponseModelCopyWith(QuantityValueResponseModel value, $Res Function(QuantityValueResponseModel) _then) = _$QuantityValueResponseModelCopyWithImpl;
@useResult
$Res call({
 String? value, QuantityFieldResponseModel? quantityField
});


$QuantityFieldResponseModelCopyWith<$Res>? get quantityField;

}
/// @nodoc
class _$QuantityValueResponseModelCopyWithImpl<$Res>
    implements $QuantityValueResponseModelCopyWith<$Res> {
  _$QuantityValueResponseModelCopyWithImpl(this._self, this._then);

  final QuantityValueResponseModel _self;
  final $Res Function(QuantityValueResponseModel) _then;

/// Create a copy of QuantityValueResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? value = freezed,Object? quantityField = freezed,}) {
  return _then(_self.copyWith(
value: freezed == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String?,quantityField: freezed == quantityField ? _self.quantityField : quantityField // ignore: cast_nullable_to_non_nullable
as QuantityFieldResponseModel?,
  ));
}
/// Create a copy of QuantityValueResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$QuantityFieldResponseModelCopyWith<$Res>? get quantityField {
    if (_self.quantityField == null) {
    return null;
  }

  return $QuantityFieldResponseModelCopyWith<$Res>(_self.quantityField!, (value) {
    return _then(_self.copyWith(quantityField: value));
  });
}
}


/// Adds pattern-matching-related methods to [QuantityValueResponseModel].
extension QuantityValueResponseModelPatterns on QuantityValueResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QuantityValueResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QuantityValueResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QuantityValueResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _QuantityValueResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QuantityValueResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _QuantityValueResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? value,  QuantityFieldResponseModel? quantityField)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QuantityValueResponseModel() when $default != null:
return $default(_that.value,_that.quantityField);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? value,  QuantityFieldResponseModel? quantityField)  $default,) {final _that = this;
switch (_that) {
case _QuantityValueResponseModel():
return $default(_that.value,_that.quantityField);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? value,  QuantityFieldResponseModel? quantityField)?  $default,) {final _that = this;
switch (_that) {
case _QuantityValueResponseModel() when $default != null:
return $default(_that.value,_that.quantityField);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _QuantityValueResponseModel extends QuantityValueResponseModel {
  const _QuantityValueResponseModel({this.value, this.quantityField}): super._();
  factory _QuantityValueResponseModel.fromJson(Map<String, dynamic> json) => _$QuantityValueResponseModelFromJson(json);

@override final  String? value;
@override final  QuantityFieldResponseModel? quantityField;

/// Create a copy of QuantityValueResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuantityValueResponseModelCopyWith<_QuantityValueResponseModel> get copyWith => __$QuantityValueResponseModelCopyWithImpl<_QuantityValueResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$QuantityValueResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QuantityValueResponseModel&&(identical(other.value, value) || other.value == value)&&(identical(other.quantityField, quantityField) || other.quantityField == quantityField));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,value,quantityField);

@override
String toString() {
  return 'QuantityValueResponseModel(value: $value, quantityField: $quantityField)';
}


}

/// @nodoc
abstract mixin class _$QuantityValueResponseModelCopyWith<$Res> implements $QuantityValueResponseModelCopyWith<$Res> {
  factory _$QuantityValueResponseModelCopyWith(_QuantityValueResponseModel value, $Res Function(_QuantityValueResponseModel) _then) = __$QuantityValueResponseModelCopyWithImpl;
@override @useResult
$Res call({
 String? value, QuantityFieldResponseModel? quantityField
});


@override $QuantityFieldResponseModelCopyWith<$Res>? get quantityField;

}
/// @nodoc
class __$QuantityValueResponseModelCopyWithImpl<$Res>
    implements _$QuantityValueResponseModelCopyWith<$Res> {
  __$QuantityValueResponseModelCopyWithImpl(this._self, this._then);

  final _QuantityValueResponseModel _self;
  final $Res Function(_QuantityValueResponseModel) _then;

/// Create a copy of QuantityValueResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? value = freezed,Object? quantityField = freezed,}) {
  return _then(_QuantityValueResponseModel(
value: freezed == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String?,quantityField: freezed == quantityField ? _self.quantityField : quantityField // ignore: cast_nullable_to_non_nullable
as QuantityFieldResponseModel?,
  ));
}

/// Create a copy of QuantityValueResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$QuantityFieldResponseModelCopyWith<$Res>? get quantityField {
    if (_self.quantityField == null) {
    return null;
  }

  return $QuantityFieldResponseModelCopyWith<$Res>(_self.quantityField!, (value) {
    return _then(_self.copyWith(quantityField: value));
  });
}
}

// dart format on
