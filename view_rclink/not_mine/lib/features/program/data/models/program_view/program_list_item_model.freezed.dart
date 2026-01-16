// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'program_list_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProgramListItemModel {

 int? get id; String? get uid; String? get name; String? get description; int? get companyID; int? get workScopeID; int? get roadID; String? get periodStart; String? get periodEnd; int? get contractRelationID; int? get requiredReportsCount; int? get totalReports; String? get calculationType; String? get fromSection; String? get toSection; String? get dividerValue; String? get inputValue; double? get longitude; double? get latitude; String? get status; int? get createdByID; String? get createdAt; String? get updatedAt; String? get deletedAt; WorkScopeNestedModel? get workScope; RoadModel? get road; ContractorRelationModel? get contractRelation; CreatedByNestedModel? get createdBy;@JsonKey(name: '_count') ProgramCountModel? get count;
/// Create a copy of ProgramListItemModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProgramListItemModelCopyWith<ProgramListItemModel> get copyWith => _$ProgramListItemModelCopyWithImpl<ProgramListItemModel>(this as ProgramListItemModel, _$identity);

  /// Serializes this ProgramListItemModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProgramListItemModel&&(identical(other.id, id) || other.id == id)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.companyID, companyID) || other.companyID == companyID)&&(identical(other.workScopeID, workScopeID) || other.workScopeID == workScopeID)&&(identical(other.roadID, roadID) || other.roadID == roadID)&&(identical(other.periodStart, periodStart) || other.periodStart == periodStart)&&(identical(other.periodEnd, periodEnd) || other.periodEnd == periodEnd)&&(identical(other.contractRelationID, contractRelationID) || other.contractRelationID == contractRelationID)&&(identical(other.requiredReportsCount, requiredReportsCount) || other.requiredReportsCount == requiredReportsCount)&&(identical(other.totalReports, totalReports) || other.totalReports == totalReports)&&(identical(other.calculationType, calculationType) || other.calculationType == calculationType)&&(identical(other.fromSection, fromSection) || other.fromSection == fromSection)&&(identical(other.toSection, toSection) || other.toSection == toSection)&&(identical(other.dividerValue, dividerValue) || other.dividerValue == dividerValue)&&(identical(other.inputValue, inputValue) || other.inputValue == inputValue)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdByID, createdByID) || other.createdByID == createdByID)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt)&&(identical(other.workScope, workScope) || other.workScope == workScope)&&(identical(other.road, road) || other.road == road)&&(identical(other.contractRelation, contractRelation) || other.contractRelation == contractRelation)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.count, count) || other.count == count));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,uid,name,description,companyID,workScopeID,roadID,periodStart,periodEnd,contractRelationID,requiredReportsCount,totalReports,calculationType,fromSection,toSection,dividerValue,inputValue,longitude,latitude,status,createdByID,createdAt,updatedAt,deletedAt,workScope,road,contractRelation,createdBy,count]);

@override
String toString() {
  return 'ProgramListItemModel(id: $id, uid: $uid, name: $name, description: $description, companyID: $companyID, workScopeID: $workScopeID, roadID: $roadID, periodStart: $periodStart, periodEnd: $periodEnd, contractRelationID: $contractRelationID, requiredReportsCount: $requiredReportsCount, totalReports: $totalReports, calculationType: $calculationType, fromSection: $fromSection, toSection: $toSection, dividerValue: $dividerValue, inputValue: $inputValue, longitude: $longitude, latitude: $latitude, status: $status, createdByID: $createdByID, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt, workScope: $workScope, road: $road, contractRelation: $contractRelation, createdBy: $createdBy, count: $count)';
}


}

