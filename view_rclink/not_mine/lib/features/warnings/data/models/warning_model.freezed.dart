// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'warning_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WarningModel {

 int? get id; String get uid; String get warningType; int? get dailyReportID; int get companyID; int get roadID; int get workScopeID; int? get contractRelationID; String? get fromSection; String? get toSection; List<WarningItemModel> get warningItems; WarningDailyReportModel? get dailyReport; bool get requiresAction; bool get isResolved; int? get resolvedByID; DateTime? get resolvedAt; String? get resolutionNotes; String? get longitude; String? get latitude; String? get description; int? get createdByID; DateTime get createdAt; DateTime get updatedAt; DateTime? get deletedAt; List<FileModel>? get files; CompanyResponseModel? get company; RoadResponseModel? get road; WorkScopeResponseModel? get workScope; CreatedByResponseModel? get createdBy; CreatedByResponseModel? get resolvedBy;
/// Create a copy of WarningModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WarningModelCopyWith<WarningModel> get copyWith => _$WarningModelCopyWithImpl<WarningModel>(this as WarningModel, _$identity);

  /// Serializes this WarningModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WarningModel&&(identical(other.id, id) || other.id == id)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.warningType, warningType) || other.warningType == warningType)&&(identical(other.dailyReportID, dailyReportID) || other.dailyReportID == dailyReportID)&&(identical(other.companyID, companyID) || other.companyID == companyID)&&(identical(other.roadID, roadID) || other.roadID == roadID)&&(identical(other.workScopeID, workScopeID) || other.workScopeID == workScopeID)&&(identical(other.contractRelationID, contractRelationID) || other.contractRelationID == contractRelationID)&&(identical(other.fromSection, fromSection) || other.fromSection == fromSection)&&(identical(other.toSection, toSection) || other.toSection == toSection)&&const DeepCollectionEquality().equals(other.warningItems, warningItems)&&(identical(other.dailyReport, dailyReport) || other.dailyReport == dailyReport)&&(identical(other.requiresAction, requiresAction) || other.requiresAction == requiresAction)&&(identical(other.isResolved, isResolved) || other.isResolved == isResolved)&&(identical(other.resolvedByID, resolvedByID) || other.resolvedByID == resolvedByID)&&(identical(other.resolvedAt, resolvedAt) || other.resolvedAt == resolvedAt)&&(identical(other.resolutionNotes, resolutionNotes) || other.resolutionNotes == resolutionNotes)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.description, description) || other.description == description)&&(identical(other.createdByID, createdByID) || other.createdByID == createdByID)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt)&&const DeepCollectionEquality().equals(other.files, files)&&(identical(other.company, company) || other.company == company)&&(identical(other.road, road) || other.road == road)&&(identical(other.workScope, workScope) || other.workScope == workScope)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.resolvedBy, resolvedBy) || other.resolvedBy == resolvedBy));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,uid,warningType,dailyReportID,companyID,roadID,workScopeID,contractRelationID,fromSection,toSection,const DeepCollectionEquality().hash(warningItems),dailyReport,requiresAction,isResolved,resolvedByID,resolvedAt,resolutionNotes,longitude,latitude,description,createdByID,createdAt,updatedAt,deletedAt,const DeepCollectionEquality().hash(files),company,road,workScope,createdBy,resolvedBy]);

@override
String toString() {
  return 'WarningModel(id: $id, uid: $uid, warningType: $warningType, dailyReportID: $dailyReportID, companyID: $companyID, roadID: $roadID, workScopeID: $workScopeID, contractRelationID: $contractRelationID, fromSection: $fromSection, toSection: $toSection, warningItems: $warningItems, dailyReport: $dailyReport, requiresAction: $requiresAction, isResolved: $isResolved, resolvedByID: $resolvedByID, resolvedAt: $resolvedAt, resolutionNotes: $resolutionNotes, longitude: $longitude, latitude: $latitude, description: $description, createdByID: $createdByID, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt, files: $files, company: $company, road: $road, workScope: $workScope, createdBy: $createdBy, resolvedBy: $resolvedBy)';
}


}

