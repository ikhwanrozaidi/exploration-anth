// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'daily_report_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DailyReportResponseModel {

 int? get id; String? get uid; String? get name; String? get notes; String? get weatherCondition; bool? get workPerformed; int? get companyID; String? get status; int? get contractRelationID; int? get approvedByID; DateTime? get approvedAt; String? get rejectionReason; int? get workScopeID; int? get roadID; int? get totalWorkers; String? get fromSection; String? get toSection; String? get longitude; String? get latitude; int? get createdByID; DateTime? get createdAt; DateTime? get updatedAt; DateTime? get deletedAt; WorkScopeResponseModel? get workScope; RoadResponseModel? get road; List<EquipmentResponseModel>? get equipments; List<ReportQuantityResponseModel>? get reportQuantities;
/// Create a copy of DailyReportResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DailyReportResponseModelCopyWith<DailyReportResponseModel> get copyWith => _$DailyReportResponseModelCopyWithImpl<DailyReportResponseModel>(this as DailyReportResponseModel, _$identity);

  /// Serializes this DailyReportResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DailyReportResponseModel&&(identical(other.id, id) || other.id == id)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.name, name) || other.name == name)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.weatherCondition, weatherCondition) || other.weatherCondition == weatherCondition)&&(identical(other.workPerformed, workPerformed) || other.workPerformed == workPerformed)&&(identical(other.companyID, companyID) || other.companyID == companyID)&&(identical(other.status, status) || other.status == status)&&(identical(other.contractRelationID, contractRelationID) || other.contractRelationID == contractRelationID)&&(identical(other.approvedByID, approvedByID) || other.approvedByID == approvedByID)&&(identical(other.approvedAt, approvedAt) || other.approvedAt == approvedAt)&&(identical(other.rejectionReason, rejectionReason) || other.rejectionReason == rejectionReason)&&(identical(other.workScopeID, workScopeID) || other.workScopeID == workScopeID)&&(identical(other.roadID, roadID) || other.roadID == roadID)&&(identical(other.totalWorkers, totalWorkers) || other.totalWorkers == totalWorkers)&&(identical(other.fromSection, fromSection) || other.fromSection == fromSection)&&(identical(other.toSection, toSection) || other.toSection == toSection)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.createdByID, createdByID) || other.createdByID == createdByID)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt)&&(identical(other.workScope, workScope) || other.workScope == workScope)&&(identical(other.road, road) || other.road == road)&&const DeepCollectionEquality().equals(other.equipments, equipments)&&const DeepCollectionEquality().equals(other.reportQuantities, reportQuantities));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,uid,name,notes,weatherCondition,workPerformed,companyID,status,contractRelationID,approvedByID,approvedAt,rejectionReason,workScopeID,roadID,totalWorkers,fromSection,toSection,longitude,latitude,createdByID,createdAt,updatedAt,deletedAt,workScope,road,const DeepCollectionEquality().hash(equipments),const DeepCollectionEquality().hash(reportQuantities)]);

@override
String toString() {
  return 'DailyReportResponseModel(id: $id, uid: $uid, name: $name, notes: $notes, weatherCondition: $weatherCondition, workPerformed: $workPerformed, companyID: $companyID, status: $status, contractRelationID: $contractRelationID, approvedByID: $approvedByID, approvedAt: $approvedAt, rejectionReason: $rejectionReason, workScopeID: $workScopeID, roadID: $roadID, totalWorkers: $totalWorkers, fromSection: $fromSection, toSection: $toSection, longitude: $longitude, latitude: $latitude, createdByID: $createdByID, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt, workScope: $workScope, road: $road, equipments: $equipments, reportQuantities: $reportQuantities)';
}


}

