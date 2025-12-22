// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'warning_reason_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WarningReasonModel {

 int get id; String get uid; String get name; String get warningType;// Stored as string in API/DB
 int get categoryID; int get workScopeID; bool get requiresAction; bool get isActive; int get displayOrder; DateTime? get createdAt; DateTime? get updatedAt;// Optional nested category
 WarningCategoryModel? get category;
/// Create a copy of WarningReasonModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WarningReasonModelCopyWith<WarningReasonModel> get copyWith => _$WarningReasonModelCopyWithImpl<WarningReasonModel>(this as WarningReasonModel, _$identity);

  /// Serializes this WarningReasonModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WarningReasonModel&&(identical(other.id, id) || other.id == id)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.name, name) || other.name == name)&&(identical(other.warningType, warningType) || other.warningType == warningType)&&(identical(other.categoryID, categoryID) || other.categoryID == categoryID)&&(identical(other.workScopeID, workScopeID) || other.workScopeID == workScopeID)&&(identical(other.requiresAction, requiresAction) || other.requiresAction == requiresAction)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.displayOrder, displayOrder) || other.displayOrder == displayOrder)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.category, category) || other.category == category));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,uid,name,warningType,categoryID,workScopeID,requiresAction,isActive,displayOrder,createdAt,updatedAt,category);

@override
String toString() {
  return 'WarningReasonModel(id: $id, uid: $uid, name: $name, warningType: $warningType, categoryID: $categoryID, workScopeID: $workScopeID, requiresAction: $requiresAction, isActive: $isActive, displayOrder: $displayOrder, createdAt: $createdAt, updatedAt: $updatedAt, category: $category)';
}


}

/// @nodoc
abstract mixin class $WarningReasonModelCopyWith<$Res>  {
  factory $WarningReasonModelCopyWith(WarningReasonModel value, $Res Function(WarningReasonModel) _then) = _$WarningReasonModelCopyWithImpl;
@useResult
$Res call({
 int id, String uid, String name, String warningType, int categoryID, int workScopeID, bool requiresAction, bool isActive, int displayOrder, DateTime? createdAt, DateTime? updatedAt, WarningCategoryModel? category
});


$WarningCategoryModelCopyWith<$Res>? get category;

}
/// @nodoc
class _$WarningReasonModelCopyWithImpl<$Res>
    implements $WarningReasonModelCopyWith<$Res> {
  _$WarningReasonModelCopyWithImpl(this._self, this._then);

  final WarningReasonModel _self;
  final $Res Function(WarningReasonModel) _then;

/// Create a copy of WarningReasonModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? uid = null,Object? name = null,Object? warningType = null,Object? categoryID = null,Object? workScopeID = null,Object? requiresAction = null,Object? isActive = null,Object? displayOrder = null,Object? createdAt = freezed,Object? updatedAt = freezed,Object? category = freezed,}) {
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
as DateTime?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as WarningCategoryModel?,
  ));
}
/// Create a copy of WarningReasonModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WarningCategoryModelCopyWith<$Res>? get category {
    if (_self.category == null) {
    return null;
  }

  return $WarningCategoryModelCopyWith<$Res>(_self.category!, (value) {
    return _then(_self.copyWith(category: value));
  });
}
}


