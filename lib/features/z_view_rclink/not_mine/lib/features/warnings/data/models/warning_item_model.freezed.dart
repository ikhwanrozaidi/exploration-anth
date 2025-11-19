// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'warning_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WarningItemModel {

 int get id; String get uid; int get warningID; int get warningReasonID; String? get notes; bool get isCompleted; DateTime? get completedAt; DateTime get createdAt; DateTime get updatedAt;// Optional nested warning reason
 WarningReasonModel? get warningReason;
/// Create a copy of WarningItemModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WarningItemModelCopyWith<WarningItemModel> get copyWith => _$WarningItemModelCopyWithImpl<WarningItemModel>(this as WarningItemModel, _$identity);

  /// Serializes this WarningItemModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WarningItemModel&&(identical(other.id, id) || other.id == id)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.warningID, warningID) || other.warningID == warningID)&&(identical(other.warningReasonID, warningReasonID) || other.warningReasonID == warningReasonID)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.isCompleted, isCompleted) || other.isCompleted == isCompleted)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.warningReason, warningReason) || other.warningReason == warningReason));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,uid,warningID,warningReasonID,notes,isCompleted,completedAt,createdAt,updatedAt,warningReason);

@override
String toString() {
  return 'WarningItemModel(id: $id, uid: $uid, warningID: $warningID, warningReasonID: $warningReasonID, notes: $notes, isCompleted: $isCompleted, completedAt: $completedAt, createdAt: $createdAt, updatedAt: $updatedAt, warningReason: $warningReason)';
}


}

/// @nodoc
abstract mixin class $WarningItemModelCopyWith<$Res>  {
  factory $WarningItemModelCopyWith(WarningItemModel value, $Res Function(WarningItemModel) _then) = _$WarningItemModelCopyWithImpl;
@useResult
$Res call({
 int id, String uid, int warningID, int warningReasonID, String? notes, bool isCompleted, DateTime? completedAt, DateTime createdAt, DateTime updatedAt, WarningReasonModel? warningReason
});


$WarningReasonModelCopyWith<$Res>? get warningReason;

}
/// @nodoc
class _$WarningItemModelCopyWithImpl<$Res>
    implements $WarningItemModelCopyWith<$Res> {
  _$WarningItemModelCopyWithImpl(this._self, this._then);

  final WarningItemModel _self;
  final $Res Function(WarningItemModel) _then;

/// Create a copy of WarningItemModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? uid = null,Object? warningID = null,Object? warningReasonID = null,Object? notes = freezed,Object? isCompleted = null,Object? completedAt = freezed,Object? createdAt = null,Object? updatedAt = null,Object? warningReason = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,warningID: null == warningID ? _self.warningID : warningID // ignore: cast_nullable_to_non_nullable
as int,warningReasonID: null == warningReasonID ? _self.warningReasonID : warningReasonID // ignore: cast_nullable_to_non_nullable
as int,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,isCompleted: null == isCompleted ? _self.isCompleted : isCompleted // ignore: cast_nullable_to_non_nullable
as bool,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,warningReason: freezed == warningReason ? _self.warningReason : warningReason // ignore: cast_nullable_to_non_nullable
as WarningReasonModel?,
  ));
}
/// Create a copy of WarningItemModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WarningReasonModelCopyWith<$Res>? get warningReason {
    if (_self.warningReason == null) {
    return null;
  }

  return $WarningReasonModelCopyWith<$Res>(_self.warningReason!, (value) {
    return _then(_self.copyWith(warningReason: value));
  });
}
}


