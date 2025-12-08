// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'package_work_scope_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FlatWorkScopeModel {

 int get id; String get uid; String get name; String get code; String get description; bool get allowMultipleQuantities;
/// Create a copy of FlatWorkScopeModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FlatWorkScopeModelCopyWith<FlatWorkScopeModel> get copyWith => _$FlatWorkScopeModelCopyWithImpl<FlatWorkScopeModel>(this as FlatWorkScopeModel, _$identity);

  /// Serializes this FlatWorkScopeModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FlatWorkScopeModel&&(identical(other.id, id) || other.id == id)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.name, name) || other.name == name)&&(identical(other.code, code) || other.code == code)&&(identical(other.description, description) || other.description == description)&&(identical(other.allowMultipleQuantities, allowMultipleQuantities) || other.allowMultipleQuantities == allowMultipleQuantities));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,uid,name,code,description,allowMultipleQuantities);

@override
String toString() {
  return 'FlatWorkScopeModel(id: $id, uid: $uid, name: $name, code: $code, description: $description, allowMultipleQuantities: $allowMultipleQuantities)';
}


}

/// @nodoc
abstract mixin class $FlatWorkScopeModelCopyWith<$Res>  {
  factory $FlatWorkScopeModelCopyWith(FlatWorkScopeModel value, $Res Function(FlatWorkScopeModel) _then) = _$FlatWorkScopeModelCopyWithImpl;
@useResult
$Res call({
 int id, String uid, String name, String code, String description, bool allowMultipleQuantities
});




}
/// @nodoc
class _$FlatWorkScopeModelCopyWithImpl<$Res>
    implements $FlatWorkScopeModelCopyWith<$Res> {
  _$FlatWorkScopeModelCopyWithImpl(this._self, this._then);

  final FlatWorkScopeModel _self;
  final $Res Function(FlatWorkScopeModel) _then;

/// Create a copy of FlatWorkScopeModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? uid = null,Object? name = null,Object? code = null,Object? description = null,Object? allowMultipleQuantities = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,allowMultipleQuantities: null == allowMultipleQuantities ? _self.allowMultipleQuantities : allowMultipleQuantities // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [FlatWorkScopeModel].
extension FlatWorkScopeModelPatterns on FlatWorkScopeModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FlatWorkScopeModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FlatWorkScopeModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FlatWorkScopeModel value)  $default,){
final _that = this;
switch (_that) {
case _FlatWorkScopeModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FlatWorkScopeModel value)?  $default,){
final _that = this;
switch (_that) {
case _FlatWorkScopeModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String uid,  String name,  String code,  String description,  bool allowMultipleQuantities)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FlatWorkScopeModel() when $default != null:
return $default(_that.id,_that.uid,_that.name,_that.code,_that.description,_that.allowMultipleQuantities);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String uid,  String name,  String code,  String description,  bool allowMultipleQuantities)  $default,) {final _that = this;
switch (_that) {
case _FlatWorkScopeModel():
return $default(_that.id,_that.uid,_that.name,_that.code,_that.description,_that.allowMultipleQuantities);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String uid,  String name,  String code,  String description,  bool allowMultipleQuantities)?  $default,) {final _that = this;
switch (_that) {
case _FlatWorkScopeModel() when $default != null:
return $default(_that.id,_that.uid,_that.name,_that.code,_that.description,_that.allowMultipleQuantities);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FlatWorkScopeModel implements FlatWorkScopeModel {
  const _FlatWorkScopeModel({required this.id, required this.uid, required this.name, required this.code, required this.description, required this.allowMultipleQuantities});
  factory _FlatWorkScopeModel.fromJson(Map<String, dynamic> json) => _$FlatWorkScopeModelFromJson(json);

@override final  int id;
@override final  String uid;
@override final  String name;
@override final  String code;
@override final  String description;
@override final  bool allowMultipleQuantities;

/// Create a copy of FlatWorkScopeModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FlatWorkScopeModelCopyWith<_FlatWorkScopeModel> get copyWith => __$FlatWorkScopeModelCopyWithImpl<_FlatWorkScopeModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FlatWorkScopeModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FlatWorkScopeModel&&(identical(other.id, id) || other.id == id)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.name, name) || other.name == name)&&(identical(other.code, code) || other.code == code)&&(identical(other.description, description) || other.description == description)&&(identical(other.allowMultipleQuantities, allowMultipleQuantities) || other.allowMultipleQuantities == allowMultipleQuantities));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,uid,name,code,description,allowMultipleQuantities);

@override
String toString() {
  return 'FlatWorkScopeModel(id: $id, uid: $uid, name: $name, code: $code, description: $description, allowMultipleQuantities: $allowMultipleQuantities)';
}


}

/// @nodoc
abstract mixin class _$FlatWorkScopeModelCopyWith<$Res> implements $FlatWorkScopeModelCopyWith<$Res> {
  factory _$FlatWorkScopeModelCopyWith(_FlatWorkScopeModel value, $Res Function(_FlatWorkScopeModel) _then) = __$FlatWorkScopeModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String uid, String name, String code, String description, bool allowMultipleQuantities
});




}
/// @nodoc
class __$FlatWorkScopeModelCopyWithImpl<$Res>
    implements _$FlatWorkScopeModelCopyWith<$Res> {
  __$FlatWorkScopeModelCopyWithImpl(this._self, this._then);

  final _FlatWorkScopeModel _self;
  final $Res Function(_FlatWorkScopeModel) _then;

/// Create a copy of FlatWorkScopeModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? uid = null,Object? name = null,Object? code = null,Object? description = null,Object? allowMultipleQuantities = null,}) {
  return _then(_FlatWorkScopeModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,allowMultipleQuantities: null == allowMultipleQuantities ? _self.allowMultipleQuantities : allowMultipleQuantities // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$FlatWorkQuantityTypeModel {

 int get id; String get uid; String get name; String get code; String? get description; String get workScopeUID; int get displayOrder; bool get hasSegmentBreakdown; int? get segmentSize; int? get maxSegmentLength;
/// Create a copy of FlatWorkQuantityTypeModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FlatWorkQuantityTypeModelCopyWith<FlatWorkQuantityTypeModel> get copyWith => _$FlatWorkQuantityTypeModelCopyWithImpl<FlatWorkQuantityTypeModel>(this as FlatWorkQuantityTypeModel, _$identity);

  /// Serializes this FlatWorkQuantityTypeModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FlatWorkQuantityTypeModel&&(identical(other.id, id) || other.id == id)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.name, name) || other.name == name)&&(identical(other.code, code) || other.code == code)&&(identical(other.description, description) || other.description == description)&&(identical(other.workScopeUID, workScopeUID) || other.workScopeUID == workScopeUID)&&(identical(other.displayOrder, displayOrder) || other.displayOrder == displayOrder)&&(identical(other.hasSegmentBreakdown, hasSegmentBreakdown) || other.hasSegmentBreakdown == hasSegmentBreakdown)&&(identical(other.segmentSize, segmentSize) || other.segmentSize == segmentSize)&&(identical(other.maxSegmentLength, maxSegmentLength) || other.maxSegmentLength == maxSegmentLength));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,uid,name,code,description,workScopeUID,displayOrder,hasSegmentBreakdown,segmentSize,maxSegmentLength);

@override
String toString() {
  return 'FlatWorkQuantityTypeModel(id: $id, uid: $uid, name: $name, code: $code, description: $description, workScopeUID: $workScopeUID, displayOrder: $displayOrder, hasSegmentBreakdown: $hasSegmentBreakdown, segmentSize: $segmentSize, maxSegmentLength: $maxSegmentLength)';
}


}

/// @nodoc
abstract mixin class $FlatWorkQuantityTypeModelCopyWith<$Res>  {
  factory $FlatWorkQuantityTypeModelCopyWith(FlatWorkQuantityTypeModel value, $Res Function(FlatWorkQuantityTypeModel) _then) = _$FlatWorkQuantityTypeModelCopyWithImpl;
@useResult
$Res call({
 int id, String uid, String name, String code, String? description, String workScopeUID, int displayOrder, bool hasSegmentBreakdown, int? segmentSize, int? maxSegmentLength
});




}
/// @nodoc
class _$FlatWorkQuantityTypeModelCopyWithImpl<$Res>
    implements $FlatWorkQuantityTypeModelCopyWith<$Res> {
  _$FlatWorkQuantityTypeModelCopyWithImpl(this._self, this._then);

  final FlatWorkQuantityTypeModel _self;
  final $Res Function(FlatWorkQuantityTypeModel) _then;

/// Create a copy of FlatWorkQuantityTypeModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? uid = null,Object? name = null,Object? code = null,Object? description = freezed,Object? workScopeUID = null,Object? displayOrder = null,Object? hasSegmentBreakdown = null,Object? segmentSize = freezed,Object? maxSegmentLength = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,workScopeUID: null == workScopeUID ? _self.workScopeUID : workScopeUID // ignore: cast_nullable_to_non_nullable
as String,displayOrder: null == displayOrder ? _self.displayOrder : displayOrder // ignore: cast_nullable_to_non_nullable
as int,hasSegmentBreakdown: null == hasSegmentBreakdown ? _self.hasSegmentBreakdown : hasSegmentBreakdown // ignore: cast_nullable_to_non_nullable
as bool,segmentSize: freezed == segmentSize ? _self.segmentSize : segmentSize // ignore: cast_nullable_to_non_nullable
as int?,maxSegmentLength: freezed == maxSegmentLength ? _self.maxSegmentLength : maxSegmentLength // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [FlatWorkQuantityTypeModel].
extension FlatWorkQuantityTypeModelPatterns on FlatWorkQuantityTypeModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FlatWorkQuantityTypeModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FlatWorkQuantityTypeModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FlatWorkQuantityTypeModel value)  $default,){
final _that = this;
switch (_that) {
case _FlatWorkQuantityTypeModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FlatWorkQuantityTypeModel value)?  $default,){
final _that = this;
switch (_that) {
case _FlatWorkQuantityTypeModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String uid,  String name,  String code,  String? description,  String workScopeUID,  int displayOrder,  bool hasSegmentBreakdown,  int? segmentSize,  int? maxSegmentLength)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FlatWorkQuantityTypeModel() when $default != null:
return $default(_that.id,_that.uid,_that.name,_that.code,_that.description,_that.workScopeUID,_that.displayOrder,_that.hasSegmentBreakdown,_that.segmentSize,_that.maxSegmentLength);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String uid,  String name,  String code,  String? description,  String workScopeUID,  int displayOrder,  bool hasSegmentBreakdown,  int? segmentSize,  int? maxSegmentLength)  $default,) {final _that = this;
switch (_that) {
case _FlatWorkQuantityTypeModel():
return $default(_that.id,_that.uid,_that.name,_that.code,_that.description,_that.workScopeUID,_that.displayOrder,_that.hasSegmentBreakdown,_that.segmentSize,_that.maxSegmentLength);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String uid,  String name,  String code,  String? description,  String workScopeUID,  int displayOrder,  bool hasSegmentBreakdown,  int? segmentSize,  int? maxSegmentLength)?  $default,) {final _that = this;
switch (_that) {
case _FlatWorkQuantityTypeModel() when $default != null:
return $default(_that.id,_that.uid,_that.name,_that.code,_that.description,_that.workScopeUID,_that.displayOrder,_that.hasSegmentBreakdown,_that.segmentSize,_that.maxSegmentLength);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FlatWorkQuantityTypeModel implements FlatWorkQuantityTypeModel {
  const _FlatWorkQuantityTypeModel({required this.id, required this.uid, required this.name, required this.code, this.description, required this.workScopeUID, required this.displayOrder, required this.hasSegmentBreakdown, this.segmentSize, this.maxSegmentLength});
  factory _FlatWorkQuantityTypeModel.fromJson(Map<String, dynamic> json) => _$FlatWorkQuantityTypeModelFromJson(json);

@override final  int id;
@override final  String uid;
@override final  String name;
@override final  String code;
@override final  String? description;
@override final  String workScopeUID;
@override final  int displayOrder;
@override final  bool hasSegmentBreakdown;
@override final  int? segmentSize;
@override final  int? maxSegmentLength;

/// Create a copy of FlatWorkQuantityTypeModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FlatWorkQuantityTypeModelCopyWith<_FlatWorkQuantityTypeModel> get copyWith => __$FlatWorkQuantityTypeModelCopyWithImpl<_FlatWorkQuantityTypeModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FlatWorkQuantityTypeModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FlatWorkQuantityTypeModel&&(identical(other.id, id) || other.id == id)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.name, name) || other.name == name)&&(identical(other.code, code) || other.code == code)&&(identical(other.description, description) || other.description == description)&&(identical(other.workScopeUID, workScopeUID) || other.workScopeUID == workScopeUID)&&(identical(other.displayOrder, displayOrder) || other.displayOrder == displayOrder)&&(identical(other.hasSegmentBreakdown, hasSegmentBreakdown) || other.hasSegmentBreakdown == hasSegmentBreakdown)&&(identical(other.segmentSize, segmentSize) || other.segmentSize == segmentSize)&&(identical(other.maxSegmentLength, maxSegmentLength) || other.maxSegmentLength == maxSegmentLength));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,uid,name,code,description,workScopeUID,displayOrder,hasSegmentBreakdown,segmentSize,maxSegmentLength);

@override
String toString() {
  return 'FlatWorkQuantityTypeModel(id: $id, uid: $uid, name: $name, code: $code, description: $description, workScopeUID: $workScopeUID, displayOrder: $displayOrder, hasSegmentBreakdown: $hasSegmentBreakdown, segmentSize: $segmentSize, maxSegmentLength: $maxSegmentLength)';
}


}

/// @nodoc
abstract mixin class _$FlatWorkQuantityTypeModelCopyWith<$Res> implements $FlatWorkQuantityTypeModelCopyWith<$Res> {
  factory _$FlatWorkQuantityTypeModelCopyWith(_FlatWorkQuantityTypeModel value, $Res Function(_FlatWorkQuantityTypeModel) _then) = __$FlatWorkQuantityTypeModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String uid, String name, String code, String? description, String workScopeUID, int displayOrder, bool hasSegmentBreakdown, int? segmentSize, int? maxSegmentLength
});




}
/// @nodoc
class __$FlatWorkQuantityTypeModelCopyWithImpl<$Res>
    implements _$FlatWorkQuantityTypeModelCopyWith<$Res> {
  __$FlatWorkQuantityTypeModelCopyWithImpl(this._self, this._then);

  final _FlatWorkQuantityTypeModel _self;
  final $Res Function(_FlatWorkQuantityTypeModel) _then;

/// Create a copy of FlatWorkQuantityTypeModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? uid = null,Object? name = null,Object? code = null,Object? description = freezed,Object? workScopeUID = null,Object? displayOrder = null,Object? hasSegmentBreakdown = null,Object? segmentSize = freezed,Object? maxSegmentLength = freezed,}) {
  return _then(_FlatWorkQuantityTypeModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,workScopeUID: null == workScopeUID ? _self.workScopeUID : workScopeUID // ignore: cast_nullable_to_non_nullable
as String,displayOrder: null == displayOrder ? _self.displayOrder : displayOrder // ignore: cast_nullable_to_non_nullable
as int,hasSegmentBreakdown: null == hasSegmentBreakdown ? _self.hasSegmentBreakdown : hasSegmentBreakdown // ignore: cast_nullable_to_non_nullable
as bool,segmentSize: freezed == segmentSize ? _self.segmentSize : segmentSize // ignore: cast_nullable_to_non_nullable
as int?,maxSegmentLength: freezed == maxSegmentLength ? _self.maxSegmentLength : maxSegmentLength // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$FlatQuantityFieldModel {

 int get id; String get uid; String get name; String get code; String get fieldType; String? get unit; String? get validationRules; String get quantityTypeUID; int get displayOrder; bool get isRequired; bool get isForSegment; String? get defaultValue; String? get placeholder; String? get helpText;
/// Create a copy of FlatQuantityFieldModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FlatQuantityFieldModelCopyWith<FlatQuantityFieldModel> get copyWith => _$FlatQuantityFieldModelCopyWithImpl<FlatQuantityFieldModel>(this as FlatQuantityFieldModel, _$identity);

  /// Serializes this FlatQuantityFieldModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FlatQuantityFieldModel&&(identical(other.id, id) || other.id == id)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.name, name) || other.name == name)&&(identical(other.code, code) || other.code == code)&&(identical(other.fieldType, fieldType) || other.fieldType == fieldType)&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.validationRules, validationRules) || other.validationRules == validationRules)&&(identical(other.quantityTypeUID, quantityTypeUID) || other.quantityTypeUID == quantityTypeUID)&&(identical(other.displayOrder, displayOrder) || other.displayOrder == displayOrder)&&(identical(other.isRequired, isRequired) || other.isRequired == isRequired)&&(identical(other.isForSegment, isForSegment) || other.isForSegment == isForSegment)&&(identical(other.defaultValue, defaultValue) || other.defaultValue == defaultValue)&&(identical(other.placeholder, placeholder) || other.placeholder == placeholder)&&(identical(other.helpText, helpText) || other.helpText == helpText));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,uid,name,code,fieldType,unit,validationRules,quantityTypeUID,displayOrder,isRequired,isForSegment,defaultValue,placeholder,helpText);

@override
String toString() {
  return 'FlatQuantityFieldModel(id: $id, uid: $uid, name: $name, code: $code, fieldType: $fieldType, unit: $unit, validationRules: $validationRules, quantityTypeUID: $quantityTypeUID, displayOrder: $displayOrder, isRequired: $isRequired, isForSegment: $isForSegment, defaultValue: $defaultValue, placeholder: $placeholder, helpText: $helpText)';
}


}

/// @nodoc
abstract mixin class $FlatQuantityFieldModelCopyWith<$Res>  {
  factory $FlatQuantityFieldModelCopyWith(FlatQuantityFieldModel value, $Res Function(FlatQuantityFieldModel) _then) = _$FlatQuantityFieldModelCopyWithImpl;
@useResult
$Res call({
 int id, String uid, String name, String code, String fieldType, String? unit, String? validationRules, String quantityTypeUID, int displayOrder, bool isRequired, bool isForSegment, String? defaultValue, String? placeholder, String? helpText
});




}
/// @nodoc
class _$FlatQuantityFieldModelCopyWithImpl<$Res>
    implements $FlatQuantityFieldModelCopyWith<$Res> {
  _$FlatQuantityFieldModelCopyWithImpl(this._self, this._then);

  final FlatQuantityFieldModel _self;
  final $Res Function(FlatQuantityFieldModel) _then;

/// Create a copy of FlatQuantityFieldModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? uid = null,Object? name = null,Object? code = null,Object? fieldType = null,Object? unit = freezed,Object? validationRules = freezed,Object? quantityTypeUID = null,Object? displayOrder = null,Object? isRequired = null,Object? isForSegment = null,Object? defaultValue = freezed,Object? placeholder = freezed,Object? helpText = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,fieldType: null == fieldType ? _self.fieldType : fieldType // ignore: cast_nullable_to_non_nullable
as String,unit: freezed == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as String?,validationRules: freezed == validationRules ? _self.validationRules : validationRules // ignore: cast_nullable_to_non_nullable
as String?,quantityTypeUID: null == quantityTypeUID ? _self.quantityTypeUID : quantityTypeUID // ignore: cast_nullable_to_non_nullable
as String,displayOrder: null == displayOrder ? _self.displayOrder : displayOrder // ignore: cast_nullable_to_non_nullable
as int,isRequired: null == isRequired ? _self.isRequired : isRequired // ignore: cast_nullable_to_non_nullable
as bool,isForSegment: null == isForSegment ? _self.isForSegment : isForSegment // ignore: cast_nullable_to_non_nullable
as bool,defaultValue: freezed == defaultValue ? _self.defaultValue : defaultValue // ignore: cast_nullable_to_non_nullable
as String?,placeholder: freezed == placeholder ? _self.placeholder : placeholder // ignore: cast_nullable_to_non_nullable
as String?,helpText: freezed == helpText ? _self.helpText : helpText // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [FlatQuantityFieldModel].
extension FlatQuantityFieldModelPatterns on FlatQuantityFieldModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FlatQuantityFieldModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FlatQuantityFieldModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FlatQuantityFieldModel value)  $default,){
final _that = this;
switch (_that) {
case _FlatQuantityFieldModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FlatQuantityFieldModel value)?  $default,){
final _that = this;
switch (_that) {
case _FlatQuantityFieldModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String uid,  String name,  String code,  String fieldType,  String? unit,  String? validationRules,  String quantityTypeUID,  int displayOrder,  bool isRequired,  bool isForSegment,  String? defaultValue,  String? placeholder,  String? helpText)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FlatQuantityFieldModel() when $default != null:
return $default(_that.id,_that.uid,_that.name,_that.code,_that.fieldType,_that.unit,_that.validationRules,_that.quantityTypeUID,_that.displayOrder,_that.isRequired,_that.isForSegment,_that.defaultValue,_that.placeholder,_that.helpText);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String uid,  String name,  String code,  String fieldType,  String? unit,  String? validationRules,  String quantityTypeUID,  int displayOrder,  bool isRequired,  bool isForSegment,  String? defaultValue,  String? placeholder,  String? helpText)  $default,) {final _that = this;
switch (_that) {
case _FlatQuantityFieldModel():
return $default(_that.id,_that.uid,_that.name,_that.code,_that.fieldType,_that.unit,_that.validationRules,_that.quantityTypeUID,_that.displayOrder,_that.isRequired,_that.isForSegment,_that.defaultValue,_that.placeholder,_that.helpText);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String uid,  String name,  String code,  String fieldType,  String? unit,  String? validationRules,  String quantityTypeUID,  int displayOrder,  bool isRequired,  bool isForSegment,  String? defaultValue,  String? placeholder,  String? helpText)?  $default,) {final _that = this;
switch (_that) {
case _FlatQuantityFieldModel() when $default != null:
return $default(_that.id,_that.uid,_that.name,_that.code,_that.fieldType,_that.unit,_that.validationRules,_that.quantityTypeUID,_that.displayOrder,_that.isRequired,_that.isForSegment,_that.defaultValue,_that.placeholder,_that.helpText);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FlatQuantityFieldModel implements FlatQuantityFieldModel {
  const _FlatQuantityFieldModel({required this.id, required this.uid, required this.name, required this.code, required this.fieldType, this.unit, this.validationRules, required this.quantityTypeUID, required this.displayOrder, required this.isRequired, required this.isForSegment, this.defaultValue, this.placeholder, this.helpText});
  factory _FlatQuantityFieldModel.fromJson(Map<String, dynamic> json) => _$FlatQuantityFieldModelFromJson(json);

@override final  int id;
@override final  String uid;
@override final  String name;
@override final  String code;
@override final  String fieldType;
@override final  String? unit;
@override final  String? validationRules;
@override final  String quantityTypeUID;
@override final  int displayOrder;
@override final  bool isRequired;
@override final  bool isForSegment;
@override final  String? defaultValue;
@override final  String? placeholder;
@override final  String? helpText;

/// Create a copy of FlatQuantityFieldModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FlatQuantityFieldModelCopyWith<_FlatQuantityFieldModel> get copyWith => __$FlatQuantityFieldModelCopyWithImpl<_FlatQuantityFieldModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FlatQuantityFieldModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FlatQuantityFieldModel&&(identical(other.id, id) || other.id == id)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.name, name) || other.name == name)&&(identical(other.code, code) || other.code == code)&&(identical(other.fieldType, fieldType) || other.fieldType == fieldType)&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.validationRules, validationRules) || other.validationRules == validationRules)&&(identical(other.quantityTypeUID, quantityTypeUID) || other.quantityTypeUID == quantityTypeUID)&&(identical(other.displayOrder, displayOrder) || other.displayOrder == displayOrder)&&(identical(other.isRequired, isRequired) || other.isRequired == isRequired)&&(identical(other.isForSegment, isForSegment) || other.isForSegment == isForSegment)&&(identical(other.defaultValue, defaultValue) || other.defaultValue == defaultValue)&&(identical(other.placeholder, placeholder) || other.placeholder == placeholder)&&(identical(other.helpText, helpText) || other.helpText == helpText));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,uid,name,code,fieldType,unit,validationRules,quantityTypeUID,displayOrder,isRequired,isForSegment,defaultValue,placeholder,helpText);

@override
String toString() {
  return 'FlatQuantityFieldModel(id: $id, uid: $uid, name: $name, code: $code, fieldType: $fieldType, unit: $unit, validationRules: $validationRules, quantityTypeUID: $quantityTypeUID, displayOrder: $displayOrder, isRequired: $isRequired, isForSegment: $isForSegment, defaultValue: $defaultValue, placeholder: $placeholder, helpText: $helpText)';
}


}

/// @nodoc
abstract mixin class _$FlatQuantityFieldModelCopyWith<$Res> implements $FlatQuantityFieldModelCopyWith<$Res> {
  factory _$FlatQuantityFieldModelCopyWith(_FlatQuantityFieldModel value, $Res Function(_FlatQuantityFieldModel) _then) = __$FlatQuantityFieldModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String uid, String name, String code, String fieldType, String? unit, String? validationRules, String quantityTypeUID, int displayOrder, bool isRequired, bool isForSegment, String? defaultValue, String? placeholder, String? helpText
});




}
/// @nodoc
class __$FlatQuantityFieldModelCopyWithImpl<$Res>
    implements _$FlatQuantityFieldModelCopyWith<$Res> {
  __$FlatQuantityFieldModelCopyWithImpl(this._self, this._then);

  final _FlatQuantityFieldModel _self;
  final $Res Function(_FlatQuantityFieldModel) _then;

/// Create a copy of FlatQuantityFieldModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? uid = null,Object? name = null,Object? code = null,Object? fieldType = null,Object? unit = freezed,Object? validationRules = freezed,Object? quantityTypeUID = null,Object? displayOrder = null,Object? isRequired = null,Object? isForSegment = null,Object? defaultValue = freezed,Object? placeholder = freezed,Object? helpText = freezed,}) {
  return _then(_FlatQuantityFieldModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,fieldType: null == fieldType ? _self.fieldType : fieldType // ignore: cast_nullable_to_non_nullable
as String,unit: freezed == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as String?,validationRules: freezed == validationRules ? _self.validationRules : validationRules // ignore: cast_nullable_to_non_nullable
as String?,quantityTypeUID: null == quantityTypeUID ? _self.quantityTypeUID : quantityTypeUID // ignore: cast_nullable_to_non_nullable
as String,displayOrder: null == displayOrder ? _self.displayOrder : displayOrder // ignore: cast_nullable_to_non_nullable
as int,isRequired: null == isRequired ? _self.isRequired : isRequired // ignore: cast_nullable_to_non_nullable
as bool,isForSegment: null == isForSegment ? _self.isForSegment : isForSegment // ignore: cast_nullable_to_non_nullable
as bool,defaultValue: freezed == defaultValue ? _self.defaultValue : defaultValue // ignore: cast_nullable_to_non_nullable
as String?,placeholder: freezed == placeholder ? _self.placeholder : placeholder // ignore: cast_nullable_to_non_nullable
as String?,helpText: freezed == helpText ? _self.helpText : helpText // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$FlatFieldOptionModel {

 int get id; String get uid; String get value; String get quantityFieldUID; int get displayOrder;
/// Create a copy of FlatFieldOptionModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FlatFieldOptionModelCopyWith<FlatFieldOptionModel> get copyWith => _$FlatFieldOptionModelCopyWithImpl<FlatFieldOptionModel>(this as FlatFieldOptionModel, _$identity);

  /// Serializes this FlatFieldOptionModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FlatFieldOptionModel&&(identical(other.id, id) || other.id == id)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.value, value) || other.value == value)&&(identical(other.quantityFieldUID, quantityFieldUID) || other.quantityFieldUID == quantityFieldUID)&&(identical(other.displayOrder, displayOrder) || other.displayOrder == displayOrder));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,uid,value,quantityFieldUID,displayOrder);

@override
String toString() {
  return 'FlatFieldOptionModel(id: $id, uid: $uid, value: $value, quantityFieldUID: $quantityFieldUID, displayOrder: $displayOrder)';
}


}

/// @nodoc
abstract mixin class $FlatFieldOptionModelCopyWith<$Res>  {
  factory $FlatFieldOptionModelCopyWith(FlatFieldOptionModel value, $Res Function(FlatFieldOptionModel) _then) = _$FlatFieldOptionModelCopyWithImpl;
@useResult
$Res call({
 int id, String uid, String value, String quantityFieldUID, int displayOrder
});




}
/// @nodoc
class _$FlatFieldOptionModelCopyWithImpl<$Res>
    implements $FlatFieldOptionModelCopyWith<$Res> {
  _$FlatFieldOptionModelCopyWithImpl(this._self, this._then);

  final FlatFieldOptionModel _self;
  final $Res Function(FlatFieldOptionModel) _then;

/// Create a copy of FlatFieldOptionModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? uid = null,Object? value = null,Object? quantityFieldUID = null,Object? displayOrder = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,quantityFieldUID: null == quantityFieldUID ? _self.quantityFieldUID : quantityFieldUID // ignore: cast_nullable_to_non_nullable
as String,displayOrder: null == displayOrder ? _self.displayOrder : displayOrder // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [FlatFieldOptionModel].
extension FlatFieldOptionModelPatterns on FlatFieldOptionModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FlatFieldOptionModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FlatFieldOptionModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FlatFieldOptionModel value)  $default,){
final _that = this;
switch (_that) {
case _FlatFieldOptionModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FlatFieldOptionModel value)?  $default,){
final _that = this;
switch (_that) {
case _FlatFieldOptionModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String uid,  String value,  String quantityFieldUID,  int displayOrder)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FlatFieldOptionModel() when $default != null:
return $default(_that.id,_that.uid,_that.value,_that.quantityFieldUID,_that.displayOrder);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String uid,  String value,  String quantityFieldUID,  int displayOrder)  $default,) {final _that = this;
switch (_that) {
case _FlatFieldOptionModel():
return $default(_that.id,_that.uid,_that.value,_that.quantityFieldUID,_that.displayOrder);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String uid,  String value,  String quantityFieldUID,  int displayOrder)?  $default,) {final _that = this;
switch (_that) {
case _FlatFieldOptionModel() when $default != null:
return $default(_that.id,_that.uid,_that.value,_that.quantityFieldUID,_that.displayOrder);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FlatFieldOptionModel implements FlatFieldOptionModel {
  const _FlatFieldOptionModel({required this.id, required this.uid, required this.value, required this.quantityFieldUID, required this.displayOrder});
  factory _FlatFieldOptionModel.fromJson(Map<String, dynamic> json) => _$FlatFieldOptionModelFromJson(json);

@override final  int id;
@override final  String uid;
@override final  String value;
@override final  String quantityFieldUID;
@override final  int displayOrder;

/// Create a copy of FlatFieldOptionModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FlatFieldOptionModelCopyWith<_FlatFieldOptionModel> get copyWith => __$FlatFieldOptionModelCopyWithImpl<_FlatFieldOptionModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FlatFieldOptionModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FlatFieldOptionModel&&(identical(other.id, id) || other.id == id)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.value, value) || other.value == value)&&(identical(other.quantityFieldUID, quantityFieldUID) || other.quantityFieldUID == quantityFieldUID)&&(identical(other.displayOrder, displayOrder) || other.displayOrder == displayOrder));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,uid,value,quantityFieldUID,displayOrder);

@override
String toString() {
  return 'FlatFieldOptionModel(id: $id, uid: $uid, value: $value, quantityFieldUID: $quantityFieldUID, displayOrder: $displayOrder)';
}


}

/// @nodoc
abstract mixin class _$FlatFieldOptionModelCopyWith<$Res> implements $FlatFieldOptionModelCopyWith<$Res> {
  factory _$FlatFieldOptionModelCopyWith(_FlatFieldOptionModel value, $Res Function(_FlatFieldOptionModel) _then) = __$FlatFieldOptionModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String uid, String value, String quantityFieldUID, int displayOrder
});




}
/// @nodoc
class __$FlatFieldOptionModelCopyWithImpl<$Res>
    implements _$FlatFieldOptionModelCopyWith<$Res> {
  __$FlatFieldOptionModelCopyWithImpl(this._self, this._then);

  final _FlatFieldOptionModel _self;
  final $Res Function(_FlatFieldOptionModel) _then;

/// Create a copy of FlatFieldOptionModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? uid = null,Object? value = null,Object? quantityFieldUID = null,Object? displayOrder = null,}) {
  return _then(_FlatFieldOptionModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,quantityFieldUID: null == quantityFieldUID ? _self.quantityFieldUID : quantityFieldUID // ignore: cast_nullable_to_non_nullable
as String,displayOrder: null == displayOrder ? _self.displayOrder : displayOrder // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$WorkScopeEquipmentJunctionModel {

 String get workScopeUID; String get workEquipmentUID;
/// Create a copy of WorkScopeEquipmentJunctionModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WorkScopeEquipmentJunctionModelCopyWith<WorkScopeEquipmentJunctionModel> get copyWith => _$WorkScopeEquipmentJunctionModelCopyWithImpl<WorkScopeEquipmentJunctionModel>(this as WorkScopeEquipmentJunctionModel, _$identity);

  /// Serializes this WorkScopeEquipmentJunctionModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WorkScopeEquipmentJunctionModel&&(identical(other.workScopeUID, workScopeUID) || other.workScopeUID == workScopeUID)&&(identical(other.workEquipmentUID, workEquipmentUID) || other.workEquipmentUID == workEquipmentUID));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,workScopeUID,workEquipmentUID);

@override
String toString() {
  return 'WorkScopeEquipmentJunctionModel(workScopeUID: $workScopeUID, workEquipmentUID: $workEquipmentUID)';
}


}

/// @nodoc
abstract mixin class $WorkScopeEquipmentJunctionModelCopyWith<$Res>  {
  factory $WorkScopeEquipmentJunctionModelCopyWith(WorkScopeEquipmentJunctionModel value, $Res Function(WorkScopeEquipmentJunctionModel) _then) = _$WorkScopeEquipmentJunctionModelCopyWithImpl;
@useResult
$Res call({
 String workScopeUID, String workEquipmentUID
});




}
/// @nodoc
class _$WorkScopeEquipmentJunctionModelCopyWithImpl<$Res>
    implements $WorkScopeEquipmentJunctionModelCopyWith<$Res> {
  _$WorkScopeEquipmentJunctionModelCopyWithImpl(this._self, this._then);

  final WorkScopeEquipmentJunctionModel _self;
  final $Res Function(WorkScopeEquipmentJunctionModel) _then;

/// Create a copy of WorkScopeEquipmentJunctionModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? workScopeUID = null,Object? workEquipmentUID = null,}) {
  return _then(_self.copyWith(
workScopeUID: null == workScopeUID ? _self.workScopeUID : workScopeUID // ignore: cast_nullable_to_non_nullable
as String,workEquipmentUID: null == workEquipmentUID ? _self.workEquipmentUID : workEquipmentUID // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [WorkScopeEquipmentJunctionModel].
extension WorkScopeEquipmentJunctionModelPatterns on WorkScopeEquipmentJunctionModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WorkScopeEquipmentJunctionModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WorkScopeEquipmentJunctionModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WorkScopeEquipmentJunctionModel value)  $default,){
final _that = this;
switch (_that) {
case _WorkScopeEquipmentJunctionModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WorkScopeEquipmentJunctionModel value)?  $default,){
final _that = this;
switch (_that) {
case _WorkScopeEquipmentJunctionModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String workScopeUID,  String workEquipmentUID)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WorkScopeEquipmentJunctionModel() when $default != null:
return $default(_that.workScopeUID,_that.workEquipmentUID);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String workScopeUID,  String workEquipmentUID)  $default,) {final _that = this;
switch (_that) {
case _WorkScopeEquipmentJunctionModel():
return $default(_that.workScopeUID,_that.workEquipmentUID);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String workScopeUID,  String workEquipmentUID)?  $default,) {final _that = this;
switch (_that) {
case _WorkScopeEquipmentJunctionModel() when $default != null:
return $default(_that.workScopeUID,_that.workEquipmentUID);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WorkScopeEquipmentJunctionModel implements WorkScopeEquipmentJunctionModel {
  const _WorkScopeEquipmentJunctionModel({required this.workScopeUID, required this.workEquipmentUID});
  factory _WorkScopeEquipmentJunctionModel.fromJson(Map<String, dynamic> json) => _$WorkScopeEquipmentJunctionModelFromJson(json);

@override final  String workScopeUID;
@override final  String workEquipmentUID;

/// Create a copy of WorkScopeEquipmentJunctionModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WorkScopeEquipmentJunctionModelCopyWith<_WorkScopeEquipmentJunctionModel> get copyWith => __$WorkScopeEquipmentJunctionModelCopyWithImpl<_WorkScopeEquipmentJunctionModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WorkScopeEquipmentJunctionModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WorkScopeEquipmentJunctionModel&&(identical(other.workScopeUID, workScopeUID) || other.workScopeUID == workScopeUID)&&(identical(other.workEquipmentUID, workEquipmentUID) || other.workEquipmentUID == workEquipmentUID));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,workScopeUID,workEquipmentUID);

@override
String toString() {
  return 'WorkScopeEquipmentJunctionModel(workScopeUID: $workScopeUID, workEquipmentUID: $workEquipmentUID)';
}


}

/// @nodoc
abstract mixin class _$WorkScopeEquipmentJunctionModelCopyWith<$Res> implements $WorkScopeEquipmentJunctionModelCopyWith<$Res> {
  factory _$WorkScopeEquipmentJunctionModelCopyWith(_WorkScopeEquipmentJunctionModel value, $Res Function(_WorkScopeEquipmentJunctionModel) _then) = __$WorkScopeEquipmentJunctionModelCopyWithImpl;
@override @useResult
$Res call({
 String workScopeUID, String workEquipmentUID
});




}
/// @nodoc
class __$WorkScopeEquipmentJunctionModelCopyWithImpl<$Res>
    implements _$WorkScopeEquipmentJunctionModelCopyWith<$Res> {
  __$WorkScopeEquipmentJunctionModelCopyWithImpl(this._self, this._then);

  final _WorkScopeEquipmentJunctionModel _self;
  final $Res Function(_WorkScopeEquipmentJunctionModel) _then;

/// Create a copy of WorkScopeEquipmentJunctionModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? workScopeUID = null,Object? workEquipmentUID = null,}) {
  return _then(_WorkScopeEquipmentJunctionModel(
workScopeUID: null == workScopeUID ? _self.workScopeUID : workScopeUID // ignore: cast_nullable_to_non_nullable
as String,workEquipmentUID: null == workEquipmentUID ? _self.workEquipmentUID : workEquipmentUID // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$PackageWorkScopeJunctionModel {

 String get uid; String get workScopeUID;
/// Create a copy of PackageWorkScopeJunctionModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PackageWorkScopeJunctionModelCopyWith<PackageWorkScopeJunctionModel> get copyWith => _$PackageWorkScopeJunctionModelCopyWithImpl<PackageWorkScopeJunctionModel>(this as PackageWorkScopeJunctionModel, _$identity);

  /// Serializes this PackageWorkScopeJunctionModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PackageWorkScopeJunctionModel&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.workScopeUID, workScopeUID) || other.workScopeUID == workScopeUID));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,uid,workScopeUID);

@override
String toString() {
  return 'PackageWorkScopeJunctionModel(uid: $uid, workScopeUID: $workScopeUID)';
}


}

/// @nodoc
abstract mixin class $PackageWorkScopeJunctionModelCopyWith<$Res>  {
  factory $PackageWorkScopeJunctionModelCopyWith(PackageWorkScopeJunctionModel value, $Res Function(PackageWorkScopeJunctionModel) _then) = _$PackageWorkScopeJunctionModelCopyWithImpl;
@useResult
$Res call({
 String uid, String workScopeUID
});




}
/// @nodoc
class _$PackageWorkScopeJunctionModelCopyWithImpl<$Res>
    implements $PackageWorkScopeJunctionModelCopyWith<$Res> {
  _$PackageWorkScopeJunctionModelCopyWithImpl(this._self, this._then);

  final PackageWorkScopeJunctionModel _self;
  final $Res Function(PackageWorkScopeJunctionModel) _then;

/// Create a copy of PackageWorkScopeJunctionModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? uid = null,Object? workScopeUID = null,}) {
  return _then(_self.copyWith(
uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,workScopeUID: null == workScopeUID ? _self.workScopeUID : workScopeUID // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [PackageWorkScopeJunctionModel].
extension PackageWorkScopeJunctionModelPatterns on PackageWorkScopeJunctionModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PackageWorkScopeJunctionModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PackageWorkScopeJunctionModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PackageWorkScopeJunctionModel value)  $default,){
final _that = this;
switch (_that) {
case _PackageWorkScopeJunctionModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PackageWorkScopeJunctionModel value)?  $default,){
final _that = this;
switch (_that) {
case _PackageWorkScopeJunctionModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String uid,  String workScopeUID)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PackageWorkScopeJunctionModel() when $default != null:
return $default(_that.uid,_that.workScopeUID);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String uid,  String workScopeUID)  $default,) {final _that = this;
switch (_that) {
case _PackageWorkScopeJunctionModel():
return $default(_that.uid,_that.workScopeUID);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String uid,  String workScopeUID)?  $default,) {final _that = this;
switch (_that) {
case _PackageWorkScopeJunctionModel() when $default != null:
return $default(_that.uid,_that.workScopeUID);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PackageWorkScopeJunctionModel implements PackageWorkScopeJunctionModel {
  const _PackageWorkScopeJunctionModel({required this.uid, required this.workScopeUID});
  factory _PackageWorkScopeJunctionModel.fromJson(Map<String, dynamic> json) => _$PackageWorkScopeJunctionModelFromJson(json);

@override final  String uid;
@override final  String workScopeUID;

/// Create a copy of PackageWorkScopeJunctionModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PackageWorkScopeJunctionModelCopyWith<_PackageWorkScopeJunctionModel> get copyWith => __$PackageWorkScopeJunctionModelCopyWithImpl<_PackageWorkScopeJunctionModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PackageWorkScopeJunctionModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PackageWorkScopeJunctionModel&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.workScopeUID, workScopeUID) || other.workScopeUID == workScopeUID));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,uid,workScopeUID);

@override
String toString() {
  return 'PackageWorkScopeJunctionModel(uid: $uid, workScopeUID: $workScopeUID)';
}


}

/// @nodoc
abstract mixin class _$PackageWorkScopeJunctionModelCopyWith<$Res> implements $PackageWorkScopeJunctionModelCopyWith<$Res> {
  factory _$PackageWorkScopeJunctionModelCopyWith(_PackageWorkScopeJunctionModel value, $Res Function(_PackageWorkScopeJunctionModel) _then) = __$PackageWorkScopeJunctionModelCopyWithImpl;
@override @useResult
$Res call({
 String uid, String workScopeUID
});




}
/// @nodoc
class __$PackageWorkScopeJunctionModelCopyWithImpl<$Res>
    implements _$PackageWorkScopeJunctionModelCopyWith<$Res> {
  __$PackageWorkScopeJunctionModelCopyWithImpl(this._self, this._then);

  final _PackageWorkScopeJunctionModel _self;
  final $Res Function(_PackageWorkScopeJunctionModel) _then;

/// Create a copy of PackageWorkScopeJunctionModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? uid = null,Object? workScopeUID = null,}) {
  return _then(_PackageWorkScopeJunctionModel(
uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,workScopeUID: null == workScopeUID ? _self.workScopeUID : workScopeUID // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$PackageWorkScopeResponseModel {

 PackageModel get package; List<FlatWorkScopeModel> get workScopes; List<PackageWorkScopeJunctionModel> get packageWorkScopes; List<FlatWorkQuantityTypeModel> get quantityTypes; List<FlatQuantityFieldModel> get quantityFields; List<FlatFieldOptionModel> get fieldOptions; List<WorkEquipmentModel> get workEquipments; List<WorkScopeEquipmentJunctionModel> get workScopeEquipments;
/// Create a copy of PackageWorkScopeResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PackageWorkScopeResponseModelCopyWith<PackageWorkScopeResponseModel> get copyWith => _$PackageWorkScopeResponseModelCopyWithImpl<PackageWorkScopeResponseModel>(this as PackageWorkScopeResponseModel, _$identity);

  /// Serializes this PackageWorkScopeResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PackageWorkScopeResponseModel&&(identical(other.package, package) || other.package == package)&&const DeepCollectionEquality().equals(other.workScopes, workScopes)&&const DeepCollectionEquality().equals(other.packageWorkScopes, packageWorkScopes)&&const DeepCollectionEquality().equals(other.quantityTypes, quantityTypes)&&const DeepCollectionEquality().equals(other.quantityFields, quantityFields)&&const DeepCollectionEquality().equals(other.fieldOptions, fieldOptions)&&const DeepCollectionEquality().equals(other.workEquipments, workEquipments)&&const DeepCollectionEquality().equals(other.workScopeEquipments, workScopeEquipments));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,package,const DeepCollectionEquality().hash(workScopes),const DeepCollectionEquality().hash(packageWorkScopes),const DeepCollectionEquality().hash(quantityTypes),const DeepCollectionEquality().hash(quantityFields),const DeepCollectionEquality().hash(fieldOptions),const DeepCollectionEquality().hash(workEquipments),const DeepCollectionEquality().hash(workScopeEquipments));

@override
String toString() {
  return 'PackageWorkScopeResponseModel(package: $package, workScopes: $workScopes, packageWorkScopes: $packageWorkScopes, quantityTypes: $quantityTypes, quantityFields: $quantityFields, fieldOptions: $fieldOptions, workEquipments: $workEquipments, workScopeEquipments: $workScopeEquipments)';
}


}

/// @nodoc
abstract mixin class $PackageWorkScopeResponseModelCopyWith<$Res>  {
  factory $PackageWorkScopeResponseModelCopyWith(PackageWorkScopeResponseModel value, $Res Function(PackageWorkScopeResponseModel) _then) = _$PackageWorkScopeResponseModelCopyWithImpl;
@useResult
$Res call({
 PackageModel package, List<FlatWorkScopeModel> workScopes, List<PackageWorkScopeJunctionModel> packageWorkScopes, List<FlatWorkQuantityTypeModel> quantityTypes, List<FlatQuantityFieldModel> quantityFields, List<FlatFieldOptionModel> fieldOptions, List<WorkEquipmentModel> workEquipments, List<WorkScopeEquipmentJunctionModel> workScopeEquipments
});


$PackageModelCopyWith<$Res> get package;

}
/// @nodoc
class _$PackageWorkScopeResponseModelCopyWithImpl<$Res>
    implements $PackageWorkScopeResponseModelCopyWith<$Res> {
  _$PackageWorkScopeResponseModelCopyWithImpl(this._self, this._then);

  final PackageWorkScopeResponseModel _self;
  final $Res Function(PackageWorkScopeResponseModel) _then;

/// Create a copy of PackageWorkScopeResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? package = null,Object? workScopes = null,Object? packageWorkScopes = null,Object? quantityTypes = null,Object? quantityFields = null,Object? fieldOptions = null,Object? workEquipments = null,Object? workScopeEquipments = null,}) {
  return _then(_self.copyWith(
package: null == package ? _self.package : package // ignore: cast_nullable_to_non_nullable
as PackageModel,workScopes: null == workScopes ? _self.workScopes : workScopes // ignore: cast_nullable_to_non_nullable
as List<FlatWorkScopeModel>,packageWorkScopes: null == packageWorkScopes ? _self.packageWorkScopes : packageWorkScopes // ignore: cast_nullable_to_non_nullable
as List<PackageWorkScopeJunctionModel>,quantityTypes: null == quantityTypes ? _self.quantityTypes : quantityTypes // ignore: cast_nullable_to_non_nullable
as List<FlatWorkQuantityTypeModel>,quantityFields: null == quantityFields ? _self.quantityFields : quantityFields // ignore: cast_nullable_to_non_nullable
as List<FlatQuantityFieldModel>,fieldOptions: null == fieldOptions ? _self.fieldOptions : fieldOptions // ignore: cast_nullable_to_non_nullable
as List<FlatFieldOptionModel>,workEquipments: null == workEquipments ? _self.workEquipments : workEquipments // ignore: cast_nullable_to_non_nullable
as List<WorkEquipmentModel>,workScopeEquipments: null == workScopeEquipments ? _self.workScopeEquipments : workScopeEquipments // ignore: cast_nullable_to_non_nullable
as List<WorkScopeEquipmentJunctionModel>,
  ));
}
/// Create a copy of PackageWorkScopeResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PackageModelCopyWith<$Res> get package {
  
  return $PackageModelCopyWith<$Res>(_self.package, (value) {
    return _then(_self.copyWith(package: value));
  });
}
}


/// Adds pattern-matching-related methods to [PackageWorkScopeResponseModel].
extension PackageWorkScopeResponseModelPatterns on PackageWorkScopeResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PackageWorkScopeResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PackageWorkScopeResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PackageWorkScopeResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _PackageWorkScopeResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PackageWorkScopeResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _PackageWorkScopeResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PackageModel package,  List<FlatWorkScopeModel> workScopes,  List<PackageWorkScopeJunctionModel> packageWorkScopes,  List<FlatWorkQuantityTypeModel> quantityTypes,  List<FlatQuantityFieldModel> quantityFields,  List<FlatFieldOptionModel> fieldOptions,  List<WorkEquipmentModel> workEquipments,  List<WorkScopeEquipmentJunctionModel> workScopeEquipments)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PackageWorkScopeResponseModel() when $default != null:
return $default(_that.package,_that.workScopes,_that.packageWorkScopes,_that.quantityTypes,_that.quantityFields,_that.fieldOptions,_that.workEquipments,_that.workScopeEquipments);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PackageModel package,  List<FlatWorkScopeModel> workScopes,  List<PackageWorkScopeJunctionModel> packageWorkScopes,  List<FlatWorkQuantityTypeModel> quantityTypes,  List<FlatQuantityFieldModel> quantityFields,  List<FlatFieldOptionModel> fieldOptions,  List<WorkEquipmentModel> workEquipments,  List<WorkScopeEquipmentJunctionModel> workScopeEquipments)  $default,) {final _that = this;
switch (_that) {
case _PackageWorkScopeResponseModel():
return $default(_that.package,_that.workScopes,_that.packageWorkScopes,_that.quantityTypes,_that.quantityFields,_that.fieldOptions,_that.workEquipments,_that.workScopeEquipments);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PackageModel package,  List<FlatWorkScopeModel> workScopes,  List<PackageWorkScopeJunctionModel> packageWorkScopes,  List<FlatWorkQuantityTypeModel> quantityTypes,  List<FlatQuantityFieldModel> quantityFields,  List<FlatFieldOptionModel> fieldOptions,  List<WorkEquipmentModel> workEquipments,  List<WorkScopeEquipmentJunctionModel> workScopeEquipments)?  $default,) {final _that = this;
switch (_that) {
case _PackageWorkScopeResponseModel() when $default != null:
return $default(_that.package,_that.workScopes,_that.packageWorkScopes,_that.quantityTypes,_that.quantityFields,_that.fieldOptions,_that.workEquipments,_that.workScopeEquipments);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PackageWorkScopeResponseModel extends PackageWorkScopeResponseModel {
  const _PackageWorkScopeResponseModel({required this.package, final  List<FlatWorkScopeModel> workScopes = const [], final  List<PackageWorkScopeJunctionModel> packageWorkScopes = const [], final  List<FlatWorkQuantityTypeModel> quantityTypes = const [], final  List<FlatQuantityFieldModel> quantityFields = const [], final  List<FlatFieldOptionModel> fieldOptions = const [], final  List<WorkEquipmentModel> workEquipments = const [], final  List<WorkScopeEquipmentJunctionModel> workScopeEquipments = const []}): _workScopes = workScopes,_packageWorkScopes = packageWorkScopes,_quantityTypes = quantityTypes,_quantityFields = quantityFields,_fieldOptions = fieldOptions,_workEquipments = workEquipments,_workScopeEquipments = workScopeEquipments,super._();
  factory _PackageWorkScopeResponseModel.fromJson(Map<String, dynamic> json) => _$PackageWorkScopeResponseModelFromJson(json);

@override final  PackageModel package;
 final  List<FlatWorkScopeModel> _workScopes;
@override@JsonKey() List<FlatWorkScopeModel> get workScopes {
  if (_workScopes is EqualUnmodifiableListView) return _workScopes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_workScopes);
}

 final  List<PackageWorkScopeJunctionModel> _packageWorkScopes;
@override@JsonKey() List<PackageWorkScopeJunctionModel> get packageWorkScopes {
  if (_packageWorkScopes is EqualUnmodifiableListView) return _packageWorkScopes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_packageWorkScopes);
}

 final  List<FlatWorkQuantityTypeModel> _quantityTypes;
@override@JsonKey() List<FlatWorkQuantityTypeModel> get quantityTypes {
  if (_quantityTypes is EqualUnmodifiableListView) return _quantityTypes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_quantityTypes);
}

 final  List<FlatQuantityFieldModel> _quantityFields;
@override@JsonKey() List<FlatQuantityFieldModel> get quantityFields {
  if (_quantityFields is EqualUnmodifiableListView) return _quantityFields;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_quantityFields);
}

 final  List<FlatFieldOptionModel> _fieldOptions;
@override@JsonKey() List<FlatFieldOptionModel> get fieldOptions {
  if (_fieldOptions is EqualUnmodifiableListView) return _fieldOptions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_fieldOptions);
}

 final  List<WorkEquipmentModel> _workEquipments;
@override@JsonKey() List<WorkEquipmentModel> get workEquipments {
  if (_workEquipments is EqualUnmodifiableListView) return _workEquipments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_workEquipments);
}

 final  List<WorkScopeEquipmentJunctionModel> _workScopeEquipments;
@override@JsonKey() List<WorkScopeEquipmentJunctionModel> get workScopeEquipments {
  if (_workScopeEquipments is EqualUnmodifiableListView) return _workScopeEquipments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_workScopeEquipments);
}


