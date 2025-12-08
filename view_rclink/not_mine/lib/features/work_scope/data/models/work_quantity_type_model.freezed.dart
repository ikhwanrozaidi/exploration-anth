// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'work_quantity_type_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WorkQuantityTypeModel {

 int get id; String get uid; String get name; String get code; int get displayOrder; bool get hasSegmentBreakdown; int? get segmentSize; int? get maxSegmentLength; List<QuantityFieldModel> get quantityFields;
/// Create a copy of WorkQuantityTypeModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WorkQuantityTypeModelCopyWith<WorkQuantityTypeModel> get copyWith => _$WorkQuantityTypeModelCopyWithImpl<WorkQuantityTypeModel>(this as WorkQuantityTypeModel, _$identity);

  /// Serializes this WorkQuantityTypeModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WorkQuantityTypeModel&&(identical(other.id, id) || other.id == id)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.name, name) || other.name == name)&&(identical(other.code, code) || other.code == code)&&(identical(other.displayOrder, displayOrder) || other.displayOrder == displayOrder)&&(identical(other.hasSegmentBreakdown, hasSegmentBreakdown) || other.hasSegmentBreakdown == hasSegmentBreakdown)&&(identical(other.segmentSize, segmentSize) || other.segmentSize == segmentSize)&&(identical(other.maxSegmentLength, maxSegmentLength) || other.maxSegmentLength == maxSegmentLength)&&const DeepCollectionEquality().equals(other.quantityFields, quantityFields));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,uid,name,code,displayOrder,hasSegmentBreakdown,segmentSize,maxSegmentLength,const DeepCollectionEquality().hash(quantityFields));

@override
String toString() {
  return 'WorkQuantityTypeModel(id: $id, uid: $uid, name: $name, code: $code, displayOrder: $displayOrder, hasSegmentBreakdown: $hasSegmentBreakdown, segmentSize: $segmentSize, maxSegmentLength: $maxSegmentLength, quantityFields: $quantityFields)';
}


}

