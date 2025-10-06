// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'daily_report_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DailyReportModel {

 int get id; String get uid; String get name; String? get notes; String get weatherCondition; bool get workPerformed;// Location coordinates
 String? get longitude; String? get latitude;// Primary ownership - the company this report belongs to
 int get companyID;// Optional contract relationship (null for in-house work)
 int? get contractRelationID;// Report status for workflow management
 String get status;// Optional approval tracking
 int? get approvedByID; DateTime? get approvedAt; String? get rejectionReason;// Work scope from the company
 int get workScopeID; int get roadID; int? get totalWorkers; String? get fromSection; String? get toSection;// Admin who created this report
 int get createdByID; DateTime get createdAt; DateTime get updatedAt;// Equipments stored as JSON
// Equipments stored as JSON
@JsonKey(name: 'equipments') List<DailyReportEquipmentModel>? get equipments;// Sync fields
 bool get isSynced; DateTime? get deletedAt; String? get syncAction; int get syncRetryCount; String? get syncError; DateTime? get lastSyncAttempt;
/// Create a copy of DailyReportModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DailyReportModelCopyWith<DailyReportModel> get copyWith => _$DailyReportModelCopyWithImpl<DailyReportModel>(this as DailyReportModel, _$identity);

  /// Serializes this DailyReportModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DailyReportModel&&(identical(other.id, id) || other.id == id)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.name, name) || other.name == name)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.weatherCondition, weatherCondition) || other.weatherCondition == weatherCondition)&&(identical(other.workPerformed, workPerformed) || other.workPerformed == workPerformed)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.companyID, companyID) || other.companyID == companyID)&&(identical(other.contractRelationID, contractRelationID) || other.contractRelationID == contractRelationID)&&(identical(other.status, status) || other.status == status)&&(identical(other.approvedByID, approvedByID) || other.approvedByID == approvedByID)&&(identical(other.approvedAt, approvedAt) || other.approvedAt == approvedAt)&&(identical(other.rejectionReason, rejectionReason) || other.rejectionReason == rejectionReason)&&(identical(other.workScopeID, workScopeID) || other.workScopeID == workScopeID)&&(identical(other.roadID, roadID) || other.roadID == roadID)&&(identical(other.totalWorkers, totalWorkers) || other.totalWorkers == totalWorkers)&&(identical(other.fromSection, fromSection) || other.fromSection == fromSection)&&(identical(other.toSection, toSection) || other.toSection == toSection)&&(identical(other.createdByID, createdByID) || other.createdByID == createdByID)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other.equipments, equipments)&&(identical(other.isSynced, isSynced) || other.isSynced == isSynced)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt)&&(identical(other.syncAction, syncAction) || other.syncAction == syncAction)&&(identical(other.syncRetryCount, syncRetryCount) || other.syncRetryCount == syncRetryCount)&&(identical(other.syncError, syncError) || other.syncError == syncError)&&(identical(other.lastSyncAttempt, lastSyncAttempt) || other.lastSyncAttempt == lastSyncAttempt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,uid,name,notes,weatherCondition,workPerformed,longitude,latitude,companyID,contractRelationID,status,approvedByID,approvedAt,rejectionReason,workScopeID,roadID,totalWorkers,fromSection,toSection,createdByID,createdAt,updatedAt,const DeepCollectionEquality().hash(equipments),isSynced,deletedAt,syncAction,syncRetryCount,syncError,lastSyncAttempt]);

@override
String toString() {
  return 'DailyReportModel(id: $id, uid: $uid, name: $name, notes: $notes, weatherCondition: $weatherCondition, workPerformed: $workPerformed, longitude: $longitude, latitude: $latitude, companyID: $companyID, contractRelationID: $contractRelationID, status: $status, approvedByID: $approvedByID, approvedAt: $approvedAt, rejectionReason: $rejectionReason, workScopeID: $workScopeID, roadID: $roadID, totalWorkers: $totalWorkers, fromSection: $fromSection, toSection: $toSection, createdByID: $createdByID, createdAt: $createdAt, updatedAt: $updatedAt, equipments: $equipments, isSynced: $isSynced, deletedAt: $deletedAt, syncAction: $syncAction, syncRetryCount: $syncRetryCount, syncError: $syncError, lastSyncAttempt: $lastSyncAttempt)';
}


}

