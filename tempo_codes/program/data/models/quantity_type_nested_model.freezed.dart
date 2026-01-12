// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quantity_type_nested_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$QuantityTypeNestedModel {

 int? get id; String? get uid; String? get name; String? get code; String? get description; int? get workScopeID; int? get companyID; int? get displayOrder; bool? get isActive; bool? get hasSegmentBreakdown; int? get segmentSize; int? get maxSegmentLength; String? get createdAt; String? get updatedAt; String? get deletedAt; List<QuantityFieldNestedModel>? get quantityFields;
/// Create a copy of QuantityTypeNestedModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuantityTypeNestedModelCopyWith<QuantityTypeNestedModel> get copyWith => _$QuantityTypeNestedModelCopyWithImpl<QuantityTypeNestedModel>(this as QuantityTypeNestedModel, _$identity);

  /// Serializes this QuantityTypeNestedModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuantityTypeNestedModel&&(identical(other.id, id) || other.id == id)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.name, name) || other.name == name)&&(identical(other.code, code) || other.code == code)&&(identical(other.description, description) || other.description == description)&&(identical(other.workScopeID, workScopeID) || other.workScopeID == workScopeID)&&(identical(other.companyID, companyID) || other.companyID == companyID)&&(identical(other.displayOrder, displayOrder) || other.displayOrder == displayOrder)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.hasSegmentBreakdown, hasSegmentBreakdown) || other.hasSegmentBreakdown == hasSegmentBreakdown)&&(identical(other.segmentSize, segmentSize) || other.segmentSize == segmentSize)&&(identical(other.maxSegmentLength, maxSegmentLength) || other.maxSegmentLength == maxSegmentLength)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt)&&const DeepCollectionEquality().equals(other.quantityFields, quantityFields));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,uid,name,code,description,workScopeID,companyID,displayOrder,isActive,hasSegmentBreakdown,segmentSize,maxSegmentLength,createdAt,updatedAt,deletedAt,const DeepCollectionEquality().hash(quantityFields));

@override
String toString() {
  return 'QuantityTypeNestedModel(id: $id, uid: $uid, name: $name, code: $code, description: $description, workScopeID: $workScopeID, companyID: $companyID, displayOrder: $displayOrder, isActive: $isActive, hasSegmentBreakdown: $hasSegmentBreakdown, segmentSize: $segmentSize, maxSegmentLength: $maxSegmentLength, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt, quantityFields: $quantityFields)';
}


}

/// @nodoc
abstract mixin class $QuantityTypeNestedModelCopyWith<$Res>  {
  factory $QuantityTypeNestedModelCopyWith(QuantityTypeNestedModel value, $Res Function(QuantityTypeNestedModel) _then) = _$QuantityTypeNestedModelCopyWithImpl;
@useResult
$Res call({
 int? id, String? uid, String? name, String? code, String? description, int? workScopeID, int? companyID, int? displayOrder, bool? isActive, bool? hasSegmentBreakdown, int? segmentSize, int? maxSegmentLength, String? createdAt, String? updatedAt, String? deletedAt, List<QuantityFieldNestedModel>? quantityFields
});




}
/// @nodoc
class _$QuantityTypeNestedModelCopyWithImpl<$Res>
    implements $QuantityTypeNestedModelCopyWith<$Res> {
  _$QuantityTypeNestedModelCopyWithImpl(this._self, this._then);

  final QuantityTypeNestedModel _self;
  final $Res Function(QuantityTypeNestedModel) _then;

/// Create a copy of QuantityTypeNestedModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? uid = freezed,Object? name = freezed,Object? code = freezed,Object? description = freezed,Object? workScopeID = freezed,Object? companyID = freezed,Object? displayOrder = freezed,Object? isActive = freezed,Object? hasSegmentBreakdown = freezed,Object? segmentSize = freezed,Object? maxSegmentLength = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? deletedAt = freezed,Object? quantityFields = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,uid: freezed == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,workScopeID: freezed == workScopeID ? _self.workScopeID : workScopeID // ignore: cast_nullable_to_non_nullable
as int?,companyID: freezed == companyID ? _self.companyID : companyID // ignore: cast_nullable_to_non_nullable
as int?,displayOrder: freezed == displayOrder ? _self.displayOrder : displayOrder // ignore: cast_nullable_to_non_nullable
as int?,isActive: freezed == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool?,hasSegmentBreakdown: freezed == hasSegmentBreakdown ? _self.hasSegmentBreakdown : hasSegmentBreakdown // ignore: cast_nullable_to_non_nullable
as bool?,segmentSize: freezed == segmentSize ? _self.segmentSize : segmentSize // ignore: cast_nullable_to_non_nullable
as int?,maxSegmentLength: freezed == maxSegmentLength ? _self.maxSegmentLength : maxSegmentLength // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as String?,quantityFields: freezed == quantityFields ? _self.quantityFields : quantityFields // ignore: cast_nullable_to_non_nullable
as List<QuantityFieldNestedModel>?,
  ));
}

}


