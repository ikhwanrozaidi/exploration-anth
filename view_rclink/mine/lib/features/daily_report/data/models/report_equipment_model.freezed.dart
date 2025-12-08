// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'report_equipment_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ReportEquipmentModel {

 int get id; String get reportType;// 'DAILY_REPORT' (future: 'INSPECTION')
 int? get dailyReportID;// Reference to DailyReports if reportType is DAILY_REPORT
// Future: inspectionID for inspection module
 int get workEquipmentID;// Foreign key to WorkScopeEquipments
 int get addedByID;// Admin who added this equipment
 DateTime get createdAt;// Sync fields
 bool get isSynced; DateTime? get deletedAt; String? get syncAction; int get syncRetryCount; String? get syncError; DateTime? get lastSyncAttempt;
/// Create a copy of ReportEquipmentModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReportEquipmentModelCopyWith<ReportEquipmentModel> get copyWith => _$ReportEquipmentModelCopyWithImpl<ReportEquipmentModel>(this as ReportEquipmentModel, _$identity);

  /// Serializes this ReportEquipmentModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReportEquipmentModel&&(identical(other.id, id) || other.id == id)&&(identical(other.reportType, reportType) || other.reportType == reportType)&&(identical(other.dailyReportID, dailyReportID) || other.dailyReportID == dailyReportID)&&(identical(other.workEquipmentID, workEquipmentID) || other.workEquipmentID == workEquipmentID)&&(identical(other.addedByID, addedByID) || other.addedByID == addedByID)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.isSynced, isSynced) || other.isSynced == isSynced)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt)&&(identical(other.syncAction, syncAction) || other.syncAction == syncAction)&&(identical(other.syncRetryCount, syncRetryCount) || other.syncRetryCount == syncRetryCount)&&(identical(other.syncError, syncError) || other.syncError == syncError)&&(identical(other.lastSyncAttempt, lastSyncAttempt) || other.lastSyncAttempt == lastSyncAttempt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,reportType,dailyReportID,workEquipmentID,addedByID,createdAt,isSynced,deletedAt,syncAction,syncRetryCount,syncError,lastSyncAttempt);

@override
String toString() {
  return 'ReportEquipmentModel(id: $id, reportType: $reportType, dailyReportID: $dailyReportID, workEquipmentID: $workEquipmentID, addedByID: $addedByID, createdAt: $createdAt, isSynced: $isSynced, deletedAt: $deletedAt, syncAction: $syncAction, syncRetryCount: $syncRetryCount, syncError: $syncError, lastSyncAttempt: $lastSyncAttempt)';
}


}

