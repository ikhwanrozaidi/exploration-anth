// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'program_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProgramModel {

 int get id; String get uid; String? get name; String? get description; int? get companyID; int? get workScopeID; int? get roadID; String? get periodStart; String? get periodEnd; int? get contractRelationID; int? get requiredReportsCount; int? get totalReports; String? get calculationType; String? get fromSection; String? get toSection; String? get dividerValue;@JsonKey(fromJson: _parseNullableInt) int? get inputValue; String? get longitude; String? get latitude; String? get status; int? get createdByID; String? get createdAt; String? get updatedAt; String? get deletedAt; WorkScopeNestedModel? get workScope; RoadNestedModel? get road; ContractRelationNestedModel? get contractRelation; CreatedByNestedModel? get createdBy; List<ProgramQuantityModel>? get quantities; List<FileModel>? get files; List<DailyReportModel>? get dailyReports;// Sync fields
 bool get isSynced; String? get syncAction; int get syncRetryCount; String? get syncError; DateTime? get lastSyncAttempt;
/// Create a copy of ProgramModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProgramModelCopyWith<ProgramModel> get copyWith => _$ProgramModelCopyWithImpl<ProgramModel>(this as ProgramModel, _$identity);

  /// Serializes this ProgramModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProgramModel&&(identical(other.id, id) || other.id == id)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.companyID, companyID) || other.companyID == companyID)&&(identical(other.workScopeID, workScopeID) || other.workScopeID == workScopeID)&&(identical(other.roadID, roadID) || other.roadID == roadID)&&(identical(other.periodStart, periodStart) || other.periodStart == periodStart)&&(identical(other.periodEnd, periodEnd) || other.periodEnd == periodEnd)&&(identical(other.contractRelationID, contractRelationID) || other.contractRelationID == contractRelationID)&&(identical(other.requiredReportsCount, requiredReportsCount) || other.requiredReportsCount == requiredReportsCount)&&(identical(other.totalReports, totalReports) || other.totalReports == totalReports)&&(identical(other.calculationType, calculationType) || other.calculationType == calculationType)&&(identical(other.fromSection, fromSection) || other.fromSection == fromSection)&&(identical(other.toSection, toSection) || other.toSection == toSection)&&(identical(other.dividerValue, dividerValue) || other.dividerValue == dividerValue)&&(identical(other.inputValue, inputValue) || other.inputValue == inputValue)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdByID, createdByID) || other.createdByID == createdByID)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt)&&(identical(other.workScope, workScope) || other.workScope == workScope)&&(identical(other.road, road) || other.road == road)&&(identical(other.contractRelation, contractRelation) || other.contractRelation == contractRelation)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&const DeepCollectionEquality().equals(other.quantities, quantities)&&const DeepCollectionEquality().equals(other.files, files)&&const DeepCollectionEquality().equals(other.dailyReports, dailyReports)&&(identical(other.isSynced, isSynced) || other.isSynced == isSynced)&&(identical(other.syncAction, syncAction) || other.syncAction == syncAction)&&(identical(other.syncRetryCount, syncRetryCount) || other.syncRetryCount == syncRetryCount)&&(identical(other.syncError, syncError) || other.syncError == syncError)&&(identical(other.lastSyncAttempt, lastSyncAttempt) || other.lastSyncAttempt == lastSyncAttempt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,uid,name,description,companyID,workScopeID,roadID,periodStart,periodEnd,contractRelationID,requiredReportsCount,totalReports,calculationType,fromSection,toSection,dividerValue,inputValue,longitude,latitude,status,createdByID,createdAt,updatedAt,deletedAt,workScope,road,contractRelation,createdBy,const DeepCollectionEquality().hash(quantities),const DeepCollectionEquality().hash(files),const DeepCollectionEquality().hash(dailyReports),isSynced,syncAction,syncRetryCount,syncError,lastSyncAttempt]);

