// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'scope_of_work_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ScopeOfWorkModel {

 int get id; String get uid; String get name; String get code; String get description; bool get allowMultipleQuantities; DateTime get createdAt; DateTime get updatedAt; DateTime? get deletedAt; int get companyID; List<WorkQuantityTypeModel> get workQuantityTypes; List<WorkEquipmentModel> get workEquipments;
/// Create a copy of ScopeOfWorkModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ScopeOfWorkModelCopyWith<ScopeOfWorkModel> get copyWith => _$ScopeOfWorkModelCopyWithImpl<ScopeOfWorkModel>(this as ScopeOfWorkModel, _$identity);

  /// Serializes this ScopeOfWorkModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScopeOfWorkModel&&(identical(other.id, id) || other.id == id)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.name, name) || other.name == name)&&(identical(other.code, code) || other.code == code)&&(identical(other.description, description) || other.description == description)&&(identical(other.allowMultipleQuantities, allowMultipleQuantities) || other.allowMultipleQuantities == allowMultipleQuantities)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt)&&(identical(other.companyID, companyID) || other.companyID == companyID)&&const DeepCollectionEquality().equals(other.workQuantityTypes, workQuantityTypes)&&const DeepCollectionEquality().equals(other.workEquipments, workEquipments));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,uid,name,code,description,allowMultipleQuantities,createdAt,updatedAt,deletedAt,companyID,const DeepCollectionEquality().hash(workQuantityTypes),const DeepCollectionEquality().hash(workEquipments));

@override
String toString() {
  return 'ScopeOfWorkModel(id: $id, uid: $uid, name: $name, code: $code, description: $description, allowMultipleQuantities: $allowMultipleQuantities, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt, companyID: $companyID, workQuantityTypes: $workQuantityTypes, workEquipments: $workEquipments)';
}


}

/// @nodoc
abstract mixin class $ScopeOfWorkModelCopyWith<$Res>  {
  factory $ScopeOfWorkModelCopyWith(ScopeOfWorkModel value, $Res Function(ScopeOfWorkModel) _then) = _$ScopeOfWorkModelCopyWithImpl;
@useResult
$Res call({
 int id, String uid, String name, String code, String description, bool allowMultipleQuantities, DateTime createdAt, DateTime updatedAt, DateTime? deletedAt, int companyID, List<WorkQuantityTypeModel> workQuantityTypes, List<WorkEquipmentModel> workEquipments
});




}
/// @nodoc
class _$ScopeOfWorkModelCopyWithImpl<$Res>
    implements $ScopeOfWorkModelCopyWith<$Res> {
  _$ScopeOfWorkModelCopyWithImpl(this._self, this._then);

  final ScopeOfWorkModel _self;
  final $Res Function(ScopeOfWorkModel) _then;

/// Create a copy of ScopeOfWorkModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? uid = null,Object? name = null,Object? code = null,Object? description = null,Object? allowMultipleQuantities = null,Object? createdAt = null,Object? updatedAt = null,Object? deletedAt = freezed,Object? companyID = null,Object? workQuantityTypes = null,Object? workEquipments = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,allowMultipleQuantities: null == allowMultipleQuantities ? _self.allowMultipleQuantities : allowMultipleQuantities // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,companyID: null == companyID ? _self.companyID : companyID // ignore: cast_nullable_to_non_nullable
as int,workQuantityTypes: null == workQuantityTypes ? _self.workQuantityTypes : workQuantityTypes // ignore: cast_nullable_to_non_nullable
as List<WorkQuantityTypeModel>,workEquipments: null == workEquipments ? _self.workEquipments : workEquipments // ignore: cast_nullable_to_non_nullable
as List<WorkEquipmentModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [ScopeOfWorkModel].
extension ScopeOfWorkModelPatterns on ScopeOfWorkModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ScopeOfWorkModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ScopeOfWorkModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ScopeOfWorkModel value)  $default,){
final _that = this;
switch (_that) {
case _ScopeOfWorkModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ScopeOfWorkModel value)?  $default,){
final _that = this;
switch (_that) {
case _ScopeOfWorkModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String uid,  String name,  String code,  String description,  bool allowMultipleQuantities,  DateTime createdAt,  DateTime updatedAt,  DateTime? deletedAt,  int companyID,  List<WorkQuantityTypeModel> workQuantityTypes,  List<WorkEquipmentModel> workEquipments)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ScopeOfWorkModel() when $default != null:
return $default(_that.id,_that.uid,_that.name,_that.code,_that.description,_that.allowMultipleQuantities,_that.createdAt,_that.updatedAt,_that.deletedAt,_that.companyID,_that.workQuantityTypes,_that.workEquipments);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String uid,  String name,  String code,  String description,  bool allowMultipleQuantities,  DateTime createdAt,  DateTime updatedAt,  DateTime? deletedAt,  int companyID,  List<WorkQuantityTypeModel> workQuantityTypes,  List<WorkEquipmentModel> workEquipments)  $default,) {final _that = this;
switch (_that) {
case _ScopeOfWorkModel():
return $default(_that.id,_that.uid,_that.name,_that.code,_that.description,_that.allowMultipleQuantities,_that.createdAt,_that.updatedAt,_that.deletedAt,_that.companyID,_that.workQuantityTypes,_that.workEquipments);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String uid,  String name,  String code,  String description,  bool allowMultipleQuantities,  DateTime createdAt,  DateTime updatedAt,  DateTime? deletedAt,  int companyID,  List<WorkQuantityTypeModel> workQuantityTypes,  List<WorkEquipmentModel> workEquipments)?  $default,) {final _that = this;
switch (_that) {
case _ScopeOfWorkModel() when $default != null:
return $default(_that.id,_that.uid,_that.name,_that.code,_that.description,_that.allowMultipleQuantities,_that.createdAt,_that.updatedAt,_that.deletedAt,_that.companyID,_that.workQuantityTypes,_that.workEquipments);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ScopeOfWorkModel extends ScopeOfWorkModel {
  const _ScopeOfWorkModel({required this.id, required this.uid, required this.name, required this.code, required this.description, required this.allowMultipleQuantities, required this.createdAt, required this.updatedAt, this.deletedAt, required this.companyID, final  List<WorkQuantityTypeModel> workQuantityTypes = const [], final  List<WorkEquipmentModel> workEquipments = const []}): _workQuantityTypes = workQuantityTypes,_workEquipments = workEquipments,super._();
  factory _ScopeOfWorkModel.fromJson(Map<String, dynamic> json) => _$ScopeOfWorkModelFromJson(json);

@override final  int id;
@override final  String uid;
@override final  String name;
@override final  String code;
@override final  String description;
@override final  bool allowMultipleQuantities;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;
@override final  DateTime? deletedAt;
@override final  int companyID;
 final  List<WorkQuantityTypeModel> _workQuantityTypes;
@override@JsonKey() List<WorkQuantityTypeModel> get workQuantityTypes {
  if (_workQuantityTypes is EqualUnmodifiableListView) return _workQuantityTypes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_workQuantityTypes);
}

 final  List<WorkEquipmentModel> _workEquipments;
@override@JsonKey() List<WorkEquipmentModel> get workEquipments {
  if (_workEquipments is EqualUnmodifiableListView) return _workEquipments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_workEquipments);
}


/// Create a copy of ScopeOfWorkModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ScopeOfWorkModelCopyWith<_ScopeOfWorkModel> get copyWith => __$ScopeOfWorkModelCopyWithImpl<_ScopeOfWorkModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ScopeOfWorkModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ScopeOfWorkModel&&(identical(other.id, id) || other.id == id)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.name, name) || other.name == name)&&(identical(other.code, code) || other.code == code)&&(identical(other.description, description) || other.description == description)&&(identical(other.allowMultipleQuantities, allowMultipleQuantities) || other.allowMultipleQuantities == allowMultipleQuantities)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt)&&(identical(other.companyID, companyID) || other.companyID == companyID)&&const DeepCollectionEquality().equals(other._workQuantityTypes, _workQuantityTypes)&&const DeepCollectionEquality().equals(other._workEquipments, _workEquipments));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,uid,name,code,description,allowMultipleQuantities,createdAt,updatedAt,deletedAt,companyID,const DeepCollectionEquality().hash(_workQuantityTypes),const DeepCollectionEquality().hash(_workEquipments));

@override
String toString() {
  return 'ScopeOfWorkModel(id: $id, uid: $uid, name: $name, code: $code, description: $description, allowMultipleQuantities: $allowMultipleQuantities, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt, companyID: $companyID, workQuantityTypes: $workQuantityTypes, workEquipments: $workEquipments)';
}


}

