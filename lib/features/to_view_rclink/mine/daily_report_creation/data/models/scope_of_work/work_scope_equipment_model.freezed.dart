// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'work_scope_equipment_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WorkScopeEquipmentModel {

 int get id; int get workScopeID; int get workEquipmentID; int get companyID; DateTime get createdAt; DateTime get updatedAt; WorkEquipmentModel get workEquipment;
/// Create a copy of WorkScopeEquipmentModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WorkScopeEquipmentModelCopyWith<WorkScopeEquipmentModel> get copyWith => _$WorkScopeEquipmentModelCopyWithImpl<WorkScopeEquipmentModel>(this as WorkScopeEquipmentModel, _$identity);

  /// Serializes this WorkScopeEquipmentModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WorkScopeEquipmentModel&&(identical(other.id, id) || other.id == id)&&(identical(other.workScopeID, workScopeID) || other.workScopeID == workScopeID)&&(identical(other.workEquipmentID, workEquipmentID) || other.workEquipmentID == workEquipmentID)&&(identical(other.companyID, companyID) || other.companyID == companyID)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.workEquipment, workEquipment) || other.workEquipment == workEquipment));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,workScopeID,workEquipmentID,companyID,createdAt,updatedAt,workEquipment);

@override
String toString() {
  return 'WorkScopeEquipmentModel(id: $id, workScopeID: $workScopeID, workEquipmentID: $workEquipmentID, companyID: $companyID, createdAt: $createdAt, updatedAt: $updatedAt, workEquipment: $workEquipment)';
}


}

/// @nodoc
abstract mixin class $WorkScopeEquipmentModelCopyWith<$Res>  {
  factory $WorkScopeEquipmentModelCopyWith(WorkScopeEquipmentModel value, $Res Function(WorkScopeEquipmentModel) _then) = _$WorkScopeEquipmentModelCopyWithImpl;
@useResult
$Res call({
 int id, int workScopeID, int workEquipmentID, int companyID, DateTime createdAt, DateTime updatedAt, WorkEquipmentModel workEquipment
});


$WorkEquipmentModelCopyWith<$Res> get workEquipment;

}
/// @nodoc
class _$WorkScopeEquipmentModelCopyWithImpl<$Res>
    implements $WorkScopeEquipmentModelCopyWith<$Res> {
  _$WorkScopeEquipmentModelCopyWithImpl(this._self, this._then);

  final WorkScopeEquipmentModel _self;
  final $Res Function(WorkScopeEquipmentModel) _then;

/// Create a copy of WorkScopeEquipmentModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? workScopeID = null,Object? workEquipmentID = null,Object? companyID = null,Object? createdAt = null,Object? updatedAt = null,Object? workEquipment = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,workScopeID: null == workScopeID ? _self.workScopeID : workScopeID // ignore: cast_nullable_to_non_nullable
as int,workEquipmentID: null == workEquipmentID ? _self.workEquipmentID : workEquipmentID // ignore: cast_nullable_to_non_nullable
as int,companyID: null == companyID ? _self.companyID : companyID // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,workEquipment: null == workEquipment ? _self.workEquipment : workEquipment // ignore: cast_nullable_to_non_nullable
as WorkEquipmentModel,
  ));
}
/// Create a copy of WorkScopeEquipmentModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WorkEquipmentModelCopyWith<$Res> get workEquipment {
  
  return $WorkEquipmentModelCopyWith<$Res>(_self.workEquipment, (value) {
    return _then(_self.copyWith(workEquipment: value));
  });
}
}