/// @nodoc
abstract mixin class $ProgramListItemModelCopyWith<$Res>  {
  factory $ProgramListItemModelCopyWith(ProgramListItemModel value, $Res Function(ProgramListItemModel) _then) = _$ProgramListItemModelCopyWithImpl;
@useResult
$Res call({
 int? id, String? uid, String? name, String? description, int? companyID, int? workScopeID, int? roadID, String? periodStart, String? periodEnd, int? contractRelationID, int? requiredReportsCount, int? totalReports, String? calculationType, String? fromSection, String? toSection, String? dividerValue, String? inputValue, double? longitude, double? latitude, String? status, int? createdByID, String? createdAt, String? updatedAt, String? deletedAt, WorkScopeNestedModel? workScope, RoadModel? road, ContractorRelationModel? contractRelation, CreatedByNestedModel? createdBy,@JsonKey(name: '_count') ProgramCountModel? count
});


$WorkScopeNestedModelCopyWith<$Res>? get workScope;$RoadModelCopyWith<$Res>? get road;$ContractorRelationModelCopyWith<$Res>? get contractRelation;$CreatedByNestedModelCopyWith<$Res>? get createdBy;$ProgramCountModelCopyWith<$Res>? get count;

}
/// @nodoc
class _$ProgramListItemModelCopyWithImpl<$Res>
    implements $ProgramListItemModelCopyWith<$Res> {
  _$ProgramListItemModelCopyWithImpl(this._self, this._then);

  final ProgramListItemModel _self;
  final $Res Function(ProgramListItemModel) _then;

/// Create a copy of ProgramListItemModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? uid = freezed,Object? name = freezed,Object? description = freezed,Object? companyID = freezed,Object? workScopeID = freezed,Object? roadID = freezed,Object? periodStart = freezed,Object? periodEnd = freezed,Object? contractRelationID = freezed,Object? requiredReportsCount = freezed,Object? totalReports = freezed,Object? calculationType = freezed,Object? fromSection = freezed,Object? toSection = freezed,Object? dividerValue = freezed,Object? inputValue = freezed,Object? longitude = freezed,Object? latitude = freezed,Object? status = freezed,Object? createdByID = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? deletedAt = freezed,Object? workScope = freezed,Object? road = freezed,Object? contractRelation = freezed,Object? createdBy = freezed,Object? count = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,uid: freezed == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
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
as String?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,createdByID: freezed == createdByID ? _self.createdByID : createdByID // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as String?,workScope: freezed == workScope ? _self.workScope : workScope // ignore: cast_nullable_to_non_nullable
as WorkScopeNestedModel?,road: freezed == road ? _self.road : road // ignore: cast_nullable_to_non_nullable
as RoadModel?,contractRelation: freezed == contractRelation ? _self.contractRelation : contractRelation // ignore: cast_nullable_to_non_nullable
as ContractorRelationModel?,createdBy: freezed == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as CreatedByNestedModel?,count: freezed == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as ProgramCountModel?,
  ));
}
/// Create a copy of ProgramListItemModel
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
}/// Create a copy of ProgramListItemModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RoadModelCopyWith<$Res>? get road {
    if (_self.road == null) {
    return null;
  }

  return $RoadModelCopyWith<$Res>(_self.road!, (value) {
    return _then(_self.copyWith(road: value));
  });
}/// Create a copy of ProgramListItemModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ContractorRelationModelCopyWith<$Res>? get contractRelation {
    if (_self.contractRelation == null) {
    return null;
  }

  return $ContractorRelationModelCopyWith<$Res>(_self.contractRelation!, (value) {
    return _then(_self.copyWith(contractRelation: value));
  });
}/// Create a copy of ProgramListItemModel
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
}/// Create a copy of ProgramListItemModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProgramCountModelCopyWith<$Res>? get count {
    if (_self.count == null) {
    return null;
  }

  return $ProgramCountModelCopyWith<$Res>(_self.count!, (value) {
    return _then(_self.copyWith(count: value));
  });
}
}


