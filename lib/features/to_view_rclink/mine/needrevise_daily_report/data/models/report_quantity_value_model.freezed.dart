// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'report_quantity_value_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ReportQuantityValueModel {

 int get id; int? get reportQuantityID;// For regular quantity entries
 int? get segmentID;// For segment entries (R02)
 int get quantityFieldID;// Foreign key to WorkQuantityFields
 String get value;// Store all values as string, parse based on fieldType
 DateTime get createdAt; DateTime get updatedAt;// Sync fields
 bool get isSynced; DateTime? get deletedAt; String? get syncAction; int get syncRetryCount; String? get syncError; DateTime? get lastSyncAttempt;
/// Create a copy of ReportQuantityValueModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReportQuantityValueModelCopyWith<ReportQuantityValueModel> get copyWith => _$ReportQuantityValueModelCopyWithImpl<ReportQuantityValueModel>(this as ReportQuantityValueModel, _$identity);

  /// Serializes this ReportQuantityValueModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReportQuantityValueModel&&(identical(other.id, id) || other.id == id)&&(identical(other.reportQuantityID, reportQuantityID) || other.reportQuantityID == reportQuantityID)&&(identical(other.segmentID, segmentID) || other.segmentID == segmentID)&&(identical(other.quantityFieldID, quantityFieldID) || other.quantityFieldID == quantityFieldID)&&(identical(other.value, value) || other.value == value)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.isSynced, isSynced) || other.isSynced == isSynced)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt)&&(identical(other.syncAction, syncAction) || other.syncAction == syncAction)&&(identical(other.syncRetryCount, syncRetryCount) || other.syncRetryCount == syncRetryCount)&&(identical(other.syncError, syncError) || other.syncError == syncError)&&(identical(other.lastSyncAttempt, lastSyncAttempt) || other.lastSyncAttempt == lastSyncAttempt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,reportQuantityID,segmentID,quantityFieldID,value,createdAt,updatedAt,isSynced,deletedAt,syncAction,syncRetryCount,syncError,lastSyncAttempt);

@override
String toString() {
  return 'ReportQuantityValueModel(id: $id, reportQuantityID: $reportQuantityID, segmentID: $segmentID, quantityFieldID: $quantityFieldID, value: $value, createdAt: $createdAt, updatedAt: $updatedAt, isSynced: $isSynced, deletedAt: $deletedAt, syncAction: $syncAction, syncRetryCount: $syncRetryCount, syncError: $syncError, lastSyncAttempt: $lastSyncAttempt)';
}


}

