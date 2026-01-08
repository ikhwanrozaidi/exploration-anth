// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quantity_field_nested_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$QuantityFieldNestedModel {

 int? get id; String? get uid; int? get quantityTypeID; String? get name; String? get code; String? get fieldType;// DROPDOWN, DECIMAL, TEXT, etc.
 String? get unit; String? get unitMeasurement; double? get minValue; double? get maxValue; int? get minLength; int? get maxLength; int? get displayOrder; bool? get isRequired; bool? get isForSegment; String? get defaultValue; String? get placeholder; String? get helpText; String? get createdAt; String? get updatedAt; List<DropdownOptionNestedModel>? get dropdownOptions;
/// Create a copy of QuantityFieldNestedModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuantityFieldNestedModelCopyWith<QuantityFieldNestedModel> get copyWith => _$QuantityFieldNestedModelCopyWithImpl<QuantityFieldNestedModel>(this as QuantityFieldNestedModel, _$identity);

  /// Serializes this QuantityFieldNestedModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuantityFieldNestedModel&&(identical(other.id, id) || other.id == id)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.quantityTypeID, quantityTypeID) || other.quantityTypeID == quantityTypeID)&&(identical(other.name, name) || other.name == name)&&(identical(other.code, code) || other.code == code)&&(identical(other.fieldType, fieldType) || other.fieldType == fieldType)&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.unitMeasurement, unitMeasurement) || other.unitMeasurement == unitMeasurement)&&(identical(other.minValue, minValue) || other.minValue == minValue)&&(identical(other.maxValue, maxValue) || other.maxValue == maxValue)&&(identical(other.minLength, minLength) || other.minLength == minLength)&&(identical(other.maxLength, maxLength) || other.maxLength == maxLength)&&(identical(other.displayOrder, displayOrder) || other.displayOrder == displayOrder)&&(identical(other.isRequired, isRequired) || other.isRequired == isRequired)&&(identical(other.isForSegment, isForSegment) || other.isForSegment == isForSegment)&&(identical(other.defaultValue, defaultValue) || other.defaultValue == defaultValue)&&(identical(other.placeholder, placeholder) || other.placeholder == placeholder)&&(identical(other.helpText, helpText) || other.helpText == helpText)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other.dropdownOptions, dropdownOptions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,uid,quantityTypeID,name,code,fieldType,unit,unitMeasurement,minValue,maxValue,minLength,maxLength,displayOrder,isRequired,isForSegment,defaultValue,placeholder,helpText,createdAt,updatedAt,const DeepCollectionEquality().hash(dropdownOptions)]);

@override
String toString() {
  return 'QuantityFieldNestedModel(id: $id, uid: $uid, quantityTypeID: $quantityTypeID, name: $name, code: $code, fieldType: $fieldType, unit: $unit, unitMeasurement: $unitMeasurement, minValue: $minValue, maxValue: $maxValue, minLength: $minLength, maxLength: $maxLength, displayOrder: $displayOrder, isRequired: $isRequired, isForSegment: $isForSegment, defaultValue: $defaultValue, placeholder: $placeholder, helpText: $helpText, createdAt: $createdAt, updatedAt: $updatedAt, dropdownOptions: $dropdownOptions)';
}


}