/// Adds pattern-matching-related methods to [QuantityTypeNestedModel].
extension QuantityTypeNestedModelPatterns on QuantityTypeNestedModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QuantityTypeNestedModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QuantityTypeNestedModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QuantityTypeNestedModel value)  $default,){
final _that = this;
switch (_that) {
case _QuantityTypeNestedModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QuantityTypeNestedModel value)?  $default,){
final _that = this;
switch (_that) {
case _QuantityTypeNestedModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  String? uid,  String? name,  String? code,  String? description,  int? workScopeID,  int? companyID,  int? displayOrder,  bool? isActive,  bool? hasSegmentBreakdown,  int? segmentSize,  int? maxSegmentLength,  String? createdAt,  String? updatedAt,  String? deletedAt,  List<QuantityFieldNestedModel>? quantityFields)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QuantityTypeNestedModel() when $default != null:
return $default(_that.id,_that.uid,_that.name,_that.code,_that.description,_that.workScopeID,_that.companyID,_that.displayOrder,_that.isActive,_that.hasSegmentBreakdown,_that.segmentSize,_that.maxSegmentLength,_that.createdAt,_that.updatedAt,_that.deletedAt,_that.quantityFields);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  String? uid,  String? name,  String? code,  String? description,  int? workScopeID,  int? companyID,  int? displayOrder,  bool? isActive,  bool? hasSegmentBreakdown,  int? segmentSize,  int? maxSegmentLength,  String? createdAt,  String? updatedAt,  String? deletedAt,  List<QuantityFieldNestedModel>? quantityFields)  $default,) {final _that = this;
switch (_that) {
case _QuantityTypeNestedModel():
return $default(_that.id,_that.uid,_that.name,_that.code,_that.description,_that.workScopeID,_that.companyID,_that.displayOrder,_that.isActive,_that.hasSegmentBreakdown,_that.segmentSize,_that.maxSegmentLength,_that.createdAt,_that.updatedAt,_that.deletedAt,_that.quantityFields);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  String? uid,  String? name,  String? code,  String? description,  int? workScopeID,  int? companyID,  int? displayOrder,  bool? isActive,  bool? hasSegmentBreakdown,  int? segmentSize,  int? maxSegmentLength,  String? createdAt,  String? updatedAt,  String? deletedAt,  List<QuantityFieldNestedModel>? quantityFields)?  $default,) {final _that = this;
switch (_that) {
case _QuantityTypeNestedModel() when $default != null:
return $default(_that.id,_that.uid,_that.name,_that.code,_that.description,_that.workScopeID,_that.companyID,_that.displayOrder,_that.isActive,_that.hasSegmentBreakdown,_that.segmentSize,_that.maxSegmentLength,_that.createdAt,_that.updatedAt,_that.deletedAt,_that.quantityFields);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _QuantityTypeNestedModel implements QuantityTypeNestedModel {
  const _QuantityTypeNestedModel({this.id, this.uid, this.name, this.code, this.description, this.workScopeID, this.companyID, this.displayOrder, this.isActive, this.hasSegmentBreakdown, this.segmentSize, this.maxSegmentLength, this.createdAt, this.updatedAt, this.deletedAt, final  List<QuantityFieldNestedModel>? quantityFields}): _quantityFields = quantityFields;
  factory _QuantityTypeNestedModel.fromJson(Map<String, dynamic> json) => _$QuantityTypeNestedModelFromJson(json);

@override final  int? id;
@override final  String? uid;
@override final  String? name;
@override final  String? code;
@override final  String? description;
@override final  int? workScopeID;
@override final  int? companyID;
@override final  int? displayOrder;
@override final  bool? isActive;
@override final  bool? hasSegmentBreakdown;
@override final  int? segmentSize;
@override final  int? maxSegmentLength;
@override final  String? createdAt;
@override final  String? updatedAt;
@override final  String? deletedAt;
 final  List<QuantityFieldNestedModel>? _quantityFields;
@override List<QuantityFieldNestedModel>? get quantityFields {
  final value = _quantityFields;
  if (value == null) return null;
  if (_quantityFields is EqualUnmodifiableListView) return _quantityFields;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of QuantityTypeNestedModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuantityTypeNestedModelCopyWith<_QuantityTypeNestedModel> get copyWith => __$QuantityTypeNestedModelCopyWithImpl<_QuantityTypeNestedModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$QuantityTypeNestedModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QuantityTypeNestedModel&&(identical(other.id, id) || other.id == id)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.name, name) || other.name == name)&&(identical(other.code, code) || other.code == code)&&(identical(other.description, description) || other.description == description)&&(identical(other.workScopeID, workScopeID) || other.workScopeID == workScopeID)&&(identical(other.companyID, companyID) || other.companyID == companyID)&&(identical(other.displayOrder, displayOrder) || other.displayOrder == displayOrder)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.hasSegmentBreakdown, hasSegmentBreakdown) || other.hasSegmentBreakdown == hasSegmentBreakdown)&&(identical(other.segmentSize, segmentSize) || other.segmentSize == segmentSize)&&(identical(other.maxSegmentLength, maxSegmentLength) || other.maxSegmentLength == maxSegmentLength)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt)&&const DeepCollectionEquality().equals(other._quantityFields, _quantityFields));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,uid,name,code,description,workScopeID,companyID,displayOrder,isActive,hasSegmentBreakdown,segmentSize,maxSegmentLength,createdAt,updatedAt,deletedAt,const DeepCollectionEquality().hash(_quantityFields));

