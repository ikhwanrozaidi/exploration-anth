// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_field_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ApiFieldModel {

 int get id; String get uid; int get quantityTypeID; String get name; String get code; String get fieldType; String? get unit; String? get validationRules; int get displayOrder; bool get isRequired; bool get isForSegment; String? get defaultValue; String? get placeholder; String? get helpText; List<ApiDropdownOption>? get dropdownOptions;
/// Create a copy of ApiFieldModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ApiFieldModelCopyWith<ApiFieldModel> get copyWith => _$ApiFieldModelCopyWithImpl<ApiFieldModel>(this as ApiFieldModel, _$identity);

  /// Serializes this ApiFieldModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ApiFieldModel&&(identical(other.id, id) || other.id == id)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.quantityTypeID, quantityTypeID) || other.quantityTypeID == quantityTypeID)&&(identical(other.name, name) || other.name == name)&&(identical(other.code, code) || other.code == code)&&(identical(other.fieldType, fieldType) || other.fieldType == fieldType)&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.validationRules, validationRules) || other.validationRules == validationRules)&&(identical(other.displayOrder, displayOrder) || other.displayOrder == displayOrder)&&(identical(other.isRequired, isRequired) || other.isRequired == isRequired)&&(identical(other.isForSegment, isForSegment) || other.isForSegment == isForSegment)&&(identical(other.defaultValue, defaultValue) || other.defaultValue == defaultValue)&&(identical(other.placeholder, placeholder) || other.placeholder == placeholder)&&(identical(other.helpText, helpText) || other.helpText == helpText)&&const DeepCollectionEquality().equals(other.dropdownOptions, dropdownOptions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,uid,quantityTypeID,name,code,fieldType,unit,validationRules,displayOrder,isRequired,isForSegment,defaultValue,placeholder,helpText,const DeepCollectionEquality().hash(dropdownOptions));

@override
String toString() {
  return 'ApiFieldModel(id: $id, uid: $uid, quantityTypeID: $quantityTypeID, name: $name, code: $code, fieldType: $fieldType, unit: $unit, validationRules: $validationRules, displayOrder: $displayOrder, isRequired: $isRequired, isForSegment: $isForSegment, defaultValue: $defaultValue, placeholder: $placeholder, helpText: $helpText, dropdownOptions: $dropdownOptions)';
}


}

/// @nodoc
abstract mixin class $ApiFieldModelCopyWith<$Res>  {
  factory $ApiFieldModelCopyWith(ApiFieldModel value, $Res Function(ApiFieldModel) _then) = _$ApiFieldModelCopyWithImpl;
@useResult
$Res call({
 int id, String uid, int quantityTypeID, String name, String code, String fieldType, String? unit, String? validationRules, int displayOrder, bool isRequired, bool isForSegment, String? defaultValue, String? placeholder, String? helpText, List<ApiDropdownOption>? dropdownOptions
});




}
/// @nodoc
class _$ApiFieldModelCopyWithImpl<$Res>
    implements $ApiFieldModelCopyWith<$Res> {
  _$ApiFieldModelCopyWithImpl(this._self, this._then);

  final ApiFieldModel _self;
  final $Res Function(ApiFieldModel) _then;

/// Create a copy of ApiFieldModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? uid = null,Object? quantityTypeID = null,Object? name = null,Object? code = null,Object? fieldType = null,Object? unit = freezed,Object? validationRules = freezed,Object? displayOrder = null,Object? isRequired = null,Object? isForSegment = null,Object? defaultValue = freezed,Object? placeholder = freezed,Object? helpText = freezed,Object? dropdownOptions = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,quantityTypeID: null == quantityTypeID ? _self.quantityTypeID : quantityTypeID // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
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
as String?,dropdownOptions: freezed == dropdownOptions ? _self.dropdownOptions : dropdownOptions // ignore: cast_nullable_to_non_nullable
as List<ApiDropdownOption>?,
  ));
}

}


