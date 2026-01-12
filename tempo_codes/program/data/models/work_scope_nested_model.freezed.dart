// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'work_scope_nested_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WorkScopeNestedModel {

 int? get id; String? get uid; String? get name; String? get code; String? get description; bool? get allowMultipleQuantities; int? get companyID; String? get createdAt; String? get updatedAt; String? get deletedAt;
/// Create a copy of WorkScopeNestedModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WorkScopeNestedModelCopyWith<WorkScopeNestedModel> get copyWith => _$WorkScopeNestedModelCopyWithImpl<WorkScopeNestedModel>(this as WorkScopeNestedModel, _$identity);

  /// Serializes this WorkScopeNestedModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WorkScopeNestedModel&&(identical(other.id, id) || other.id == id)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.name, name) || other.name == name)&&(identical(other.code, code) || other.code == code)&&(identical(other.description, description) || other.description == description)&&(identical(other.allowMultipleQuantities, allowMultipleQuantities) || other.allowMultipleQuantities == allowMultipleQuantities)&&(identical(other.companyID, companyID) || other.companyID == companyID)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,uid,name,code,description,allowMultipleQuantities,companyID,createdAt,updatedAt,deletedAt);

@override
String toString() {
  return 'WorkScopeNestedModel(id: $id, uid: $uid, name: $name, code: $code, description: $description, allowMultipleQuantities: $allowMultipleQuantities, companyID: $companyID, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt)';
}


}

/// @nodoc
abstract mixin class $WorkScopeNestedModelCopyWith<$Res>  {
  factory $WorkScopeNestedModelCopyWith(WorkScopeNestedModel value, $Res Function(WorkScopeNestedModel) _then) = _$WorkScopeNestedModelCopyWithImpl;
@useResult
$Res call({
 int? id, String? uid, String? name, String? code, String? description, bool? allowMultipleQuantities, int? companyID, String? createdAt, String? updatedAt, String? deletedAt
});




}
/// @nodoc
class _$WorkScopeNestedModelCopyWithImpl<$Res>
    implements $WorkScopeNestedModelCopyWith<$Res> {
  _$WorkScopeNestedModelCopyWithImpl(this._self, this._then);

  final WorkScopeNestedModel _self;
  final $Res Function(WorkScopeNestedModel) _then;

/// Create a copy of WorkScopeNestedModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? uid = freezed,Object? name = freezed,Object? code = freezed,Object? description = freezed,Object? allowMultipleQuantities = freezed,Object? companyID = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? deletedAt = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,uid: freezed == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,allowMultipleQuantities: freezed == allowMultipleQuantities ? _self.allowMultipleQuantities : allowMultipleQuantities // ignore: cast_nullable_to_non_nullable
as bool?,companyID: freezed == companyID ? _self.companyID : companyID // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [WorkScopeNestedModel].
extension WorkScopeNestedModelPatterns on WorkScopeNestedModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WorkScopeNestedModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WorkScopeNestedModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WorkScopeNestedModel value)  $default,){
final _that = this;
switch (_that) {
case _WorkScopeNestedModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WorkScopeNestedModel value)?  $default,){
final _that = this;
switch (_that) {
case _WorkScopeNestedModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  String? uid,  String? name,  String? code,  String? description,  bool? allowMultipleQuantities,  int? companyID,  String? createdAt,  String? updatedAt,  String? deletedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WorkScopeNestedModel() when $default != null:
return $default(_that.id,_that.uid,_that.name,_that.code,_that.description,_that.allowMultipleQuantities,_that.companyID,_that.createdAt,_that.updatedAt,_that.deletedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  String? uid,  String? name,  String? code,  String? description,  bool? allowMultipleQuantities,  int? companyID,  String? createdAt,  String? updatedAt,  String? deletedAt)  $default,) {final _that = this;
switch (_that) {
case _WorkScopeNestedModel():
return $default(_that.id,_that.uid,_that.name,_that.code,_that.description,_that.allowMultipleQuantities,_that.companyID,_that.createdAt,_that.updatedAt,_that.deletedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  String? uid,  String? name,  String? code,  String? description,  bool? allowMultipleQuantities,  int? companyID,  String? createdAt,  String? updatedAt,  String? deletedAt)?  $default,) {final _that = this;
switch (_that) {
case _WorkScopeNestedModel() when $default != null:
return $default(_that.id,_that.uid,_that.name,_that.code,_that.description,_that.allowMultipleQuantities,_that.companyID,_that.createdAt,_that.updatedAt,_that.deletedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WorkScopeNestedModel implements WorkScopeNestedModel {
  const _WorkScopeNestedModel({this.id, this.uid, this.name, this.code, this.description, this.allowMultipleQuantities, this.companyID, this.createdAt, this.updatedAt, this.deletedAt});
  factory _WorkScopeNestedModel.fromJson(Map<String, dynamic> json) => _$WorkScopeNestedModelFromJson(json);

@override final  int? id;
@override final  String? uid;
@override final  String? name;
@override final  String? code;
@override final  String? description;
@override final  bool? allowMultipleQuantities;
@override final  int? companyID;
@override final  String? createdAt;
@override final  String? updatedAt;
@override final  String? deletedAt;

/// Create a copy of WorkScopeNestedModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WorkScopeNestedModelCopyWith<_WorkScopeNestedModel> get copyWith => __$WorkScopeNestedModelCopyWithImpl<_WorkScopeNestedModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WorkScopeNestedModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WorkScopeNestedModel&&(identical(other.id, id) || other.id == id)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.name, name) || other.name == name)&&(identical(other.code, code) || other.code == code)&&(identical(other.description, description) || other.description == description)&&(identical(other.allowMultipleQuantities, allowMultipleQuantities) || other.allowMultipleQuantities == allowMultipleQuantities)&&(identical(other.companyID, companyID) || other.companyID == companyID)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,uid,name,code,description,allowMultipleQuantities,companyID,createdAt,updatedAt,deletedAt);

@override
String toString() {
  return 'WorkScopeNestedModel(id: $id, uid: $uid, name: $name, code: $code, description: $description, allowMultipleQuantities: $allowMultipleQuantities, companyID: $companyID, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt)';
}


}

/// @nodoc
abstract mixin class _$WorkScopeNestedModelCopyWith<$Res> implements $WorkScopeNestedModelCopyWith<$Res> {
  factory _$WorkScopeNestedModelCopyWith(_WorkScopeNestedModel value, $Res Function(_WorkScopeNestedModel) _then) = __$WorkScopeNestedModelCopyWithImpl;
@override @useResult
$Res call({
 int? id, String? uid, String? name, String? code, String? description, bool? allowMultipleQuantities, int? companyID, String? createdAt, String? updatedAt, String? deletedAt
});




}
/// @nodoc
class __$WorkScopeNestedModelCopyWithImpl<$Res>
    implements _$WorkScopeNestedModelCopyWith<$Res> {
  __$WorkScopeNestedModelCopyWithImpl(this._self, this._then);

  final _WorkScopeNestedModel _self;
  final $Res Function(_WorkScopeNestedModel) _then;

/// Create a copy of WorkScopeNestedModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? uid = freezed,Object? name = freezed,Object? code = freezed,Object? description = freezed,Object? allowMultipleQuantities = freezed,Object? companyID = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? deletedAt = freezed,}) {
  return _then(_WorkScopeNestedModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,uid: freezed == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,allowMultipleQuantities: freezed == allowMultipleQuantities ? _self.allowMultipleQuantities : allowMultipleQuantities // ignore: cast_nullable_to_non_nullable
as bool?,companyID: freezed == companyID ? _self.companyID : companyID // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