/// Adds pattern-matching-related methods to [WorkScopeEquipmentModel].
extension WorkScopeEquipmentModelPatterns on WorkScopeEquipmentModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WorkScopeEquipmentModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WorkScopeEquipmentModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WorkScopeEquipmentModel value)  $default,){
final _that = this;
switch (_that) {
case _WorkScopeEquipmentModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WorkScopeEquipmentModel value)?  $default,){
final _that = this;
switch (_that) {
case _WorkScopeEquipmentModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int workScopeID,  int workEquipmentID,  int companyID,  DateTime createdAt,  DateTime updatedAt,  WorkEquipmentModel workEquipment)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WorkScopeEquipmentModel() when $default != null:
return $default(_that.id,_that.workScopeID,_that.workEquipmentID,_that.companyID,_that.createdAt,_that.updatedAt,_that.workEquipment);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int workScopeID,  int workEquipmentID,  int companyID,  DateTime createdAt,  DateTime updatedAt,  WorkEquipmentModel workEquipment)  $default,) {final _that = this;
switch (_that) {
case _WorkScopeEquipmentModel():
return $default(_that.id,_that.workScopeID,_that.workEquipmentID,_that.companyID,_that.createdAt,_that.updatedAt,_that.workEquipment);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int workScopeID,  int workEquipmentID,  int companyID,  DateTime createdAt,  DateTime updatedAt,  WorkEquipmentModel workEquipment)?  $default,) {final _that = this;
switch (_that) {
case _WorkScopeEquipmentModel() when $default != null:
return $default(_that.id,_that.workScopeID,_that.workEquipmentID,_that.companyID,_that.createdAt,_that.updatedAt,_that.workEquipment);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WorkScopeEquipmentModel extends WorkScopeEquipmentModel {
  const _WorkScopeEquipmentModel({required this.id, required this.workScopeID, required this.workEquipmentID, required this.companyID, required this.createdAt, required this.updatedAt, required this.workEquipment}): super._();
  factory _WorkScopeEquipmentModel.fromJson(Map<String, dynamic> json) => _$WorkScopeEquipmentModelFromJson(json);

@override final  int id;
@override final  int workScopeID;
@override final  int workEquipmentID;
@override final  int companyID;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;
@override final  WorkEquipmentModel workEquipment;

/// Create a copy of WorkScopeEquipmentModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WorkScopeEquipmentModelCopyWith<_WorkScopeEquipmentModel> get copyWith => __$WorkScopeEquipmentModelCopyWithImpl<_WorkScopeEquipmentModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WorkScopeEquipmentModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WorkScopeEquipmentModel&&(identical(other.id, id) || other.id == id)&&(identical(other.workScopeID, workScopeID) || other.workScopeID == workScopeID)&&(identical(other.workEquipmentID, workEquipmentID) || other.workEquipmentID == workEquipmentID)&&(identical(other.companyID, companyID) || other.companyID == companyID)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.workEquipment, workEquipment) || other.workEquipment == workEquipment));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,workScopeID,workEquipmentID,companyID,createdAt,updatedAt,workEquipment);

@override
String toString() {
  return 'WorkScopeEquipmentModel(id: $id, workScopeID: $workScopeID, workEquipmentID: $workEquipmentID, companyID: $companyID, createdAt: $createdAt, updatedAt: $updatedAt, workEquipment: $workEquipment)';
}


}

/// @nodoc
abstract mixin class _$WorkScopeEquipmentModelCopyWith<$Res> implements $WorkScopeEquipmentModelCopyWith<$Res> {
  factory _$WorkScopeEquipmentModelCopyWith(_WorkScopeEquipmentModel value, $Res Function(_WorkScopeEquipmentModel) _then) = __$WorkScopeEquipmentModelCopyWithImpl;
@override @useResult
$Res call({
 int id, int workScopeID, int workEquipmentID, int companyID, DateTime createdAt, DateTime updatedAt, WorkEquipmentModel workEquipment
});


@override $WorkEquipmentModelCopyWith<$Res> get workEquipment;

}
/// @nodoc
class __$WorkScopeEquipmentModelCopyWithImpl<$Res>
    implements _$WorkScopeEquipmentModelCopyWith<$Res> {
  __$WorkScopeEquipmentModelCopyWithImpl(this._self, this._then);

  final _WorkScopeEquipmentModel _self;
  final $Res Function(_WorkScopeEquipmentModel) _then;

/// Create a copy of WorkScopeEquipmentModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? workScopeID = null,Object? workEquipmentID = null,Object? companyID = null,Object? createdAt = null,Object? updatedAt = null,Object? workEquipment = null,}) {
  return _then(_WorkScopeEquipmentModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,workScopeID: null == workScopeID ? _self.workScopeID : workScopeID // ignore: cast_nullable_to_non_nullable
as int,workEquipmentID: null == workEquipmentID ? _self.workEquipmentID : workEquipmentID // ignore: cast_nullable_to_non_nullable
as int,companyID: null == companyID ? _self.companyID : companyID // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,workEquipment: null == workEquipment ? _self.workEquipment : workEquipment // ignore: cast_nullable_to_non_nullable
as WorkEquipmentModel,
  ));
}

/// Create a copy of WorkScopeEquipmentModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WorkEquipmentModelCopyWith<$Res> get workEquipment {
  
  return $WorkEquipmentModelCopyWith<$Res>(_self.workEquipment, (value) {
    return _then(_self.copyWith(workEquipment: value));
  });
}
}

// dart format on
