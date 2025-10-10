// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quantity_value_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$QuantityValueModel {

 String get value; QuantityFieldModel get quantityField;
/// Create a copy of QuantityValueModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuantityValueModelCopyWith<QuantityValueModel> get copyWith => _$QuantityValueModelCopyWithImpl<QuantityValueModel>(this as QuantityValueModel, _$identity);

  /// Serializes this QuantityValueModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuantityValueModel&&(identical(other.value, value) || other.value == value)&&(identical(other.quantityField, quantityField) || other.quantityField == quantityField));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,value,quantityField);

@override
String toString() {
  return 'QuantityValueModel(value: $value, quantityField: $quantityField)';
}


}

/// @nodoc
abstract mixin class $QuantityValueModelCopyWith<$Res>  {
  factory $QuantityValueModelCopyWith(QuantityValueModel value, $Res Function(QuantityValueModel) _then) = _$QuantityValueModelCopyWithImpl;
@useResult
$Res call({
 String value, QuantityFieldModel quantityField
});


$QuantityFieldModelCopyWith<$Res> get quantityField;

}
/// @nodoc
class _$QuantityValueModelCopyWithImpl<$Res>
    implements $QuantityValueModelCopyWith<$Res> {
  _$QuantityValueModelCopyWithImpl(this._self, this._then);

  final QuantityValueModel _self;
  final $Res Function(QuantityValueModel) _then;

/// Create a copy of QuantityValueModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? value = null,Object? quantityField = null,}) {
  return _then(_self.copyWith(
value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,quantityField: null == quantityField ? _self.quantityField : quantityField // ignore: cast_nullable_to_non_nullable
as QuantityFieldModel,
  ));
}
/// Create a copy of QuantityValueModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$QuantityFieldModelCopyWith<$Res> get quantityField {
  
  return $QuantityFieldModelCopyWith<$Res>(_self.quantityField, (value) {
    return _then(_self.copyWith(quantityField: value));
  });
}
}


/// Adds pattern-matching-related methods to [QuantityValueModel].
extension QuantityValueModelPatterns on QuantityValueModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QuantityValueModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QuantityValueModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QuantityValueModel value)  $default,){
final _that = this;
switch (_that) {
case _QuantityValueModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QuantityValueModel value)?  $default,){
final _that = this;
switch (_that) {
case _QuantityValueModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String value,  QuantityFieldModel quantityField)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QuantityValueModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String value,  QuantityFieldModel quantityField)  $default,) {final _that = this;
switch (_that) {
case _QuantityValueModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String value,  QuantityFieldModel quantityField)?  $default,) {final _that = this;
switch (_that) {
case _QuantityValueModel() when $default != null:
return $default(_that.value,_that.quantityField);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _QuantityValueModel extends QuantityValueModel {
  const _QuantityValueModel({required this.value, required this.quantityField}): super._();
  factory _QuantityValueModel.fromJson(Map<String, dynamic> json) => _$QuantityValueModelFromJson(json);

@override final  String value;
@override final  QuantityFieldModel quantityField;

/// Create a copy of QuantityValueModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuantityValueModelCopyWith<_QuantityValueModel> get copyWith => __$QuantityValueModelCopyWithImpl<_QuantityValueModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$QuantityValueModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QuantityValueModel&&(identical(other.value, value) || other.value == value)&&(identical(other.quantityField, quantityField) || other.quantityField == quantityField));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,value,quantityField);

@override
String toString() {
  return 'QuantityValueModel(value: $value, quantityField: $quantityField)';
}


}

/// @nodoc
abstract mixin class _$QuantityValueModelCopyWith<$Res> implements $QuantityValueModelCopyWith<$Res> {
  factory _$QuantityValueModelCopyWith(_QuantityValueModel value, $Res Function(_QuantityValueModel) _then) = __$QuantityValueModelCopyWithImpl;
@override @useResult
$Res call({
 String value, QuantityFieldModel quantityField
});


@override $QuantityFieldModelCopyWith<$Res> get quantityField;

}
/// @nodoc
class __$QuantityValueModelCopyWithImpl<$Res>
    implements _$QuantityValueModelCopyWith<$Res> {
  __$QuantityValueModelCopyWithImpl(this._self, this._then);

  final _QuantityValueModel _self;
  final $Res Function(_QuantityValueModel) _then;

/// Create a copy of QuantityValueModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? value = null,Object? quantityField = null,}) {
  return _then(_QuantityValueModel(
value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,quantityField: null == quantityField ? _self.quantityField : quantityField // ignore: cast_nullable_to_non_nullable
as QuantityFieldModel,
  ));
}

/// Create a copy of QuantityValueModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$QuantityFieldModelCopyWith<$Res> get quantityField {
  
  return $QuantityFieldModelCopyWith<$Res>(_self.quantityField, (value) {
    return _then(_self.copyWith(quantityField: value));
  });
}
}

// dart format on