/// Adds pattern-matching-related methods to [ProgramListItemModel].
extension ProgramListItemModelPatterns on ProgramListItemModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProgramListItemModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProgramListItemModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProgramListItemModel value)  $default,){
final _that = this;
switch (_that) {
case _ProgramListItemModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProgramListItemModel value)?  $default,){
final _that = this;
switch (_that) {
case _ProgramListItemModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  String? uid,  String? name,  String? description,  int? companyID,  int? workScopeID,  int? roadID,  String? periodStart,  String? periodEnd,  int? contractRelationID,  int? requiredReportsCount,  int? totalReports,  String? calculationType,  String? fromSection,  String? toSection,  String? dividerValue,  String? inputValue,  double? longitude,  double? latitude,  String? status,  int? createdByID,  String? createdAt,  String? updatedAt,  String? deletedAt,  WorkScopeNestedModel? workScope,  RoadModel? road,  ContractorRelationModel? contractRelation,  CreatedByNestedModel? createdBy, @JsonKey(name: '_count')  ProgramCountModel? count)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProgramListItemModel() when $default != null:
return $default(_that.id,_that.uid,_that.name,_that.description,_that.companyID,_that.workScopeID,_that.roadID,_that.periodStart,_that.periodEnd,_that.contractRelationID,_that.requiredReportsCount,_that.totalReports,_that.calculationType,_that.fromSection,_that.toSection,_that.dividerValue,_that.inputValue,_that.longitude,_that.latitude,_that.status,_that.createdByID,_that.createdAt,_that.updatedAt,_that.deletedAt,_that.workScope,_that.road,_that.contractRelation,_that.createdBy,_that.count);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  String? uid,  String? name,  String? description,  int? companyID,  int? workScopeID,  int? roadID,  String? periodStart,  String? periodEnd,  int? contractRelationID,  int? requiredReportsCount,  int? totalReports,  String? calculationType,  String? fromSection,  String? toSection,  String? dividerValue,  String? inputValue,  double? longitude,  double? latitude,  String? status,  int? createdByID,  String? createdAt,  String? updatedAt,  String? deletedAt,  WorkScopeNestedModel? workScope,  RoadModel? road,  ContractorRelationModel? contractRelation,  CreatedByNestedModel? createdBy, @JsonKey(name: '_count')  ProgramCountModel? count)  $default,) {final _that = this;
switch (_that) {
case _ProgramListItemModel():
return $default(_that.id,_that.uid,_that.name,_that.description,_that.companyID,_that.workScopeID,_that.roadID,_that.periodStart,_that.periodEnd,_that.contractRelationID,_that.requiredReportsCount,_that.totalReports,_that.calculationType,_that.fromSection,_that.toSection,_that.dividerValue,_that.inputValue,_that.longitude,_that.latitude,_that.status,_that.createdByID,_that.createdAt,_that.updatedAt,_that.deletedAt,_that.workScope,_that.road,_that.contractRelation,_that.createdBy,_that.count);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  String? uid,  String? name,  String? description,  int? companyID,  int? workScopeID,  int? roadID,  String? periodStart,  String? periodEnd,  int? contractRelationID,  int? requiredReportsCount,  int? totalReports,  String? calculationType,  String? fromSection,  String? toSection,  String? dividerValue,  String? inputValue,  double? longitude,  double? latitude,  String? status,  int? createdByID,  String? createdAt,  String? updatedAt,  String? deletedAt,  WorkScopeNestedModel? workScope,  RoadModel? road,  ContractorRelationModel? contractRelation,  CreatedByNestedModel? createdBy, @JsonKey(name: '_count')  ProgramCountModel? count)?  $default,) {final _that = this;
switch (_that) {
case _ProgramListItemModel() when $default != null:
return $default(_that.id,_that.uid,_that.name,_that.description,_that.companyID,_that.workScopeID,_that.roadID,_that.periodStart,_that.periodEnd,_that.contractRelationID,_that.requiredReportsCount,_that.totalReports,_that.calculationType,_that.fromSection,_that.toSection,_that.dividerValue,_that.inputValue,_that.longitude,_that.latitude,_that.status,_that.createdByID,_that.createdAt,_that.updatedAt,_that.deletedAt,_that.workScope,_that.road,_that.contractRelation,_that.createdBy,_that.count);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProgramListItemModel implements ProgramListItemModel {
  const _ProgramListItemModel({this.id, this.uid, this.name, this.description, this.companyID, this.workScopeID, this.roadID, this.periodStart, this.periodEnd, this.contractRelationID, this.requiredReportsCount, this.totalReports, this.calculationType, this.fromSection, this.toSection, this.dividerValue, this.inputValue, this.longitude, this.latitude, this.status, this.createdByID, this.createdAt, this.updatedAt, this.deletedAt, this.workScope, this.road, this.contractRelation, this.createdBy, @JsonKey(name: '_count') this.count});
  factory _ProgramListItemModel.fromJson(Map<String, dynamic> json) => _$ProgramListItemModelFromJson(json);

@override final  int? id;
@override final  String? uid;
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
@override final  String? inputValue;
@override final  double? longitude;
@override final  double? latitude;
@override final  String? status;
@override final  int? createdByID;
@override final  String? createdAt;
@override final  String? updatedAt;
@override final  String? deletedAt;
@override final  WorkScopeNestedModel? workScope;
@override final  RoadModel? road;
@override final  ContractorRelationModel? contractRelation;
@override final  CreatedByNestedModel? createdBy;
@override@JsonKey(name: '_count') final  ProgramCountModel? count;

/// Create a copy of ProgramListItemModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProgramListItemModelCopyWith<_ProgramListItemModel> get copyWith => __$ProgramListItemModelCopyWithImpl<_ProgramListItemModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProgramListItemModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProgramListItemModel&&(identical(other.id, id) || other.id == id)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.companyID, companyID) || other.companyID == companyID)&&(identical(other.workScopeID, workScopeID) || other.workScopeID == workScopeID)&&(identical(other.roadID, roadID) || other.roadID == roadID)&&(identical(other.periodStart, periodStart) || other.periodStart == periodStart)&&(identical(other.periodEnd, periodEnd) || other.periodEnd == periodEnd)&&(identical(other.contractRelationID, contractRelationID) || other.contractRelationID == contractRelationID)&&(identical(other.requiredReportsCount, requiredReportsCount) || other.requiredReportsCount == requiredReportsCount)&&(identical(other.totalReports, totalReports) || other.totalReports == totalReports)&&(identical(other.calculationType, calculationType) || other.calculationType == calculationType)&&(identical(other.fromSection, fromSection) || other.fromSection == fromSection)&&(identical(other.toSection, toSection) || other.toSection == toSection)&&(identical(other.dividerValue, dividerValue) || other.dividerValue == dividerValue)&&(identical(other.inputValue, inputValue) || other.inputValue == inputValue)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdByID, createdByID) || other.createdByID == createdByID)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt)&&(identical(other.workScope, workScope) || other.workScope == workScope)&&(identical(other.road, road) || other.road == road)&&(identical(other.contractRelation, contractRelation) || other.contractRelation == contractRelation)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.count, count) || other.count == count));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,uid,name,description,companyID,workScopeID,roadID,periodStart,periodEnd,contractRelationID,requiredReportsCount,totalReports,calculationType,fromSection,toSection,dividerValue,inputValue,longitude,latitude,status,createdByID,createdAt,updatedAt,deletedAt,workScope,road,contractRelation,createdBy,count]);

@override
String toString() {
  return 'ProgramListItemModel(id: $id, uid: $uid, name: $name, description: $description, companyID: $companyID, workScopeID: $workScopeID, roadID: $roadID, periodStart: $periodStart, periodEnd: $periodEnd, contractRelationID: $contractRelationID, requiredReportsCount: $requiredReportsCount, totalReports: $totalReports, calculationType: $calculationType, fromSection: $fromSection, toSection: $toSection, dividerValue: $dividerValue, inputValue: $inputValue, longitude: $longitude, latitude: $latitude, status: $status, createdByID: $createdByID, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt, workScope: $workScope, road: $road, contractRelation: $contractRelation, createdBy: $createdBy, count: $count)';
}


}

/// @nodoc
abstract mixin class _$ProgramListItemModelCopyWith<$Res> implements $ProgramListItemModelCopyWith<$Res> {
  factory _$ProgramListItemModelCopyWith(_ProgramListItemModel value, $Res Function(_ProgramListItemModel) _then) = __$ProgramListItemModelCopyWithImpl;
@override @useResult
$Res call({
 int? id, String? uid, String? name, String? description, int? companyID, int? workScopeID, int? roadID, String? periodStart, String? periodEnd, int? contractRelationID, int? requiredReportsCount, int? totalReports, String? calculationType, String? fromSection, String? toSection, String? dividerValue, String? inputValue, double? longitude, double? latitude, String? status, int? createdByID, String? createdAt, String? updatedAt, String? deletedAt, WorkScopeNestedModel? workScope, RoadModel? road, ContractorRelationModel? contractRelation, CreatedByNestedModel? createdBy,@JsonKey(name: '_count') ProgramCountModel? count
});


@override $WorkScopeNestedModelCopyWith<$Res>? get workScope;@override $RoadModelCopyWith<$Res>? get road;@override $ContractorRelationModelCopyWith<$Res>? get contractRelation;@override $CreatedByNestedModelCopyWith<$Res>? get createdBy;@override $ProgramCountModelCopyWith<$Res>? get count;

}
/// @nodoc
class __$ProgramListItemModelCopyWithImpl<$Res>
    implements _$ProgramListItemModelCopyWith<$Res> {
  __$ProgramListItemModelCopyWithImpl(this._self, this._then);

  final _ProgramListItemModel _self;
  final $Res Function(_ProgramListItemModel) _then;

/// Create a copy of ProgramListItemModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? uid = freezed,Object? name = freezed,Object? description = freezed,Object? companyID = freezed,Object? workScopeID = freezed,Object? roadID = freezed,Object? periodStart = freezed,Object? periodEnd = freezed,Object? contractRelationID = freezed,Object? requiredReportsCount = freezed,Object? totalReports = freezed,Object? calculationType = freezed,Object? fromSection = freezed,Object? toSection = freezed,Object? dividerValue = freezed,Object? inputValue = freezed,Object? longitude = freezed,Object? latitude = freezed,Object? status = freezed,Object? createdByID = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? deletedAt = freezed,Object? workScope = freezed,Object? road = freezed,Object? contractRelation = freezed,Object? createdBy = freezed,Object? count = freezed,}) {
  return _then(_ProgramListItemModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,uid: freezed == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
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
as String?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,createdByID: freezed == createdByID ? _self.createdByID : createdByID // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as String?,workScope: freezed == workScope ? _self.workScope : workScope // ignore: cast_nullable_to_non_nullable
as WorkScopeNestedModel?,road: freezed == road ? _self.road : road // ignore: cast_nullable_to_non_nullable
as RoadModel?,contractRelation: freezed == contractRelation ? _self.contractRelation : contractRelation // ignore: cast_nullable_to_non_nullable
as ContractorRelationModel?,createdBy: freezed == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as CreatedByNestedModel?,count: freezed == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as ProgramCountModel?,
  ));
}

/// Create a copy of ProgramListItemModel
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
}/// Create a copy of ProgramListItemModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RoadModelCopyWith<$Res>? get road {
    if (_self.road == null) {
    return null;
  }

  return $RoadModelCopyWith<$Res>(_self.road!, (value) {
    return _then(_self.copyWith(road: value));
  });
}/// Create a copy of ProgramListItemModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ContractorRelationModelCopyWith<$Res>? get contractRelation {
    if (_self.contractRelation == null) {
    return null;
  }

  return $ContractorRelationModelCopyWith<$Res>(_self.contractRelation!, (value) {
    return _then(_self.copyWith(contractRelation: value));
  });
}/// Create a copy of ProgramListItemModel
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
}/// Create a copy of ProgramListItemModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProgramCountModelCopyWith<$Res>? get count {
    if (_self.count == null) {
    return null;
  }

  return $ProgramCountModelCopyWith<$Res>(_self.count!, (value) {
    return _then(_self.copyWith(count: value));
  });
}
}


