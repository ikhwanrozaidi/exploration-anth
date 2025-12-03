// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'warning_reason_with_work_scope_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WarningReasonWithWorkScopeModel {

 int get id; String get uid; String get name; String get warningType; int get categoryID; int get workScopeID; bool get requiresAction; bool get isActive; int get displayOrder; DateTime? get createdAt; DateTime? get updatedAt;// Nested work scope info
 WorkScopeResponseModel? get workScope;
/// Create a copy of WarningReasonWithWorkScopeModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WarningReasonWithWorkScopeModelCopyWith<WarningReasonWithWorkScopeModel> get copyWith => _$WarningReasonWithWorkScopeModelCopyWithImpl<WarningReasonWithWorkScopeModel>(this as WarningReasonWithWorkScopeModel, _$identity);

  /// Serializes this WarningReasonWithWorkScopeModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WarningReasonWithWorkScopeModel&&(identical(other.id, id) || other.id == id)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.name, name) || other.name == name)&&(identical(other.warningType, warningType) || other.warningType == warningType)&&(identical(other.categoryID, categoryID) || other.categoryID == categoryID)&&(identical(other.workScopeID, workScopeID) || other.workScopeID == workScopeID)&&(identical(other.requiresAction, requiresAction) || other.requiresAction == requiresAction)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.displayOrder, displayOrder) || other.displayOrder == displayOrder)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.workScope, workScope) || other.workScope == workScope));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,uid,name,warningType,categoryID,workScopeID,requiresAction,isActive,displayOrder,createdAt,updatedAt,workScope);

@override
String toString() {
  return 'WarningReasonWithWorkScopeModel(id: $id, uid: $uid, name: $name, warningType: $warningType, categoryID: $categoryID, workScopeID: $workScopeID, requiresAction: $requiresAction, isActive: $isActive, displayOrder: $displayOrder, createdAt: $createdAt, updatedAt: $updatedAt, workScope: $workScope)';
}


}

/// @nodoc
abstract mixin class $WarningReasonWithWorkScopeModelCopyWith<$Res>  {
  factory $WarningReasonWithWorkScopeModelCopyWith(WarningReasonWithWorkScopeModel value, $Res Function(WarningReasonWithWorkScopeModel) _then) = _$WarningReasonWithWorkScopeModelCopyWithImpl;
@useResult
$Res call({
 int id, String uid, String name, String warningType, int categoryID, int workScopeID, bool requiresAction, bool isActive, int displayOrder, DateTime? createdAt, DateTime? updatedAt, WorkScopeResponseModel? workScope
});


$WorkScopeResponseModelCopyWith<$Res>? get workScope;

}
/// @nodoc
class _$WarningReasonWithWorkScopeModelCopyWithImpl<$Res>
    implements $WarningReasonWithWorkScopeModelCopyWith<$Res> {
  _$WarningReasonWithWorkScopeModelCopyWithImpl(this._self, this._then);

  final WarningReasonWithWorkScopeModel _self;
  final $Res Function(WarningReasonWithWorkScopeModel) _then;

/// Create a copy of WarningReasonWithWorkScopeModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? uid = null,Object? name = null,Object? warningType = null,Object? categoryID = null,Object? workScopeID = null,Object? requiresAction = null,Object? isActive = null,Object? displayOrder = null,Object? createdAt = freezed,Object? updatedAt = freezed,Object? workScope = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,warningType: null == warningType ? _self.warningType : warningType // ignore: cast_nullable_to_non_nullable
as String,categoryID: null == categoryID ? _self.categoryID : categoryID // ignore: cast_nullable_to_non_nullable
as int,workScopeID: null == workScopeID ? _self.workScopeID : workScopeID // ignore: cast_nullable_to_non_nullable
as int,requiresAction: null == requiresAction ? _self.requiresAction : requiresAction // ignore: cast_nullable_to_non_nullable
as bool,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,displayOrder: null == displayOrder ? _self.displayOrder : displayOrder // ignore: cast_nullable_to_non_nullable
as int,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,workScope: freezed == workScope ? _self.workScope : workScope // ignore: cast_nullable_to_non_nullable
as WorkScopeResponseModel?,
  ));
}
/// Create a copy of WarningReasonWithWorkScopeModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WorkScopeResponseModelCopyWith<$Res>? get workScope {
    if (_self.workScope == null) {
    return null;
  }

  return $WorkScopeResponseModelCopyWith<$Res>(_self.workScope!, (value) {
    return _then(_self.copyWith(workScope: value));
  });
}
}