/// @nodoc
abstract mixin class $ReportEquipmentModelCopyWith<$Res>  {
  factory $ReportEquipmentModelCopyWith(ReportEquipmentModel value, $Res Function(ReportEquipmentModel) _then) = _$ReportEquipmentModelCopyWithImpl;
@useResult
$Res call({
 int id, String reportType, int? dailyReportID, int workEquipmentID, int addedByID, DateTime createdAt, bool isSynced, DateTime? deletedAt, String? syncAction, int syncRetryCount, String? syncError, DateTime? lastSyncAttempt
});




}
/// @nodoc
class _$ReportEquipmentModelCopyWithImpl<$Res>
    implements $ReportEquipmentModelCopyWith<$Res> {
  _$ReportEquipmentModelCopyWithImpl(this._self, this._then);

  final ReportEquipmentModel _self;
  final $Res Function(ReportEquipmentModel) _then;

/// Create a copy of ReportEquipmentModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? reportType = null,Object? dailyReportID = freezed,Object? workEquipmentID = null,Object? addedByID = null,Object? createdAt = null,Object? isSynced = null,Object? deletedAt = freezed,Object? syncAction = freezed,Object? syncRetryCount = null,Object? syncError = freezed,Object? lastSyncAttempt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,reportType: null == reportType ? _self.reportType : reportType // ignore: cast_nullable_to_non_nullable
as String,dailyReportID: freezed == dailyReportID ? _self.dailyReportID : dailyReportID // ignore: cast_nullable_to_non_nullable
as int?,workEquipmentID: null == workEquipmentID ? _self.workEquipmentID : workEquipmentID // ignore: cast_nullable_to_non_nullable
as int,addedByID: null == addedByID ? _self.addedByID : addedByID // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
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


/// Adds pattern-matching-related methods to [ReportEquipmentModel].
extension ReportEquipmentModelPatterns on ReportEquipmentModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReportEquipmentModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReportEquipmentModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReportEquipmentModel value)  $default,){
final _that = this;
switch (_that) {
case _ReportEquipmentModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReportEquipmentModel value)?  $default,){
final _that = this;
switch (_that) {
case _ReportEquipmentModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String reportType,  int? dailyReportID,  int workEquipmentID,  int addedByID,  DateTime createdAt,  bool isSynced,  DateTime? deletedAt,  String? syncAction,  int syncRetryCount,  String? syncError,  DateTime? lastSyncAttempt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReportEquipmentModel() when $default != null:
return $default(_that.id,_that.reportType,_that.dailyReportID,_that.workEquipmentID,_that.addedByID,_that.createdAt,_that.isSynced,_that.deletedAt,_that.syncAction,_that.syncRetryCount,_that.syncError,_that.lastSyncAttempt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String reportType,  int? dailyReportID,  int workEquipmentID,  int addedByID,  DateTime createdAt,  bool isSynced,  DateTime? deletedAt,  String? syncAction,  int syncRetryCount,  String? syncError,  DateTime? lastSyncAttempt)  $default,) {final _that = this;
switch (_that) {
case _ReportEquipmentModel():
return $default(_that.id,_that.reportType,_that.dailyReportID,_that.workEquipmentID,_that.addedByID,_that.createdAt,_that.isSynced,_that.deletedAt,_that.syncAction,_that.syncRetryCount,_that.syncError,_that.lastSyncAttempt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String reportType,  int? dailyReportID,  int workEquipmentID,  int addedByID,  DateTime createdAt,  bool isSynced,  DateTime? deletedAt,  String? syncAction,  int syncRetryCount,  String? syncError,  DateTime? lastSyncAttempt)?  $default,) {final _that = this;
switch (_that) {
case _ReportEquipmentModel() when $default != null:
return $default(_that.id,_that.reportType,_that.dailyReportID,_that.workEquipmentID,_that.addedByID,_that.createdAt,_that.isSynced,_that.deletedAt,_that.syncAction,_that.syncRetryCount,_that.syncError,_that.lastSyncAttempt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ReportEquipmentModel implements ReportEquipmentModel {
  const _ReportEquipmentModel({required this.id, required this.reportType, this.dailyReportID, required this.workEquipmentID, required this.addedByID, required this.createdAt, this.isSynced = false, this.deletedAt, this.syncAction, this.syncRetryCount = 0, this.syncError, this.lastSyncAttempt});
  factory _ReportEquipmentModel.fromJson(Map<String, dynamic> json) => _$ReportEquipmentModelFromJson(json);

@override final  int id;
@override final  String reportType;
// 'DAILY_REPORT' (future: 'INSPECTION')
@override final  int? dailyReportID;
// Reference to DailyReports if reportType is DAILY_REPORT
// Future: inspectionID for inspection module
@override final  int workEquipmentID;
// Foreign key to WorkScopeEquipments
@override final  int addedByID;
// Admin who added this equipment
@override final  DateTime createdAt;
// Sync fields
@override@JsonKey() final  bool isSynced;
@override final  DateTime? deletedAt;
@override final  String? syncAction;
@override@JsonKey() final  int syncRetryCount;
@override final  String? syncError;
@override final  DateTime? lastSyncAttempt;

/// Create a copy of ReportEquipmentModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReportEquipmentModelCopyWith<_ReportEquipmentModel> get copyWith => __$ReportEquipmentModelCopyWithImpl<_ReportEquipmentModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReportEquipmentModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReportEquipmentModel&&(identical(other.id, id) || other.id == id)&&(identical(other.reportType, reportType) || other.reportType == reportType)&&(identical(other.dailyReportID, dailyReportID) || other.dailyReportID == dailyReportID)&&(identical(other.workEquipmentID, workEquipmentID) || other.workEquipmentID == workEquipmentID)&&(identical(other.addedByID, addedByID) || other.addedByID == addedByID)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.isSynced, isSynced) || other.isSynced == isSynced)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt)&&(identical(other.syncAction, syncAction) || other.syncAction == syncAction)&&(identical(other.syncRetryCount, syncRetryCount) || other.syncRetryCount == syncRetryCount)&&(identical(other.syncError, syncError) || other.syncError == syncError)&&(identical(other.lastSyncAttempt, lastSyncAttempt) || other.lastSyncAttempt == lastSyncAttempt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,reportType,dailyReportID,workEquipmentID,addedByID,createdAt,isSynced,deletedAt,syncAction,syncRetryCount,syncError,lastSyncAttempt);

@override
String toString() {
  return 'ReportEquipmentModel(id: $id, reportType: $reportType, dailyReportID: $dailyReportID, workEquipmentID: $workEquipmentID, addedByID: $addedByID, createdAt: $createdAt, isSynced: $isSynced, deletedAt: $deletedAt, syncAction: $syncAction, syncRetryCount: $syncRetryCount, syncError: $syncError, lastSyncAttempt: $lastSyncAttempt)';
}


}

/// @nodoc
abstract mixin class _$ReportEquipmentModelCopyWith<$Res> implements $ReportEquipmentModelCopyWith<$Res> {
  factory _$ReportEquipmentModelCopyWith(_ReportEquipmentModel value, $Res Function(_ReportEquipmentModel) _then) = __$ReportEquipmentModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String reportType, int? dailyReportID, int workEquipmentID, int addedByID, DateTime createdAt, bool isSynced, DateTime? deletedAt, String? syncAction, int syncRetryCount, String? syncError, DateTime? lastSyncAttempt
});




}
/// @nodoc
class __$ReportEquipmentModelCopyWithImpl<$Res>
    implements _$ReportEquipmentModelCopyWith<$Res> {
  __$ReportEquipmentModelCopyWithImpl(this._self, this._then);

  final _ReportEquipmentModel _self;
  final $Res Function(_ReportEquipmentModel) _then;

/// Create a copy of ReportEquipmentModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? reportType = null,Object? dailyReportID = freezed,Object? workEquipmentID = null,Object? addedByID = null,Object? createdAt = null,Object? isSynced = null,Object? deletedAt = freezed,Object? syncAction = freezed,Object? syncRetryCount = null,Object? syncError = freezed,Object? lastSyncAttempt = freezed,}) {
  return _then(_ReportEquipmentModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,reportType: null == reportType ? _self.reportType : reportType // ignore: cast_nullable_to_non_nullable
as String,dailyReportID: freezed == dailyReportID ? _self.dailyReportID : dailyReportID // ignore: cast_nullable_to_non_nullable
as int?,workEquipmentID: null == workEquipmentID ? _self.workEquipmentID : workEquipmentID // ignore: cast_nullable_to_non_nullable
as int,addedByID: null == addedByID ? _self.addedByID : addedByID // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
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
