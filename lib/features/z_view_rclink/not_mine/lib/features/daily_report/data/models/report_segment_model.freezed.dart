// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'report_segment_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ReportSegmentModel {

 int get id; int get reportQuantityID;// Foreign key to ReportQuantities
 int get segmentNumber;// 1, 2, 3... (segment sequence)
 double get startDistance;// 0, 25, 50...
 double get endDistance;// 25, 50, 75...
 DateTime get createdAt; DateTime get updatedAt;// Sync fields
 bool get isSynced; DateTime? get deletedAt; String? get syncAction; int get syncRetryCount; String? get syncError; DateTime? get lastSyncAttempt;
/// Create a copy of ReportSegmentModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReportSegmentModelCopyWith<ReportSegmentModel> get copyWith => _$ReportSegmentModelCopyWithImpl<ReportSegmentModel>(this as ReportSegmentModel, _$identity);

  /// Serializes this ReportSegmentModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReportSegmentModel&&(identical(other.id, id) || other.id == id)&&(identical(other.reportQuantityID, reportQuantityID) || other.reportQuantityID == reportQuantityID)&&(identical(other.segmentNumber, segmentNumber) || other.segmentNumber == segmentNumber)&&(identical(other.startDistance, startDistance) || other.startDistance == startDistance)&&(identical(other.endDistance, endDistance) || other.endDistance == endDistance)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.isSynced, isSynced) || other.isSynced == isSynced)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt)&&(identical(other.syncAction, syncAction) || other.syncAction == syncAction)&&(identical(other.syncRetryCount, syncRetryCount) || other.syncRetryCount == syncRetryCount)&&(identical(other.syncError, syncError) || other.syncError == syncError)&&(identical(other.lastSyncAttempt, lastSyncAttempt) || other.lastSyncAttempt == lastSyncAttempt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,reportQuantityID,segmentNumber,startDistance,endDistance,createdAt,updatedAt,isSynced,deletedAt,syncAction,syncRetryCount,syncError,lastSyncAttempt);

@override
String toString() {
  return 'ReportSegmentModel(id: $id, reportQuantityID: $reportQuantityID, segmentNumber: $segmentNumber, startDistance: $startDistance, endDistance: $endDistance, createdAt: $createdAt, updatedAt: $updatedAt, isSynced: $isSynced, deletedAt: $deletedAt, syncAction: $syncAction, syncRetryCount: $syncRetryCount, syncError: $syncError, lastSyncAttempt: $lastSyncAttempt)';
}


}