/// @nodoc
abstract mixin class $DailyReportResponseModelCopyWith<$Res>  {
  factory $DailyReportResponseModelCopyWith(DailyReportResponseModel value, $Res Function(DailyReportResponseModel) _then) = _$DailyReportResponseModelCopyWithImpl;
@useResult
$Res call({
 int? id, String? uid, String? name, String? notes, String? weatherCondition, bool? workPerformed, int? companyID, String? status, int? contractRelationID, int? approvedByID, DateTime? approvedAt, String? rejectionReason, int? workScopeID, int? roadID, int? totalWorkers, String? fromSection, String? toSection, String? longitude, String? latitude, int? createdByID, DateTime? createdAt, DateTime? updatedAt, DateTime? deletedAt, WorkScopeResponseModel? workScope, RoadResponseModel? road, List<EquipmentResponseModel>? equipments, List<ReportQuantityResponseModel>? reportQuantities
});


$WorkScopeResponseModelCopyWith<$Res>? get workScope;$RoadResponseModelCopyWith<$Res>? get road;

}
/// @nodoc
class _$DailyReportResponseModelCopyWithImpl<$Res>
    implements $DailyReportResponseModelCopyWith<$Res> {
  _$DailyReportResponseModelCopyWithImpl(this._self, this._then);

  final DailyReportResponseModel _self;
  final $Res Function(DailyReportResponseModel) _then;

/// Create a copy of DailyReportResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? uid = freezed,Object? name = freezed,Object? notes = freezed,Object? weatherCondition = freezed,Object? workPerformed = freezed,Object? companyID = freezed,Object? status = freezed,Object? contractRelationID = freezed,Object? approvedByID = freezed,Object? approvedAt = freezed,Object? rejectionReason = freezed,Object? workScopeID = freezed,Object? roadID = freezed,Object? totalWorkers = freezed,Object? fromSection = freezed,Object? toSection = freezed,Object? longitude = freezed,Object? latitude = freezed,Object? createdByID = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? deletedAt = freezed,Object? workScope = freezed,Object? road = freezed,Object? equipments = freezed,Object? reportQuantities = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,uid: freezed == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,weatherCondition: freezed == weatherCondition ? _self.weatherCondition : weatherCondition // ignore: cast_nullable_to_non_nullable
as String?,workPerformed: freezed == workPerformed ? _self.workPerformed : workPerformed // ignore: cast_nullable_to_non_nullable
as bool?,companyID: freezed == companyID ? _self.companyID : companyID // ignore: cast_nullable_to_non_nullable
as int?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,contractRelationID: freezed == contractRelationID ? _self.contractRelationID : contractRelationID // ignore: cast_nullable_to_non_nullable
as int?,approvedByID: freezed == approvedByID ? _self.approvedByID : approvedByID // ignore: cast_nullable_to_non_nullable
as int?,approvedAt: freezed == approvedAt ? _self.approvedAt : approvedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,rejectionReason: freezed == rejectionReason ? _self.rejectionReason : rejectionReason // ignore: cast_nullable_to_non_nullable
as String?,workScopeID: freezed == workScopeID ? _self.workScopeID : workScopeID // ignore: cast_nullable_to_non_nullable
as int?,roadID: freezed == roadID ? _self.roadID : roadID // ignore: cast_nullable_to_non_nullable
as int?,totalWorkers: freezed == totalWorkers ? _self.totalWorkers : totalWorkers // ignore: cast_nullable_to_non_nullable
as int?,fromSection: freezed == fromSection ? _self.fromSection : fromSection // ignore: cast_nullable_to_non_nullable
as String?,toSection: freezed == toSection ? _self.toSection : toSection // ignore: cast_nullable_to_non_nullable
as String?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as String?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as String?,createdByID: freezed == createdByID ? _self.createdByID : createdByID // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,workScope: freezed == workScope ? _self.workScope : workScope // ignore: cast_nullable_to_non_nullable
as WorkScopeResponseModel?,road: freezed == road ? _self.road : road // ignore: cast_nullable_to_non_nullable
as RoadResponseModel?,equipments: freezed == equipments ? _self.equipments : equipments // ignore: cast_nullable_to_non_nullable
as List<EquipmentResponseModel>?,reportQuantities: freezed == reportQuantities ? _self.reportQuantities : reportQuantities // ignore: cast_nullable_to_non_nullable
as List<ReportQuantityResponseModel>?,
  ));
}
/// Create a copy of DailyReportResponseModel
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
}/// Create a copy of DailyReportResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RoadResponseModelCopyWith<$Res>? get road {
    if (_self.road == null) {
    return null;
  }

  return $RoadResponseModelCopyWith<$Res>(_self.road!, (value) {
    return _then(_self.copyWith(road: value));
  });
}
}