/// @nodoc
abstract mixin class _$ScopeOfWorkModelCopyWith<$Res> implements $ScopeOfWorkModelCopyWith<$Res> {
  factory _$ScopeOfWorkModelCopyWith(_ScopeOfWorkModel value, $Res Function(_ScopeOfWorkModel) _then) = __$ScopeOfWorkModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String uid, String name, String code, String description, bool allowMultipleQuantities, DateTime createdAt, DateTime updatedAt, DateTime? deletedAt, int companyID, List<WorkQuantityTypeModel> workQuantityTypes, List<WorkEquipmentModel> workEquipments
});




}
/// @nodoc
class __$ScopeOfWorkModelCopyWithImpl<$Res>
    implements _$ScopeOfWorkModelCopyWith<$Res> {
  __$ScopeOfWorkModelCopyWithImpl(this._self, this._then);

  final _ScopeOfWorkModel _self;
  final $Res Function(_ScopeOfWorkModel) _then;

/// Create a copy of ScopeOfWorkModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? uid = null,Object? name = null,Object? code = null,Object? description = null,Object? allowMultipleQuantities = null,Object? createdAt = null,Object? updatedAt = null,Object? deletedAt = freezed,Object? companyID = null,Object? workQuantityTypes = null,Object? workEquipments = null,}) {
  return _then(_ScopeOfWorkModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,allowMultipleQuantities: null == allowMultipleQuantities ? _self.allowMultipleQuantities : allowMultipleQuantities // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,companyID: null == companyID ? _self.companyID : companyID // ignore: cast_nullable_to_non_nullable
as int,workQuantityTypes: null == workQuantityTypes ? _self._workQuantityTypes : workQuantityTypes // ignore: cast_nullable_to_non_nullable
as List<WorkQuantityTypeModel>,workEquipments: null == workEquipments ? _self._workEquipments : workEquipments // ignore: cast_nullable_to_non_nullable
as List<WorkEquipmentModel>,
  ));
}


}

// dart format on