/// Adds pattern-matching-related methods to [WarningReasonModel].
extension WarningReasonModelPatterns on WarningReasonModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WarningReasonModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WarningReasonModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WarningReasonModel value)  $default,){
final _that = this;
switch (_that) {
case _WarningReasonModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WarningReasonModel value)?  $default,){
final _that = this;
switch (_that) {
case _WarningReasonModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String uid,  String name,  String warningType,  int categoryID,  int workScopeID,  bool requiresAction,  bool isActive,  int displayOrder,  DateTime? createdAt,  DateTime? updatedAt,  WarningCategoryModel? category)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WarningReasonModel() when $default != null:
return $default(_that.id,_that.uid,_that.name,_that.warningType,_that.categoryID,_that.workScopeID,_that.requiresAction,_that.isActive,_that.displayOrder,_that.createdAt,_that.updatedAt,_that.category);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String uid,  String name,  String warningType,  int categoryID,  int workScopeID,  bool requiresAction,  bool isActive,  int displayOrder,  DateTime? createdAt,  DateTime? updatedAt,  WarningCategoryModel? category)  $default,) {final _that = this;
switch (_that) {
case _WarningReasonModel():
return $default(_that.id,_that.uid,_that.name,_that.warningType,_that.categoryID,_that.workScopeID,_that.requiresAction,_that.isActive,_that.displayOrder,_that.createdAt,_that.updatedAt,_that.category);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String uid,  String name,  String warningType,  int categoryID,  int workScopeID,  bool requiresAction,  bool isActive,  int displayOrder,  DateTime? createdAt,  DateTime? updatedAt,  WarningCategoryModel? category)?  $default,) {final _that = this;
switch (_that) {
case _WarningReasonModel() when $default != null:
return $default(_that.id,_that.uid,_that.name,_that.warningType,_that.categoryID,_that.workScopeID,_that.requiresAction,_that.isActive,_that.displayOrder,_that.createdAt,_that.updatedAt,_that.category);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WarningReasonModel extends WarningReasonModel {
  const _WarningReasonModel({required this.id, required this.uid, required this.name, required this.warningType, required this.categoryID, required this.workScopeID, this.requiresAction = true, this.isActive = true, this.displayOrder = 0, this.createdAt, this.updatedAt, this.category}): super._();
  factory _WarningReasonModel.fromJson(Map<String, dynamic> json) => _$WarningReasonModelFromJson(json);

@override final  int id;
@override final  String uid;
@override final  String name;
@override final  String warningType;
// Stored as string in API/DB
@override final  int categoryID;
@override final  int workScopeID;
@override@JsonKey() final  bool requiresAction;
@override@JsonKey() final  bool isActive;
@override@JsonKey() final  int displayOrder;
@override final  DateTime? createdAt;
@override final  DateTime? updatedAt;
// Optional nested category
@override final  WarningCategoryModel? category;

/// Create a copy of WarningReasonModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WarningReasonModelCopyWith<_WarningReasonModel> get copyWith => __$WarningReasonModelCopyWithImpl<_WarningReasonModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WarningReasonModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WarningReasonModel&&(identical(other.id, id) || other.id == id)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.name, name) || other.name == name)&&(identical(other.warningType, warningType) || other.warningType == warningType)&&(identical(other.categoryID, categoryID) || other.categoryID == categoryID)&&(identical(other.workScopeID, workScopeID) || other.workScopeID == workScopeID)&&(identical(other.requiresAction, requiresAction) || other.requiresAction == requiresAction)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.displayOrder, displayOrder) || other.displayOrder == displayOrder)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.category, category) || other.category == category));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,uid,name,warningType,categoryID,workScopeID,requiresAction,isActive,displayOrder,createdAt,updatedAt,category);

@override
String toString() {
  return 'WarningReasonModel(id: $id, uid: $uid, name: $name, warningType: $warningType, categoryID: $categoryID, workScopeID: $workScopeID, requiresAction: $requiresAction, isActive: $isActive, displayOrder: $displayOrder, createdAt: $createdAt, updatedAt: $updatedAt, category: $category)';
}


}

/// @nodoc
abstract mixin class _$WarningReasonModelCopyWith<$Res> implements $WarningReasonModelCopyWith<$Res> {
  factory _$WarningReasonModelCopyWith(_WarningReasonModel value, $Res Function(_WarningReasonModel) _then) = __$WarningReasonModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String uid, String name, String warningType, int categoryID, int workScopeID, bool requiresAction, bool isActive, int displayOrder, DateTime? createdAt, DateTime? updatedAt, WarningCategoryModel? category
});


@override $WarningCategoryModelCopyWith<$Res>? get category;

}
/// @nodoc
class __$WarningReasonModelCopyWithImpl<$Res>
    implements _$WarningReasonModelCopyWith<$Res> {
  __$WarningReasonModelCopyWithImpl(this._self, this._then);

  final _WarningReasonModel _self;
  final $Res Function(_WarningReasonModel) _then;

/// Create a copy of WarningReasonModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? uid = null,Object? name = null,Object? warningType = null,Object? categoryID = null,Object? workScopeID = null,Object? requiresAction = null,Object? isActive = null,Object? displayOrder = null,Object? createdAt = freezed,Object? updatedAt = freezed,Object? category = freezed,}) {
  return _then(_WarningReasonModel(
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
as DateTime?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as WarningCategoryModel?,
  ));
}

/// Create a copy of WarningReasonModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WarningCategoryModelCopyWith<$Res>? get category {
    if (_self.category == null) {
    return null;
  }

  return $WarningCategoryModelCopyWith<$Res>(_self.category!, (value) {
    return _then(_self.copyWith(category: value));
  });
}
}

// dart format on