/// Adds pattern-matching-related methods to [ApiFieldModel].
extension ApiFieldModelPatterns on ApiFieldModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ApiFieldModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ApiFieldModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ApiFieldModel value)  $default,){
final _that = this;
switch (_that) {
case _ApiFieldModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ApiFieldModel value)?  $default,){
final _that = this;
switch (_that) {
case _ApiFieldModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String uid,  int quantityTypeID,  String name,  String code,  String fieldType,  String? unit,  String? validationRules,  int displayOrder,  bool isRequired,  bool isForSegment,  String? defaultValue,  String? placeholder,  String? helpText,  List<ApiDropdownOption>? dropdownOptions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ApiFieldModel() when $default != null:
return $default(_that.id,_that.uid,_that.quantityTypeID,_that.name,_that.code,_that.fieldType,_that.unit,_that.validationRules,_that.displayOrder,_that.isRequired,_that.isForSegment,_that.defaultValue,_that.placeholder,_that.helpText,_that.dropdownOptions);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String uid,  int quantityTypeID,  String name,  String code,  String fieldType,  String? unit,  String? validationRules,  int displayOrder,  bool isRequired,  bool isForSegment,  String? defaultValue,  String? placeholder,  String? helpText,  List<ApiDropdownOption>? dropdownOptions)  $default,) {final _that = this;
switch (_that) {
case _ApiFieldModel():
return $default(_that.id,_that.uid,_that.quantityTypeID,_that.name,_that.code,_that.fieldType,_that.unit,_that.validationRules,_that.displayOrder,_that.isRequired,_that.isForSegment,_that.defaultValue,_that.placeholder,_that.helpText,_that.dropdownOptions);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String uid,  int quantityTypeID,  String name,  String code,  String fieldType,  String? unit,  String? validationRules,  int displayOrder,  bool isRequired,  bool isForSegment,  String? defaultValue,  String? placeholder,  String? helpText,  List<ApiDropdownOption>? dropdownOptions)?  $default,) {final _that = this;
switch (_that) {
case _ApiFieldModel() when $default != null:
return $default(_that.id,_that.uid,_that.quantityTypeID,_that.name,_that.code,_that.fieldType,_that.unit,_that.validationRules,_that.displayOrder,_that.isRequired,_that.isForSegment,_that.defaultValue,_that.placeholder,_that.helpText,_that.dropdownOptions);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ApiFieldModel implements ApiFieldModel {
  const _ApiFieldModel({required this.id, required this.uid, required this.quantityTypeID, required this.name, required this.code, required this.fieldType, this.unit, this.validationRules, required this.displayOrder, required this.isRequired, required this.isForSegment, this.defaultValue, this.placeholder, this.helpText, final  List<ApiDropdownOption>? dropdownOptions}): _dropdownOptions = dropdownOptions;
  factory _ApiFieldModel.fromJson(Map<String, dynamic> json) => _$ApiFieldModelFromJson(json);

@override final  int id;
@override final  String uid;
@override final  int quantityTypeID;
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
 final  List<ApiDropdownOption>? _dropdownOptions;
@override List<ApiDropdownOption>? get dropdownOptions {
  final value = _dropdownOptions;
  if (value == null) return null;
  if (_dropdownOptions is EqualUnmodifiableListView) return _dropdownOptions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of ApiFieldModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ApiFieldModelCopyWith<_ApiFieldModel> get copyWith => __$ApiFieldModelCopyWithImpl<_ApiFieldModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ApiFieldModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ApiFieldModel&&(identical(other.id, id) || other.id == id)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.quantityTypeID, quantityTypeID) || other.quantityTypeID == quantityTypeID)&&(identical(other.name, name) || other.name == name)&&(identical(other.code, code) || other.code == code)&&(identical(other.fieldType, fieldType) || other.fieldType == fieldType)&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.validationRules, validationRules) || other.validationRules == validationRules)&&(identical(other.displayOrder, displayOrder) || other.displayOrder == displayOrder)&&(identical(other.isRequired, isRequired) || other.isRequired == isRequired)&&(identical(other.isForSegment, isForSegment) || other.isForSegment == isForSegment)&&(identical(other.defaultValue, defaultValue) || other.defaultValue == defaultValue)&&(identical(other.placeholder, placeholder) || other.placeholder == placeholder)&&(identical(other.helpText, helpText) || other.helpText == helpText)&&const DeepCollectionEquality().equals(other._dropdownOptions, _dropdownOptions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,uid,quantityTypeID,name,code,fieldType,unit,validationRules,displayOrder,isRequired,isForSegment,defaultValue,placeholder,helpText,const DeepCollectionEquality().hash(_dropdownOptions));