/// Create a copy of PackageWorkScopeResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PackageWorkScopeResponseModelCopyWith<_PackageWorkScopeResponseModel> get copyWith => __$PackageWorkScopeResponseModelCopyWithImpl<_PackageWorkScopeResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PackageWorkScopeResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PackageWorkScopeResponseModel&&(identical(other.package, package) || other.package == package)&&const DeepCollectionEquality().equals(other._workScopes, _workScopes)&&const DeepCollectionEquality().equals(other._packageWorkScopes, _packageWorkScopes)&&const DeepCollectionEquality().equals(other._quantityTypes, _quantityTypes)&&const DeepCollectionEquality().equals(other._quantityFields, _quantityFields)&&const DeepCollectionEquality().equals(other._fieldOptions, _fieldOptions)&&const DeepCollectionEquality().equals(other._workEquipments, _workEquipments)&&const DeepCollectionEquality().equals(other._workScopeEquipments, _workScopeEquipments));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,package,const DeepCollectionEquality().hash(_workScopes),const DeepCollectionEquality().hash(_packageWorkScopes),const DeepCollectionEquality().hash(_quantityTypes),const DeepCollectionEquality().hash(_quantityFields),const DeepCollectionEquality().hash(_fieldOptions),const DeepCollectionEquality().hash(_workEquipments),const DeepCollectionEquality().hash(_workScopeEquipments));

