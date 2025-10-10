// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'report_quantity_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ReportQuantityModel {

 int get id; String get reportType;// 'DAILY_REPORT' (future: 'INSPECTION')
 int? get dailyReportID;// Reference to DailyReports if reportType is DAILY_REPORT
// Future: inspectionID for inspection module
 int get quantityTypeID;// Foreign key to WorkQuantityTypes
 int get sequenceNo;// For multiple entries of same type
 double? get totalLength;// For R02: total measurement entered by user
 String? get notes; DateTime get createdAt; DateTime get updatedAt;// Sync fields
 bool get isSynced; DateTime? get deletedAt; String? get syncAction; int get syncRetryCount; String? get syncError; DateTime? get lastSyncAttempt;
/// Create a copy of ReportQuantityModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReportQuantityModelCopyWith<ReportQuantityModel> get copyWith => _$ReportQuantityModelCopyWithImpl<ReportQuantityModel>(this as ReportQuantityModel, _$identity);

  /// Serializes this ReportQuantityModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReportQuantityModel&&(identical(other.id, id) || other.id == id)&&(identical(other.reportType, reportType) || other.reportType == reportType)&&(identical(other.dailyReportID, dailyReportID) || other.dailyReportID == dailyReportID)&&(identical(other.quantityTypeID, quantityTypeID) || other.quantityTypeID == quantityTypeID)&&(identical(other.sequenceNo, sequenceNo) || other.sequenceNo == sequenceNo)&&(identical(other.totalLength, totalLength) || other.totalLength == totalLength)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.isSynced, isSynced) || other.isSynced == isSynced)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt)&&(identical(other.syncAction, syncAction) || other.syncAction == syncAction)&&(identical(other.syncRetryCount, syncRetryCount) || other.syncRetryCount == syncRetryCount)&&(identical(other.syncError, syncError) || other.syncError == syncError)&&(identical(other.lastSyncAttempt, lastSyncAttempt) || other.lastSyncAttempt == lastSyncAttempt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,reportType,dailyReportID,quantityTypeID,sequenceNo,totalLength,notes,createdAt,updatedAt,isSynced,deletedAt,syncAction,syncRetryCount,syncError,lastSyncAttempt);

@override
String toString() {
  return 'ReportQuantityModel(id: $id, reportType: $reportType, dailyReportID: $dailyReportID, quantityTypeID: $quantityTypeID, sequenceNo: $sequenceNo, totalLength: $totalLength, notes: $notes, createdAt: $createdAt, updatedAt: $updatedAt, isSynced: $isSynced, deletedAt: $deletedAt, syncAction: $syncAction, syncRetryCount: $syncRetryCount, syncError: $syncError, lastSyncAttempt: $lastSyncAttempt)';
}


}