/// @nodoc
abstract mixin class $QuantityFieldNestedModelCopyWith<$Res>  {
  factory $QuantityFieldNestedModelCopyWith(QuantityFieldNestedModel value, $Res Function(QuantityFieldNestedModel) _then) = _$QuantityFieldNestedModelCopyWithImpl;
@useResult
$Res call({
 int? id, String? uid, int? quantityTypeID, String? name, String? code, String? fieldType, String? unit, String? unitMeasurement, double? minValue, double? maxValue, int? minLength, int? maxLength, int? displayOrder, bool? isRequired, bool? isForSegment, String? defaultValue, String? placeholder, String? helpText, String? createdAt, String? updatedAt, List<DropdownOptionNestedModel>? dropdownOptions
});




}
/// @nodoc
class _$QuantityFieldNestedModelCopyWithImpl<$Res>
    implements $QuantityFieldNestedModelCopyWith<$Res> {
  _$QuantityFieldNestedModelCopyWithImpl(this._self, this._then);

  final QuantityFieldNestedModel _self;
  final $Res Function(QuantityFieldNestedModel) _then;

/// Create a copy of QuantityFieldNestedModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? uid = freezed,Object? quantityTypeID = freezed,Object? name = freezed,Object? code = freezed,Object? fieldType = freezed,Object? unit = freezed,Object? unitMeasurement = freezed,Object? minValue = freezed,Object? maxValue = freezed,Object? minLength = freezed,Object? maxLength = freezed,Object? displayOrder = freezed,Object? isRequired = freezed,Object? isForSegment = freezed,Object? defaultValue = freezed,Object? placeholder = freezed,Object? helpText = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? dropdownOptions = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,uid: freezed == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String?,quantityTypeID: freezed == quantityTypeID ? _self.quantityTypeID : quantityTypeID // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String?,fieldType: freezed == fieldType ? _self.fieldType : fieldType // ignore: cast_nullable_to_non_nullable
as String?,unit: freezed == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as String?,unitMeasurement: freezed == unitMeasurement ? _self.unitMeasurement : unitMeasurement // ignore: cast_nullable_to_non_nullable
as String?,minValue: freezed == minValue ? _self.minValue : minValue // ignore: cast_nullable_to_non_nullable
as double?,maxValue: freezed == maxValue ? _self.maxValue : maxValue // ignore: cast_nullable_to_non_nullable
as double?,minLength: freezed == minLength ? _self.minLength : minLength // ignore: cast_nullable_to_non_nullable
as int?,maxLength: freezed == maxLength ? _self.maxLength : maxLength // ignore: cast_nullable_to_non_nullable
as int?,displayOrder: freezed == displayOrder ? _self.displayOrder : displayOrder // ignore: cast_nullable_to_non_nullable
as int?,isRequired: freezed == isRequired ? _self.isRequired : isRequired // ignore: cast_nullable_to_non_nullable
as bool?,isForSegment: freezed == isForSegment ? _self.isForSegment : isForSegment // ignore: cast_nullable_to_non_nullable
as bool?,defaultValue: freezed == defaultValue ? _self.defaultValue : defaultValue // ignore: cast_nullable_to_non_nullable
as String?,placeholder: freezed == placeholder ? _self.placeholder : placeholder // ignore: cast_nullable_to_non_nullable
as String?,helpText: freezed == helpText ? _self.helpText : helpText // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,dropdownOptions: freezed == dropdownOptions ? _self.dropdownOptions : dropdownOptions // ignore: cast_nullable_to_non_nullable
as List<DropdownOptionNestedModel>?,
  ));
}

}