@override
String toString() {
  return 'ProgramModel(id: $id, uid: $uid, name: $name, description: $description, companyID: $companyID, workScopeID: $workScopeID, roadID: $roadID, periodStart: $periodStart, periodEnd: $periodEnd, contractRelationID: $contractRelationID, requiredReportsCount: $requiredReportsCount, totalReports: $totalReports, calculationType: $calculationType, fromSection: $fromSection, toSection: $toSection, dividerValue: $dividerValue, inputValue: $inputValue, longitude: $longitude, latitude: $latitude, status: $status, createdByID: $createdByID, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt, workScope: $workScope, road: $road, contractRelation: $contractRelation, createdBy: $createdBy, quantities: $quantities, files: $files, dailyReports: $dailyReports, isSynced: $isSynced, syncAction: $syncAction, syncRetryCount: $syncRetryCount, syncError: $syncError, lastSyncAttempt: $lastSyncAttempt)';
}


}

/// @nodoc
abstract mixin class $ProgramModelCopyWith<$Res>  {
  factory $ProgramModelCopyWith(ProgramModel value, $Res Function(ProgramModel) _then) = _$ProgramModelCopyWithImpl;
@useResult
$Res call({
 int id, String uid, String? name, String? description, int? companyID, int? workScopeID, int? roadID, String? periodStart, String? periodEnd, int? contractRelationID, int? requiredReportsCount, int? totalReports, String? calculationType, String? fromSection, String? toSection, String? dividerValue,@JsonKey(fromJson: _parseNullableInt) int? inputValue, String? longitude, String? latitude, String? status, int? createdByID, String? createdAt, String? updatedAt, String? deletedAt, WorkScopeNestedModel? workScope, RoadNestedModel? road, ContractRelationNestedModel? contractRelation, CreatedByNestedModel? createdBy, List<ProgramQuantityModel>? quantities, List<FileModel>? files, List<DailyReportModel>? dailyReports, bool isSynced, String? syncAction, int syncRetryCount, String? syncError, DateTime? lastSyncAttempt
});


$WorkScopeNestedModelCopyWith<$Res>? get workScope;$RoadNestedModelCopyWith<$Res>? get road;$ContractRelationNestedModelCopyWith<$Res>? get contractRelation;$CreatedByNestedModelCopyWith<$Res>? get createdBy;

}
/// @nodoc
class _$ProgramModelCopyWithImpl<$Res>
    implements $ProgramModelCopyWith<$Res> {
  _$ProgramModelCopyWithImpl(this._self, this._then);

  final ProgramModel _self;
  final $Res Function(ProgramModel) _then;

/// Create a copy of ProgramModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? uid = null,Object? name = freezed,Object? description = freezed,Object? companyID = freezed,Object? workScopeID = freezed,Object? roadID = freezed,Object? periodStart = freezed,Object? periodEnd = freezed,Object? contractRelationID = freezed,Object? requiredReportsCount = freezed,Object? totalReports = freezed,Object? calculationType = freezed,Object? fromSection = freezed,Object? toSection = freezed,Object? dividerValue = freezed,Object? inputValue = freezed,Object? longitude = freezed,Object? latitude = freezed,Object? status = freezed,Object? createdByID = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? deletedAt = freezed,Object? workScope = freezed,Object? road = freezed,Object? contractRelation = freezed,Object? createdBy = freezed,Object? quantities = freezed,Object? files = freezed,Object? dailyReports = freezed,Object? isSynced = null,Object? syncAction = freezed,Object? syncRetryCount = null,Object? syncError = freezed,Object? lastSyncAttempt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,companyID: freezed == companyID ? _self.companyID : companyID // ignore: cast_nullable_to_non_nullable
as int?,workScopeID: freezed == workScopeID ? _self.workScopeID : workScopeID // ignore: cast_nullable_to_non_nullable
as int?,roadID: freezed == roadID ? _self.roadID : roadID // ignore: cast_nullable_to_non_nullable
as int?,periodStart: freezed == periodStart ? _self.periodStart : periodStart // ignore: cast_nullable_to_non_nullable
as String?,periodEnd: freezed == periodEnd ? _self.periodEnd : periodEnd // ignore: cast_nullable_to_non_nullable
as String?,contractRelationID: freezed == contractRelationID ? _self.contractRelationID : contractRelationID // ignore: cast_nullable_to_non_nullable
as int?,requiredReportsCount: freezed == requiredReportsCount ? _self.requiredReportsCount : requiredReportsCount // ignore: cast_nullable_to_non_nullable
as int?,totalReports: freezed == totalReports ? _self.totalReports : totalReports // ignore: cast_nullable_to_non_nullable
as int?,calculationType: freezed == calculationType ? _self.calculationType : calculationType // ignore: cast_nullable_to_non_nullable
as String?,fromSection: freezed == fromSection ? _self.fromSection : fromSection // ignore: cast_nullable_to_non_nullable
as String?,toSection: freezed == toSection ? _self.toSection : toSection // ignore: cast_nullable_to_non_nullable
as String?,dividerValue: freezed == dividerValue ? _self.dividerValue : dividerValue // ignore: cast_nullable_to_non_nullable
as String?,inputValue: freezed == inputValue ? _self.inputValue : inputValue // ignore: cast_nullable_to_non_nullable
as int?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as String?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,createdByID: freezed == createdByID ? _self.createdByID : createdByID // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as String?,workScope: freezed == workScope ? _self.workScope : workScope // ignore: cast_nullable_to_non_nullable
as WorkScopeNestedModel?,road: freezed == road ? _self.road : road // ignore: cast_nullable_to_non_nullable
as RoadNestedModel?,contractRelation: freezed == contractRelation ? _self.contractRelation : contractRelation // ignore: cast_nullable_to_non_nullable
as ContractRelationNestedModel?,createdBy: freezed == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as CreatedByNestedModel?,quantities: freezed == quantities ? _self.quantities : quantities // ignore: cast_nullable_to_non_nullable
as List<ProgramQuantityModel>?,files: freezed == files ? _self.files : files // ignore: cast_nullable_to_non_nullable
as List<FileModel>?,dailyReports: freezed == dailyReports ? _self.dailyReports : dailyReports // ignore: cast_nullable_to_non_nullable
as List<DailyReportModel>?,isSynced: null == isSynced ? _self.isSynced : isSynced // ignore: cast_nullable_to_non_nullable
as bool,syncAction: freezed == syncAction ? _self.syncAction : syncAction // ignore: cast_nullable_to_non_nullable
as String?,syncRetryCount: null == syncRetryCount ? _self.syncRetryCount : syncRetryCount // ignore: cast_nullable_to_non_nullable
as int,syncError: freezed == syncError ? _self.syncError : syncError // ignore: cast_nullable_to_non_nullable
as String?,lastSyncAttempt: freezed == lastSyncAttempt ? _self.lastSyncAttempt : lastSyncAttempt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}
/// Create a copy of ProgramModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WorkScopeNestedModelCopyWith<$Res>? get workScope {
    if (_self.workScope == null) {
    return null;
  }

  return $WorkScopeNestedModelCopyWith<$Res>(_self.workScope!, (value) {
    return _then(_self.copyWith(workScope: value));
  });
}/// Create a copy of ProgramModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RoadNestedModelCopyWith<$Res>? get road {
    if (_self.road == null) {
    return null;
  }

  return $RoadNestedModelCopyWith<$Res>(_self.road!, (value) {
    return _then(_self.copyWith(road: value));
  });
}/// Create a copy of ProgramModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ContractRelationNestedModelCopyWith<$Res>? get contractRelation {
    if (_self.contractRelation == null) {
    return null;
  }

  return $ContractRelationNestedModelCopyWith<$Res>(_self.contractRelation!, (value) {
    return _then(_self.copyWith(contractRelation: value));
  });
}/// Create a copy of ProgramModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CreatedByNestedModelCopyWith<$Res>? get createdBy {
    if (_self.createdBy == null) {
    return null;
  }

  return $CreatedByNestedModelCopyWith<$Res>(_self.createdBy!, (value) {
    return _then(_self.copyWith(createdBy: value));
  });
}
}