/// @nodoc
abstract mixin class $ReportQuantityModelCopyWith<$Res>  {
  factory $ReportQuantityModelCopyWith(ReportQuantityModel value, $Res Function(ReportQuantityModel) _then) = _$ReportQuantityModelCopyWithImpl;
@useResult
$Res call({
 int id, String reportType, int? dailyReportID, int quantityTypeID, int sequenceNo, double? totalLength, String? notes, DateTime createdAt, DateTime updatedAt, bool isSynced, DateTime? deletedAt, String? syncAction, int syncRetryCount, String? syncError, DateTime? lastSyncAttempt
});




}
/// @nodoc
class _$ReportQuantityModelCopyWithImpl<$Res>
    implements $ReportQuantityModelCopyWith<$Res> {
  _$ReportQuantityModelCopyWithImpl(this._self, this._then);

  final ReportQuantityModel _self;
  final $Res Function(ReportQuantityModel) _then;

/// Create a copy of ReportQuantityModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? reportType = null,Object? dailyReportID = freezed,Object? quantityTypeID = null,Object? sequenceNo = null,Object? totalLength = freezed,Object? notes = freezed,Object? createdAt = null,Object? updatedAt = null,Object? isSynced = null,Object? deletedAt = freezed,Object? syncAction = freezed,Object? syncRetryCount = null,Object? syncError = freezed,Object? lastSyncAttempt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,reportType: null == reportType ? _self.reportType : reportType // ignore: cast_nullable_to_non_nullable
as String,dailyReportID: freezed == dailyReportID ? _self.dailyReportID : dailyReportID // ignore: cast_nullable_to_non_nullable
as int?,quantityTypeID: null == quantityTypeID ? _self.quantityTypeID : quantityTypeID // ignore: cast_nullable_to_non_nullable
as int,sequenceNo: null == sequenceNo ? _self.sequenceNo : sequenceNo // ignore: cast_nullable_to_non_nullable
as int,totalLength: freezed == totalLength ? _self.totalLength : totalLength // ignore: cast_nullable_to_non_nullable
as double?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
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


/// Adds pattern-matching-related methods to [ReportQuantityModel].
extension ReportQuantityModelPatterns on ReportQuantityModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReportQuantityModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReportQuantityModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReportQuantityModel value)  $default,){
final _that = this;
switch (_that) {
case _ReportQuantityModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReportQuantityModel value)?  $default,){
final _that = this;
switch (_that) {
case _ReportQuantityModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String reportType,  int? dailyReportID,  int quantityTypeID,  int sequenceNo,  double? totalLength,  String? notes,  DateTime createdAt,  DateTime updatedAt,  bool isSynced,  DateTime? deletedAt,  String? syncAction,  int syncRetryCount,  String? syncError,  DateTime? lastSyncAttempt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReportQuantityModel() when $default != null:
return $default(_that.id,_that.reportType,_that.dailyReportID,_that.quantityTypeID,_that.sequenceNo,_that.totalLength,_that.notes,_that.createdAt,_that.updatedAt,_that.isSynced,_that.deletedAt,_that.syncAction,_that.syncRetryCount,_that.syncError,_that.lastSyncAttempt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String reportType,  int? dailyReportID,  int quantityTypeID,  int sequenceNo,  double? totalLength,  String? notes,  DateTime createdAt,  DateTime updatedAt,  bool isSynced,  DateTime? deletedAt,  String? syncAction,  int syncRetryCount,  String? syncError,  DateTime? lastSyncAttempt)  $default,) {final _that = this;
switch (_that) {
case _ReportQuantityModel():
return $default(_that.id,_that.reportType,_that.dailyReportID,_that.quantityTypeID,_that.sequenceNo,_that.totalLength,_that.notes,_that.createdAt,_that.updatedAt,_that.isSynced,_that.deletedAt,_that.syncAction,_that.syncRetryCount,_that.syncError,_that.lastSyncAttempt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String reportType,  int? dailyReportID,  int quantityTypeID,  int sequenceNo,  double? totalLength,  String? notes,  DateTime createdAt,  DateTime updatedAt,  bool isSynced,  DateTime? deletedAt,  String? syncAction,  int syncRetryCount,  String? syncError,  DateTime? lastSyncAttempt)?  $default,) {final _that = this;
switch (_that) {
case _ReportQuantityModel() when $default != null:
return $default(_that.id,_that.reportType,_that.dailyReportID,_that.quantityTypeID,_that.sequenceNo,_that.totalLength,_that.notes,_that.createdAt,_that.updatedAt,_that.isSynced,_that.deletedAt,_that.syncAction,_that.syncRetryCount,_that.syncError,_that.lastSyncAttempt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ReportQuantityModel implements ReportQuantityModel {
  const _ReportQuantityModel({required this.id, required this.reportType, this.dailyReportID, required this.quantityTypeID, this.sequenceNo = 1, this.totalLength, this.notes, required this.createdAt, required this.updatedAt, this.isSynced = false, this.deletedAt, this.syncAction, this.syncRetryCount = 0, this.syncError, this.lastSyncAttempt});
  factory _ReportQuantityModel.fromJson(Map<String, dynamic> json) => _$ReportQuantityModelFromJson(json);

@override final  int id;
@override final  String reportType;
// 'DAILY_REPORT' (future: 'INSPECTION')
@override final  int? dailyReportID;
// Reference to DailyReports if reportType is DAILY_REPORT
// Future: inspectionID for inspection module
@override final  int quantityTypeID;
// Foreign key to WorkQuantityTypes
@override@JsonKey() final  int sequenceNo;
// For multiple entries of same type
@override final  double? totalLength;
// For R02: total measurement entered by user
@override final  String? notes;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;
// Sync fields
@override@JsonKey() final  bool isSynced;
@override final  DateTime? deletedAt;
@override final  String? syncAction;
@override@JsonKey() final  int syncRetryCount;
@override final  String? syncError;
@override final  DateTime? lastSyncAttempt;

/// Create a copy of ReportQuantityModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReportQuantityModelCopyWith<_ReportQuantityModel> get copyWith => __$ReportQuantityModelCopyWithImpl<_ReportQuantityModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReportQuantityModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReportQuantityModel&&(identical(other.id, id) || other.id == id)&&(identical(other.reportType, reportType) || other.reportType == reportType)&&(identical(other.dailyReportID, dailyReportID) || other.dailyReportID == dailyReportID)&&(identical(other.quantityTypeID, quantityTypeID) || other.quantityTypeID == quantityTypeID)&&(identical(other.sequenceNo, sequenceNo) || other.sequenceNo == sequenceNo)&&(identical(other.totalLength, totalLength) || other.totalLength == totalLength)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.isSynced, isSynced) || other.isSynced == isSynced)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt)&&(identical(other.syncAction, syncAction) || other.syncAction == syncAction)&&(identical(other.syncRetryCount, syncRetryCount) || other.syncRetryCount == syncRetryCount)&&(identical(other.syncError, syncError) || other.syncError == syncError)&&(identical(other.lastSyncAttempt, lastSyncAttempt) || other.lastSyncAttempt == lastSyncAttempt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,reportType,dailyReportID,quantityTypeID,sequenceNo,totalLength,notes,createdAt,updatedAt,isSynced,deletedAt,syncAction,syncRetryCount,syncError,lastSyncAttempt);

@override
String toString() {
  return 'ReportQuantityModel(id: $id, reportType: $reportType, dailyReportID: $dailyReportID, quantityTypeID: $quantityTypeID, sequenceNo: $sequenceNo, totalLength: $totalLength, notes: $notes, createdAt: $createdAt, updatedAt: $updatedAt, isSynced: $isSynced, deletedAt: $deletedAt, syncAction: $syncAction, syncRetryCount: $syncRetryCount, syncError: $syncError, lastSyncAttempt: $lastSyncAttempt)';
}


}

/// @nodoc
abstract mixin class _$ReportQuantityModelCopyWith<$Res> implements $ReportQuantityModelCopyWith<$Res> {
  factory _$ReportQuantityModelCopyWith(_ReportQuantityModel value, $Res Function(_ReportQuantityModel) _then) = __$ReportQuantityModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String reportType, int? dailyReportID, int quantityTypeID, int sequenceNo, double? totalLength, String? notes, DateTime createdAt, DateTime updatedAt, bool isSynced, DateTime? deletedAt, String? syncAction, int syncRetryCount, String? syncError, DateTime? lastSyncAttempt
});




}
/// @nodoc
class __$ReportQuantityModelCopyWithImpl<$Res>
    implements _$ReportQuantityModelCopyWith<$Res> {
  __$ReportQuantityModelCopyWithImpl(this._self, this._then);

  final _ReportQuantityModel _self;
  final $Res Function(_ReportQuantityModel) _then;

/// Create a copy of ReportQuantityModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? reportType = null,Object? dailyReportID = freezed,Object? quantityTypeID = null,Object? sequenceNo = null,Object? totalLength = freezed,Object? notes = freezed,Object? createdAt = null,Object? updatedAt = null,Object? isSynced = null,Object? deletedAt = freezed,Object? syncAction = freezed,Object? syncRetryCount = null,Object? syncError = freezed,Object? lastSyncAttempt = freezed,}) {
  return _then(_ReportQuantityModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,reportType: null == reportType ? _self.reportType : reportType // ignore: cast_nullable_to_non_nullable
as String,dailyReportID: freezed == dailyReportID ? _self.dailyReportID : dailyReportID // ignore: cast_nullable_to_non_nullable
as int?,quantityTypeID: null == quantityTypeID ? _self.quantityTypeID : quantityTypeID // ignore: cast_nullable_to_non_nullable
as int,sequenceNo: null == sequenceNo ? _self.sequenceNo : sequenceNo // ignore: cast_nullable_to_non_nullable
as int,totalLength: freezed == totalLength ? _self.totalLength : totalLength // ignore: cast_nullable_to_non_nullable
as double?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
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