/// @nodoc
abstract mixin class $WarningModelCopyWith<$Res>  {
  factory $WarningModelCopyWith(WarningModel value, $Res Function(WarningModel) _then) = _$WarningModelCopyWithImpl;
@useResult
$Res call({
 int? id, String uid, String warningType, int? dailyReportID, int companyID, int roadID, int workScopeID, int? contractRelationID, String? fromSection, String? toSection, List<WarningItemModel> warningItems, WarningDailyReportModel? dailyReport, bool requiresAction, bool isResolved, int? resolvedByID, DateTime? resolvedAt, String? resolutionNotes, String? longitude, String? latitude, String? description, int? createdByID, DateTime createdAt, DateTime updatedAt, DateTime? deletedAt, List<FileModel>? files, CompanyResponseModel? company, RoadResponseModel? road, WorkScopeResponseModel? workScope, CreatedByResponseModel? createdBy, CreatedByResponseModel? resolvedBy
});


$WarningDailyReportModelCopyWith<$Res>? get dailyReport;$CompanyResponseModelCopyWith<$Res>? get company;$RoadResponseModelCopyWith<$Res>? get road;$WorkScopeResponseModelCopyWith<$Res>? get workScope;$CreatedByResponseModelCopyWith<$Res>? get createdBy;$CreatedByResponseModelCopyWith<$Res>? get resolvedBy;

}
/// @nodoc
class _$WarningModelCopyWithImpl<$Res>
    implements $WarningModelCopyWith<$Res> {
  _$WarningModelCopyWithImpl(this._self, this._then);

  final WarningModel _self;
  final $Res Function(WarningModel) _then;

/// Create a copy of WarningModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? uid = null,Object? warningType = null,Object? dailyReportID = freezed,Object? companyID = null,Object? roadID = null,Object? workScopeID = null,Object? contractRelationID = freezed,Object? fromSection = freezed,Object? toSection = freezed,Object? warningItems = null,Object? dailyReport = freezed,Object? requiresAction = null,Object? isResolved = null,Object? resolvedByID = freezed,Object? resolvedAt = freezed,Object? resolutionNotes = freezed,Object? longitude = freezed,Object? latitude = freezed,Object? description = freezed,Object? createdByID = freezed,Object? createdAt = null,Object? updatedAt = null,Object? deletedAt = freezed,Object? files = freezed,Object? company = freezed,Object? road = freezed,Object? workScope = freezed,Object? createdBy = freezed,Object? resolvedBy = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,warningType: null == warningType ? _self.warningType : warningType // ignore: cast_nullable_to_non_nullable
as String,dailyReportID: freezed == dailyReportID ? _self.dailyReportID : dailyReportID // ignore: cast_nullable_to_non_nullable
as int?,companyID: null == companyID ? _self.companyID : companyID // ignore: cast_nullable_to_non_nullable
as int,roadID: null == roadID ? _self.roadID : roadID // ignore: cast_nullable_to_non_nullable
as int,workScopeID: null == workScopeID ? _self.workScopeID : workScopeID // ignore: cast_nullable_to_non_nullable
as int,contractRelationID: freezed == contractRelationID ? _self.contractRelationID : contractRelationID // ignore: cast_nullable_to_non_nullable
as int?,fromSection: freezed == fromSection ? _self.fromSection : fromSection // ignore: cast_nullable_to_non_nullable
as String?,toSection: freezed == toSection ? _self.toSection : toSection // ignore: cast_nullable_to_non_nullable
as String?,warningItems: null == warningItems ? _self.warningItems : warningItems // ignore: cast_nullable_to_non_nullable
as List<WarningItemModel>,dailyReport: freezed == dailyReport ? _self.dailyReport : dailyReport // ignore: cast_nullable_to_non_nullable
as WarningDailyReportModel?,requiresAction: null == requiresAction ? _self.requiresAction : requiresAction // ignore: cast_nullable_to_non_nullable
as bool,isResolved: null == isResolved ? _self.isResolved : isResolved // ignore: cast_nullable_to_non_nullable
as bool,resolvedByID: freezed == resolvedByID ? _self.resolvedByID : resolvedByID // ignore: cast_nullable_to_non_nullable
as int?,resolvedAt: freezed == resolvedAt ? _self.resolvedAt : resolvedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,resolutionNotes: freezed == resolutionNotes ? _self.resolutionNotes : resolutionNotes // ignore: cast_nullable_to_non_nullable
as String?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as String?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,createdByID: freezed == createdByID ? _self.createdByID : createdByID // ignore: cast_nullable_to_non_nullable
as int?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,files: freezed == files ? _self.files : files // ignore: cast_nullable_to_non_nullable
as List<FileModel>?,company: freezed == company ? _self.company : company // ignore: cast_nullable_to_non_nullable
as CompanyResponseModel?,road: freezed == road ? _self.road : road // ignore: cast_nullable_to_non_nullable
as RoadResponseModel?,workScope: freezed == workScope ? _self.workScope : workScope // ignore: cast_nullable_to_non_nullable
as WorkScopeResponseModel?,createdBy: freezed == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as CreatedByResponseModel?,resolvedBy: freezed == resolvedBy ? _self.resolvedBy : resolvedBy // ignore: cast_nullable_to_non_nullable
as CreatedByResponseModel?,
  ));
}
/// Create a copy of WarningModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WarningDailyReportModelCopyWith<$Res>? get dailyReport {
    if (_self.dailyReport == null) {
    return null;
  }

  return $WarningDailyReportModelCopyWith<$Res>(_self.dailyReport!, (value) {
    return _then(_self.copyWith(dailyReport: value));
  });
}/// Create a copy of WarningModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CompanyResponseModelCopyWith<$Res>? get company {
    if (_self.company == null) {
    return null;
  }

  return $CompanyResponseModelCopyWith<$Res>(_self.company!, (value) {
    return _then(_self.copyWith(company: value));
  });
}/// Create a copy of WarningModel
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
}/// Create a copy of WarningModel
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
}/// Create a copy of WarningModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CreatedByResponseModelCopyWith<$Res>? get createdBy {
    if (_self.createdBy == null) {
    return null;
  }

  return $CreatedByResponseModelCopyWith<$Res>(_self.createdBy!, (value) {
    return _then(_self.copyWith(createdBy: value));
  });
}/// Create a copy of WarningModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CreatedByResponseModelCopyWith<$Res>? get resolvedBy {
    if (_self.resolvedBy == null) {
    return null;
  }

  return $CreatedByResponseModelCopyWith<$Res>(_self.resolvedBy!, (value) {
    return _then(_self.copyWith(resolvedBy: value));
  });
}
}


