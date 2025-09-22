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

 int get id; String get uid; String get name; String get code; String get fieldType; String? get unit; String? get validationRules; int get displayOrder; bool get isRequired; bool get isForSegment; String? get defaultValue; String? get placeholder; String? get helpText; List<DropdownOptionModel> get dropdownOptions;
/// Create a copy of QuantityFieldModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuantityFieldModelCopyWith<QuantityFieldModel> get copyWith => _$QuantityFieldModelCopyWithImpl<QuantityFieldModel>(this as QuantityFieldModel, _$identity);

  /// Serializes this QuantityFieldModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuantityFieldModel&&(identical(other.id, id) || other.id == id)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.name, name) || other.name == name)&&(identical(other.code, code) || other.code == code)&&(identical(other.fieldType, fieldType) || other.fieldType == fieldType)&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.validationRules, validationRules) || other.validationRules == validationRules)&&(identical(other.displayOrder, displayOrder) || other.displayOrder == displayOrder)&&(identical(other.isRequired, isRequired) || other.isRequired == isRequired)&&(identical(other.isForSegment, isForSegment) || other.isForSegment == isForSegment)&&(identical(other.defaultValue, defaultValue) || other.defaultValue == defaultValue)&&(identical(other.placeholder, placeholder) || other.placeholder == placeholder)&&(identical(other.helpText, helpText) || other.helpText == helpText)&&const DeepCollectionEquality().equals(other.dropdownOptions, dropdownOptions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,uid,name,code,fieldType,unit,validationRules,displayOrder,isRequired,isForSegment,defaultValue,placeholder,helpText,const DeepCollectionEquality().hash(dropdownOptions));

@override
String toString() {
  return 'QuantityFieldModel(id: $id, uid: $uid, name: $name, code: $code, fieldType: $fieldType, unit: $unit, validationRules: $validationRules, displayOrder: $displayOrder, isRequired: $isRequired, isForSegment: $isForSegment, defaultValue: $defaultValue, placeholder: $placeholder, helpText: $helpText, dropdownOptions: $dropdownOptions)';
}


}

/// @nodoc
abstract mixin class $QuantityFieldModelCopyWith<$Res>  {
  factory $QuantityFieldModelCopyWith(QuantityFieldModel value, $Res Function(QuantityFieldModel) _then) = _$QuantityFieldModelCopyWithImpl;
@useResult
$Res call({
 int id, String uid, String name, String code, String fieldType, String? unit, String? validationRules, int displayOrder, bool isRequired, bool isForSegment, String? defaultValue, String? placeholder, String? helpText, List<DropdownOptionModel> dropdownOptions
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? uid = null,Object? name = null,Object? code = null,Object? fieldType = null,Object? unit = freezed,Object? validationRules = freezed,Object? displayOrder = null,Object? isRequired = null,Object? isForSegment = null,Object? defaultValue = freezed,Object? placeholder = freezed,Object? helpText = freezed,Object? dropdownOptions = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,fieldType: null == fieldType ? _self.fieldType : fieldType // ignore: cast_nullable_to_non_nullable
as String,unit: freezed == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as String?,validationRules: freezed == validationRules ? _self.validationRules : validationRules // ignore: cast_nullable_to_non_nullable
as String?,displayOrder: null == displayOrder ? _self.displayOrder : displayOrder // ignore: cast_nullable_to_non_nullable
as int,isRequired: null == isRequired ? _self.isRequired : isRequired // ignore: cast_nullable_to_non_nullable
as bool,isForSegment: null == isForSegment ? _self.isForSegment : isForSegment // ignore: cast_nullable_to_non_nullable
as bool,defaultValue: freezed == defaultValue ? _self.defaultValue : defaultValue // ignore: cast_nullable_to_non_nullable
as String?,placeholder: freezed == placeholder ? _self.placeholder : placeholder // ignore: cast_nullable_to_non_nullable
as String?,helpText: freezed == helpText ? _self.helpText : helpText // ignore: cast_nullable_to_non_nullable
as String?,dropdownOptions: null == dropdownOptions ? _self.dropdownOptions : dropdownOptions // ignore: cast_nullable_to_non_nullable
as List<DropdownOptionModel>,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String uid,  String name,  String code,  String fieldType,  String? unit,  String? validationRules,  int displayOrder,  bool isRequired,  bool isForSegment,  String? defaultValue,  String? placeholder,  String? helpText,  List<DropdownOptionModel> dropdownOptions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QuantityFieldModel() when $default != null:
return $default(_that.id,_that.uid,_that.name,_that.code,_that.fieldType,_that.unit,_that.validationRules,_that.displayOrder,_that.isRequired,_that.isForSegment,_that.defaultValue,_that.placeholder,_that.helpText,_that.dropdownOptions);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String uid,  String name,  String code,  String fieldType,  String? unit,  String? validationRules,  int displayOrder,  bool isRequired,  bool isForSegment,  String? defaultValue,  String? placeholder,  String? helpText,  List<DropdownOptionModel> dropdownOptions)  $default,) {final _that = this;
switch (_that) {
case _QuantityFieldModel():
return $default(_that.id,_that.uid,_that.name,_that.code,_that.fieldType,_that.unit,_that.validationRules,_that.displayOrder,_that.isRequired,_that.isForSegment,_that.defaultValue,_that.placeholder,_that.helpText,_that.dropdownOptions);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String uid,  String name,  String code,  String fieldType,  String? unit,  String? validationRules,  int displayOrder,  bool isRequired,  bool isForSegment,  String? defaultValue,  String? placeholder,  String? helpText,  List<DropdownOptionModel> dropdownOptions)?  $default,) {final _that = this;
switch (_that) {
case _QuantityFieldModel() when $default != null:
return $default(_that.id,_that.uid,_that.name,_that.code,_that.fieldType,_that.unit,_that.validationRules,_that.displayOrder,_that.isRequired,_that.isForSegment,_that.defaultValue,_that.placeholder,_that.helpText,_that.dropdownOptions);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _QuantityFieldModel extends QuantityFieldModel {
  const _QuantityFieldModel({required this.id, required this.uid, required this.name, required this.code, required this.fieldType, this.unit, this.validationRules, required this.displayOrder, required this.isRequired, required this.isForSegment, this.defaultValue, this.placeholder, this.helpText, final  List<DropdownOptionModel> dropdownOptions = const []}): _dropdownOptions = dropdownOptions,super._();
  factory _QuantityFieldModel.fromJson(Map<String, dynamic> json) => _$QuantityFieldModelFromJson(json);

@override final  int id;
@override final  String uid;
@override final  String name;
@override final  String code;
@override final  String fieldType;
@override final  String? unit;
@override final  String? validationRules;
@override final  int displayOrder;
@override final  bool isRequired;
@override final  bool isForSegment;
@override final  String? defaultValue;
@override final  String? placeholder;
@override final  String? helpText;
 final  List<DropdownOptionModel> _dropdownOptions;
@override@JsonKey() List<DropdownOptionModel> get dropdownOptions {
  if (_dropdownOptions is EqualUnmodifiableListView) return _dropdownOptions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_dropdownOptions);
}


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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QuantityFieldModel&&(identical(other.id, id) || other.id == id)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.name, name) || other.name == name)&&(identical(other.code, code) || other.code == code)&&(identical(other.fieldType, fieldType) || other.fieldType == fieldType)&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.validationRules, validationRules) || other.validationRules == validationRules)&&(identical(other.displayOrder, displayOrder) || other.displayOrder == displayOrder)&&(identical(other.isRequired, isRequired) || other.isRequired == isRequired)&&(identical(other.isForSegment, isForSegment) || other.isForSegment == isForSegment)&&(identical(other.defaultValue, defaultValue) || other.defaultValue == defaultValue)&&(identical(other.placeholder, placeholder) || other.placeholder == placeholder)&&(identical(other.helpText, helpText) || other.helpText == helpText)&&const DeepCollectionEquality().equals(other._dropdownOptions, _dropdownOptions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,uid,name,code,fieldType,unit,validationRules,displayOrder,isRequired,isForSegment,defaultValue,placeholder,helpText,const DeepCollectionEquality().hash(_dropdownOptions));