@override
String toString() {
  return 'PackageWorkScopeResponseModel(package: $package, workScopes: $workScopes, packageWorkScopes: $packageWorkScopes, quantityTypes: $quantityTypes, quantityFields: $quantityFields, fieldOptions: $fieldOptions, workEquipments: $workEquipments, workScopeEquipments: $workScopeEquipments)';
}


}

/// @nodoc
abstract mixin class _$PackageWorkScopeResponseModelCopyWith<$Res> implements $PackageWorkScopeResponseModelCopyWith<$Res> {
  factory _$PackageWorkScopeResponseModelCopyWith(_PackageWorkScopeResponseModel value, $Res Function(_PackageWorkScopeResponseModel) _then) = __$PackageWorkScopeResponseModelCopyWithImpl;
@override @useResult
$Res call({
 PackageModel package, List<FlatWorkScopeModel> workScopes, List<PackageWorkScopeJunctionModel> packageWorkScopes, List<FlatWorkQuantityTypeModel> quantityTypes, List<FlatQuantityFieldModel> quantityFields, List<FlatFieldOptionModel> fieldOptions, List<WorkEquipmentModel> workEquipments, List<WorkScopeEquipmentJunctionModel> workScopeEquipments
});


@override $PackageModelCopyWith<$Res> get package;

}
/// @nodoc
class __$PackageWorkScopeResponseModelCopyWithImpl<$Res>
    implements _$PackageWorkScopeResponseModelCopyWith<$Res> {
  __$PackageWorkScopeResponseModelCopyWithImpl(this._self, this._then);

  final _PackageWorkScopeResponseModel _self;
  final $Res Function(_PackageWorkScopeResponseModel) _then;

/// Create a copy of PackageWorkScopeResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? package = null,Object? workScopes = null,Object? packageWorkScopes = null,Object? quantityTypes = null,Object? quantityFields = null,Object? fieldOptions = null,Object? workEquipments = null,Object? workScopeEquipments = null,}) {
  return _then(_PackageWorkScopeResponseModel(
package: null == package ? _self.package : package // ignore: cast_nullable_to_non_nullable
as PackageModel,workScopes: null == workScopes ? _self._workScopes : workScopes // ignore: cast_nullable_to_non_nullable
as List<FlatWorkScopeModel>,packageWorkScopes: null == packageWorkScopes ? _self._packageWorkScopes : packageWorkScopes // ignore: cast_nullable_to_non_nullable
as List<PackageWorkScopeJunctionModel>,quantityTypes: null == quantityTypes ? _self._quantityTypes : quantityTypes // ignore: cast_nullable_to_non_nullable
as List<FlatWorkQuantityTypeModel>,quantityFields: null == quantityFields ? _self._quantityFields : quantityFields // ignore: cast_nullable_to_non_nullable
as List<FlatQuantityFieldModel>,fieldOptions: null == fieldOptions ? _self._fieldOptions : fieldOptions // ignore: cast_nullable_to_non_nullable
as List<FlatFieldOptionModel>,workEquipments: null == workEquipments ? _self._workEquipments : workEquipments // ignore: cast_nullable_to_non_nullable
as List<WorkEquipmentModel>,workScopeEquipments: null == workScopeEquipments ? _self._workScopeEquipments : workScopeEquipments // ignore: cast_nullable_to_non_nullable
as List<WorkScopeEquipmentJunctionModel>,
  ));
}

/// Create a copy of PackageWorkScopeResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PackageModelCopyWith<$Res> get package {
  
  return $PackageModelCopyWith<$Res>(_self.package, (value) {
    return _then(_self.copyWith(package: value));
  });
}
}

// dart format on