/// Adds pattern-matching-related methods to [WarningItemModel].
extension WarningItemModelPatterns on WarningItemModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WarningItemModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WarningItemModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WarningItemModel value)  $default,){
final _that = this;
switch (_that) {
case _WarningItemModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WarningItemModel value)?  $default,){
final _that = this;
switch (_that) {
case _WarningItemModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String uid,  int warningID,  int warningReasonID,  String? notes,  bool isCompleted,  DateTime? completedAt,  DateTime createdAt,  DateTime updatedAt,  WarningReasonModel? warningReason)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WarningItemModel() when $default != null:
return $default(_that.id,_that.uid,_that.warningID,_that.warningReasonID,_that.notes,_that.isCompleted,_that.completedAt,_that.createdAt,_that.updatedAt,_that.warningReason);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String uid,  int warningID,  int warningReasonID,  String? notes,  bool isCompleted,  DateTime? completedAt,  DateTime createdAt,  DateTime updatedAt,  WarningReasonModel? warningReason)  $default,) {final _that = this;
switch (_that) {
case _WarningItemModel():
return $default(_that.id,_that.uid,_that.warningID,_that.warningReasonID,_that.notes,_that.isCompleted,_that.completedAt,_that.createdAt,_that.updatedAt,_that.warningReason);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String uid,  int warningID,  int warningReasonID,  String? notes,  bool isCompleted,  DateTime? completedAt,  DateTime createdAt,  DateTime updatedAt,  WarningReasonModel? warningReason)?  $default,) {final _that = this;
switch (_that) {
case _WarningItemModel() when $default != null:
return $default(_that.id,_that.uid,_that.warningID,_that.warningReasonID,_that.notes,_that.isCompleted,_that.completedAt,_that.createdAt,_that.updatedAt,_that.warningReason);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WarningItemModel extends WarningItemModel {
  const _WarningItemModel({required this.id, required this.uid, required this.warningID, required this.warningReasonID, this.notes, this.isCompleted = false, this.completedAt, required this.createdAt, required this.updatedAt, this.warningReason}): super._();
  factory _WarningItemModel.fromJson(Map<String, dynamic> json) => _$WarningItemModelFromJson(json);

@override final  int id;
@override final  String uid;
@override final  int warningID;
@override final  int warningReasonID;
@override final  String? notes;
@override@JsonKey() final  bool isCompleted;
@override final  DateTime? completedAt;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;
// Optional nested warning reason
@override final  WarningReasonModel? warningReason;

/// Create a copy of WarningItemModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WarningItemModelCopyWith<_WarningItemModel> get copyWith => __$WarningItemModelCopyWithImpl<_WarningItemModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WarningItemModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WarningItemModel&&(identical(other.id, id) || other.id == id)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.warningID, warningID) || other.warningID == warningID)&&(identical(other.warningReasonID, warningReasonID) || other.warningReasonID == warningReasonID)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.isCompleted, isCompleted) || other.isCompleted == isCompleted)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.warningReason, warningReason) || other.warningReason == warningReason));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,uid,warningID,warningReasonID,notes,isCompleted,completedAt,createdAt,updatedAt,warningReason);

@override
String toString() {
  return 'WarningItemModel(id: $id, uid: $uid, warningID: $warningID, warningReasonID: $warningReasonID, notes: $notes, isCompleted: $isCompleted, completedAt: $completedAt, createdAt: $createdAt, updatedAt: $updatedAt, warningReason: $warningReason)';
}


}

/// @nodoc
abstract mixin class _$WarningItemModelCopyWith<$Res> implements $WarningItemModelCopyWith<$Res> {
  factory _$WarningItemModelCopyWith(_WarningItemModel value, $Res Function(_WarningItemModel) _then) = __$WarningItemModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String uid, int warningID, int warningReasonID, String? notes, bool isCompleted, DateTime? completedAt, DateTime createdAt, DateTime updatedAt, WarningReasonModel? warningReason
});


@override $WarningReasonModelCopyWith<$Res>? get warningReason;

}
/// @nodoc
class __$WarningItemModelCopyWithImpl<$Res>
    implements _$WarningItemModelCopyWith<$Res> {
  __$WarningItemModelCopyWithImpl(this._self, this._then);

  final _WarningItemModel _self;
  final $Res Function(_WarningItemModel) _then;

/// Create a copy of WarningItemModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? uid = null,Object? warningID = null,Object? warningReasonID = null,Object? notes = freezed,Object? isCompleted = null,Object? completedAt = freezed,Object? createdAt = null,Object? updatedAt = null,Object? warningReason = freezed,}) {
  return _then(_WarningItemModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,warningID: null == warningID ? _self.warningID : warningID // ignore: cast_nullable_to_non_nullable
as int,warningReasonID: null == warningReasonID ? _self.warningReasonID : warningReasonID // ignore: cast_nullable_to_non_nullable
as int,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,isCompleted: null == isCompleted ? _self.isCompleted : isCompleted // ignore: cast_nullable_to_non_nullable
as bool,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,warningReason: freezed == warningReason ? _self.warningReason : warningReason // ignore: cast_nullable_to_non_nullable
as WarningReasonModel?,
  ));
}

/// Create a copy of WarningItemModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WarningReasonModelCopyWith<$Res>? get warningReason {
    if (_self.warningReason == null) {
    return null;
  }

  return $WarningReasonModelCopyWith<$Res>(_self.warningReason!, (value) {
    return _then(_self.copyWith(warningReason: value));
  });
}
}

// dart format on