/// @nodoc
abstract mixin class $ReportSegmentModelCopyWith<$Res>  {
  factory $ReportSegmentModelCopyWith(ReportSegmentModel value, $Res Function(ReportSegmentModel) _then) = _$ReportSegmentModelCopyWithImpl;
@useResult
$Res call({
 int id, int reportQuantityID, int segmentNumber, double startDistance, double endDistance, DateTime createdAt, DateTime updatedAt, bool isSynced, DateTime? deletedAt, String? syncAction, int syncRetryCount, String? syncError, DateTime? lastSyncAttempt
});




}
/// @nodoc
class _$ReportSegmentModelCopyWithImpl<$Res>
    implements $ReportSegmentModelCopyWith<$Res> {
  _$ReportSegmentModelCopyWithImpl(this._self, this._then);

  final ReportSegmentModel _self;
  final $Res Function(ReportSegmentModel) _then;

/// Create a copy of ReportSegmentModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? reportQuantityID = null,Object? segmentNumber = null,Object? startDistance = null,Object? endDistance = null,Object? createdAt = null,Object? updatedAt = null,Object? isSynced = null,Object? deletedAt = freezed,Object? syncAction = freezed,Object? syncRetryCount = null,Object? syncError = freezed,Object? lastSyncAttempt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,reportQuantityID: null == reportQuantityID ? _self.reportQuantityID : reportQuantityID // ignore: cast_nullable_to_non_nullable
as int,segmentNumber: null == segmentNumber ? _self.segmentNumber : segmentNumber // ignore: cast_nullable_to_non_nullable
as int,startDistance: null == startDistance ? _self.startDistance : startDistance // ignore: cast_nullable_to_non_nullable
as double,endDistance: null == endDistance ? _self.endDistance : endDistance // ignore: cast_nullable_to_non_nullable
as double,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
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


/// Adds pattern-matching-related methods to [ReportSegmentModel].
extension ReportSegmentModelPatterns on ReportSegmentModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReportSegmentModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReportSegmentModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReportSegmentModel value)  $default,){
final _that = this;
switch (_that) {
case _ReportSegmentModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReportSegmentModel value)?  $default,){
final _that = this;
switch (_that) {
case _ReportSegmentModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int reportQuantityID,  int segmentNumber,  double startDistance,  double endDistance,  DateTime createdAt,  DateTime updatedAt,  bool isSynced,  DateTime? deletedAt,  String? syncAction,  int syncRetryCount,  String? syncError,  DateTime? lastSyncAttempt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReportSegmentModel() when $default != null:
return $default(_that.id,_that.reportQuantityID,_that.segmentNumber,_that.startDistance,_that.endDistance,_that.createdAt,_that.updatedAt,_that.isSynced,_that.deletedAt,_that.syncAction,_that.syncRetryCount,_that.syncError,_that.lastSyncAttempt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int reportQuantityID,  int segmentNumber,  double startDistance,  double endDistance,  DateTime createdAt,  DateTime updatedAt,  bool isSynced,  DateTime? deletedAt,  String? syncAction,  int syncRetryCount,  String? syncError,  DateTime? lastSyncAttempt)  $default,) {final _that = this;
switch (_that) {
case _ReportSegmentModel():
return $default(_that.id,_that.reportQuantityID,_that.segmentNumber,_that.startDistance,_that.endDistance,_that.createdAt,_that.updatedAt,_that.isSynced,_that.deletedAt,_that.syncAction,_that.syncRetryCount,_that.syncError,_that.lastSyncAttempt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int reportQuantityID,  int segmentNumber,  double startDistance,  double endDistance,  DateTime createdAt,  DateTime updatedAt,  bool isSynced,  DateTime? deletedAt,  String? syncAction,  int syncRetryCount,  String? syncError,  DateTime? lastSyncAttempt)?  $default,) {final _that = this;
switch (_that) {
case _ReportSegmentModel() when $default != null:
return $default(_that.id,_that.reportQuantityID,_that.segmentNumber,_that.startDistance,_that.endDistance,_that.createdAt,_that.updatedAt,_that.isSynced,_that.deletedAt,_that.syncAction,_that.syncRetryCount,_that.syncError,_that.lastSyncAttempt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ReportSegmentModel implements ReportSegmentModel {
  const _ReportSegmentModel({required this.id, required this.reportQuantityID, required this.segmentNumber, required this.startDistance, required this.endDistance, required this.createdAt, required this.updatedAt, this.isSynced = false, this.deletedAt, this.syncAction, this.syncRetryCount = 0, this.syncError, this.lastSyncAttempt});
  factory _ReportSegmentModel.fromJson(Map<String, dynamic> json) => _$ReportSegmentModelFromJson(json);

@override final  int id;
@override final  int reportQuantityID;
// Foreign key to ReportQuantities
@override final  int segmentNumber;
// 1, 2, 3... (segment sequence)
@override final  double startDistance;
// 0, 25, 50...
@override final  double endDistance;
// 25, 50, 75...
@override final  DateTime createdAt;
@override final  DateTime updatedAt;
// Sync fields
@override@JsonKey() final  bool isSynced;
@override final  DateTime? deletedAt;
@override final  String? syncAction;
@override@JsonKey() final  int syncRetryCount;
@override final  String? syncError;
@override final  DateTime? lastSyncAttempt;

/// Create a copy of ReportSegmentModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReportSegmentModelCopyWith<_ReportSegmentModel> get copyWith => __$ReportSegmentModelCopyWithImpl<_ReportSegmentModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReportSegmentModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReportSegmentModel&&(identical(other.id, id) || other.id == id)&&(identical(other.reportQuantityID, reportQuantityID) || other.reportQuantityID == reportQuantityID)&&(identical(other.segmentNumber, segmentNumber) || other.segmentNumber == segmentNumber)&&(identical(other.startDistance, startDistance) || other.startDistance == startDistance)&&(identical(other.endDistance, endDistance) || other.endDistance == endDistance)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.isSynced, isSynced) || other.isSynced == isSynced)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt)&&(identical(other.syncAction, syncAction) || other.syncAction == syncAction)&&(identical(other.syncRetryCount, syncRetryCount) || other.syncRetryCount == syncRetryCount)&&(identical(other.syncError, syncError) || other.syncError == syncError)&&(identical(other.lastSyncAttempt, lastSyncAttempt) || other.lastSyncAttempt == lastSyncAttempt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,reportQuantityID,segmentNumber,startDistance,endDistance,createdAt,updatedAt,isSynced,deletedAt,syncAction,syncRetryCount,syncError,lastSyncAttempt);

@override
String toString() {
  return 'ReportSegmentModel(id: $id, reportQuantityID: $reportQuantityID, segmentNumber: $segmentNumber, startDistance: $startDistance, endDistance: $endDistance, createdAt: $createdAt, updatedAt: $updatedAt, isSynced: $isSynced, deletedAt: $deletedAt, syncAction: $syncAction, syncRetryCount: $syncRetryCount, syncError: $syncError, lastSyncAttempt: $lastSyncAttempt)';
}


}

/// @nodoc
abstract mixin class _$ReportSegmentModelCopyWith<$Res> implements $ReportSegmentModelCopyWith<$Res> {
  factory _$ReportSegmentModelCopyWith(_ReportSegmentModel value, $Res Function(_ReportSegmentModel) _then) = __$ReportSegmentModelCopyWithImpl;
@override @useResult
$Res call({
 int id, int reportQuantityID, int segmentNumber, double startDistance, double endDistance, DateTime createdAt, DateTime updatedAt, bool isSynced, DateTime? deletedAt, String? syncAction, int syncRetryCount, String? syncError, DateTime? lastSyncAttempt
});




}
/// @nodoc
class __$ReportSegmentModelCopyWithImpl<$Res>
    implements _$ReportSegmentModelCopyWith<$Res> {
  __$ReportSegmentModelCopyWithImpl(this._self, this._then);

  final _ReportSegmentModel _self;
  final $Res Function(_ReportSegmentModel) _then;

/// Create a copy of ReportSegmentModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? reportQuantityID = null,Object? segmentNumber = null,Object? startDistance = null,Object? endDistance = null,Object? createdAt = null,Object? updatedAt = null,Object? isSynced = null,Object? deletedAt = freezed,Object? syncAction = freezed,Object? syncRetryCount = null,Object? syncError = freezed,Object? lastSyncAttempt = freezed,}) {
  return _then(_ReportSegmentModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,reportQuantityID: null == reportQuantityID ? _self.reportQuantityID : reportQuantityID // ignore: cast_nullable_to_non_nullable
as int,segmentNumber: null == segmentNumber ? _self.segmentNumber : segmentNumber // ignore: cast_nullable_to_non_nullable
as int,startDistance: null == startDistance ? _self.startDistance : startDistance // ignore: cast_nullable_to_non_nullable
as double,endDistance: null == endDistance ? _self.endDistance : endDistance // ignore: cast_nullable_to_non_nullable
as double,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
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