@override
String toString() {
  return 'ApiFieldModel(id: $id, uid: $uid, quantityTypeID: $quantityTypeID, name: $name, code: $code, fieldType: $fieldType, unit: $unit, validationRules: $validationRules, displayOrder: $displayOrder, isRequired: $isRequired, isForSegment: $isForSegment, defaultValue: $defaultValue, placeholder: $placeholder, helpText: $helpText, dropdownOptions: $dropdownOptions)';
}


}

/// @nodoc
abstract mixin class _$ApiFieldModelCopyWith<$Res> implements $ApiFieldModelCopyWith<$Res> {
  factory _$ApiFieldModelCopyWith(_ApiFieldModel value, $Res Function(_ApiFieldModel) _then) = __$ApiFieldModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String uid, int quantityTypeID, String name, String code, String fieldType, String? unit, String? validationRules, int displayOrder, bool isRequired, bool isForSegment, String? defaultValue, String? placeholder, String? helpText, List<ApiDropdownOption>? dropdownOptions
});




}
/// @nodoc
class __$ApiFieldModelCopyWithImpl<$Res>
    implements _$ApiFieldModelCopyWith<$Res> {
  __$ApiFieldModelCopyWithImpl(this._self, this._then);

  final _ApiFieldModel _self;
  final $Res Function(_ApiFieldModel) _then;

/// Create a copy of ApiFieldModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? uid = null,Object? quantityTypeID = null,Object? name = null,Object? code = null,Object? fieldType = null,Object? unit = freezed,Object? validationRules = freezed,Object? displayOrder = null,Object? isRequired = null,Object? isForSegment = null,Object? defaultValue = freezed,Object? placeholder = freezed,Object? helpText = freezed,Object? dropdownOptions = freezed,}) {
  return _then(_ApiFieldModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,quantityTypeID: null == quantityTypeID ? _self.quantityTypeID : quantityTypeID // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
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
as String?,dropdownOptions: freezed == dropdownOptions ? _self._dropdownOptions : dropdownOptions // ignore: cast_nullable_to_non_nullable
as List<ApiDropdownOption>?,
  ));
}


}