@override
String toString() {
  return 'QuantityTypeNestedModel(id: $id, uid: $uid, name: $name, code: $code, description: $description, workScopeID: $workScopeID, companyID: $companyID, displayOrder: $displayOrder, isActive: $isActive, hasSegmentBreakdown: $hasSegmentBreakdown, segmentSize: $segmentSize, maxSegmentLength: $maxSegmentLength, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt, quantityFields: $quantityFields)';
}


}

/// @nodoc
abstract mixin class _$QuantityTypeNestedModelCopyWith<$Res> implements $QuantityTypeNestedModelCopyWith<$Res> {
  factory _$QuantityTypeNestedModelCopyWith(_QuantityTypeNestedModel value, $Res Function(_QuantityTypeNestedModel) _then) = __$QuantityTypeNestedModelCopyWithImpl;
@override @useResult
$Res call({
 int? id, String? uid, String? name, String? code, String? description, int? workScopeID, int? companyID, int? displayOrder, bool? isActive, bool? hasSegmentBreakdown, int? segmentSize, int? maxSegmentLength, String? createdAt, String? updatedAt, String? deletedAt, List<QuantityFieldNestedModel>? quantityFields
});




}
/// @nodoc
class __$QuantityTypeNestedModelCopyWithImpl<$Res>
    implements _$QuantityTypeNestedModelCopyWith<$Res> {
  __$QuantityTypeNestedModelCopyWithImpl(this._self, this._then);

  final _QuantityTypeNestedModel _self;
  final $Res Function(_QuantityTypeNestedModel) _then;

/// Create a copy of QuantityTypeNestedModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? uid = freezed,Object? name = freezed,Object? code = freezed,Object? description = freezed,Object? workScopeID = freezed,Object? companyID = freezed,Object? displayOrder = freezed,Object? isActive = freezed,Object? hasSegmentBreakdown = freezed,Object? segmentSize = freezed,Object? maxSegmentLength = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? deletedAt = freezed,Object? quantityFields = freezed,}) {
  return _then(_QuantityTypeNestedModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,uid: freezed == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,workScopeID: freezed == workScopeID ? _self.workScopeID : workScopeID // ignore: cast_nullable_to_non_nullable
as int?,companyID: freezed == companyID ? _self.companyID : companyID // ignore: cast_nullable_to_non_nullable
as int?,displayOrder: freezed == displayOrder ? _self.displayOrder : displayOrder // ignore: cast_nullable_to_non_nullable
as int?,isActive: freezed == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool?,hasSegmentBreakdown: freezed == hasSegmentBreakdown ? _self.hasSegmentBreakdown : hasSegmentBreakdown // ignore: cast_nullable_to_non_nullable
as bool?,segmentSize: freezed == segmentSize ? _self.segmentSize : segmentSize // ignore: cast_nullable_to_non_nullable
as int?,maxSegmentLength: freezed == maxSegmentLength ? _self.maxSegmentLength : maxSegmentLength // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as String?,quantityFields: freezed == quantityFields ? _self._quantityFields : quantityFields // ignore: cast_nullable_to_non_nullable
as List<QuantityFieldNestedModel>?,
  ));
}


}

// dart format on