/// @nodoc
mixin _$ProgramCountModel {

 int? get dailyReports;
/// Create a copy of ProgramCountModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProgramCountModelCopyWith<ProgramCountModel> get copyWith => _$ProgramCountModelCopyWithImpl<ProgramCountModel>(this as ProgramCountModel, _$identity);

  /// Serializes this ProgramCountModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProgramCountModel&&(identical(other.dailyReports, dailyReports) || other.dailyReports == dailyReports));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,dailyReports);

@override
String toString() {
  return 'ProgramCountModel(dailyReports: $dailyReports)';
}


}

/// @nodoc
abstract mixin class $ProgramCountModelCopyWith<$Res>  {
  factory $ProgramCountModelCopyWith(ProgramCountModel value, $Res Function(ProgramCountModel) _then) = _$ProgramCountModelCopyWithImpl;
@useResult
$Res call({
 int? dailyReports
});




}
/// @nodoc
class _$ProgramCountModelCopyWithImpl<$Res>
    implements $ProgramCountModelCopyWith<$Res> {
  _$ProgramCountModelCopyWithImpl(this._self, this._then);

  final ProgramCountModel _self;
  final $Res Function(ProgramCountModel) _then;

/// Create a copy of ProgramCountModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? dailyReports = freezed,}) {
  return _then(_self.copyWith(
dailyReports: freezed == dailyReports ? _self.dailyReports : dailyReports // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [ProgramCountModel].
extension ProgramCountModelPatterns on ProgramCountModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProgramCountModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProgramCountModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProgramCountModel value)  $default,){
final _that = this;
switch (_that) {
case _ProgramCountModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProgramCountModel value)?  $default,){
final _that = this;
switch (_that) {
case _ProgramCountModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? dailyReports)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProgramCountModel() when $default != null:
return $default(_that.dailyReports);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? dailyReports)  $default,) {final _that = this;
switch (_that) {
case _ProgramCountModel():
return $default(_that.dailyReports);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? dailyReports)?  $default,) {final _that = this;
switch (_that) {
case _ProgramCountModel() when $default != null:
return $default(_that.dailyReports);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProgramCountModel implements ProgramCountModel {
  const _ProgramCountModel({this.dailyReports});
  factory _ProgramCountModel.fromJson(Map<String, dynamic> json) => _$ProgramCountModelFromJson(json);

@override final  int? dailyReports;

/// Create a copy of ProgramCountModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProgramCountModelCopyWith<_ProgramCountModel> get copyWith => __$ProgramCountModelCopyWithImpl<_ProgramCountModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProgramCountModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProgramCountModel&&(identical(other.dailyReports, dailyReports) || other.dailyReports == dailyReports));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,dailyReports);

@override
String toString() {
  return 'ProgramCountModel(dailyReports: $dailyReports)';
}


}

/// @nodoc
abstract mixin class _$ProgramCountModelCopyWith<$Res> implements $ProgramCountModelCopyWith<$Res> {
  factory _$ProgramCountModelCopyWith(_ProgramCountModel value, $Res Function(_ProgramCountModel) _then) = __$ProgramCountModelCopyWithImpl;
@override @useResult
$Res call({
 int? dailyReports
});




}
/// @nodoc
class __$ProgramCountModelCopyWithImpl<$Res>
    implements _$ProgramCountModelCopyWith<$Res> {
  __$ProgramCountModelCopyWithImpl(this._self, this._then);

  final _ProgramCountModel _self;
  final $Res Function(_ProgramCountModel) _then;

/// Create a copy of ProgramCountModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? dailyReports = freezed,}) {
  return _then(_ProgramCountModel(
dailyReports: freezed == dailyReports ? _self.dailyReports : dailyReports // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