/// @nodoc
abstract mixin class $WorkQuantityTypeModelCopyWith<$Res>  {
  factory $WorkQuantityTypeModelCopyWith(WorkQuantityTypeModel value, $Res Function(WorkQuantityTypeModel) _then) = _$WorkQuantityTypeModelCopyWithImpl;
@useResult
$Res call({
 int id, String uid, String name, String code, int displayOrder, bool hasSegmentBreakdown, int? segmentSize, int? maxSegmentLength, List<QuantityFieldModel> quantityFields
});




}
/// @nodoc
class _$WorkQuantityTypeModelCopyWithImpl<$Res>
    implements $WorkQuantityTypeModelCopyWith<$Res> {
  _$WorkQuantityTypeModelCopyWithImpl(this._self, this._then);

  final WorkQuantityTypeModel _self;
  final $Res Function(WorkQuantityTypeModel) _then;

/// Create a copy of WorkQuantityTypeModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? uid = null,Object? name = null,Object? code = null,Object? displayOrder = null,Object? hasSegmentBreakdown = null,Object? segmentSize = freezed,Object? maxSegmentLength = freezed,Object? quantityFields = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,displayOrder: null == displayOrder ? _self.displayOrder : displayOrder // ignore: cast_nullable_to_non_nullable
as int,hasSegmentBreakdown: null == hasSegmentBreakdown ? _self.hasSegmentBreakdown : hasSegmentBreakdown // ignore: cast_nullable_to_non_nullable
as bool,segmentSize: freezed == segmentSize ? _self.segmentSize : segmentSize // ignore: cast_nullable_to_non_nullable
as int?,maxSegmentLength: freezed == maxSegmentLength ? _self.maxSegmentLength : maxSegmentLength // ignore: cast_nullable_to_non_nullable
as int?,quantityFields: null == quantityFields ? _self.quantityFields : quantityFields // ignore: cast_nullable_to_non_nullable
as List<QuantityFieldModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [WorkQuantityTypeModel].
extension WorkQuantityTypeModelPatterns on WorkQuantityTypeModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WorkQuantityTypeModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WorkQuantityTypeModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WorkQuantityTypeModel value)  $default,){
final _that = this;
switch (_that) {
case _WorkQuantityTypeModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WorkQuantityTypeModel value)?  $default,){
final _that = this;
switch (_that) {
case _WorkQuantityTypeModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String uid,  String name,  String code,  int displayOrder,  bool hasSegmentBreakdown,  int? segmentSize,  int? maxSegmentLength,  List<QuantityFieldModel> quantityFields)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WorkQuantityTypeModel() when $default != null:
return $default(_that.id,_that.uid,_that.name,_that.code,_that.displayOrder,_that.hasSegmentBreakdown,_that.segmentSize,_that.maxSegmentLength,_that.quantityFields);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String uid,  String name,  String code,  int displayOrder,  bool hasSegmentBreakdown,  int? segmentSize,  int? maxSegmentLength,  List<QuantityFieldModel> quantityFields)  $default,) {final _that = this;
switch (_that) {
case _WorkQuantityTypeModel():
return $default(_that.id,_that.uid,_that.name,_that.code,_that.displayOrder,_that.hasSegmentBreakdown,_that.segmentSize,_that.maxSegmentLength,_that.quantityFields);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String uid,  String name,  String code,  int displayOrder,  bool hasSegmentBreakdown,  int? segmentSize,  int? maxSegmentLength,  List<QuantityFieldModel> quantityFields)?  $default,) {final _that = this;
switch (_that) {
case _WorkQuantityTypeModel() when $default != null:
return $default(_that.id,_that.uid,_that.name,_that.code,_that.displayOrder,_that.hasSegmentBreakdown,_that.segmentSize,_that.maxSegmentLength,_that.quantityFields);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WorkQuantityTypeModel extends WorkQuantityTypeModel {
  const _WorkQuantityTypeModel({required this.id, required this.uid, required this.name, required this.code, required this.displayOrder, required this.hasSegmentBreakdown, this.segmentSize, this.maxSegmentLength, final  List<QuantityFieldModel> quantityFields = const []}): _quantityFields = quantityFields,super._();
  factory _WorkQuantityTypeModel.fromJson(Map<String, dynamic> json) => _$WorkQuantityTypeModelFromJson(json);

@override final  int id;
@override final  String uid;
@override final  String name;
@override final  String code;
@override final  int displayOrder;
@override final  bool hasSegmentBreakdown;
@override final  int? segmentSize;
@override final  int? maxSegmentLength;
 final  List<QuantityFieldModel> _quantityFields;
@override@JsonKey() List<QuantityFieldModel> get quantityFields {
  if (_quantityFields is EqualUnmodifiableListView) return _quantityFields;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_quantityFields);
}


/// Create a copy of WorkQuantityTypeModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WorkQuantityTypeModelCopyWith<_WorkQuantityTypeModel> get copyWith => __$WorkQuantityTypeModelCopyWithImpl<_WorkQuantityTypeModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WorkQuantityTypeModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WorkQuantityTypeModel&&(identical(other.id, id) || other.id == id)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.name, name) || other.name == name)&&(identical(other.code, code) || other.code == code)&&(identical(other.displayOrder, displayOrder) || other.displayOrder == displayOrder)&&(identical(other.hasSegmentBreakdown, hasSegmentBreakdown) || other.hasSegmentBreakdown == hasSegmentBreakdown)&&(identical(other.segmentSize, segmentSize) || other.segmentSize == segmentSize)&&(identical(other.maxSegmentLength, maxSegmentLength) || other.maxSegmentLength == maxSegmentLength)&&const DeepCollectionEquality().equals(other._quantityFields, _quantityFields));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,uid,name,code,displayOrder,hasSegmentBreakdown,segmentSize,maxSegmentLength,const DeepCollectionEquality().hash(_quantityFields));

@override
String toString() {
  return 'WorkQuantityTypeModel(id: $id, uid: $uid, name: $name, code: $code, displayOrder: $displayOrder, hasSegmentBreakdown: $hasSegmentBreakdown, segmentSize: $segmentSize, maxSegmentLength: $maxSegmentLength, quantityFields: $quantityFields)';
}


}

/// @nodoc
abstract mixin class _$WorkQuantityTypeModelCopyWith<$Res> implements $WorkQuantityTypeModelCopyWith<$Res> {
  factory _$WorkQuantityTypeModelCopyWith(_WorkQuantityTypeModel value, $Res Function(_WorkQuantityTypeModel) _then) = __$WorkQuantityTypeModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String uid, String name, String code, int displayOrder, bool hasSegmentBreakdown, int? segmentSize, int? maxSegmentLength, List<QuantityFieldModel> quantityFields
});




}
/// @nodoc
class __$WorkQuantityTypeModelCopyWithImpl<$Res>
    implements _$WorkQuantityTypeModelCopyWith<$Res> {
  __$WorkQuantityTypeModelCopyWithImpl(this._self, this._then);

  final _WorkQuantityTypeModel _self;
  final $Res Function(_WorkQuantityTypeModel) _then;

/// Create a copy of WorkQuantityTypeModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? uid = null,Object? name = null,Object? code = null,Object? displayOrder = null,Object? hasSegmentBreakdown = null,Object? segmentSize = freezed,Object? maxSegmentLength = freezed,Object? quantityFields = null,}) {
  return _then(_WorkQuantityTypeModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,displayOrder: null == displayOrder ? _self.displayOrder : displayOrder // ignore: cast_nullable_to_non_nullable
as int,hasSegmentBreakdown: null == hasSegmentBreakdown ? _self.hasSegmentBreakdown : hasSegmentBreakdown // ignore: cast_nullable_to_non_nullable
as bool,segmentSize: freezed == segmentSize ? _self.segmentSize : segmentSize // ignore: cast_nullable_to_non_nullable
as int?,maxSegmentLength: freezed == maxSegmentLength ? _self.maxSegmentLength : maxSegmentLength // ignore: cast_nullable_to_non_nullable
as int?,quantityFields: null == quantityFields ? _self._quantityFields : quantityFields // ignore: cast_nullable_to_non_nullable
as List<QuantityFieldModel>,
  ));
}


}

// dart format on