/// Adds pattern-matching-related methods to [WarningModel].
extension WarningModelPatterns on WarningModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WarningModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WarningModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WarningModel value)  $default,){
final _that = this;
switch (_that) {
case _WarningModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WarningModel value)?  $default,){
final _that = this;
switch (_that) {
case _WarningModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  String uid,  String warningType,  int? dailyReportID,  int companyID,  int roadID,  int workScopeID,  int? contractRelationID,  String? fromSection,  String? toSection,  List<WarningItemModel> warningItems,  WarningDailyReportModel? dailyReport,  bool requiresAction,  bool isResolved,  int? resolvedByID,  DateTime? resolvedAt,  String? resolutionNotes,  String? longitude,  String? latitude,  String? description,  int? createdByID,  DateTime createdAt,  DateTime updatedAt,  DateTime? deletedAt,  List<FileModel>? files,  CompanyResponseModel? company,  RoadResponseModel? road,  WorkScopeResponseModel? workScope,  CreatedByResponseModel? createdBy,  CreatedByResponseModel? resolvedBy)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WarningModel() when $default != null:
return $default(_that.id,_that.uid,_that.warningType,_that.dailyReportID,_that.companyID,_that.roadID,_that.workScopeID,_that.contractRelationID,_that.fromSection,_that.toSection,_that.warningItems,_that.dailyReport,_that.requiresAction,_that.isResolved,_that.resolvedByID,_that.resolvedAt,_that.resolutionNotes,_that.longitude,_that.latitude,_that.description,_that.createdByID,_that.createdAt,_that.updatedAt,_that.deletedAt,_that.files,_that.company,_that.road,_that.workScope,_that.createdBy,_that.resolvedBy);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  String uid,  String warningType,  int? dailyReportID,  int companyID,  int roadID,  int workScopeID,  int? contractRelationID,  String? fromSection,  String? toSection,  List<WarningItemModel> warningItems,  WarningDailyReportModel? dailyReport,  bool requiresAction,  bool isResolved,  int? resolvedByID,  DateTime? resolvedAt,  String? resolutionNotes,  String? longitude,  String? latitude,  String? description,  int? createdByID,  DateTime createdAt,  DateTime updatedAt,  DateTime? deletedAt,  List<FileModel>? files,  CompanyResponseModel? company,  RoadResponseModel? road,  WorkScopeResponseModel? workScope,  CreatedByResponseModel? createdBy,  CreatedByResponseModel? resolvedBy)  $default,) {final _that = this;
switch (_that) {
case _WarningModel():
return $default(_that.id,_that.uid,_that.warningType,_that.dailyReportID,_that.companyID,_that.roadID,_that.workScopeID,_that.contractRelationID,_that.fromSection,_that.toSection,_that.warningItems,_that.dailyReport,_that.requiresAction,_that.isResolved,_that.resolvedByID,_that.resolvedAt,_that.resolutionNotes,_that.longitude,_that.latitude,_that.description,_that.createdByID,_that.createdAt,_that.updatedAt,_that.deletedAt,_that.files,_that.company,_that.road,_that.workScope,_that.createdBy,_that.resolvedBy);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  String uid,  String warningType,  int? dailyReportID,  int companyID,  int roadID,  int workScopeID,  int? contractRelationID,  String? fromSection,  String? toSection,  List<WarningItemModel> warningItems,  WarningDailyReportModel? dailyReport,  bool requiresAction,  bool isResolved,  int? resolvedByID,  DateTime? resolvedAt,  String? resolutionNotes,  String? longitude,  String? latitude,  String? description,  int? createdByID,  DateTime createdAt,  DateTime updatedAt,  DateTime? deletedAt,  List<FileModel>? files,  CompanyResponseModel? company,  RoadResponseModel? road,  WorkScopeResponseModel? workScope,  CreatedByResponseModel? createdBy,  CreatedByResponseModel? resolvedBy)?  $default,) {final _that = this;
switch (_that) {
case _WarningModel() when $default != null:
return $default(_that.id,_that.uid,_that.warningType,_that.dailyReportID,_that.companyID,_that.roadID,_that.workScopeID,_that.contractRelationID,_that.fromSection,_that.toSection,_that.warningItems,_that.dailyReport,_that.requiresAction,_that.isResolved,_that.resolvedByID,_that.resolvedAt,_that.resolutionNotes,_that.longitude,_that.latitude,_that.description,_that.createdByID,_that.createdAt,_that.updatedAt,_that.deletedAt,_that.files,_that.company,_that.road,_that.workScope,_that.createdBy,_that.resolvedBy);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WarningModel extends WarningModel {
  const _WarningModel({this.id, required this.uid, required this.warningType, this.dailyReportID, required this.companyID, required this.roadID, required this.workScopeID, this.contractRelationID, this.fromSection, this.toSection, final  List<WarningItemModel> warningItems = const [], this.dailyReport, this.requiresAction = true, this.isResolved = false, this.resolvedByID, this.resolvedAt, this.resolutionNotes, this.longitude, this.latitude, this.description, this.createdByID, required this.createdAt, required this.updatedAt, this.deletedAt, final  List<FileModel>? files, this.company, this.road, this.workScope, this.createdBy, this.resolvedBy}): _warningItems = warningItems,_files = files,super._();
  factory _WarningModel.fromJson(Map<String, dynamic> json) => _$WarningModelFromJson(json);

@override final  int? id;
@override final  String uid;
@override final  String warningType;
@override final  int? dailyReportID;
@override final  int companyID;
@override final  int roadID;
@override final  int workScopeID;
@override final  int? contractRelationID;
@override final  String? fromSection;
@override final  String? toSection;
 final  List<WarningItemModel> _warningItems;
@override@JsonKey() List<WarningItemModel> get warningItems {
  if (_warningItems is EqualUnmodifiableListView) return _warningItems;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_warningItems);
}

@override final  WarningDailyReportModel? dailyReport;
@override@JsonKey() final  bool requiresAction;
@override@JsonKey() final  bool isResolved;
@override final  int? resolvedByID;
@override final  DateTime? resolvedAt;
@override final  String? resolutionNotes;
@override final  String? longitude;
@override final  String? latitude;
@override final  String? description;
@override final  int? createdByID;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;
@override final  DateTime? deletedAt;
 final  List<FileModel>? _files;
@override List<FileModel>? get files {
  final value = _files;
  if (value == null) return null;
  if (_files is EqualUnmodifiableListView) return _files;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  CompanyResponseModel? company;
@override final  RoadResponseModel? road;
@override final  WorkScopeResponseModel? workScope;
@override final  CreatedByResponseModel? createdBy;
@override final  CreatedByResponseModel? resolvedBy;

/// Create a copy of WarningModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WarningModelCopyWith<_WarningModel> get copyWith => __$WarningModelCopyWithImpl<_WarningModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WarningModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WarningModel&&(identical(other.id, id) || other.id == id)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.warningType, warningType) || other.warningType == warningType)&&(identical(other.dailyReportID, dailyReportID) || other.dailyReportID == dailyReportID)&&(identical(other.companyID, companyID) || other.companyID == companyID)&&(identical(other.roadID, roadID) || other.roadID == roadID)&&(identical(other.workScopeID, workScopeID) || other.workScopeID == workScopeID)&&(identical(other.contractRelationID, contractRelationID) || other.contractRelationID == contractRelationID)&&(identical(other.fromSection, fromSection) || other.fromSection == fromSection)&&(identical(other.toSection, toSection) || other.toSection == toSection)&&const DeepCollectionEquality().equals(other._warningItems, _warningItems)&&(identical(other.dailyReport, dailyReport) || other.dailyReport == dailyReport)&&(identical(other.requiresAction, requiresAction) || other.requiresAction == requiresAction)&&(identical(other.isResolved, isResolved) || other.isResolved == isResolved)&&(identical(other.resolvedByID, resolvedByID) || other.resolvedByID == resolvedByID)&&(identical(other.resolvedAt, resolvedAt) || other.resolvedAt == resolvedAt)&&(identical(other.resolutionNotes, resolutionNotes) || other.resolutionNotes == resolutionNotes)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.description, description) || other.description == description)&&(identical(other.createdByID, createdByID) || other.createdByID == createdByID)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt)&&const DeepCollectionEquality().equals(other._files, _files)&&(identical(other.company, company) || other.company == company)&&(identical(other.road, road) || other.road == road)&&(identical(other.workScope, workScope) || other.workScope == workScope)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.resolvedBy, resolvedBy) || other.resolvedBy == resolvedBy));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,uid,warningType,dailyReportID,companyID,roadID,workScopeID,contractRelationID,fromSection,toSection,const DeepCollectionEquality().hash(_warningItems),dailyReport,requiresAction,isResolved,resolvedByID,resolvedAt,resolutionNotes,longitude,latitude,description,createdByID,createdAt,updatedAt,deletedAt,const DeepCollectionEquality().hash(_files),company,road,workScope,createdBy,resolvedBy]);

@override
String toString() {
  return 'WarningModel(id: $id, uid: $uid, warningType: $warningType, dailyReportID: $dailyReportID, companyID: $companyID, roadID: $roadID, workScopeID: $workScopeID, contractRelationID: $contractRelationID, fromSection: $fromSection, toSection: $toSection, warningItems: $warningItems, dailyReport: $dailyReport, requiresAction: $requiresAction, isResolved: $isResolved, resolvedByID: $resolvedByID, resolvedAt: $resolvedAt, resolutionNotes: $resolutionNotes, longitude: $longitude, latitude: $latitude, description: $description, createdByID: $createdByID, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt, files: $files, company: $company, road: $road, workScope: $workScope, createdBy: $createdBy, resolvedBy: $resolvedBy)';
}


}

/// @nodoc
abstract mixin class _$WarningModelCopyWith<$Res> implements $WarningModelCopyWith<$Res> {
  factory _$WarningModelCopyWith(_WarningModel value, $Res Function(_WarningModel) _then) = __$WarningModelCopyWithImpl;
@override @useResult
$Res call({
 int? id, String uid, String warningType, int? dailyReportID, int companyID, int roadID, int workScopeID, int? contractRelationID, String? fromSection, String? toSection, List<WarningItemModel> warningItems, WarningDailyReportModel? dailyReport, bool requiresAction, bool isResolved, int? resolvedByID, DateTime? resolvedAt, String? resolutionNotes, String? longitude, String? latitude, String? description, int? createdByID, DateTime createdAt, DateTime updatedAt, DateTime? deletedAt, List<FileModel>? files, CompanyResponseModel? company, RoadResponseModel? road, WorkScopeResponseModel? workScope, CreatedByResponseModel? createdBy, CreatedByResponseModel? resolvedBy
});


@override $WarningDailyReportModelCopyWith<$Res>? get dailyReport;@override $CompanyResponseModelCopyWith<$Res>? get company;@override $RoadResponseModelCopyWith<$Res>? get road;@override $WorkScopeResponseModelCopyWith<$Res>? get workScope;@override $CreatedByResponseModelCopyWith<$Res>? get createdBy;@override $CreatedByResponseModelCopyWith<$Res>? get resolvedBy;

}
/// @nodoc
class __$WarningModelCopyWithImpl<$Res>
    implements _$WarningModelCopyWith<$Res> {
  __$WarningModelCopyWithImpl(this._self, this._then);

  final _WarningModel _self;
  final $Res Function(_WarningModel) _then;

/// Create a copy of WarningModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? uid = null,Object? warningType = null,Object? dailyReportID = freezed,Object? companyID = null,Object? roadID = null,Object? workScopeID = null,Object? contractRelationID = freezed,Object? fromSection = freezed,Object? toSection = freezed,Object? warningItems = null,Object? dailyReport = freezed,Object? requiresAction = null,Object? isResolved = null,Object? resolvedByID = freezed,Object? resolvedAt = freezed,Object? resolutionNotes = freezed,Object? longitude = freezed,Object? latitude = freezed,Object? description = freezed,Object? createdByID = freezed,Object? createdAt = null,Object? updatedAt = null,Object? deletedAt = freezed,Object? files = freezed,Object? company = freezed,Object? road = freezed,Object? workScope = freezed,Object? createdBy = freezed,Object? resolvedBy = freezed,}) {
  return _then(_WarningModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,warningType: null == warningType ? _self.warningType : warningType // ignore: cast_nullable_to_non_nullable
as String,dailyReportID: freezed == dailyReportID ? _self.dailyReportID : dailyReportID // ignore: cast_nullable_to_non_nullable
as int?,companyID: null == companyID ? _self.companyID : companyID // ignore: cast_nullable_to_non_nullable
as int,roadID: null == roadID ? _self.roadID : roadID // ignore: cast_nullable_to_non_nullable
as int,workScopeID: null == workScopeID ? _self.workScopeID : workScopeID // ignore: cast_nullable_to_non_nullable
as int,contractRelationID: freezed == contractRelationID ? _self.contractRelationID : contractRelationID // ignore: cast_nullable_to_non_nullable
as int?,fromSection: freezed == fromSection ? _self.fromSection : fromSection // ignore: cast_nullable_to_non_nullable
as String?,toSection: freezed == toSection ? _self.toSection : toSection // ignore: cast_nullable_to_non_nullable
as String?,warningItems: null == warningItems ? _self._warningItems : warningItems // ignore: cast_nullable_to_non_nullable
as List<WarningItemModel>,dailyReport: freezed == dailyReport ? _self.dailyReport : dailyReport // ignore: cast_nullable_to_non_nullable
as WarningDailyReportModel?,requiresAction: null == requiresAction ? _self.requiresAction : requiresAction // ignore: cast_nullable_to_non_nullable
as bool,isResolved: null == isResolved ? _self.isResolved : isResolved // ignore: cast_nullable_to_non_nullable
as bool,resolvedByID: freezed == resolvedByID ? _self.resolvedByID : resolvedByID // ignore: cast_nullable_to_non_nullable
as int?,resolvedAt: freezed == resolvedAt ? _self.resolvedAt : resolvedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,resolutionNotes: freezed == resolutionNotes ? _self.resolutionNotes : resolutionNotes // ignore: cast_nullable_to_non_nullable
as String?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as String?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,createdByID: freezed == createdByID ? _self.createdByID : createdByID // ignore: cast_nullable_to_non_nullable
as int?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,files: freezed == files ? _self._files : files // ignore: cast_nullable_to_non_nullable
as List<FileModel>?,company: freezed == company ? _self.company : company // ignore: cast_nullable_to_non_nullable
as CompanyResponseModel?,road: freezed == road ? _self.road : road // ignore: cast_nullable_to_non_nullable
as RoadResponseModel?,workScope: freezed == workScope ? _self.workScope : workScope // ignore: cast_nullable_to_non_nullable
as WorkScopeResponseModel?,createdBy: freezed == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as CreatedByResponseModel?,resolvedBy: freezed == resolvedBy ? _self.resolvedBy : resolvedBy // ignore: cast_nullable_to_non_nullable
as CreatedByResponseModel?,
  ));
}

/// Create a copy of WarningModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WarningDailyReportModelCopyWith<$Res>? get dailyReport {
    if (_self.dailyReport == null) {
    return null;
  }

  return $WarningDailyReportModelCopyWith<$Res>(_self.dailyReport!, (value) {
    return _then(_self.copyWith(dailyReport: value));
  });
}/// Create a copy of WarningModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CompanyResponseModelCopyWith<$Res>? get company {
    if (_self.company == null) {
    return null;
  }

  return $CompanyResponseModelCopyWith<$Res>(_self.company!, (value) {
    return _then(_self.copyWith(company: value));
  });
}/// Create a copy of WarningModel
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
}/// Create a copy of WarningModel
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
}/// Create a copy of WarningModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CreatedByResponseModelCopyWith<$Res>? get createdBy {
    if (_self.createdBy == null) {
    return null;
  }

  return $CreatedByResponseModelCopyWith<$Res>(_self.createdBy!, (value) {
    return _then(_self.copyWith(createdBy: value));
  });
}/// Create a copy of WarningModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CreatedByResponseModelCopyWith<$Res>? get resolvedBy {
    if (_self.resolvedBy == null) {
    return null;
  }

  return $CreatedByResponseModelCopyWith<$Res>(_self.resolvedBy!, (value) {
    return _then(_self.copyWith(resolvedBy: value));
  });
}
}

// dart format on
