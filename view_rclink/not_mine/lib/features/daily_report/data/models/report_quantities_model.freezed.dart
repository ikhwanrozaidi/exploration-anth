// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'report_quantities_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ReportQuantitiesModel {

 QuantityTypeModel get quantityType; List<QuantityValueModel> get quantityValues;
/// Create a copy of ReportQuantitiesModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReportQuantitiesModelCopyWith<ReportQuantitiesModel> get copyWith => _$ReportQuantitiesModelCopyWithImpl<ReportQuantitiesModel>(this as ReportQuantitiesModel, _$identity);

  /// Serializes this ReportQuantitiesModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReportQuantitiesModel&&(identical(other.quantityType, quantityType) || other.quantityType == quantityType)&&const DeepCollectionEquality().equals(other.quantityValues, quantityValues));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,quantityType,const DeepCollectionEquality().hash(quantityValues));

@override
String toString() {
  return 'ReportQuantitiesModel(quantityType: $quantityType, quantityValues: $quantityValues)';
}


}

/// @nodoc
abstract mixin class $ReportQuantitiesModelCopyWith<$Res>  {
  factory $ReportQuantitiesModelCopyWith(ReportQuantitiesModel value, $Res Function(ReportQuantitiesModel) _then) = _$ReportQuantitiesModelCopyWithImpl;
@useResult
$Res call({
 QuantityTypeModel quantityType, List<QuantityValueModel> quantityValues
});


$QuantityTypeModelCopyWith<$Res> get quantityType;

}
/// @nodoc
class _$ReportQuantitiesModelCopyWithImpl<$Res>
    implements $ReportQuantitiesModelCopyWith<$Res> {
  _$ReportQuantitiesModelCopyWithImpl(this._self, this._then);

  final ReportQuantitiesModel _self;
  final $Res Function(ReportQuantitiesModel) _then;

/// Create a copy of ReportQuantitiesModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? quantityType = null,Object? quantityValues = null,}) {
  return _then(_self.copyWith(
quantityType: null == quantityType ? _self.quantityType : quantityType // ignore: cast_nullable_to_non_nullable
as QuantityTypeModel,quantityValues: null == quantityValues ? _self.quantityValues : quantityValues // ignore: cast_nullable_to_non_nullable
as List<QuantityValueModel>,
  ));
}
/// Create a copy of ReportQuantitiesModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$QuantityTypeModelCopyWith<$Res> get quantityType {
  
  return $QuantityTypeModelCopyWith<$Res>(_self.quantityType, (value) {
    return _then(_self.copyWith(quantityType: value));
  });
}
}


/// Adds pattern-matching-related methods to [ReportQuantitiesModel].
extension ReportQuantitiesModelPatterns on ReportQuantitiesModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReportQuantitiesModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReportQuantitiesModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReportQuantitiesModel value)  $default,){
final _that = this;
switch (_that) {
case _ReportQuantitiesModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReportQuantitiesModel value)?  $default,){
final _that = this;
switch (_that) {
case _ReportQuantitiesModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( QuantityTypeModel quantityType,  List<QuantityValueModel> quantityValues)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReportQuantitiesModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( QuantityTypeModel quantityType,  List<QuantityValueModel> quantityValues)  $default,) {final _that = this;
switch (_that) {
case _ReportQuantitiesModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( QuantityTypeModel quantityType,  List<QuantityValueModel> quantityValues)?  $default,) {final _that = this;
switch (_that) {
case _ReportQuantitiesModel() when $default != null:
return $default(_that.quantityType,_that.quantityValues);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ReportQuantitiesModel extends ReportQuantitiesModel {
  const _ReportQuantitiesModel({required this.quantityType, required final  List<QuantityValueModel> quantityValues}): _quantityValues = quantityValues,super._();
  factory _ReportQuantitiesModel.fromJson(Map<String, dynamic> json) => _$ReportQuantitiesModelFromJson(json);

@override final  QuantityTypeModel quantityType;
 final  List<QuantityValueModel> _quantityValues;
@override List<QuantityValueModel> get quantityValues {
  if (_quantityValues is EqualUnmodifiableListView) return _quantityValues;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_quantityValues);
}


/// Create a copy of ReportQuantitiesModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReportQuantitiesModelCopyWith<_ReportQuantitiesModel> get copyWith => __$ReportQuantitiesModelCopyWithImpl<_ReportQuantitiesModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReportQuantitiesModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReportQuantitiesModel&&(identical(other.quantityType, quantityType) || other.quantityType == quantityType)&&const DeepCollectionEquality().equals(other._quantityValues, _quantityValues));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,quantityType,const DeepCollectionEquality().hash(_quantityValues));

@override
String toString() {
  return 'ReportQuantitiesModel(quantityType: $quantityType, quantityValues: $quantityValues)';
}


}

/// @nodoc
abstract mixin class _$ReportQuantitiesModelCopyWith<$Res> implements $ReportQuantitiesModelCopyWith<$Res> {
  factory _$ReportQuantitiesModelCopyWith(_ReportQuantitiesModel value, $Res Function(_ReportQuantitiesModel) _then) = __$ReportQuantitiesModelCopyWithImpl;
@override @useResult
$Res call({
 QuantityTypeModel quantityType, List<QuantityValueModel> quantityValues
});


@override $QuantityTypeModelCopyWith<$Res> get quantityType;

}
/// @nodoc
class __$ReportQuantitiesModelCopyWithImpl<$Res>
    implements _$ReportQuantitiesModelCopyWith<$Res> {
  __$ReportQuantitiesModelCopyWithImpl(this._self, this._then);

  final _ReportQuantitiesModel _self;
  final $Res Function(_ReportQuantitiesModel) _then;

/// Create a copy of ReportQuantitiesModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? quantityType = null,Object? quantityValues = null,}) {
  return _then(_ReportQuantitiesModel(
quantityType: null == quantityType ? _self.quantityType : quantityType // ignore: cast_nullable_to_non_nullable
as QuantityTypeModel,quantityValues: null == quantityValues ? _self._quantityValues : quantityValues // ignore: cast_nullable_to_non_nullable
as List<QuantityValueModel>,
  ));
}

/// Create a copy of ReportQuantitiesModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$QuantityTypeModelCopyWith<$Res> get quantityType {
  
  return $QuantityTypeModelCopyWith<$Res>(_self.quantityType, (value) {
    return _then(_self.copyWith(quantityType: value));
  });
}
}

// dart format on
