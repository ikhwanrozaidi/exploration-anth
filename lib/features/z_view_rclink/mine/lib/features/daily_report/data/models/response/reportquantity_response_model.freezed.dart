// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reportquantity_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ReportQuantityResponseModel {

 QuantityTypeResponseModel? get quantityType; List<QuantityValueResponseModel>? get quantityValues;
/// Create a copy of ReportQuantityResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReportQuantityResponseModelCopyWith<ReportQuantityResponseModel> get copyWith => _$ReportQuantityResponseModelCopyWithImpl<ReportQuantityResponseModel>(this as ReportQuantityResponseModel, _$identity);

  /// Serializes this ReportQuantityResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReportQuantityResponseModel&&(identical(other.quantityType, quantityType) || other.quantityType == quantityType)&&const DeepCollectionEquality().equals(other.quantityValues, quantityValues));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,quantityType,const DeepCollectionEquality().hash(quantityValues));

@override
String toString() {
  return 'ReportQuantityResponseModel(quantityType: $quantityType, quantityValues: $quantityValues)';
}


}

/// @nodoc
abstract mixin class $ReportQuantityResponseModelCopyWith<$Res>  {
  factory $ReportQuantityResponseModelCopyWith(ReportQuantityResponseModel value, $Res Function(ReportQuantityResponseModel) _then) = _$ReportQuantityResponseModelCopyWithImpl;
@useResult
$Res call({
 QuantityTypeResponseModel? quantityType, List<QuantityValueResponseModel>? quantityValues
});


$QuantityTypeResponseModelCopyWith<$Res>? get quantityType;

}
/// @nodoc
class _$ReportQuantityResponseModelCopyWithImpl<$Res>
    implements $ReportQuantityResponseModelCopyWith<$Res> {
  _$ReportQuantityResponseModelCopyWithImpl(this._self, this._then);

  final ReportQuantityResponseModel _self;
  final $Res Function(ReportQuantityResponseModel) _then;

/// Create a copy of ReportQuantityResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? quantityType = freezed,Object? quantityValues = freezed,}) {
  return _then(_self.copyWith(
quantityType: freezed == quantityType ? _self.quantityType : quantityType // ignore: cast_nullable_to_non_nullable
as QuantityTypeResponseModel?,quantityValues: freezed == quantityValues ? _self.quantityValues : quantityValues // ignore: cast_nullable_to_non_nullable
as List<QuantityValueResponseModel>?,
  ));
}
/// Create a copy of ReportQuantityResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$QuantityTypeResponseModelCopyWith<$Res>? get quantityType {
    if (_self.quantityType == null) {
    return null;
  }

  return $QuantityTypeResponseModelCopyWith<$Res>(_self.quantityType!, (value) {
    return _then(_self.copyWith(quantityType: value));
  });
}
}


/// Adds pattern-matching-related methods to [ReportQuantityResponseModel].
extension ReportQuantityResponseModelPatterns on ReportQuantityResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReportQuantityResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReportQuantityResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReportQuantityResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _ReportQuantityResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReportQuantityResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _ReportQuantityResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( QuantityTypeResponseModel? quantityType,  List<QuantityValueResponseModel>? quantityValues)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReportQuantityResponseModel() when $default != null:
return $default(_that.quantityType,_that.quantityValues);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( QuantityTypeResponseModel? quantityType,  List<QuantityValueResponseModel>? quantityValues)  $default,) {final _that = this;
switch (_that) {
case _ReportQuantityResponseModel():
return $default(_that.quantityType,_that.quantityValues);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( QuantityTypeResponseModel? quantityType,  List<QuantityValueResponseModel>? quantityValues)?  $default,) {final _that = this;
switch (_that) {
case _ReportQuantityResponseModel() when $default != null:
return $default(_that.quantityType,_that.quantityValues);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ReportQuantityResponseModel extends ReportQuantityResponseModel {
  const _ReportQuantityResponseModel({this.quantityType, final  List<QuantityValueResponseModel>? quantityValues}): _quantityValues = quantityValues,super._();
  factory _ReportQuantityResponseModel.fromJson(Map<String, dynamic> json) => _$ReportQuantityResponseModelFromJson(json);

@override final  QuantityTypeResponseModel? quantityType;
 final  List<QuantityValueResponseModel>? _quantityValues;
@override List<QuantityValueResponseModel>? get quantityValues {
  final value = _quantityValues;
  if (value == null) return null;
  if (_quantityValues is EqualUnmodifiableListView) return _quantityValues;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of ReportQuantityResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReportQuantityResponseModelCopyWith<_ReportQuantityResponseModel> get copyWith => __$ReportQuantityResponseModelCopyWithImpl<_ReportQuantityResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReportQuantityResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReportQuantityResponseModel&&(identical(other.quantityType, quantityType) || other.quantityType == quantityType)&&const DeepCollectionEquality().equals(other._quantityValues, _quantityValues));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,quantityType,const DeepCollectionEquality().hash(_quantityValues));

@override
String toString() {
  return 'ReportQuantityResponseModel(quantityType: $quantityType, quantityValues: $quantityValues)';
}


}

/// @nodoc
abstract mixin class _$ReportQuantityResponseModelCopyWith<$Res> implements $ReportQuantityResponseModelCopyWith<$Res> {
  factory _$ReportQuantityResponseModelCopyWith(_ReportQuantityResponseModel value, $Res Function(_ReportQuantityResponseModel) _then) = __$ReportQuantityResponseModelCopyWithImpl;
@override @useResult
$Res call({
 QuantityTypeResponseModel? quantityType, List<QuantityValueResponseModel>? quantityValues
});


@override $QuantityTypeResponseModelCopyWith<$Res>? get quantityType;

}
/// @nodoc
class __$ReportQuantityResponseModelCopyWithImpl<$Res>
    implements _$ReportQuantityResponseModelCopyWith<$Res> {
  __$ReportQuantityResponseModelCopyWithImpl(this._self, this._then);

  final _ReportQuantityResponseModel _self;
  final $Res Function(_ReportQuantityResponseModel) _then;

/// Create a copy of ReportQuantityResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? quantityType = freezed,Object? quantityValues = freezed,}) {
  return _then(_ReportQuantityResponseModel(
quantityType: freezed == quantityType ? _self.quantityType : quantityType // ignore: cast_nullable_to_non_nullable
as QuantityTypeResponseModel?,quantityValues: freezed == quantityValues ? _self._quantityValues : quantityValues // ignore: cast_nullable_to_non_nullable
as List<QuantityValueResponseModel>?,
  ));
}

/// Create a copy of ReportQuantityResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$QuantityTypeResponseModelCopyWith<$Res>? get quantityType {
    if (_self.quantityType == null) {
    return null;
  }

  return $QuantityTypeResponseModelCopyWith<$Res>(_self.quantityType!, (value) {
    return _then(_self.copyWith(quantityType: value));
  });
}
}

// dart format on