/// Adds pattern-matching-related methods to [QuantityFieldNestedModel].
extension QuantityFieldNestedModelPatterns on QuantityFieldNestedModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QuantityFieldNestedModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QuantityFieldNestedModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QuantityFieldNestedModel value)  $default,){
final _that = this;
switch (_that) {
case _QuantityFieldNestedModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QuantityFieldNestedModel value)?  $default,){
final _that = this;
switch (_that) {
case _QuantityFieldNestedModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  String? uid,  int? quantityTypeID,  String? name,  String? code,  String? fieldType,  String? unit,  String? unitMeasurement,  double? minValue,  double? maxValue,  int? minLength,  int? maxLength,  int? displayOrder,  bool? isRequired,  bool? isForSegment,  String? defaultValue,  String? placeholder,  String? helpText,  String? createdAt,  String? updatedAt,  List<DropdownOptionNestedModel>? dropdownOptions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QuantityFieldNestedModel() when $default != null:
return $default(_that.id,_that.uid,_that.quantityTypeID,_that.name,_that.code,_that.fieldType,_that.unit,_that.unitMeasurement,_that.minValue,_that.maxValue,_that.minLength,_that.maxLength,_that.displayOrder,_that.isRequired,_that.isForSegment,_that.defaultValue,_that.placeholder,_that.helpText,_that.createdAt,_that.updatedAt,_that.dropdownOptions);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  String? uid,  int? quantityTypeID,  String? name,  String? code,  String? fieldType,  String? unit,  String? unitMeasurement,  double? minValue,  double? maxValue,  int? minLength,  int? maxLength,  int? displayOrder,  bool? isRequired,  bool? isForSegment,  String? defaultValue,  String? placeholder,  String? helpText,  String? createdAt,  String? updatedAt,  List<DropdownOptionNestedModel>? dropdownOptions)  $default,) {final _that = this;
switch (_that) {
case _QuantityFieldNestedModel():
return $default(_that.id,_that.uid,_that.quantityTypeID,_that.name,_that.code,_that.fieldType,_that.unit,_that.unitMeasurement,_that.minValue,_that.maxValue,_that.minLength,_that.maxLength,_that.displayOrder,_that.isRequired,_that.isForSegment,_that.defaultValue,_that.placeholder,_that.helpText,_that.createdAt,_that.updatedAt,_that.dropdownOptions);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  String? uid,  int? quantityTypeID,  String? name,  String? code,  String? fieldType,  String? unit,  String? unitMeasurement,  double? minValue,  double? maxValue,  int? minLength,  int? maxLength,  int? displayOrder,  bool? isRequired,  bool? isForSegment,  String? defaultValue,  String? placeholder,  String? helpText,  String? createdAt,  String? updatedAt,  List<DropdownOptionNestedModel>? dropdownOptions)?  $default,) {final _that = this;
switch (_that) {
case _QuantityFieldNestedModel() when $default != null:
return $default(_that.id,_that.uid,_that.quantityTypeID,_that.name,_that.code,_that.fieldType,_that.unit,_that.unitMeasurement,_that.minValue,_that.maxValue,_that.minLength,_that.maxLength,_that.displayOrder,_that.isRequired,_that.isForSegment,_that.defaultValue,_that.placeholder,_that.helpText,_that.createdAt,_that.updatedAt,_that.dropdownOptions);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _QuantityFieldNestedModel implements QuantityFieldNestedModel {
  const _QuantityFieldNestedModel({this.id, this.uid, this.quantityTypeID, this.name, this.code, this.fieldType, this.unit, this.unitMeasurement, this.minValue, this.maxValue, this.minLength, this.maxLength, this.displayOrder, this.isRequired, this.isForSegment, this.defaultValue, this.placeholder, this.helpText, this.createdAt, this.updatedAt, final  List<DropdownOptionNestedModel>? dropdownOptions}): _dropdownOptions = dropdownOptions;
  factory _QuantityFieldNestedModel.fromJson(Map<String, dynamic> json) => _$QuantityFieldNestedModelFromJson(json);

@override final  int? id;
@override final  String? uid;
@override final  int? quantityTypeID;
@override final  String? name;
@override final  String? code;
@override final  String? fieldType;
// DROPDOWN, DECIMAL, TEXT, etc.
@override final  String? unit;
@override final  String? unitMeasurement;
@override final  double? minValue;
@override final  double? maxValue;
@override final  int? minLength;
@override final  int? maxLength;
@override final  int? displayOrder;
@override final  bool? isRequired;
@override final  bool? isForSegment;
@override final  String? defaultValue;
@override final  String? placeholder;
@override final  String? helpText;
@override final  String? createdAt;
@override final  String? updatedAt;
 final  List<DropdownOptionNestedModel>? _dropdownOptions;
@override List<DropdownOptionNestedModel>? get dropdownOptions {
  final value = _dropdownOptions;
  if (value == null) return null;
  if (_dropdownOptions is EqualUnmodifiableListView) return _dropdownOptions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of QuantityFieldNestedModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuantityFieldNestedModelCopyWith<_QuantityFieldNestedModel> get copyWith => __$QuantityFieldNestedModelCopyWithImpl<_QuantityFieldNestedModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$QuantityFieldNestedModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QuantityFieldNestedModel&&(identical(other.id, id) || other.id == id)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.quantityTypeID, quantityTypeID) || other.quantityTypeID == quantityTypeID)&&(identical(other.name, name) || other.name == name)&&(identical(other.code, code) || other.code == code)&&(identical(other.fieldType, fieldType) || other.fieldType == fieldType)&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.unitMeasurement, unitMeasurement) || other.unitMeasurement == unitMeasurement)&&(identical(other.minValue, minValue) || other.minValue == minValue)&&(identical(other.maxValue, maxValue) || other.maxValue == maxValue)&&(identical(other.minLength, minLength) || other.minLength == minLength)&&(identical(other.maxLength, maxLength) || other.maxLength == maxLength)&&(identical(other.displayOrder, displayOrder) || other.displayOrder == displayOrder)&&(identical(other.isRequired, isRequired) || other.isRequired == isRequired)&&(identical(other.isForSegment, isForSegment) || other.isForSegment == isForSegment)&&(identical(other.defaultValue, defaultValue) || other.defaultValue == defaultValue)&&(identical(other.placeholder, placeholder) || other.placeholder == placeholder)&&(identical(other.helpText, helpText) || other.helpText == helpText)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other._dropdownOptions, _dropdownOptions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,uid,quantityTypeID,name,code,fieldType,unit,unitMeasurement,minValue,maxValue,minLength,maxLength,displayOrder,isRequired,isForSegment,defaultValue,placeholder,helpText,createdAt,updatedAt,const DeepCollectionEquality().hash(_dropdownOptions)]);