/// Adds pattern-matching-related methods to [WarningReasonWithWorkScopeModel].
extension WarningReasonWithWorkScopeModelPatterns on WarningReasonWithWorkScopeModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WarningReasonWithWorkScopeModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WarningReasonWithWorkScopeModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WarningReasonWithWorkScopeModel value)  $default,){
final _that = this;
switch (_that) {
case _WarningReasonWithWorkScopeModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WarningReasonWithWorkScopeModel value)?  $default,){
final _that = this;
switch (_that) {
case _WarningReasonWithWorkScopeModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String uid,  String name,  String warningType,  int categoryID,  int workScopeID,  bool requiresAction,  bool isActive,  int displayOrder,  DateTime? createdAt,  DateTime? updatedAt,  WorkScopeResponseModel? workScope)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WarningReasonWithWorkScopeModel() when $default != null:
return $default(_that.id,_that.uid,_that.name,_that.warningType,_that.categoryID,_that.workScopeID,_that.requiresAction,_that.isActive,_that.displayOrder,_that.createdAt,_that.updatedAt,_that.workScope);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String uid,  String name,  String warningType,  int categoryID,  int workScopeID,  bool requiresAction,  bool isActive,  int displayOrder,  DateTime? createdAt,  DateTime? updatedAt,  WorkScopeResponseModel? workScope)  $default,) {final _that = this;
switch (_that) {
case _WarningReasonWithWorkScopeModel():
return $default(_that.id,_that.uid,_that.name,_that.warningType,_that.categoryID,_that.workScopeID,_that.requiresAction,_that.isActive,_that.displayOrder,_that.createdAt,_that.updatedAt,_that.workScope);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String uid,  String name,  String warningType,  int categoryID,  int workScopeID,  bool requiresAction,  bool isActive,  int displayOrder,  DateTime? createdAt,  DateTime? updatedAt,  WorkScopeResponseModel? workScope)?  $default,) {final _that = this;
switch (_that) {
case _WarningReasonWithWorkScopeModel() when $default != null:
return $default(_that.id,_that.uid,_that.name,_that.warningType,_that.categoryID,_that.workScopeID,_that.requiresAction,_that.isActive,_that.displayOrder,_that.createdAt,_that.updatedAt,_that.workScope);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WarningReasonWithWorkScopeModel extends WarningReasonWithWorkScopeModel {
  const _WarningReasonWithWorkScopeModel({required this.id, required this.uid, required this.name, required this.warningType, required this.categoryID, required this.workScopeID, this.requiresAction = true, this.isActive = true, this.displayOrder = 0, this.createdAt, this.updatedAt, this.workScope}): super._();
  factory _WarningReasonWithWorkScopeModel.fromJson(Map<String, dynamic> json) => _$WarningReasonWithWorkScopeModelFromJson(json);

@override final  int id;
@override final  String uid;
@override final  String name;
@override final  String warningType;
@override final  int categoryID;
@override final  int workScopeID;
@override@JsonKey() final  bool requiresAction;
@override@JsonKey() final  bool isActive;
@override@JsonKey() final  int displayOrder;
@override final  DateTime? createdAt;
@override final  DateTime? updatedAt;
// Nested work scope info
@override final  WorkScopeResponseModel? workScope;

/// Create a copy of WarningReasonWithWorkScopeModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WarningReasonWithWorkScopeModelCopyWith<_WarningReasonWithWorkScopeModel> get copyWith => __$WarningReasonWithWorkScopeModelCopyWithImpl<_WarningReasonWithWorkScopeModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WarningReasonWithWorkScopeModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WarningReasonWithWorkScopeModel&&(identical(other.id, id) || other.id == id)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.name, name) || other.name == name)&&(identical(other.warningType, warningType) || other.warningType == warningType)&&(identical(other.categoryID, categoryID) || other.categoryID == categoryID)&&(identical(other.workScopeID, workScopeID) || other.workScopeID == workScopeID)&&(identical(other.requiresAction, requiresAction) || other.requiresAction == requiresAction)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.displayOrder, displayOrder) || other.displayOrder == displayOrder)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.workScope, workScope) || other.workScope == workScope));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,uid,name,warningType,categoryID,workScopeID,requiresAction,isActive,displayOrder,createdAt,updatedAt,workScope);

@override
String toString() {
  return 'WarningReasonWithWorkScopeModel(id: $id, uid: $uid, name: $name, warningType: $warningType, categoryID: $categoryID, workScopeID: $workScopeID, requiresAction: $requiresAction, isActive: $isActive, displayOrder: $displayOrder, createdAt: $createdAt, updatedAt: $updatedAt, workScope: $workScope)';
}


}

/// @nodoc
abstract mixin class _$WarningReasonWithWorkScopeModelCopyWith<$Res> implements $WarningReasonWithWorkScopeModelCopyWith<$Res> {
  factory _$WarningReasonWithWorkScopeModelCopyWith(_WarningReasonWithWorkScopeModel value, $Res Function(_WarningReasonWithWorkScopeModel) _then) = __$WarningReasonWithWorkScopeModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String uid, String name, String warningType, int categoryID, int workScopeID, bool requiresAction, bool isActive, int displayOrder, DateTime? createdAt, DateTime? updatedAt, WorkScopeResponseModel? workScope
});


@override $WorkScopeResponseModelCopyWith<$Res>? get workScope;

}
/// @nodoc
class __$WarningReasonWithWorkScopeModelCopyWithImpl<$Res>
    implements _$WarningReasonWithWorkScopeModelCopyWith<$Res> {
  __$WarningReasonWithWorkScopeModelCopyWithImpl(this._self, this._then);

  final _WarningReasonWithWorkScopeModel _self;
  final $Res Function(_WarningReasonWithWorkScopeModel) _then;

/// Create a copy of WarningReasonWithWorkScopeModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? uid = null,Object? name = null,Object? warningType = null,Object? categoryID = null,Object? workScopeID = null,Object? requiresAction = null,Object? isActive = null,Object? displayOrder = null,Object? createdAt = freezed,Object? updatedAt = freezed,Object? workScope = freezed,}) {
  return _then(_WarningReasonWithWorkScopeModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,warningType: null == warningType ? _self.warningType : warningType // ignore: cast_nullable_to_non_nullable
as String,categoryID: null == categoryID ? _self.categoryID : categoryID // ignore: cast_nullable_to_non_nullable
as int,workScopeID: null == workScopeID ? _self.workScopeID : workScopeID // ignore: cast_nullable_to_non_nullable
as int,requiresAction: null == requiresAction ? _self.requiresAction : requiresAction // ignore: cast_nullable_to_non_nullable
as bool,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,displayOrder: null == displayOrder ? _self.displayOrder : displayOrder // ignore: cast_nullable_to_non_nullable
as int,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,workScope: freezed == workScope ? _self.workScope : workScope // ignore: cast_nullable_to_non_nullable
as WorkScopeResponseModel?,
  ));
}

/// Create a copy of WarningReasonWithWorkScopeModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WorkScopeResponseModelCopyWith<$Res>? get workScope {
    if (_self.workScope == null) {
    return null;
  }

  return $WorkScopeResponseModelCopyWith<$Res>(_self.workScope!, (value) {
    return _then(_self.copyWith(workScope: value));
  });
}
}

// dart format on
