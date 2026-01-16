// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_program_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProgramResponseModel {

 int? get id; String? get uid; String? get name; String? get description; int? get companyID; int? get workScopeID; int? get roadID; String? get periodStart; String? get periodEnd; int? get contractRelationID; int? get requiredReportsCount; int? get totalReports; String? get calculationType; String? get fromSection; String? get toSection; String? get dividerValue; String? get inputValue; String? get status; int? get createdByID; String? get createdAt; String? get updatedAt; String? get deletedAt;
/// Create a copy of ProgramResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProgramResponseModelCopyWith<ProgramResponseModel> get copyWith => _$ProgramResponseModelCopyWithImpl<ProgramResponseModel>(this as ProgramResponseModel, _$identity);

  /// Serializes this ProgramResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProgramResponseModel&&(identical(other.id, id) || other.id == id)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.companyID, companyID) || other.companyID == companyID)&&(identical(other.workScopeID, workScopeID) || other.workScopeID == workScopeID)&&(identical(other.roadID, roadID) || other.roadID == roadID)&&(identical(other.periodStart, periodStart) || other.periodStart == periodStart)&&(identical(other.periodEnd, periodEnd) || other.periodEnd == periodEnd)&&(identical(other.contractRelationID, contractRelationID) || other.contractRelationID == contractRelationID)&&(identical(other.requiredReportsCount, requiredReportsCount) || other.requiredReportsCount == requiredReportsCount)&&(identical(other.totalReports, totalReports) || other.totalReports == totalReports)&&(identical(other.calculationType, calculationType) || other.calculationType == calculationType)&&(identical(other.fromSection, fromSection) || other.fromSection == fromSection)&&(identical(other.toSection, toSection) || other.toSection == toSection)&&(identical(other.dividerValue, dividerValue) || other.dividerValue == dividerValue)&&(identical(other.inputValue, inputValue) || other.inputValue == inputValue)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdByID, createdByID) || other.createdByID == createdByID)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,uid,name,description,companyID,workScopeID,roadID,periodStart,periodEnd,contractRelationID,requiredReportsCount,totalReports,calculationType,fromSection,toSection,dividerValue,inputValue,status,createdByID,createdAt,updatedAt,deletedAt]);

@override
String toString() {
  return 'ProgramResponseModel(id: $id, uid: $uid, name: $name, description: $description, companyID: $companyID, workScopeID: $workScopeID, roadID: $roadID, periodStart: $periodStart, periodEnd: $periodEnd, contractRelationID: $contractRelationID, requiredReportsCount: $requiredReportsCount, totalReports: $totalReports, calculationType: $calculationType, fromSection: $fromSection, toSection: $toSection, dividerValue: $dividerValue, inputValue: $inputValue, status: $status, createdByID: $createdByID, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt)';
}


}