/// Adds pattern-matching-related methods to [DailyReportResponseModel].
extension DailyReportResponseModelPatterns on DailyReportResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DailyReportResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DailyReportResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DailyReportResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _DailyReportResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DailyReportResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _DailyReportResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  String? uid,  String? name,  String? notes,  String? weatherCondition,  bool? workPerformed,  int? companyID,  String? status,  int? contractRelationID,  int? approvedByID,  DateTime? approvedAt,  String? rejectionReason,  int? workScopeID,  int? roadID,  int? totalWorkers,  String? fromSection,  String? toSection,  String? longitude,  String? latitude,  int? createdByID,  DateTime? createdAt,  DateTime? updatedAt,  DateTime? deletedAt,  WorkScopeResponseModel? workScope,  RoadResponseModel? road,  List<EquipmentResponseModel>? equipments,  List<ReportQuantityResponseModel>? reportQuantities)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DailyReportResponseModel() when $default != null:
return $default(_that.id,_that.uid,_that.name,_that.notes,_that.weatherCondition,_that.workPerformed,_that.companyID,_that.status,_that.contractRelationID,_that.approvedByID,_that.approvedAt,_that.rejectionReason,_that.workScopeID,_that.roadID,_that.totalWorkers,_that.fromSection,_that.toSection,_that.longitude,_that.latitude,_that.createdByID,_that.createdAt,_that.updatedAt,_that.deletedAt,_that.workScope,_that.road,_that.equipments,_that.reportQuantities);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  String? uid,  String? name,  String? notes,  String? weatherCondition,  bool? workPerformed,  int? companyID,  String? status,  int? contractRelationID,  int? approvedByID,  DateTime? approvedAt,  String? rejectionReason,  int? workScopeID,  int? roadID,  int? totalWorkers,  String? fromSection,  String? toSection,  String? longitude,  String? latitude,  int? createdByID,  DateTime? createdAt,  DateTime? updatedAt,  DateTime? deletedAt,  WorkScopeResponseModel? workScope,  RoadResponseModel? road,  List<EquipmentResponseModel>? equipments,  List<ReportQuantityResponseModel>? reportQuantities)  $default,) {final _that = this;
switch (_that) {
case _DailyReportResponseModel():
return $default(_that.id,_that.uid,_that.name,_that.notes,_that.weatherCondition,_that.workPerformed,_that.companyID,_that.status,_that.contractRelationID,_that.approvedByID,_that.approvedAt,_that.rejectionReason,_that.workScopeID,_that.roadID,_that.totalWorkers,_that.fromSection,_that.toSection,_that.longitude,_that.latitude,_that.createdByID,_that.createdAt,_that.updatedAt,_that.deletedAt,_that.workScope,_that.road,_that.equipments,_that.reportQuantities);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  String? uid,  String? name,  String? notes,  String? weatherCondition,  bool? workPerformed,  int? companyID,  String? status,  int? contractRelationID,  int? approvedByID,  DateTime? approvedAt,  String? rejectionReason,  int? workScopeID,  int? roadID,  int? totalWorkers,  String? fromSection,  String? toSection,  String? longitude,  String? latitude,  int? createdByID,  DateTime? createdAt,  DateTime? updatedAt,  DateTime? deletedAt,  WorkScopeResponseModel? workScope,  RoadResponseModel? road,  List<EquipmentResponseModel>? equipments,  List<ReportQuantityResponseModel>? reportQuantities)?  $default,) {final _that = this;
switch (_that) {
case _DailyReportResponseModel() when $default != null:
return $default(_that.id,_that.uid,_that.name,_that.notes,_that.weatherCondition,_that.workPerformed,_that.companyID,_that.status,_that.contractRelationID,_that.approvedByID,_that.approvedAt,_that.rejectionReason,_that.workScopeID,_that.roadID,_that.totalWorkers,_that.fromSection,_that.toSection,_that.longitude,_that.latitude,_that.createdByID,_that.createdAt,_that.updatedAt,_that.deletedAt,_that.workScope,_that.road,_that.equipments,_that.reportQuantities);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DailyReportResponseModel extends DailyReportResponseModel {
  const _DailyReportResponseModel({this.id, this.uid, this.name, this.notes, this.weatherCondition, this.workPerformed, this.companyID, this.status, this.contractRelationID, this.approvedByID, this.approvedAt, this.rejectionReason, this.workScopeID, this.roadID, this.totalWorkers, this.fromSection, this.toSection, this.longitude, this.latitude, this.createdByID, this.createdAt, this.updatedAt, this.deletedAt, this.workScope, this.road, final  List<EquipmentResponseModel>? equipments, final  List<ReportQuantityResponseModel>? reportQuantities}): _equipments = equipments,_reportQuantities = reportQuantities,super._();
  factory _DailyReportResponseModel.fromJson(Map<String, dynamic> json) => _$DailyReportResponseModelFromJson(json);

@override final  int? id;
@override final  String? uid;
@override final  String? name;
@override final  String? notes;
@override final  String? weatherCondition;
@override final  bool? workPerformed;
@override final  int? companyID;
@override final  String? status;
@override final  int? contractRelationID;
@override final  int? approvedByID;
@override final  DateTime? approvedAt;
@override final  String? rejectionReason;
@override final  int? workScopeID;
@override final  int? roadID;
@override final  int? totalWorkers;
@override final  String? fromSection;
@override final  String? toSection;
@override final  String? longitude;
@override final  String? latitude;
@override final  int? createdByID;
@override final  DateTime? createdAt;
@override final  DateTime? updatedAt;
@override final  DateTime? deletedAt;
@override final  WorkScopeResponseModel? workScope;
@override final  RoadResponseModel? road;
 final  List<EquipmentResponseModel>? _equipments;
@override List<EquipmentResponseModel>? get equipments {
  final value = _equipments;
  if (value == null) return null;
  if (_equipments is EqualUnmodifiableListView) return _equipments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<ReportQuantityResponseModel>? _reportQuantities;
@override List<ReportQuantityResponseModel>? get reportQuantities {
  final value = _reportQuantities;
  if (value == null) return null;
  if (_reportQuantities is EqualUnmodifiableListView) return _reportQuantities;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of DailyReportResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DailyReportResponseModelCopyWith<_DailyReportResponseModel> get copyWith => __$DailyReportResponseModelCopyWithImpl<_DailyReportResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DailyReportResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DailyReportResponseModel&&(identical(other.id, id) || other.id == id)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.name, name) || other.name == name)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.weatherCondition, weatherCondition) || other.weatherCondition == weatherCondition)&&(identical(other.workPerformed, workPerformed) || other.workPerformed == workPerformed)&&(identical(other.companyID, companyID) || other.companyID == companyID)&&(identical(other.status, status) || other.status == status)&&(identical(other.contractRelationID, contractRelationID) || other.contractRelationID == contractRelationID)&&(identical(other.approvedByID, approvedByID) || other.approvedByID == approvedByID)&&(identical(other.approvedAt, approvedAt) || other.approvedAt == approvedAt)&&(identical(other.rejectionReason, rejectionReason) || other.rejectionReason == rejectionReason)&&(identical(other.workScopeID, workScopeID) || other.workScopeID == workScopeID)&&(identical(other.roadID, roadID) || other.roadID == roadID)&&(identical(other.totalWorkers, totalWorkers) || other.totalWorkers == totalWorkers)&&(identical(other.fromSection, fromSection) || other.fromSection == fromSection)&&(identical(other.toSection, toSection) || other.toSection == toSection)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.createdByID, createdByID) || other.createdByID == createdByID)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt)&&(identical(other.workScope, workScope) || other.workScope == workScope)&&(identical(other.road, road) || other.road == road)&&const DeepCollectionEquality().equals(other._equipments, _equipments)&&const DeepCollectionEquality().equals(other._reportQuantities, _reportQuantities));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,uid,name,notes,weatherCondition,workPerformed,companyID,status,contractRelationID,approvedByID,approvedAt,rejectionReason,workScopeID,roadID,totalWorkers,fromSection,toSection,longitude,latitude,createdByID,createdAt,updatedAt,deletedAt,workScope,road,const DeepCollectionEquality().hash(_equipments),const DeepCollectionEquality().hash(_reportQuantities)]);

