// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quantityfield_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$QuantityFieldResponseModel {

 String? get name; String? get fieldType; String? get unit; String? get validationRules; int? get displayOrder; bool? get isRequired; bool? get isForSegment; String? get defaultValue; String? get uid; List<String>? get dropdownOptions;
/// Create a copy of QuantityFieldResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuantityFieldResponseModelCopyWith<QuantityFieldResponseModel> get copyWith => _$QuantityFieldResponseModelCopyWithImpl<QuantityFieldResponseModel>(this as QuantityFieldResponseModel, _$identity);

  /// Serializes this QuantityFieldResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuantityFieldResponseModel&&(identical(other.name, name) || other.name == name)&&(identical(other.fieldType, fieldType) || other.fieldType == fieldType)&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.validationRules, validationRules) || other.validationRules == validationRules)&&(identical(other.displayOrder, displayOrder) || other.displayOrder == displayOrder)&&(identical(other.isRequired, isRequired) || other.isRequired == isRequired)&&(identical(other.isForSegment, isForSegment) || other.isForSegment == isForSegment)&&(identical(other.defaultValue, defaultValue) || other.defaultValue == defaultValue)&&(identical(other.uid, uid) || other.uid == uid)&&const DeepCollectionEquality().equals(other.dropdownOptions, dropdownOptions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,fieldType,unit,validationRules,displayOrder,isRequired,isForSegment,defaultValue,uid,const DeepCollectionEquality().hash(dropdownOptions));

@override
String toString() {
  return 'QuantityFieldResponseModel(name: $name, fieldType: $fieldType, unit: $unit, validationRules: $validationRules, displayOrder: $displayOrder, isRequired: $isRequired, isForSegment: $isForSegment, defaultValue: $defaultValue, uid: $uid, dropdownOptions: $dropdownOptions)';
}


}