/// @nodoc
mixin _$ApiDropdownOption {

 int get id; String get uid; int get fieldID; String get value; int get displayOrder; bool get isActive; DateTime get createdAt; DateTime get updatedAt;
/// Create a copy of ApiDropdownOption
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ApiDropdownOptionCopyWith<ApiDropdownOption> get copyWith => _$ApiDropdownOptionCopyWithImpl<ApiDropdownOption>(this as ApiDropdownOption, _$identity);

  /// Serializes this ApiDropdownOption to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ApiDropdownOption&&(identical(other.id, id) || other.id == id)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.fieldID, fieldID) || other.fieldID == fieldID)&&(identical(other.value, value) || other.value == value)&&(identical(other.displayOrder, displayOrder) || other.displayOrder == displayOrder)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,uid,fieldID,value,displayOrder,isActive,createdAt,updatedAt);

@override
String toString() {
  return 'ApiDropdownOption(id: $id, uid: $uid, fieldID: $fieldID, value: $value, displayOrder: $displayOrder, isActive: $isActive, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $ApiDropdownOptionCopyWith<$Res>  {
  factory $ApiDropdownOptionCopyWith(ApiDropdownOption value, $Res Function(ApiDropdownOption) _then) = _$ApiDropdownOptionCopyWithImpl;
@useResult
$Res call({
 int id, String uid, int fieldID, String value, int displayOrder, bool isActive, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class _$ApiDropdownOptionCopyWithImpl<$Res>
    implements $ApiDropdownOptionCopyWith<$Res> {
  _$ApiDropdownOptionCopyWithImpl(this._self, this._then);

  final ApiDropdownOption _self;
  final $Res Function(ApiDropdownOption) _then;

/// Create a copy of ApiDropdownOption
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? uid = null,Object? fieldID = null,Object? value = null,Object? displayOrder = null,Object? isActive = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,fieldID: null == fieldID ? _self.fieldID : fieldID // ignore: cast_nullable_to_non_nullable
as int,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,displayOrder: null == displayOrder ? _self.displayOrder : displayOrder // ignore: cast_nullable_to_non_nullable
as int,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [ApiDropdownOption].
extension ApiDropdownOptionPatterns on ApiDropdownOption {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ApiDropdownOption value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ApiDropdownOption() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ApiDropdownOption value)  $default,){
final _that = this;
switch (_that) {
case _ApiDropdownOption():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ApiDropdownOption value)?  $default,){
final _that = this;
switch (_that) {
case _ApiDropdownOption() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String uid,  int fieldID,  String value,  int displayOrder,  bool isActive,  DateTime createdAt,  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ApiDropdownOption() when $default != null:
return $default(_that.id,_that.uid,_that.fieldID,_that.value,_that.displayOrder,_that.isActive,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String uid,  int fieldID,  String value,  int displayOrder,  bool isActive,  DateTime createdAt,  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _ApiDropdownOption():
return $default(_that.id,_that.uid,_that.fieldID,_that.value,_that.displayOrder,_that.isActive,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String uid,  int fieldID,  String value,  int displayOrder,  bool isActive,  DateTime createdAt,  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _ApiDropdownOption() when $default != null:
return $default(_that.id,_that.uid,_that.fieldID,_that.value,_that.displayOrder,_that.isActive,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ApiDropdownOption implements ApiDropdownOption {
  const _ApiDropdownOption({required this.id, required this.uid, required this.fieldID, required this.value, required this.displayOrder, required this.isActive, required this.createdAt, required this.updatedAt});
  factory _ApiDropdownOption.fromJson(Map<String, dynamic> json) => _$ApiDropdownOptionFromJson(json);

@override final  int id;
@override final  String uid;
@override final  int fieldID;
@override final  String value;
@override final  int displayOrder;
@override final  bool isActive;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;

/// Create a copy of ApiDropdownOption
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ApiDropdownOptionCopyWith<_ApiDropdownOption> get copyWith => __$ApiDropdownOptionCopyWithImpl<_ApiDropdownOption>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ApiDropdownOptionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ApiDropdownOption&&(identical(other.id, id) || other.id == id)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.fieldID, fieldID) || other.fieldID == fieldID)&&(identical(other.value, value) || other.value == value)&&(identical(other.displayOrder, displayOrder) || other.displayOrder == displayOrder)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,uid,fieldID,value,displayOrder,isActive,createdAt,updatedAt);

@override
String toString() {
  return 'ApiDropdownOption(id: $id, uid: $uid, fieldID: $fieldID, value: $value, displayOrder: $displayOrder, isActive: $isActive, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$ApiDropdownOptionCopyWith<$Res> implements $ApiDropdownOptionCopyWith<$Res> {
  factory _$ApiDropdownOptionCopyWith(_ApiDropdownOption value, $Res Function(_ApiDropdownOption) _then) = __$ApiDropdownOptionCopyWithImpl;
@override @useResult
$Res call({
 int id, String uid, int fieldID, String value, int displayOrder, bool isActive, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class __$ApiDropdownOptionCopyWithImpl<$Res>
    implements _$ApiDropdownOptionCopyWith<$Res> {
  __$ApiDropdownOptionCopyWithImpl(this._self, this._then);

  final _ApiDropdownOption _self;
  final $Res Function(_ApiDropdownOption) _then;

/// Create a copy of ApiDropdownOption
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? uid = null,Object? fieldID = null,Object? value = null,Object? displayOrder = null,Object? isActive = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_ApiDropdownOption(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,fieldID: null == fieldID ? _self.fieldID : fieldID // ignore: cast_nullable_to_non_nullable
as int,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,displayOrder: null == displayOrder ? _self.displayOrder : displayOrder // ignore: cast_nullable_to_non_nullable
as int,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