/// @nodoc
abstract mixin class $DailyReportModelCopyWith<$Res>  {
  factory $DailyReportModelCopyWith(DailyReportModel value, $Res Function(DailyReportModel) _then) = _$DailyReportModelCopyWithImpl;
@useResult
$Res call({
 int id, String uid, String name, String? notes, String weatherCondition, bool workPerformed, String? longitude, String? latitude, int companyID, int? contractRelationID, String status, int? approvedByID, DateTime? approvedAt, String? rejectionReason, int workScopeID, int roadID, int? totalWorkers, String? fromSection, String? toSection, int createdByID, DateTime createdAt, DateTime updatedAt,@JsonKey(name: 'equipments') List<DailyReportEquipmentModel>? equipments, bool isSynced, DateTime? deletedAt, String? syncAction, int syncRetryCount, String? syncError, DateTime? lastSyncAttempt
});




}
/// @nodoc
class _$DailyReportModelCopyWithImpl<$Res>
    implements $DailyReportModelCopyWith<$Res> {
  _$DailyReportModelCopyWithImpl(this._self, this._then);

  final DailyReportModel _self;
  final $Res Function(DailyReportModel) _then;

/// Create a copy of DailyReportModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? uid = null,Object? name = null,Object? notes = freezed,Object? weatherCondition = null,Object? workPerformed = null,Object? longitude = freezed,Object? latitude = freezed,Object? companyID = null,Object? contractRelationID = freezed,Object? status = null,Object? approvedByID = freezed,Object? approvedAt = freezed,Object? rejectionReason = freezed,Object? workScopeID = null,Object? roadID = null,Object? totalWorkers = freezed,Object? fromSection = freezed,Object? toSection = freezed,Object? createdByID = null,Object? createdAt = null,Object? updatedAt = null,Object? equipments = freezed,Object? isSynced = null,Object? deletedAt = freezed,Object? syncAction = freezed,Object? syncRetryCount = null,Object? syncError = freezed,Object? lastSyncAttempt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,weatherCondition: null == weatherCondition ? _self.weatherCondition : weatherCondition // ignore: cast_nullable_to_non_nullable
as String,workPerformed: null == workPerformed ? _self.workPerformed : workPerformed // ignore: cast_nullable_to_non_nullable
as bool,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as String?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as String?,companyID: null == companyID ? _self.companyID : companyID // ignore: cast_nullable_to_non_nullable
as int,contractRelationID: freezed == contractRelationID ? _self.contractRelationID : contractRelationID // ignore: cast_nullable_to_non_nullable
as int?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,approvedByID: freezed == approvedByID ? _self.approvedByID : approvedByID // ignore: cast_nullable_to_non_nullable
as int?,approvedAt: freezed == approvedAt ? _self.approvedAt : approvedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,rejectionReason: freezed == rejectionReason ? _self.rejectionReason : rejectionReason // ignore: cast_nullable_to_non_nullable
as String?,workScopeID: null == workScopeID ? _self.workScopeID : workScopeID // ignore: cast_nullable_to_non_nullable
as int,roadID: null == roadID ? _self.roadID : roadID // ignore: cast_nullable_to_non_nullable
as int,totalWorkers: freezed == totalWorkers ? _self.totalWorkers : totalWorkers // ignore: cast_nullable_to_non_nullable
as int?,fromSection: freezed == fromSection ? _self.fromSection : fromSection // ignore: cast_nullable_to_non_nullable
as String?,toSection: freezed == toSection ? _self.toSection : toSection // ignore: cast_nullable_to_non_nullable
as String?,createdByID: null == createdByID ? _self.createdByID : createdByID // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,equipments: freezed == equipments ? _self.equipments : equipments // ignore: cast_nullable_to_non_nullable
as List<DailyReportEquipmentModel>?,isSynced: null == isSynced ? _self.isSynced : isSynced // ignore: cast_nullable_to_non_nullable
as bool,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,syncAction: freezed == syncAction ? _self.syncAction : syncAction // ignore: cast_nullable_to_non_nullable
as String?,syncRetryCount: null == syncRetryCount ? _self.syncRetryCount : syncRetryCount // ignore: cast_nullable_to_non_nullable
as int,syncError: freezed == syncError ? _self.syncError : syncError // ignore: cast_nullable_to_non_nullable
as String?,lastSyncAttempt: freezed == lastSyncAttempt ? _self.lastSyncAttempt : lastSyncAttempt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [DailyReportModel].
extension DailyReportModelPatterns on DailyReportModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DailyReportModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DailyReportModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DailyReportModel value)  $default,){
final _that = this;
switch (_that) {
case _DailyReportModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DailyReportModel value)?  $default,){
final _that = this;
switch (_that) {
case _DailyReportModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String uid,  String name,  String? notes,  String weatherCondition,  bool workPerformed,  String? longitude,  String? latitude,  int companyID,  int? contractRelationID,  String status,  int? approvedByID,  DateTime? approvedAt,  String? rejectionReason,  int workScopeID,  int roadID,  int? totalWorkers,  String? fromSection,  String? toSection,  int createdByID,  DateTime createdAt,  DateTime updatedAt, @JsonKey(name: 'equipments')  List<DailyReportEquipmentModel>? equipments,  bool isSynced,  DateTime? deletedAt,  String? syncAction,  int syncRetryCount,  String? syncError,  DateTime? lastSyncAttempt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DailyReportModel() when $default != null:
return $default(_that.id,_that.uid,_that.name,_that.notes,_that.weatherCondition,_that.workPerformed,_that.longitude,_that.latitude,_that.companyID,_that.contractRelationID,_that.status,_that.approvedByID,_that.approvedAt,_that.rejectionReason,_that.workScopeID,_that.roadID,_that.totalWorkers,_that.fromSection,_that.toSection,_that.createdByID,_that.createdAt,_that.updatedAt,_that.equipments,_that.isSynced,_that.deletedAt,_that.syncAction,_that.syncRetryCount,_that.syncError,_that.lastSyncAttempt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String uid,  String name,  String? notes,  String weatherCondition,  bool workPerformed,  String? longitude,  String? latitude,  int companyID,  int? contractRelationID,  String status,  int? approvedByID,  DateTime? approvedAt,  String? rejectionReason,  int workScopeID,  int roadID,  int? totalWorkers,  String? fromSection,  String? toSection,  int createdByID,  DateTime createdAt,  DateTime updatedAt, @JsonKey(name: 'equipments')  List<DailyReportEquipmentModel>? equipments,  bool isSynced,  DateTime? deletedAt,  String? syncAction,  int syncRetryCount,  String? syncError,  DateTime? lastSyncAttempt)  $default,) {final _that = this;
switch (_that) {
case _DailyReportModel():
return $default(_that.id,_that.uid,_that.name,_that.notes,_that.weatherCondition,_that.workPerformed,_that.longitude,_that.latitude,_that.companyID,_that.contractRelationID,_that.status,_that.approvedByID,_that.approvedAt,_that.rejectionReason,_that.workScopeID,_that.roadID,_that.totalWorkers,_that.fromSection,_that.toSection,_that.createdByID,_that.createdAt,_that.updatedAt,_that.equipments,_that.isSynced,_that.deletedAt,_that.syncAction,_that.syncRetryCount,_that.syncError,_that.lastSyncAttempt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String uid,  String name,  String? notes,  String weatherCondition,  bool workPerformed,  String? longitude,  String? latitude,  int companyID,  int? contractRelationID,  String status,  int? approvedByID,  DateTime? approvedAt,  String? rejectionReason,  int workScopeID,  int roadID,  int? totalWorkers,  String? fromSection,  String? toSection,  int createdByID,  DateTime createdAt,  DateTime updatedAt, @JsonKey(name: 'equipments')  List<DailyReportEquipmentModel>? equipments,  bool isSynced,  DateTime? deletedAt,  String? syncAction,  int syncRetryCount,  String? syncError,  DateTime? lastSyncAttempt)?  $default,) {final _that = this;
switch (_that) {
case _DailyReportModel() when $default != null:
return $default(_that.id,_that.uid,_that.name,_that.notes,_that.weatherCondition,_that.workPerformed,_that.longitude,_that.latitude,_that.companyID,_that.contractRelationID,_that.status,_that.approvedByID,_that.approvedAt,_that.rejectionReason,_that.workScopeID,_that.roadID,_that.totalWorkers,_that.fromSection,_that.toSection,_that.createdByID,_that.createdAt,_that.updatedAt,_that.equipments,_that.isSynced,_that.deletedAt,_that.syncAction,_that.syncRetryCount,_that.syncError,_that.lastSyncAttempt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DailyReportModel extends DailyReportModel {
  const _DailyReportModel({required this.id, required this.uid, required this.name, this.notes, required this.weatherCondition, this.workPerformed = false, this.longitude, this.latitude, required this.companyID, this.contractRelationID, this.status = 'SUBMITTED', this.approvedByID, this.approvedAt, this.rejectionReason, required this.workScopeID, required this.roadID, this.totalWorkers, this.fromSection, this.toSection, required this.createdByID, required this.createdAt, required this.updatedAt, @JsonKey(name: 'equipments') final  List<DailyReportEquipmentModel>? equipments, this.isSynced = false, this.deletedAt, this.syncAction, this.syncRetryCount = 0, this.syncError, this.lastSyncAttempt}): _equipments = equipments,super._();
  factory _DailyReportModel.fromJson(Map<String, dynamic> json) => _$DailyReportModelFromJson(json);

@override final  int id;
@override final  String uid;
@override final  String name;
@override final  String? notes;
@override final  String weatherCondition;
@override@JsonKey() final  bool workPerformed;
// Location coordinates
@override final  String? longitude;
@override final  String? latitude;
// Primary ownership - the company this report belongs to
@override final  int companyID;
// Optional contract relationship (null for in-house work)
@override final  int? contractRelationID;
// Report status for workflow management
@override@JsonKey() final  String status;
// Optional approval tracking
@override final  int? approvedByID;
@override final  DateTime? approvedAt;
@override final  String? rejectionReason;
// Work scope from the company
@override final  int workScopeID;
@override final  int roadID;
@override final  int? totalWorkers;
@override final  String? fromSection;
@override final  String? toSection;
// Admin who created this report
@override final  int createdByID;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;
// Equipments stored as JSON
// Equipments stored as JSON
 final  List<DailyReportEquipmentModel>? _equipments;
// Equipments stored as JSON
// Equipments stored as JSON
@override@JsonKey(name: 'equipments') List<DailyReportEquipmentModel>? get equipments {
  final value = _equipments;
  if (value == null) return null;
  if (_equipments is EqualUnmodifiableListView) return _equipments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

// Sync fields
@override@JsonKey() final  bool isSynced;
@override final  DateTime? deletedAt;
@override final  String? syncAction;
@override@JsonKey() final  int syncRetryCount;
@override final  String? syncError;
@override final  DateTime? lastSyncAttempt;

/// Create a copy of DailyReportModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DailyReportModelCopyWith<_DailyReportModel> get copyWith => __$DailyReportModelCopyWithImpl<_DailyReportModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DailyReportModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DailyReportModel&&(identical(other.id, id) || other.id == id)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.name, name) || other.name == name)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.weatherCondition, weatherCondition) || other.weatherCondition == weatherCondition)&&(identical(other.workPerformed, workPerformed) || other.workPerformed == workPerformed)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.companyID, companyID) || other.companyID == companyID)&&(identical(other.contractRelationID, contractRelationID) || other.contractRelationID == contractRelationID)&&(identical(other.status, status) || other.status == status)&&(identical(other.approvedByID, approvedByID) || other.approvedByID == approvedByID)&&(identical(other.approvedAt, approvedAt) || other.approvedAt == approvedAt)&&(identical(other.rejectionReason, rejectionReason) || other.rejectionReason == rejectionReason)&&(identical(other.workScopeID, workScopeID) || other.workScopeID == workScopeID)&&(identical(other.roadID, roadID) || other.roadID == roadID)&&(identical(other.totalWorkers, totalWorkers) || other.totalWorkers == totalWorkers)&&(identical(other.fromSection, fromSection) || other.fromSection == fromSection)&&(identical(other.toSection, toSection) || other.toSection == toSection)&&(identical(other.createdByID, createdByID) || other.createdByID == createdByID)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other._equipments, _equipments)&&(identical(other.isSynced, isSynced) || other.isSynced == isSynced)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt)&&(identical(other.syncAction, syncAction) || other.syncAction == syncAction)&&(identical(other.syncRetryCount, syncRetryCount) || other.syncRetryCount == syncRetryCount)&&(identical(other.syncError, syncError) || other.syncError == syncError)&&(identical(other.lastSyncAttempt, lastSyncAttempt) || other.lastSyncAttempt == lastSyncAttempt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,uid,name,notes,weatherCondition,workPerformed,longitude,latitude,companyID,contractRelationID,status,approvedByID,approvedAt,rejectionReason,workScopeID,roadID,totalWorkers,fromSection,toSection,createdByID,createdAt,updatedAt,const DeepCollectionEquality().hash(_equipments),isSynced,deletedAt,syncAction,syncRetryCount,syncError,lastSyncAttempt]);

@override
String toString() {
  return 'DailyReportModel(id: $id, uid: $uid, name: $name, notes: $notes, weatherCondition: $weatherCondition, workPerformed: $workPerformed, longitude: $longitude, latitude: $latitude, companyID: $companyID, contractRelationID: $contractRelationID, status: $status, approvedByID: $approvedByID, approvedAt: $approvedAt, rejectionReason: $rejectionReason, workScopeID: $workScopeID, roadID: $roadID, totalWorkers: $totalWorkers, fromSection: $fromSection, toSection: $toSection, createdByID: $createdByID, createdAt: $createdAt, updatedAt: $updatedAt, equipments: $equipments, isSynced: $isSynced, deletedAt: $deletedAt, syncAction: $syncAction, syncRetryCount: $syncRetryCount, syncError: $syncError, lastSyncAttempt: $lastSyncAttempt)';
}


}

/// @nodoc
abstract mixin class _$DailyReportModelCopyWith<$Res> implements $DailyReportModelCopyWith<$Res> {
  factory _$DailyReportModelCopyWith(_DailyReportModel value, $Res Function(_DailyReportModel) _then) = __$DailyReportModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String uid, String name, String? notes, String weatherCondition, bool workPerformed, String? longitude, String? latitude, int companyID, int? contractRelationID, String status, int? approvedByID, DateTime? approvedAt, String? rejectionReason, int workScopeID, int roadID, int? totalWorkers, String? fromSection, String? toSection, int createdByID, DateTime createdAt, DateTime updatedAt,@JsonKey(name: 'equipments') List<DailyReportEquipmentModel>? equipments, bool isSynced, DateTime? deletedAt, String? syncAction, int syncRetryCount, String? syncError, DateTime? lastSyncAttempt
});




}
/// @nodoc
class __$DailyReportModelCopyWithImpl<$Res>
    implements _$DailyReportModelCopyWith<$Res> {
  __$DailyReportModelCopyWithImpl(this._self, this._then);

  final _DailyReportModel _self;
  final $Res Function(_DailyReportModel) _then;

/// Create a copy of DailyReportModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? uid = null,Object? name = null,Object? notes = freezed,Object? weatherCondition = null,Object? workPerformed = null,Object? longitude = freezed,Object? latitude = freezed,Object? companyID = null,Object? contractRelationID = freezed,Object? status = null,Object? approvedByID = freezed,Object? approvedAt = freezed,Object? rejectionReason = freezed,Object? workScopeID = null,Object? roadID = null,Object? totalWorkers = freezed,Object? fromSection = freezed,Object? toSection = freezed,Object? createdByID = null,Object? createdAt = null,Object? updatedAt = null,Object? equipments = freezed,Object? isSynced = null,Object? deletedAt = freezed,Object? syncAction = freezed,Object? syncRetryCount = null,Object? syncError = freezed,Object? lastSyncAttempt = freezed,}) {
  return _then(_DailyReportModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,weatherCondition: null == weatherCondition ? _self.weatherCondition : weatherCondition // ignore: cast_nullable_to_non_nullable
as String,workPerformed: null == workPerformed ? _self.workPerformed : workPerformed // ignore: cast_nullable_to_non_nullable
as bool,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as String?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as String?,companyID: null == companyID ? _self.companyID : companyID // ignore: cast_nullable_to_non_nullable
as int,contractRelationID: freezed == contractRelationID ? _self.contractRelationID : contractRelationID // ignore: cast_nullable_to_non_nullable
as int?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,approvedByID: freezed == approvedByID ? _self.approvedByID : approvedByID // ignore: cast_nullable_to_non_nullable
as int?,approvedAt: freezed == approvedAt ? _self.approvedAt : approvedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,rejectionReason: freezed == rejectionReason ? _self.rejectionReason : rejectionReason // ignore: cast_nullable_to_non_nullable
as String?,workScopeID: null == workScopeID ? _self.workScopeID : workScopeID // ignore: cast_nullable_to_non_nullable
as int,roadID: null == roadID ? _self.roadID : roadID // ignore: cast_nullable_to_non_nullable
as int,totalWorkers: freezed == totalWorkers ? _self.totalWorkers : totalWorkers // ignore: cast_nullable_to_non_nullable
as int?,fromSection: freezed == fromSection ? _self.fromSection : fromSection // ignore: cast_nullable_to_non_nullable
as String?,toSection: freezed == toSection ? _self.toSection : toSection // ignore: cast_nullable_to_non_nullable
as String?,createdByID: null == createdByID ? _self.createdByID : createdByID // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,equipments: freezed == equipments ? _self._equipments : equipments // ignore: cast_nullable_to_non_nullable
as List<DailyReportEquipmentModel>?,isSynced: null == isSynced ? _self.isSynced : isSynced // ignore: cast_nullable_to_non_nullable
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