/// Adds pattern-matching-related methods to [ProgramModel].
extension ProgramModelPatterns on ProgramModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProgramModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProgramModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProgramModel value)  $default,){
final _that = this;
switch (_that) {
case _ProgramModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProgramModel value)?  $default,){
final _that = this;
switch (_that) {
case _ProgramModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String uid,  String? name,  String? description,  int? companyID,  int? workScopeID,  int? roadID,  String? periodStart,  String? periodEnd,  int? contractRelationID,  int? requiredReportsCount,  int? totalReports,  String? calculationType,  String? fromSection,  String? toSection,  String? dividerValue, @JsonKey(fromJson: _parseNullableInt)  int? inputValue,  String? longitude,  String? latitude,  String? status,  int? createdByID,  String? createdAt,  String? updatedAt,  String? deletedAt,  WorkScopeNestedModel? workScope,  RoadNestedModel? road,  ContractRelationNestedModel? contractRelation,  CreatedByNestedModel? createdBy,  List<ProgramQuantityModel>? quantities,  List<FileModel>? files,  List<DailyReportModel>? dailyReports,  bool isSynced,  String? syncAction,  int syncRetryCount,  String? syncError,  DateTime? lastSyncAttempt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProgramModel() when $default != null:
return $default(_that.id,_that.uid,_that.name,_that.description,_that.companyID,_that.workScopeID,_that.roadID,_that.periodStart,_that.periodEnd,_that.contractRelationID,_that.requiredReportsCount,_that.totalReports,_that.calculationType,_that.fromSection,_that.toSection,_that.dividerValue,_that.inputValue,_that.longitude,_that.latitude,_that.status,_that.createdByID,_that.createdAt,_that.updatedAt,_that.deletedAt,_that.workScope,_that.road,_that.contractRelation,_that.createdBy,_that.quantities,_that.files,_that.dailyReports,_that.isSynced,_that.syncAction,_that.syncRetryCount,_that.syncError,_that.lastSyncAttempt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String uid,  String? name,  String? description,  int? companyID,  int? workScopeID,  int? roadID,  String? periodStart,  String? periodEnd,  int? contractRelationID,  int? requiredReportsCount,  int? totalReports,  String? calculationType,  String? fromSection,  String? toSection,  String? dividerValue, @JsonKey(fromJson: _parseNullableInt)  int? inputValue,  String? longitude,  String? latitude,  String? status,  int? createdByID,  String? createdAt,  String? updatedAt,  String? deletedAt,  WorkScopeNestedModel? workScope,  RoadNestedModel? road,  ContractRelationNestedModel? contractRelation,  CreatedByNestedModel? createdBy,  List<ProgramQuantityModel>? quantities,  List<FileModel>? files,  List<DailyReportModel>? dailyReports,  bool isSynced,  String? syncAction,  int syncRetryCount,  String? syncError,  DateTime? lastSyncAttempt)  $default,) {final _that = this;
switch (_that) {
case _ProgramModel():
return $default(_that.id,_that.uid,_that.name,_that.description,_that.companyID,_that.workScopeID,_that.roadID,_that.periodStart,_that.periodEnd,_that.contractRelationID,_that.requiredReportsCount,_that.totalReports,_that.calculationType,_that.fromSection,_that.toSection,_that.dividerValue,_that.inputValue,_that.longitude,_that.latitude,_that.status,_that.createdByID,_that.createdAt,_that.updatedAt,_that.deletedAt,_that.workScope,_that.road,_that.contractRelation,_that.createdBy,_that.quantities,_that.files,_that.dailyReports,_that.isSynced,_that.syncAction,_that.syncRetryCount,_that.syncError,_that.lastSyncAttempt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String uid,  String? name,  String? description,  int? companyID,  int? workScopeID,  int? roadID,  String? periodStart,  String? periodEnd,  int? contractRelationID,  int? requiredReportsCount,  int? totalReports,  String? calculationType,  String? fromSection,  String? toSection,  String? dividerValue, @JsonKey(fromJson: _parseNullableInt)  int? inputValue,  String? longitude,  String? latitude,  String? status,  int? createdByID,  String? createdAt,  String? updatedAt,  String? deletedAt,  WorkScopeNestedModel? workScope,  RoadNestedModel? road,  ContractRelationNestedModel? contractRelation,  CreatedByNestedModel? createdBy,  List<ProgramQuantityModel>? quantities,  List<FileModel>? files,  List<DailyReportModel>? dailyReports,  bool isSynced,  String? syncAction,  int syncRetryCount,  String? syncError,  DateTime? lastSyncAttempt)?  $default,) {final _that = this;
switch (_that) {
case _ProgramModel() when $default != null:
return $default(_that.id,_that.uid,_that.name,_that.description,_that.companyID,_that.workScopeID,_that.roadID,_that.periodStart,_that.periodEnd,_that.contractRelationID,_that.requiredReportsCount,_that.totalReports,_that.calculationType,_that.fromSection,_that.toSection,_that.dividerValue,_that.inputValue,_that.longitude,_that.latitude,_that.status,_that.createdByID,_that.createdAt,_that.updatedAt,_that.deletedAt,_that.workScope,_that.road,_that.contractRelation,_that.createdBy,_that.quantities,_that.files,_that.dailyReports,_that.isSynced,_that.syncAction,_that.syncRetryCount,_that.syncError,_that.lastSyncAttempt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProgramModel extends ProgramModel {
  const _ProgramModel({required this.id, required this.uid, this.name, this.description, this.companyID, this.workScopeID, this.roadID, this.periodStart, this.periodEnd, this.contractRelationID, this.requiredReportsCount, this.totalReports, this.calculationType, this.fromSection, this.toSection, this.dividerValue, @JsonKey(fromJson: _parseNullableInt) this.inputValue, this.longitude, this.latitude, this.status, this.createdByID, this.createdAt, this.updatedAt, this.deletedAt, this.workScope, this.road, this.contractRelation, this.createdBy, final  List<ProgramQuantityModel>? quantities, final  List<FileModel>? files, final  List<DailyReportModel>? dailyReports, this.isSynced = false, this.syncAction, this.syncRetryCount = 0, this.syncError, this.lastSyncAttempt}): _quantities = quantities,_files = files,_dailyReports = dailyReports,super._();
  factory _ProgramModel.fromJson(Map<String, dynamic> json) => _$ProgramModelFromJson(json);

@override final  int id;
@override final  String uid;
@override final  String? name;
@override final  String? description;
@override final  int? companyID;
@override final  int? workScopeID;
@override final  int? roadID;
@override final  String? periodStart;
@override final  String? periodEnd;
@override final  int? contractRelationID;
@override final  int? requiredReportsCount;
@override final  int? totalReports;
@override final  String? calculationType;
@override final  String? fromSection;
@override final  String? toSection;
@override final  String? dividerValue;
@override@JsonKey(fromJson: _parseNullableInt) final  int? inputValue;
@override final  String? longitude;
@override final  String? latitude;
@override final  String? status;
@override final  int? createdByID;
@override final  String? createdAt;
@override final  String? updatedAt;
@override final  String? deletedAt;
@override final  WorkScopeNestedModel? workScope;
@override final  RoadNestedModel? road;
@override final  ContractRelationNestedModel? contractRelation;
@override final  CreatedByNestedModel? createdBy;
 final  List<ProgramQuantityModel>? _quantities;
@override List<ProgramQuantityModel>? get quantities {
  final value = _quantities;
  if (value == null) return null;
  if (_quantities is EqualUnmodifiableListView) return _quantities;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<FileModel>? _files;
@override List<FileModel>? get files {
  final value = _files;
  if (value == null) return null;
  if (_files is EqualUnmodifiableListView) return _files;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<DailyReportModel>? _dailyReports;
@override List<DailyReportModel>? get dailyReports {
  final value = _dailyReports;
  if (value == null) return null;
  if (_dailyReports is EqualUnmodifiableListView) return _dailyReports;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

// Sync fields
@override@JsonKey() final  bool isSynced;
@override final  String? syncAction;
@override@JsonKey() final  int syncRetryCount;
@override final  String? syncError;
@override final  DateTime? lastSyncAttempt;

/// Create a copy of ProgramModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProgramModelCopyWith<_ProgramModel> get copyWith => __$ProgramModelCopyWithImpl<_ProgramModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProgramModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProgramModel&&(identical(other.id, id) || other.id == id)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.companyID, companyID) || other.companyID == companyID)&&(identical(other.workScopeID, workScopeID) || other.workScopeID == workScopeID)&&(identical(other.roadID, roadID) || other.roadID == roadID)&&(identical(other.periodStart, periodStart) || other.periodStart == periodStart)&&(identical(other.periodEnd, periodEnd) || other.periodEnd == periodEnd)&&(identical(other.contractRelationID, contractRelationID) || other.contractRelationID == contractRelationID)&&(identical(other.requiredReportsCount, requiredReportsCount) || other.requiredReportsCount == requiredReportsCount)&&(identical(other.totalReports, totalReports) || other.totalReports == totalReports)&&(identical(other.calculationType, calculationType) || other.calculationType == calculationType)&&(identical(other.fromSection, fromSection) || other.fromSection == fromSection)&&(identical(other.toSection, toSection) || other.toSection == toSection)&&(identical(other.dividerValue, dividerValue) || other.dividerValue == dividerValue)&&(identical(other.inputValue, inputValue) || other.inputValue == inputValue)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdByID, createdByID) || other.createdByID == createdByID)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt)&&(identical(other.workScope, workScope) || other.workScope == workScope)&&(identical(other.road, road) || other.road == road)&&(identical(other.contractRelation, contractRelation) || other.contractRelation == contractRelation)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&const DeepCollectionEquality().equals(other._quantities, _quantities)&&const DeepCollectionEquality().equals(other._files, _files)&&const DeepCollectionEquality().equals(other._dailyReports, _dailyReports)&&(identical(other.isSynced, isSynced) || other.isSynced == isSynced)&&(identical(other.syncAction, syncAction) || other.syncAction == syncAction)&&(identical(other.syncRetryCount, syncRetryCount) || other.syncRetryCount == syncRetryCount)&&(identical(other.syncError, syncError) || other.syncError == syncError)&&(identical(other.lastSyncAttempt, lastSyncAttempt) || other.lastSyncAttempt == lastSyncAttempt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,uid,name,description,companyID,workScopeID,roadID,periodStart,periodEnd,contractRelationID,requiredReportsCount,totalReports,calculationType,fromSection,toSection,dividerValue,inputValue,longitude,latitude,status,createdByID,createdAt,updatedAt,deletedAt,workScope,road,contractRelation,createdBy,const DeepCollectionEquality().hash(_quantities),const DeepCollectionEquality().hash(_files),const DeepCollectionEquality().hash(_dailyReports),isSynced,syncAction,syncRetryCount,syncError,lastSyncAttempt]);

@override
String toString() {
  return 'ProgramModel(id: $id, uid: $uid, name: $name, description: $description, companyID: $companyID, workScopeID: $workScopeID, roadID: $roadID, periodStart: $periodStart, periodEnd: $periodEnd, contractRelationID: $contractRelationID, requiredReportsCount: $requiredReportsCount, totalReports: $totalReports, calculationType: $calculationType, fromSection: $fromSection, toSection: $toSection, dividerValue: $dividerValue, inputValue: $inputValue, longitude: $longitude, latitude: $latitude, status: $status, createdByID: $createdByID, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt, workScope: $workScope, road: $road, contractRelation: $contractRelation, createdBy: $createdBy, quantities: $quantities, files: $files, dailyReports: $dailyReports, isSynced: $isSynced, syncAction: $syncAction, syncRetryCount: $syncRetryCount, syncError: $syncError, lastSyncAttempt: $lastSyncAttempt)';
}


}

/// @nodoc
abstract mixin class _$ProgramModelCopyWith<$Res> implements $ProgramModelCopyWith<$Res> {
  factory _$ProgramModelCopyWith(_ProgramModel value, $Res Function(_ProgramModel) _then) = __$ProgramModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String uid, String? name, String? description, int? companyID, int? workScopeID, int? roadID, String? periodStart, String? periodEnd, int? contractRelationID, int? requiredReportsCount, int? totalReports, String? calculationType, String? fromSection, String? toSection, String? dividerValue,@JsonKey(fromJson: _parseNullableInt) int? inputValue, String? longitude, String? latitude, String? status, int? createdByID, String? createdAt, String? updatedAt, String? deletedAt, WorkScopeNestedModel? workScope, RoadNestedModel? road, ContractRelationNestedModel? contractRelation, CreatedByNestedModel? createdBy, List<ProgramQuantityModel>? quantities, List<FileModel>? files, List<DailyReportModel>? dailyReports, bool isSynced, String? syncAction, int syncRetryCount, String? syncError, DateTime? lastSyncAttempt
});


@override $WorkScopeNestedModelCopyWith<$Res>? get workScope;@override $RoadNestedModelCopyWith<$Res>? get road;@override $ContractRelationNestedModelCopyWith<$Res>? get contractRelation;@override $CreatedByNestedModelCopyWith<$Res>? get createdBy;

}
/// @nodoc
class __$ProgramModelCopyWithImpl<$Res>
    implements _$ProgramModelCopyWith<$Res> {
  __$ProgramModelCopyWithImpl(this._self, this._then);

  final _ProgramModel _self;
  final $Res Function(_ProgramModel) _then;

/// Create a copy of ProgramModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? uid = null,Object? name = freezed,Object? description = freezed,Object? companyID = freezed,Object? workScopeID = freezed,Object? roadID = freezed,Object? periodStart = freezed,Object? periodEnd = freezed,Object? contractRelationID = freezed,Object? requiredReportsCount = freezed,Object? totalReports = freezed,Object? calculationType = freezed,Object? fromSection = freezed,Object? toSection = freezed,Object? dividerValue = freezed,Object? inputValue = freezed,Object? longitude = freezed,Object? latitude = freezed,Object? status = freezed,Object? createdByID = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? deletedAt = freezed,Object? workScope = freezed,Object? road = freezed,Object? contractRelation = freezed,Object? createdBy = freezed,Object? quantities = freezed,Object? files = freezed,Object? dailyReports = freezed,Object? isSynced = null,Object? syncAction = freezed,Object? syncRetryCount = null,Object? syncError = freezed,Object? lastSyncAttempt = freezed,}) {
  return _then(_ProgramModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,companyID: freezed == companyID ? _self.companyID : companyID // ignore: cast_nullable_to_non_nullable
as int?,workScopeID: freezed == workScopeID ? _self.workScopeID : workScopeID // ignore: cast_nullable_to_non_nullable
as int?,roadID: freezed == roadID ? _self.roadID : roadID // ignore: cast_nullable_to_non_nullable
as int?,periodStart: freezed == periodStart ? _self.periodStart : periodStart // ignore: cast_nullable_to_non_nullable
as String?,periodEnd: freezed == periodEnd ? _self.periodEnd : periodEnd // ignore: cast_nullable_to_non_nullable
as String?,contractRelationID: freezed == contractRelationID ? _self.contractRelationID : contractRelationID // ignore: cast_nullable_to_non_nullable
as int?,requiredReportsCount: freezed == requiredReportsCount ? _self.requiredReportsCount : requiredReportsCount // ignore: cast_nullable_to_non_nullable
as int?,totalReports: freezed == totalReports ? _self.totalReports : totalReports // ignore: cast_nullable_to_non_nullable
as int?,calculationType: freezed == calculationType ? _self.calculationType : calculationType // ignore: cast_nullable_to_non_nullable
as String?,fromSection: freezed == fromSection ? _self.fromSection : fromSection // ignore: cast_nullable_to_non_nullable
as String?,toSection: freezed == toSection ? _self.toSection : toSection // ignore: cast_nullable_to_non_nullable
as String?,dividerValue: freezed == dividerValue ? _self.dividerValue : dividerValue // ignore: cast_nullable_to_non_nullable
as String?,inputValue: freezed == inputValue ? _self.inputValue : inputValue // ignore: cast_nullable_to_non_nullable
as int?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as String?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,createdByID: freezed == createdByID ? _self.createdByID : createdByID // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as String?,workScope: freezed == workScope ? _self.workScope : workScope // ignore: cast_nullable_to_non_nullable
as WorkScopeNestedModel?,road: freezed == road ? _self.road : road // ignore: cast_nullable_to_non_nullable
as RoadNestedModel?,contractRelation: freezed == contractRelation ? _self.contractRelation : contractRelation // ignore: cast_nullable_to_non_nullable
as ContractRelationNestedModel?,createdBy: freezed == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as CreatedByNestedModel?,quantities: freezed == quantities ? _self._quantities : quantities // ignore: cast_nullable_to_non_nullable
as List<ProgramQuantityModel>?,files: freezed == files ? _self._files : files // ignore: cast_nullable_to_non_nullable
as List<FileModel>?,dailyReports: freezed == dailyReports ? _self._dailyReports : dailyReports // ignore: cast_nullable_to_non_nullable
as List<DailyReportModel>?,isSynced: null == isSynced ? _self.isSynced : isSynced // ignore: cast_nullable_to_non_nullable
as bool,syncAction: freezed == syncAction ? _self.syncAction : syncAction // ignore: cast_nullable_to_non_nullable
as String?,syncRetryCount: null == syncRetryCount ? _self.syncRetryCount : syncRetryCount // ignore: cast_nullable_to_non_nullable
as int,syncError: freezed == syncError ? _self.syncError : syncError // ignore: cast_nullable_to_non_nullable
as String?,lastSyncAttempt: freezed == lastSyncAttempt ? _self.lastSyncAttempt : lastSyncAttempt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

/// Create a copy of ProgramModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WorkScopeNestedModelCopyWith<$Res>? get workScope {
    if (_self.workScope == null) {
    return null;
  }

  return $WorkScopeNestedModelCopyWith<$Res>(_self.workScope!, (value) {
    return _then(_self.copyWith(workScope: value));
  });
}/// Create a copy of ProgramModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RoadNestedModelCopyWith<$Res>? get road {
    if (_self.road == null) {
    return null;
  }

  return $RoadNestedModelCopyWith<$Res>(_self.road!, (value) {
    return _then(_self.copyWith(road: value));
  });
}/// Create a copy of ProgramModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ContractRelationNestedModelCopyWith<$Res>? get contractRelation {
    if (_self.contractRelation == null) {
    return null;
  }

  return $ContractRelationNestedModelCopyWith<$Res>(_self.contractRelation!, (value) {
    return _then(_self.copyWith(contractRelation: value));
  });
}/// Create a copy of ProgramModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CreatedByNestedModelCopyWith<$Res>? get createdBy {
    if (_self.createdBy == null) {
    return null;
  }

  return $CreatedByNestedModelCopyWith<$Res>(_self.createdBy!, (value) {
    return _then(_self.copyWith(createdBy: value));
  });
}
}

// dart format on