@override
String toString() {
  return 'QuantityFieldModel(id: $id, uid: $uid, name: $name, code: $code, fieldType: $fieldType, unit: $unit, validationRules: $validationRules, displayOrder: $displayOrder, isRequired: $isRequired, isForSegment: $isForSegment, defaultValue: $defaultValue, placeholder: $placeholder, helpText: $helpText, dropdownOptions: $dropdownOptions)';
}


}

/// @nodoc
abstract mixin class _$QuantityFieldModelCopyWith<$Res> implements $QuantityFieldModelCopyWith<$Res> {
  factory _$QuantityFieldModelCopyWith(_QuantityFieldModel value, $Res Function(_QuantityFieldModel) _then) = __$QuantityFieldModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String uid, String name, String code, String fieldType, String? unit, String? validationRules, int displayOrder, bool isRequired, bool isForSegment, String? defaultValue, String? placeholder, String? helpText, List<DropdownOptionModel> dropdownOptions
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? uid = null,Object? name = null,Object? code = null,Object? fieldType = null,Object? unit = freezed,Object? validationRules = freezed,Object? displayOrder = null,Object? isRequired = null,Object? isForSegment = null,Object? defaultValue = freezed,Object? placeholder = freezed,Object? helpText = freezed,Object? dropdownOptions = null,}) {
  return _then(_QuantityFieldModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,fieldType: null == fieldType ? _self.fieldType : fieldType // ignore: cast_nullable_to_non_nullable
as String,unit: freezed == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as String?,validationRules: freezed == validationRules ? _self.validationRules : validationRules // ignore: cast_nullable_to_non_nullable
as String?,displayOrder: null == displayOrder ? _self.displayOrder : displayOrder // ignore: cast_nullable_to_non_nullable
as int,isRequired: null == isRequired ? _self.isRequired : isRequired // ignore: cast_nullable_to_non_nullable
as bool,isForSegment: null == isForSegment ? _self.isForSegment : isForSegment // ignore: cast_nullable_to_non_nullable
as bool,defaultValue: freezed == defaultValue ? _self.defaultValue : defaultValue // ignore: cast_nullable_to_non_nullable
as String?,placeholder: freezed == placeholder ? _self.placeholder : placeholder // ignore: cast_nullable_to_non_nullable
as String?,helpText: freezed == helpText ? _self.helpText : helpText // ignore: cast_nullable_to_non_nullable
as String?,dropdownOptions: null == dropdownOptions ? _self._dropdownOptions : dropdownOptions // ignore: cast_nullable_to_non_nullable
as List<DropdownOptionModel>,
  ));
}


}

// dart format on