/// @nodoc
abstract mixin class $ProgramResponseModelCopyWith<$Res>  {
  factory $ProgramResponseModelCopyWith(ProgramResponseModel value, $Res Function(ProgramResponseModel) _then) = _$ProgramResponseModelCopyWithImpl;
@useResult
$Res call({
 int? id, String? uid, String? name, String? description, int? companyID, int? workScopeID, int? roadID, String? periodStart, String? periodEnd, int? contractRelationID, int? requiredReportsCount, int? totalReports, String? calculationType, String? fromSection, String? toSection, String? dividerValue, String? inputValue, String? status, int? createdByID, String? createdAt, String? updatedAt, String? deletedAt
});




}
/// @nodoc
class _$ProgramResponseModelCopyWithImpl<$Res>
    implements $ProgramResponseModelCopyWith<$Res> {
  _$ProgramResponseModelCopyWithImpl(this._self, this._then);

  final ProgramResponseModel _self;
  final $Res Function(ProgramResponseModel) _then;

/// Create a copy of ProgramResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? uid = freezed,Object? name = freezed,Object? description = freezed,Object? companyID = freezed,Object? workScopeID = freezed,Object? roadID = freezed,Object? periodStart = freezed,Object? periodEnd = freezed,Object? contractRelationID = freezed,Object? requiredReportsCount = freezed,Object? totalReports = freezed,Object? calculationType = freezed,Object? fromSection = freezed,Object? toSection = freezed,Object? dividerValue = freezed,Object? inputValue = freezed,Object? status = freezed,Object? createdByID = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? deletedAt = freezed,}) {
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
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,createdByID: freezed == createdByID ? _self.createdByID : createdByID // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ProgramResponseModel].
extension ProgramResponseModelPatterns on ProgramResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProgramResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProgramResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProgramResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _ProgramResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProgramResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _ProgramResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  String? uid,  String? name,  String? description,  int? companyID,  int? workScopeID,  int? roadID,  String? periodStart,  String? periodEnd,  int? contractRelationID,  int? requiredReportsCount,  int? totalReports,  String? calculationType,  String? fromSection,  String? toSection,  String? dividerValue,  String? inputValue,  String? status,  int? createdByID,  String? createdAt,  String? updatedAt,  String? deletedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProgramResponseModel() when $default != null:
return $default(_that.id,_that.uid,_that.name,_that.description,_that.companyID,_that.workScopeID,_that.roadID,_that.periodStart,_that.periodEnd,_that.contractRelationID,_that.requiredReportsCount,_that.totalReports,_that.calculationType,_that.fromSection,_that.toSection,_that.dividerValue,_that.inputValue,_that.status,_that.createdByID,_that.createdAt,_that.updatedAt,_that.deletedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  String? uid,  String? name,  String? description,  int? companyID,  int? workScopeID,  int? roadID,  String? periodStart,  String? periodEnd,  int? contractRelationID,  int? requiredReportsCount,  int? totalReports,  String? calculationType,  String? fromSection,  String? toSection,  String? dividerValue,  String? inputValue,  String? status,  int? createdByID,  String? createdAt,  String? updatedAt,  String? deletedAt)  $default,) {final _that = this;
switch (_that) {
case _ProgramResponseModel():
return $default(_that.id,_that.uid,_that.name,_that.description,_that.companyID,_that.workScopeID,_that.roadID,_that.periodStart,_that.periodEnd,_that.contractRelationID,_that.requiredReportsCount,_that.totalReports,_that.calculationType,_that.fromSection,_that.toSection,_that.dividerValue,_that.inputValue,_that.status,_that.createdByID,_that.createdAt,_that.updatedAt,_that.deletedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  String? uid,  String? name,  String? description,  int? companyID,  int? workScopeID,  int? roadID,  String? periodStart,  String? periodEnd,  int? contractRelationID,  int? requiredReportsCount,  int? totalReports,  String? calculationType,  String? fromSection,  String? toSection,  String? dividerValue,  String? inputValue,  String? status,  int? createdByID,  String? createdAt,  String? updatedAt,  String? deletedAt)?  $default,) {final _that = this;
switch (_that) {
case _ProgramResponseModel() when $default != null:
return $default(_that.id,_that.uid,_that.name,_that.description,_that.companyID,_that.workScopeID,_that.roadID,_that.periodStart,_that.periodEnd,_that.contractRelationID,_that.requiredReportsCount,_that.totalReports,_that.calculationType,_that.fromSection,_that.toSection,_that.dividerValue,_that.inputValue,_that.status,_that.createdByID,_that.createdAt,_that.updatedAt,_that.deletedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProgramResponseModel implements ProgramResponseModel {
  const _ProgramResponseModel({this.id, this.uid, this.name, this.description, this.companyID, this.workScopeID, this.roadID, this.periodStart, this.periodEnd, this.contractRelationID, this.requiredReportsCount, this.totalReports, this.calculationType, this.fromSection, this.toSection, this.dividerValue, this.inputValue, this.status, this.createdByID, this.createdAt, this.updatedAt, this.deletedAt});
  factory _ProgramResponseModel.fromJson(Map<String, dynamic> json) => _$ProgramResponseModelFromJson(json);

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
@override final  String? status;
@override final  int? createdByID;
@override final  String? createdAt;
@override final  String? updatedAt;
@override final  String? deletedAt;

/// Create a copy of ProgramResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProgramResponseModelCopyWith<_ProgramResponseModel> get copyWith => __$ProgramResponseModelCopyWithImpl<_ProgramResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProgramResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProgramResponseModel&&(identical(other.id, id) || other.id == id)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.companyID, companyID) || other.companyID == companyID)&&(identical(other.workScopeID, workScopeID) || other.workScopeID == workScopeID)&&(identical(other.roadID, roadID) || other.roadID == roadID)&&(identical(other.periodStart, periodStart) || other.periodStart == periodStart)&&(identical(other.periodEnd, periodEnd) || other.periodEnd == periodEnd)&&(identical(other.contractRelationID, contractRelationID) || other.contractRelationID == contractRelationID)&&(identical(other.requiredReportsCount, requiredReportsCount) || other.requiredReportsCount == requiredReportsCount)&&(identical(other.totalReports, totalReports) || other.totalReports == totalReports)&&(identical(other.calculationType, calculationType) || other.calculationType == calculationType)&&(identical(other.fromSection, fromSection) || other.fromSection == fromSection)&&(identical(other.toSection, toSection) || other.toSection == toSection)&&(identical(other.dividerValue, dividerValue) || other.dividerValue == dividerValue)&&(identical(other.inputValue, inputValue) || other.inputValue == inputValue)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdByID, createdByID) || other.createdByID == createdByID)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,uid,name,description,companyID,workScopeID,roadID,periodStart,periodEnd,contractRelationID,requiredReportsCount,totalReports,calculationType,fromSection,toSection,dividerValue,inputValue,status,createdByID,createdAt,updatedAt,deletedAt]);

@override
String toString() {
  return 'ProgramResponseModel(id: $id, uid: $uid, name: $name, description: $description, companyID: $companyID, workScopeID: $workScopeID, roadID: $roadID, periodStart: $periodStart, periodEnd: $periodEnd, contractRelationID: $contractRelationID, requiredReportsCount: $requiredReportsCount, totalReports: $totalReports, calculationType: $calculationType, fromSection: $fromSection, toSection: $toSection, dividerValue: $dividerValue, inputValue: $inputValue, status: $status, createdByID: $createdByID, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt)';
}


}

/// @nodoc
abstract mixin class _$ProgramResponseModelCopyWith<$Res> implements $ProgramResponseModelCopyWith<$Res> {
  factory _$ProgramResponseModelCopyWith(_ProgramResponseModel value, $Res Function(_ProgramResponseModel) _then) = __$ProgramResponseModelCopyWithImpl;
@override @useResult
$Res call({
 int? id, String? uid, String? name, String? description, int? companyID, int? workScopeID, int? roadID, String? periodStart, String? periodEnd, int? contractRelationID, int? requiredReportsCount, int? totalReports, String? calculationType, String? fromSection, String? toSection, String? dividerValue, String? inputValue, String? status, int? createdByID, String? createdAt, String? updatedAt, String? deletedAt
});




}
/// @nodoc
class __$ProgramResponseModelCopyWithImpl<$Res>
    implements _$ProgramResponseModelCopyWith<$Res> {
  __$ProgramResponseModelCopyWithImpl(this._self, this._then);

  final _ProgramResponseModel _self;
  final $Res Function(_ProgramResponseModel) _then;

/// Create a copy of ProgramResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? uid = freezed,Object? name = freezed,Object? description = freezed,Object? companyID = freezed,Object? workScopeID = freezed,Object? roadID = freezed,Object? periodStart = freezed,Object? periodEnd = freezed,Object? contractRelationID = freezed,Object? requiredReportsCount = freezed,Object? totalReports = freezed,Object? calculationType = freezed,Object? fromSection = freezed,Object? toSection = freezed,Object? dividerValue = freezed,Object? inputValue = freezed,Object? status = freezed,Object? createdByID = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? deletedAt = freezed,}) {
  return _then(_ProgramResponseModel(
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
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,createdByID: freezed == createdByID ? _self.createdByID : createdByID // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