/// @nodoc
abstract mixin class $QuantityFieldResponseModelCopyWith<$Res>  {
  factory $QuantityFieldResponseModelCopyWith(QuantityFieldResponseModel value, $Res Function(QuantityFieldResponseModel) _then) = _$QuantityFieldResponseModelCopyWithImpl;
@useResult
$Res call({
 String? name, String? fieldType, String? unit, String? validationRules, int? displayOrder, bool? isRequired, bool? isForSegment, String? defaultValue, String? uid, List<String>? dropdownOptions
});




}
/// @nodoc
class _$QuantityFieldResponseModelCopyWithImpl<$Res>
    implements $QuantityFieldResponseModelCopyWith<$Res> {
  _$QuantityFieldResponseModelCopyWithImpl(this._self, this._then);

  final QuantityFieldResponseModel _self;
  final $Res Function(QuantityFieldResponseModel) _then;

/// Create a copy of QuantityFieldResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = freezed,Object? fieldType = freezed,Object? unit = freezed,Object? validationRules = freezed,Object? displayOrder = freezed,Object? isRequired = freezed,Object? isForSegment = freezed,Object? defaultValue = freezed,Object? uid = freezed,Object? dropdownOptions = freezed,}) {
  return _then(_self.copyWith(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,fieldType: freezed == fieldType ? _self.fieldType : fieldType // ignore: cast_nullable_to_non_nullable
as String?,unit: freezed == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as String?,validationRules: freezed == validationRules ? _self.validationRules : validationRules // ignore: cast_nullable_to_non_nullable
as String?,displayOrder: freezed == displayOrder ? _self.displayOrder : displayOrder // ignore: cast_nullable_to_non_nullable
as int?,isRequired: freezed == isRequired ? _self.isRequired : isRequired // ignore: cast_nullable_to_non_nullable
as bool?,isForSegment: freezed == isForSegment ? _self.isForSegment : isForSegment // ignore: cast_nullable_to_non_nullable
as bool?,defaultValue: freezed == defaultValue ? _self.defaultValue : defaultValue // ignore: cast_nullable_to_non_nullable
as String?,uid: freezed == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String?,dropdownOptions: freezed == dropdownOptions ? _self.dropdownOptions : dropdownOptions // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}

}


/// Adds pattern-matching-related methods to [QuantityFieldResponseModel].
extension QuantityFieldResponseModelPatterns on QuantityFieldResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QuantityFieldResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QuantityFieldResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QuantityFieldResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _QuantityFieldResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QuantityFieldResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _QuantityFieldResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? name,  String? fieldType,  String? unit,  String? validationRules,  int? displayOrder,  bool? isRequired,  bool? isForSegment,  String? defaultValue,  String? uid,  List<String>? dropdownOptions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QuantityFieldResponseModel() when $default != null:
return $default(_that.name,_that.fieldType,_that.unit,_that.validationRules,_that.displayOrder,_that.isRequired,_that.isForSegment,_that.defaultValue,_that.uid,_that.dropdownOptions);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? name,  String? fieldType,  String? unit,  String? validationRules,  int? displayOrder,  bool? isRequired,  bool? isForSegment,  String? defaultValue,  String? uid,  List<String>? dropdownOptions)  $default,) {final _that = this;
switch (_that) {
case _QuantityFieldResponseModel():
return $default(_that.name,_that.fieldType,_that.unit,_that.validationRules,_that.displayOrder,_that.isRequired,_that.isForSegment,_that.defaultValue,_that.uid,_that.dropdownOptions);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? name,  String? fieldType,  String? unit,  String? validationRules,  int? displayOrder,  bool? isRequired,  bool? isForSegment,  String? defaultValue,  String? uid,  List<String>? dropdownOptions)?  $default,) {final _that = this;
switch (_that) {
case _QuantityFieldResponseModel() when $default != null:
return $default(_that.name,_that.fieldType,_that.unit,_that.validationRules,_that.displayOrder,_that.isRequired,_that.isForSegment,_that.defaultValue,_that.uid,_that.dropdownOptions);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _QuantityFieldResponseModel extends QuantityFieldResponseModel {
  const _QuantityFieldResponseModel({this.name, this.fieldType, this.unit, this.validationRules, this.displayOrder, this.isRequired, this.isForSegment, this.defaultValue, this.uid, final  List<String>? dropdownOptions}): _dropdownOptions = dropdownOptions,super._();
  factory _QuantityFieldResponseModel.fromJson(Map<String, dynamic> json) => _$QuantityFieldResponseModelFromJson(json);

@override final  String? name;
@override final  String? fieldType;
@override final  String? unit;
@override final  String? validationRules;
@override final  int? displayOrder;
@override final  bool? isRequired;
@override final  bool? isForSegment;
@override final  String? defaultValue;
@override final  String? uid;
 final  List<String>? _dropdownOptions;
@override List<String>? get dropdownOptions {
  final value = _dropdownOptions;
  if (value == null) return null;
  if (_dropdownOptions is EqualUnmodifiableListView) return _dropdownOptions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of QuantityFieldResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuantityFieldResponseModelCopyWith<_QuantityFieldResponseModel> get copyWith => __$QuantityFieldResponseModelCopyWithImpl<_QuantityFieldResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$QuantityFieldResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QuantityFieldResponseModel&&(identical(other.name, name) || other.name == name)&&(identical(other.fieldType, fieldType) || other.fieldType == fieldType)&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.validationRules, validationRules) || other.validationRules == validationRules)&&(identical(other.displayOrder, displayOrder) || other.displayOrder == displayOrder)&&(identical(other.isRequired, isRequired) || other.isRequired == isRequired)&&(identical(other.isForSegment, isForSegment) || other.isForSegment == isForSegment)&&(identical(other.defaultValue, defaultValue) || other.defaultValue == defaultValue)&&(identical(other.uid, uid) || other.uid == uid)&&const DeepCollectionEquality().equals(other._dropdownOptions, _dropdownOptions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,fieldType,unit,validationRules,displayOrder,isRequired,isForSegment,defaultValue,uid,const DeepCollectionEquality().hash(_dropdownOptions));

@override
String toString() {
  return 'QuantityFieldResponseModel(name: $name, fieldType: $fieldType, unit: $unit, validationRules: $validationRules, displayOrder: $displayOrder, isRequired: $isRequired, isForSegment: $isForSegment, defaultValue: $defaultValue, uid: $uid, dropdownOptions: $dropdownOptions)';
}


}

/// @nodoc
abstract mixin class _$QuantityFieldResponseModelCopyWith<$Res> implements $QuantityFieldResponseModelCopyWith<$Res> {
  factory _$QuantityFieldResponseModelCopyWith(_QuantityFieldResponseModel value, $Res Function(_QuantityFieldResponseModel) _then) = __$QuantityFieldResponseModelCopyWithImpl;
@override @useResult
$Res call({
 String? name, String? fieldType, String? unit, String? validationRules, int? displayOrder, bool? isRequired, bool? isForSegment, String? defaultValue, String? uid, List<String>? dropdownOptions
});




}
/// @nodoc
class __$QuantityFieldResponseModelCopyWithImpl<$Res>
    implements _$QuantityFieldResponseModelCopyWith<$Res> {
  __$QuantityFieldResponseModelCopyWithImpl(this._self, this._then);

  final _QuantityFieldResponseModel _self;
  final $Res Function(_QuantityFieldResponseModel) _then;

/// Create a copy of QuantityFieldResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = freezed,Object? fieldType = freezed,Object? unit = freezed,Object? validationRules = freezed,Object? displayOrder = freezed,Object? isRequired = freezed,Object? isForSegment = freezed,Object? defaultValue = freezed,Object? uid = freezed,Object? dropdownOptions = freezed,}) {
  return _then(_QuantityFieldResponseModel(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,fieldType: freezed == fieldType ? _self.fieldType : fieldType // ignore: cast_nullable_to_non_nullable
as String?,unit: freezed == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as String?,validationRules: freezed == validationRules ? _self.validationRules : validationRules // ignore: cast_nullable_to_non_nullable
as String?,displayOrder: freezed == displayOrder ? _self.displayOrder : displayOrder // ignore: cast_nullable_to_non_nullable
as int?,isRequired: freezed == isRequired ? _self.isRequired : isRequired // ignore: cast_nullable_to_non_nullable
as bool?,isForSegment: freezed == isForSegment ? _self.isForSegment : isForSegment // ignore: cast_nullable_to_non_nullable
as bool?,defaultValue: freezed == defaultValue ? _self.defaultValue : defaultValue // ignore: cast_nullable_to_non_nullable
as String?,uid: freezed == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String?,dropdownOptions: freezed == dropdownOptions ? _self._dropdownOptions : dropdownOptions // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}


}

// dart format on