@override
String toString() {
  return 'QuantityFieldNestedModel(id: $id, uid: $uid, quantityTypeID: $quantityTypeID, name: $name, code: $code, fieldType: $fieldType, unit: $unit, unitMeasurement: $unitMeasurement, minValue: $minValue, maxValue: $maxValue, minLength: $minLength, maxLength: $maxLength, displayOrder: $displayOrder, isRequired: $isRequired, isForSegment: $isForSegment, defaultValue: $defaultValue, placeholder: $placeholder, helpText: $helpText, createdAt: $createdAt, updatedAt: $updatedAt, dropdownOptions: $dropdownOptions)';
}


}

/// @nodoc
abstract mixin class _$QuantityFieldNestedModelCopyWith<$Res> implements $QuantityFieldNestedModelCopyWith<$Res> {
  factory _$QuantityFieldNestedModelCopyWith(_QuantityFieldNestedModel value, $Res Function(_QuantityFieldNestedModel) _then) = __$QuantityFieldNestedModelCopyWithImpl;
@override @useResult
$Res call({
 int? id, String? uid, int? quantityTypeID, String? name, String? code, String? fieldType, String? unit, String? unitMeasurement, double? minValue, double? maxValue, int? minLength, int? maxLength, int? displayOrder, bool? isRequired, bool? isForSegment, String? defaultValue, String? placeholder, String? helpText, String? createdAt, String? updatedAt, List<DropdownOptionNestedModel>? dropdownOptions
});




}
/// @nodoc
class __$QuantityFieldNestedModelCopyWithImpl<$Res>
    implements _$QuantityFieldNestedModelCopyWith<$Res> {
  __$QuantityFieldNestedModelCopyWithImpl(this._self, this._then);

  final _QuantityFieldNestedModel _self;
  final $Res Function(_QuantityFieldNestedModel) _then;

/// Create a copy of QuantityFieldNestedModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? uid = freezed,Object? quantityTypeID = freezed,Object? name = freezed,Object? code = freezed,Object? fieldType = freezed,Object? unit = freezed,Object? unitMeasurement = freezed,Object? minValue = freezed,Object? maxValue = freezed,Object? minLength = freezed,Object? maxLength = freezed,Object? displayOrder = freezed,Object? isRequired = freezed,Object? isForSegment = freezed,Object? defaultValue = freezed,Object? placeholder = freezed,Object? helpText = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? dropdownOptions = freezed,}) {
  return _then(_QuantityFieldNestedModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,uid: freezed == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String?,quantityTypeID: freezed == quantityTypeID ? _self.quantityTypeID : quantityTypeID // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String?,fieldType: freezed == fieldType ? _self.fieldType : fieldType // ignore: cast_nullable_to_non_nullable
as String?,unit: freezed == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as String?,unitMeasurement: freezed == unitMeasurement ? _self.unitMeasurement : unitMeasurement // ignore: cast_nullable_to_non_nullable
as String?,minValue: freezed == minValue ? _self.minValue : minValue // ignore: cast_nullable_to_non_nullable
as double?,maxValue: freezed == maxValue ? _self.maxValue : maxValue // ignore: cast_nullable_to_non_nullable
as double?,minLength: freezed == minLength ? _self.minLength : minLength // ignore: cast_nullable_to_non_nullable
as int?,maxLength: freezed == maxLength ? _self.maxLength : maxLength // ignore: cast_nullable_to_non_nullable
as int?,displayOrder: freezed == displayOrder ? _self.displayOrder : displayOrder // ignore: cast_nullable_to_non_nullable
as int?,isRequired: freezed == isRequired ? _self.isRequired : isRequired // ignore: cast_nullable_to_non_nullable
as bool?,isForSegment: freezed == isForSegment ? _self.isForSegment : isForSegment // ignore: cast_nullable_to_non_nullable
as bool?,defaultValue: freezed == defaultValue ? _self.defaultValue : defaultValue // ignore: cast_nullable_to_non_nullable
as String?,placeholder: freezed == placeholder ? _self.placeholder : placeholder // ignore: cast_nullable_to_non_nullable
as String?,helpText: freezed == helpText ? _self.helpText : helpText // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,dropdownOptions: freezed == dropdownOptions ? _self._dropdownOptions : dropdownOptions // ignore: cast_nullable_to_non_nullable
as List<DropdownOptionNestedModel>?,
  ));
}


}

// dart format on