/// @nodoc
abstract mixin class $ReportQuantityValueModelCopyWith<$Res>  {
  factory $ReportQuantityValueModelCopyWith(ReportQuantityValueModel value, $Res Function(ReportQuantityValueModel) _then) = _$ReportQuantityValueModelCopyWithImpl;
@useResult
$Res call({
 int id, int? reportQuantityID, int? segmentID, int quantityFieldID, String value, DateTime createdAt, DateTime updatedAt, bool isSynced, DateTime? deletedAt, String? syncAction, int syncRetryCount, String? syncError, DateTime? lastSyncAttempt
});




}
/// @nodoc
class _$ReportQuantityValueModelCopyWithImpl<$Res>
    implements $ReportQuantityValueModelCopyWith<$Res> {
  _$ReportQuantityValueModelCopyWithImpl(this._self, this._then);

  final ReportQuantityValueModel _self;
  final $Res Function(ReportQuantityValueModel) _then;

/// Create a copy of ReportQuantityValueModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? reportQuantityID = freezed,Object? segmentID = freezed,Object? quantityFieldID = null,Object? value = null,Object? createdAt = null,Object? updatedAt = null,Object? isSynced = null,Object? deletedAt = freezed,Object? syncAction = freezed,Object? syncRetryCount = null,Object? syncError = freezed,Object? lastSyncAttempt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,reportQuantityID: freezed == reportQuantityID ? _self.reportQuantityID : reportQuantityID // ignore: cast_nullable_to_non_nullable
as int?,segmentID: freezed == segmentID ? _self.segmentID : segmentID // ignore: cast_nullable_to_non_nullable
as int?,quantityFieldID: null == quantityFieldID ? _self.quantityFieldID : quantityFieldID // ignore: cast_nullable_to_non_nullable
as int,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,isSynced: null == isSynced ? _self.isSynced : isSynced // ignore: cast_nullable_to_non_nullable
as bool,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,syncAction: freezed == syncAction ? _self.syncAction : syncAction // ignore: cast_nullable_to_non_nullable
as String?,syncRetryCount: null == syncRetryCount ? _self.syncRetryCount : syncRetryCount // ignore: cast_nullable_to_non_nullable
as int,syncError: freezed == syncError ? _self.syncError : syncError // ignore: cast_nullable_to_non_nullable
as String?,lastSyncAttempt: freezed == lastSyncAttempt ? _self.lastSyncAttempt : lastSyncAttempt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [ReportQuantityValueModel].
extension ReportQuantityValueModelPatterns on ReportQuantityValueModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReportQuantityValueModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReportQuantityValueModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReportQuantityValueModel value)  $default,){
final _that = this;
switch (_that) {
case _ReportQuantityValueModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReportQuantityValueModel value)?  $default,){
final _that = this;
switch (_that) {
case _ReportQuantityValueModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int? reportQuantityID,  int? segmentID,  int quantityFieldID,  String value,  DateTime createdAt,  DateTime updatedAt,  bool isSynced,  DateTime? deletedAt,  String? syncAction,  int syncRetryCount,  String? syncError,  DateTime? lastSyncAttempt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReportQuantityValueModel() when $default != null:
return $default(_that.id,_that.reportQuantityID,_that.segmentID,_that.quantityFieldID,_that.value,_that.createdAt,_that.updatedAt,_that.isSynced,_that.deletedAt,_that.syncAction,_that.syncRetryCount,_that.syncError,_that.lastSyncAttempt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int? reportQuantityID,  int? segmentID,  int quantityFieldID,  String value,  DateTime createdAt,  DateTime updatedAt,  bool isSynced,  DateTime? deletedAt,  String? syncAction,  int syncRetryCount,  String? syncError,  DateTime? lastSyncAttempt)  $default,) {final _that = this;
switch (_that) {
case _ReportQuantityValueModel():
return $default(_that.id,_that.reportQuantityID,_that.segmentID,_that.quantityFieldID,_that.value,_that.createdAt,_that.updatedAt,_that.isSynced,_that.deletedAt,_that.syncAction,_that.syncRetryCount,_that.syncError,_that.lastSyncAttempt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int? reportQuantityID,  int? segmentID,  int quantityFieldID,  String value,  DateTime createdAt,  DateTime updatedAt,  bool isSynced,  DateTime? deletedAt,  String? syncAction,  int syncRetryCount,  String? syncError,  DateTime? lastSyncAttempt)?  $default,) {final _that = this;
switch (_that) {
case _ReportQuantityValueModel() when $default != null:
return $default(_that.id,_that.reportQuantityID,_that.segmentID,_that.quantityFieldID,_that.value,_that.createdAt,_that.updatedAt,_that.isSynced,_that.deletedAt,_that.syncAction,_that.syncRetryCount,_that.syncError,_that.lastSyncAttempt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ReportQuantityValueModel implements ReportQuantityValueModel {
  const _ReportQuantityValueModel({required this.id, this.reportQuantityID, this.segmentID, required this.quantityFieldID, required this.value, required this.createdAt, required this.updatedAt, this.isSynced = false, this.deletedAt, this.syncAction, this.syncRetryCount = 0, this.syncError, this.lastSyncAttempt});
  factory _ReportQuantityValueModel.fromJson(Map<String, dynamic> json) => _$ReportQuantityValueModelFromJson(json);

@override final  int id;
@override final  int? reportQuantityID;
// For regular quantity entries
@override final  int? segmentID;
// For segment entries (R02)
@override final  int quantityFieldID;
// Foreign key to WorkQuantityFields
@override final  String value;
// Store all values as string, parse based on fieldType
@override final  DateTime createdAt;
@override final  DateTime updatedAt;
// Sync fields
@override@JsonKey() final  bool isSynced;
@override final  DateTime? deletedAt;
@override final  String? syncAction;
@override@JsonKey() final  int syncRetryCount;
@override final  String? syncError;
@override final  DateTime? lastSyncAttempt;

/// Create a copy of ReportQuantityValueModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReportQuantityValueModelCopyWith<_ReportQuantityValueModel> get copyWith => __$ReportQuantityValueModelCopyWithImpl<_ReportQuantityValueModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReportQuantityValueModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReportQuantityValueModel&&(identical(other.id, id) || other.id == id)&&(identical(other.reportQuantityID, reportQuantityID) || other.reportQuantityID == reportQuantityID)&&(identical(other.segmentID, segmentID) || other.segmentID == segmentID)&&(identical(other.quantityFieldID, quantityFieldID) || other.quantityFieldID == quantityFieldID)&&(identical(other.value, value) || other.value == value)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.isSynced, isSynced) || other.isSynced == isSynced)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt)&&(identical(other.syncAction, syncAction) || other.syncAction == syncAction)&&(identical(other.syncRetryCount, syncRetryCount) || other.syncRetryCount == syncRetryCount)&&(identical(other.syncError, syncError) || other.syncError == syncError)&&(identical(other.lastSyncAttempt, lastSyncAttempt) || other.lastSyncAttempt == lastSyncAttempt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,reportQuantityID,segmentID,quantityFieldID,value,createdAt,updatedAt,isSynced,deletedAt,syncAction,syncRetryCount,syncError,lastSyncAttempt);

@override
String toString() {
  return 'ReportQuantityValueModel(id: $id, reportQuantityID: $reportQuantityID, segmentID: $segmentID, quantityFieldID: $quantityFieldID, value: $value, createdAt: $createdAt, updatedAt: $updatedAt, isSynced: $isSynced, deletedAt: $deletedAt, syncAction: $syncAction, syncRetryCount: $syncRetryCount, syncError: $syncError, lastSyncAttempt: $lastSyncAttempt)';
}


}

/// @nodoc
abstract mixin class _$ReportQuantityValueModelCopyWith<$Res> implements $ReportQuantityValueModelCopyWith<$Res> {
  factory _$ReportQuantityValueModelCopyWith(_ReportQuantityValueModel value, $Res Function(_ReportQuantityValueModel) _then) = __$ReportQuantityValueModelCopyWithImpl;
@override @useResult
$Res call({
 int id, int? reportQuantityID, int? segmentID, int quantityFieldID, String value, DateTime createdAt, DateTime updatedAt, bool isSynced, DateTime? deletedAt, String? syncAction, int syncRetryCount, String? syncError, DateTime? lastSyncAttempt
});




}
/// @nodoc
class __$ReportQuantityValueModelCopyWithImpl<$Res>
    implements _$ReportQuantityValueModelCopyWith<$Res> {
  __$ReportQuantityValueModelCopyWithImpl(this._self, this._then);

  final _ReportQuantityValueModel _self;
  final $Res Function(_ReportQuantityValueModel) _then;

/// Create a copy of ReportQuantityValueModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? reportQuantityID = freezed,Object? segmentID = freezed,Object? quantityFieldID = null,Object? value = null,Object? createdAt = null,Object? updatedAt = null,Object? isSynced = null,Object? deletedAt = freezed,Object? syncAction = freezed,Object? syncRetryCount = null,Object? syncError = freezed,Object? lastSyncAttempt = freezed,}) {
  return _then(_ReportQuantityValueModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,reportQuantityID: freezed == reportQuantityID ? _self.reportQuantityID : reportQuantityID // ignore: cast_nullable_to_non_nullable
as int?,segmentID: freezed == segmentID ? _self.segmentID : segmentID // ignore: cast_nullable_to_non_nullable
as int?,quantityFieldID: null == quantityFieldID ? _self.quantityFieldID : quantityFieldID // ignore: cast_nullable_to_non_nullable
as int,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,isSynced: null == isSynced ? _self.isSynced : isSynced // ignore: cast_nullable_to_non_nullable
as bool,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,syncAction: freezed == syncAction ? _self.syncAction : syncAction // ignore: cast_nullable_to_non_nullable
as String?,syncRetryCount: null == syncRetryCount ? _self.syncRetryCount : syncRetryCount // ignore: cast_nullable_to_non_nullable
as int,syncError: freezed == syncError ? _self.syncError : syncError // ignore: cast_nullable_to_non_nullable
as String?,lastSyncAttempt: freezed == lastSyncAttempt ? _self.lastSyncAttempt : lastSyncAttempt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