@override
String toString() {
  return 'DailyReportResponseModel(id: $id, uid: $uid, name: $name, notes: $notes, weatherCondition: $weatherCondition, workPerformed: $workPerformed, companyID: $companyID, status: $status, contractRelationID: $contractRelationID, approvedByID: $approvedByID, approvedAt: $approvedAt, rejectionReason: $rejectionReason, workScopeID: $workScopeID, roadID: $roadID, totalWorkers: $totalWorkers, fromSection: $fromSection, toSection: $toSection, longitude: $longitude, latitude: $latitude, createdByID: $createdByID, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt, workScope: $workScope, road: $road, equipments: $equipments, reportQuantities: $reportQuantities)';
}


}

/// @nodoc
abstract mixin class _$DailyReportResponseModelCopyWith<$Res> implements $DailyReportResponseModelCopyWith<$Res> {
  factory _$DailyReportResponseModelCopyWith(_DailyReportResponseModel value, $Res Function(_DailyReportResponseModel) _then) = __$DailyReportResponseModelCopyWithImpl;
@override @useResult
$Res call({
 int? id, String? uid, String? name, String? notes, String? weatherCondition, bool? workPerformed, int? companyID, String? status, int? contractRelationID, int? approvedByID, DateTime? approvedAt, String? rejectionReason, int? workScopeID, int? roadID, int? totalWorkers, String? fromSection, String? toSection, String? longitude, String? latitude, int? createdByID, DateTime? createdAt, DateTime? updatedAt, DateTime? deletedAt, WorkScopeResponseModel? workScope, RoadResponseModel? road, List<EquipmentResponseModel>? equipments, List<ReportQuantityResponseModel>? reportQuantities
});


@override $WorkScopeResponseModelCopyWith<$Res>? get workScope;@override $RoadResponseModelCopyWith<$Res>? get road;

}
/// @nodoc
class __$DailyReportResponseModelCopyWithImpl<$Res>
    implements _$DailyReportResponseModelCopyWith<$Res> {
  __$DailyReportResponseModelCopyWithImpl(this._self, this._then);

  final _DailyReportResponseModel _self;
  final $Res Function(_DailyReportResponseModel) _then;

/// Create a copy of DailyReportResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? uid = freezed,Object? name = freezed,Object? notes = freezed,Object? weatherCondition = freezed,Object? workPerformed = freezed,Object? companyID = freezed,Object? status = freezed,Object? contractRelationID = freezed,Object? approvedByID = freezed,Object? approvedAt = freezed,Object? rejectionReason = freezed,Object? workScopeID = freezed,Object? roadID = freezed,Object? totalWorkers = freezed,Object? fromSection = freezed,Object? toSection = freezed,Object? longitude = freezed,Object? latitude = freezed,Object? createdByID = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? deletedAt = freezed,Object? workScope = freezed,Object? road = freezed,Object? equipments = freezed,Object? reportQuantities = freezed,}) {
  return _then(_DailyReportResponseModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,uid: freezed == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,weatherCondition: freezed == weatherCondition ? _self.weatherCondition : weatherCondition // ignore: cast_nullable_to_non_nullable
as String?,workPerformed: freezed == workPerformed ? _self.workPerformed : workPerformed // ignore: cast_nullable_to_non_nullable
as bool?,companyID: freezed == companyID ? _self.companyID : companyID // ignore: cast_nullable_to_non_nullable
as int?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,contractRelationID: freezed == contractRelationID ? _self.contractRelationID : contractRelationID // ignore: cast_nullable_to_non_nullable
as int?,approvedByID: freezed == approvedByID ? _self.approvedByID : approvedByID // ignore: cast_nullable_to_non_nullable
as int?,approvedAt: freezed == approvedAt ? _self.approvedAt : approvedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,rejectionReason: freezed == rejectionReason ? _self.rejectionReason : rejectionReason // ignore: cast_nullable_to_non_nullable
as String?,workScopeID: freezed == workScopeID ? _self.workScopeID : workScopeID // ignore: cast_nullable_to_non_nullable
as int?,roadID: freezed == roadID ? _self.roadID : roadID // ignore: cast_nullable_to_non_nullable
as int?,totalWorkers: freezed == totalWorkers ? _self.totalWorkers : totalWorkers // ignore: cast_nullable_to_non_nullable
as int?,fromSection: freezed == fromSection ? _self.fromSection : fromSection // ignore: cast_nullable_to_non_nullable
as String?,toSection: freezed == toSection ? _self.toSection : toSection // ignore: cast_nullable_to_non_nullable
as String?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as String?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as String?,createdByID: freezed == createdByID ? _self.createdByID : createdByID // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,workScope: freezed == workScope ? _self.workScope : workScope // ignore: cast_nullable_to_non_nullable
as WorkScopeResponseModel?,road: freezed == road ? _self.road : road // ignore: cast_nullable_to_non_nullable
as RoadResponseModel?,equipments: freezed == equipments ? _self._equipments : equipments // ignore: cast_nullable_to_non_nullable
as List<EquipmentResponseModel>?,reportQuantities: freezed == reportQuantities ? _self._reportQuantities : reportQuantities // ignore: cast_nullable_to_non_nullable
as List<ReportQuantityResponseModel>?,
  ));
}

/// Create a copy of DailyReportResponseModel
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
}/// Create a copy of DailyReportResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RoadResponseModelCopyWith<$Res>? get road {
    if (_self.road == null) {
    return null;
  }

  return $RoadResponseModelCopyWith<$Res>(_self.road!, (value) {
    return _then(_self.copyWith(road: value));
  });
}
}

// dart format on
