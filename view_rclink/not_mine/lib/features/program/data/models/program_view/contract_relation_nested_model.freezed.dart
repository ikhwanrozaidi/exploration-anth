// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contract_relation_nested_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ContractRelationNestedModel {

 int? get id; String? get uid; int? get principalCompanyID; int? get contractorCompanyID; String? get contractNumber; String? get description; String? get startDate; String? get endDate; String? get status; String? get invitedAt; String? get acceptedAt; String? get suspendedAt; String? get terminatedAt; String? get terminationReason; String? get rejectedAt; String? get rejectionReason; String? get createdAt; String? get updatedAt; String? get deletedAt; int? get packageID; int? get invitationCodeID; ContractorCompanyNestedModel? get contractorCompany;
/// Create a copy of ContractRelationNestedModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ContractRelationNestedModelCopyWith<ContractRelationNestedModel> get copyWith => _$ContractRelationNestedModelCopyWithImpl<ContractRelationNestedModel>(this as ContractRelationNestedModel, _$identity);

  /// Serializes this ContractRelationNestedModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ContractRelationNestedModel&&(identical(other.id, id) || other.id == id)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.principalCompanyID, principalCompanyID) || other.principalCompanyID == principalCompanyID)&&(identical(other.contractorCompanyID, contractorCompanyID) || other.contractorCompanyID == contractorCompanyID)&&(identical(other.contractNumber, contractNumber) || other.contractNumber == contractNumber)&&(identical(other.description, description) || other.description == description)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.status, status) || other.status == status)&&(identical(other.invitedAt, invitedAt) || other.invitedAt == invitedAt)&&(identical(other.acceptedAt, acceptedAt) || other.acceptedAt == acceptedAt)&&(identical(other.suspendedAt, suspendedAt) || other.suspendedAt == suspendedAt)&&(identical(other.terminatedAt, terminatedAt) || other.terminatedAt == terminatedAt)&&(identical(other.terminationReason, terminationReason) || other.terminationReason == terminationReason)&&(identical(other.rejectedAt, rejectedAt) || other.rejectedAt == rejectedAt)&&(identical(other.rejectionReason, rejectionReason) || other.rejectionReason == rejectionReason)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt)&&(identical(other.packageID, packageID) || other.packageID == packageID)&&(identical(other.invitationCodeID, invitationCodeID) || other.invitationCodeID == invitationCodeID)&&(identical(other.contractorCompany, contractorCompany) || other.contractorCompany == contractorCompany));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,uid,principalCompanyID,contractorCompanyID,contractNumber,description,startDate,endDate,status,invitedAt,acceptedAt,suspendedAt,terminatedAt,terminationReason,rejectedAt,rejectionReason,createdAt,updatedAt,deletedAt,packageID,invitationCodeID,contractorCompany]);

@override
String toString() {
  return 'ContractRelationNestedModel(id: $id, uid: $uid, principalCompanyID: $principalCompanyID, contractorCompanyID: $contractorCompanyID, contractNumber: $contractNumber, description: $description, startDate: $startDate, endDate: $endDate, status: $status, invitedAt: $invitedAt, acceptedAt: $acceptedAt, suspendedAt: $suspendedAt, terminatedAt: $terminatedAt, terminationReason: $terminationReason, rejectedAt: $rejectedAt, rejectionReason: $rejectionReason, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt, packageID: $packageID, invitationCodeID: $invitationCodeID, contractorCompany: $contractorCompany)';
}


}

/// @nodoc
abstract mixin class $ContractRelationNestedModelCopyWith<$Res>  {
  factory $ContractRelationNestedModelCopyWith(ContractRelationNestedModel value, $Res Function(ContractRelationNestedModel) _then) = _$ContractRelationNestedModelCopyWithImpl;
@useResult
$Res call({
 int? id, String? uid, int? principalCompanyID, int? contractorCompanyID, String? contractNumber, String? description, String? startDate, String? endDate, String? status, String? invitedAt, String? acceptedAt, String? suspendedAt, String? terminatedAt, String? terminationReason, String? rejectedAt, String? rejectionReason, String? createdAt, String? updatedAt, String? deletedAt, int? packageID, int? invitationCodeID, ContractorCompanyNestedModel? contractorCompany
});


$ContractorCompanyNestedModelCopyWith<$Res>? get contractorCompany;

}
/// @nodoc
class _$ContractRelationNestedModelCopyWithImpl<$Res>
    implements $ContractRelationNestedModelCopyWith<$Res> {
  _$ContractRelationNestedModelCopyWithImpl(this._self, this._then);

  final ContractRelationNestedModel _self;
  final $Res Function(ContractRelationNestedModel) _then;

/// Create a copy of ContractRelationNestedModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? uid = freezed,Object? principalCompanyID = freezed,Object? contractorCompanyID = freezed,Object? contractNumber = freezed,Object? description = freezed,Object? startDate = freezed,Object? endDate = freezed,Object? status = freezed,Object? invitedAt = freezed,Object? acceptedAt = freezed,Object? suspendedAt = freezed,Object? terminatedAt = freezed,Object? terminationReason = freezed,Object? rejectedAt = freezed,Object? rejectionReason = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? deletedAt = freezed,Object? packageID = freezed,Object? invitationCodeID = freezed,Object? contractorCompany = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,uid: freezed == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String?,principalCompanyID: freezed == principalCompanyID ? _self.principalCompanyID : principalCompanyID // ignore: cast_nullable_to_non_nullable
as int?,contractorCompanyID: freezed == contractorCompanyID ? _self.contractorCompanyID : contractorCompanyID // ignore: cast_nullable_to_non_nullable
as int?,contractNumber: freezed == contractNumber ? _self.contractNumber : contractNumber // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as String?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,invitedAt: freezed == invitedAt ? _self.invitedAt : invitedAt // ignore: cast_nullable_to_non_nullable
as String?,acceptedAt: freezed == acceptedAt ? _self.acceptedAt : acceptedAt // ignore: cast_nullable_to_non_nullable
as String?,suspendedAt: freezed == suspendedAt ? _self.suspendedAt : suspendedAt // ignore: cast_nullable_to_non_nullable
as String?,terminatedAt: freezed == terminatedAt ? _self.terminatedAt : terminatedAt // ignore: cast_nullable_to_non_nullable
as String?,terminationReason: freezed == terminationReason ? _self.terminationReason : terminationReason // ignore: cast_nullable_to_non_nullable
as String?,rejectedAt: freezed == rejectedAt ? _self.rejectedAt : rejectedAt // ignore: cast_nullable_to_non_nullable
as String?,rejectionReason: freezed == rejectionReason ? _self.rejectionReason : rejectionReason // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as String?,packageID: freezed == packageID ? _self.packageID : packageID // ignore: cast_nullable_to_non_nullable
as int?,invitationCodeID: freezed == invitationCodeID ? _self.invitationCodeID : invitationCodeID // ignore: cast_nullable_to_non_nullable
as int?,contractorCompany: freezed == contractorCompany ? _self.contractorCompany : contractorCompany // ignore: cast_nullable_to_non_nullable
as ContractorCompanyNestedModel?,
  ));
}
/// Create a copy of ContractRelationNestedModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ContractorCompanyNestedModelCopyWith<$Res>? get contractorCompany {
    if (_self.contractorCompany == null) {
    return null;
  }

  return $ContractorCompanyNestedModelCopyWith<$Res>(_self.contractorCompany!, (value) {
    return _then(_self.copyWith(contractorCompany: value));
  });
}
}


/// Adds pattern-matching-related methods to [ContractRelationNestedModel].
extension ContractRelationNestedModelPatterns on ContractRelationNestedModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ContractRelationNestedModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ContractRelationNestedModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ContractRelationNestedModel value)  $default,){
final _that = this;
switch (_that) {
case _ContractRelationNestedModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ContractRelationNestedModel value)?  $default,){
final _that = this;
switch (_that) {
case _ContractRelationNestedModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  String? uid,  int? principalCompanyID,  int? contractorCompanyID,  String? contractNumber,  String? description,  String? startDate,  String? endDate,  String? status,  String? invitedAt,  String? acceptedAt,  String? suspendedAt,  String? terminatedAt,  String? terminationReason,  String? rejectedAt,  String? rejectionReason,  String? createdAt,  String? updatedAt,  String? deletedAt,  int? packageID,  int? invitationCodeID,  ContractorCompanyNestedModel? contractorCompany)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ContractRelationNestedModel() when $default != null:
return $default(_that.id,_that.uid,_that.principalCompanyID,_that.contractorCompanyID,_that.contractNumber,_that.description,_that.startDate,_that.endDate,_that.status,_that.invitedAt,_that.acceptedAt,_that.suspendedAt,_that.terminatedAt,_that.terminationReason,_that.rejectedAt,_that.rejectionReason,_that.createdAt,_that.updatedAt,_that.deletedAt,_that.packageID,_that.invitationCodeID,_that.contractorCompany);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  String? uid,  int? principalCompanyID,  int? contractorCompanyID,  String? contractNumber,  String? description,  String? startDate,  String? endDate,  String? status,  String? invitedAt,  String? acceptedAt,  String? suspendedAt,  String? terminatedAt,  String? terminationReason,  String? rejectedAt,  String? rejectionReason,  String? createdAt,  String? updatedAt,  String? deletedAt,  int? packageID,  int? invitationCodeID,  ContractorCompanyNestedModel? contractorCompany)  $default,) {final _that = this;
switch (_that) {
case _ContractRelationNestedModel():
return $default(_that.id,_that.uid,_that.principalCompanyID,_that.contractorCompanyID,_that.contractNumber,_that.description,_that.startDate,_that.endDate,_that.status,_that.invitedAt,_that.acceptedAt,_that.suspendedAt,_that.terminatedAt,_that.terminationReason,_that.rejectedAt,_that.rejectionReason,_that.createdAt,_that.updatedAt,_that.deletedAt,_that.packageID,_that.invitationCodeID,_that.contractorCompany);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  String? uid,  int? principalCompanyID,  int? contractorCompanyID,  String? contractNumber,  String? description,  String? startDate,  String? endDate,  String? status,  String? invitedAt,  String? acceptedAt,  String? suspendedAt,  String? terminatedAt,  String? terminationReason,  String? rejectedAt,  String? rejectionReason,  String? createdAt,  String? updatedAt,  String? deletedAt,  int? packageID,  int? invitationCodeID,  ContractorCompanyNestedModel? contractorCompany)?  $default,) {final _that = this;
switch (_that) {
case _ContractRelationNestedModel() when $default != null:
return $default(_that.id,_that.uid,_that.principalCompanyID,_that.contractorCompanyID,_that.contractNumber,_that.description,_that.startDate,_that.endDate,_that.status,_that.invitedAt,_that.acceptedAt,_that.suspendedAt,_that.terminatedAt,_that.terminationReason,_that.rejectedAt,_that.rejectionReason,_that.createdAt,_that.updatedAt,_that.deletedAt,_that.packageID,_that.invitationCodeID,_that.contractorCompany);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ContractRelationNestedModel implements ContractRelationNestedModel {
  const _ContractRelationNestedModel({this.id, this.uid, this.principalCompanyID, this.contractorCompanyID, this.contractNumber, this.description, this.startDate, this.endDate, this.status, this.invitedAt, this.acceptedAt, this.suspendedAt, this.terminatedAt, this.terminationReason, this.rejectedAt, this.rejectionReason, this.createdAt, this.updatedAt, this.deletedAt, this.packageID, this.invitationCodeID, this.contractorCompany});
  factory _ContractRelationNestedModel.fromJson(Map<String, dynamic> json) => _$ContractRelationNestedModelFromJson(json);

@override final  int? id;
@override final  String? uid;
@override final  int? principalCompanyID;
@override final  int? contractorCompanyID;
@override final  String? contractNumber;
@override final  String? description;
@override final  String? startDate;
@override final  String? endDate;
@override final  String? status;
@override final  String? invitedAt;
@override final  String? acceptedAt;
@override final  String? suspendedAt;
@override final  String? terminatedAt;
@override final  String? terminationReason;
@override final  String? rejectedAt;
@override final  String? rejectionReason;
@override final  String? createdAt;
@override final  String? updatedAt;
@override final  String? deletedAt;
@override final  int? packageID;
@override final  int? invitationCodeID;
@override final  ContractorCompanyNestedModel? contractorCompany;

/// Create a copy of ContractRelationNestedModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ContractRelationNestedModelCopyWith<_ContractRelationNestedModel> get copyWith => __$ContractRelationNestedModelCopyWithImpl<_ContractRelationNestedModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ContractRelationNestedModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ContractRelationNestedModel&&(identical(other.id, id) || other.id == id)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.principalCompanyID, principalCompanyID) || other.principalCompanyID == principalCompanyID)&&(identical(other.contractorCompanyID, contractorCompanyID) || other.contractorCompanyID == contractorCompanyID)&&(identical(other.contractNumber, contractNumber) || other.contractNumber == contractNumber)&&(identical(other.description, description) || other.description == description)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.status, status) || other.status == status)&&(identical(other.invitedAt, invitedAt) || other.invitedAt == invitedAt)&&(identical(other.acceptedAt, acceptedAt) || other.acceptedAt == acceptedAt)&&(identical(other.suspendedAt, suspendedAt) || other.suspendedAt == suspendedAt)&&(identical(other.terminatedAt, terminatedAt) || other.terminatedAt == terminatedAt)&&(identical(other.terminationReason, terminationReason) || other.terminationReason == terminationReason)&&(identical(other.rejectedAt, rejectedAt) || other.rejectedAt == rejectedAt)&&(identical(other.rejectionReason, rejectionReason) || other.rejectionReason == rejectionReason)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt)&&(identical(other.packageID, packageID) || other.packageID == packageID)&&(identical(other.invitationCodeID, invitationCodeID) || other.invitationCodeID == invitationCodeID)&&(identical(other.contractorCompany, contractorCompany) || other.contractorCompany == contractorCompany));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,uid,principalCompanyID,contractorCompanyID,contractNumber,description,startDate,endDate,status,invitedAt,acceptedAt,suspendedAt,terminatedAt,terminationReason,rejectedAt,rejectionReason,createdAt,updatedAt,deletedAt,packageID,invitationCodeID,contractorCompany]);

@override
String toString() {
  return 'ContractRelationNestedModel(id: $id, uid: $uid, principalCompanyID: $principalCompanyID, contractorCompanyID: $contractorCompanyID, contractNumber: $contractNumber, description: $description, startDate: $startDate, endDate: $endDate, status: $status, invitedAt: $invitedAt, acceptedAt: $acceptedAt, suspendedAt: $suspendedAt, terminatedAt: $terminatedAt, terminationReason: $terminationReason, rejectedAt: $rejectedAt, rejectionReason: $rejectionReason, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt, packageID: $packageID, invitationCodeID: $invitationCodeID, contractorCompany: $contractorCompany)';
}


}

/// @nodoc
abstract mixin class _$ContractRelationNestedModelCopyWith<$Res> implements $ContractRelationNestedModelCopyWith<$Res> {
  factory _$ContractRelationNestedModelCopyWith(_ContractRelationNestedModel value, $Res Function(_ContractRelationNestedModel) _then) = __$ContractRelationNestedModelCopyWithImpl;
@override @useResult
$Res call({
 int? id, String? uid, int? principalCompanyID, int? contractorCompanyID, String? contractNumber, String? description, String? startDate, String? endDate, String? status, String? invitedAt, String? acceptedAt, String? suspendedAt, String? terminatedAt, String? terminationReason, String? rejectedAt, String? rejectionReason, String? createdAt, String? updatedAt, String? deletedAt, int? packageID, int? invitationCodeID, ContractorCompanyNestedModel? contractorCompany
});


@override $ContractorCompanyNestedModelCopyWith<$Res>? get contractorCompany;

}
/// @nodoc
class __$ContractRelationNestedModelCopyWithImpl<$Res>
    implements _$ContractRelationNestedModelCopyWith<$Res> {
  __$ContractRelationNestedModelCopyWithImpl(this._self, this._then);

  final _ContractRelationNestedModel _self;
  final $Res Function(_ContractRelationNestedModel) _then;

/// Create a copy of ContractRelationNestedModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? uid = freezed,Object? principalCompanyID = freezed,Object? contractorCompanyID = freezed,Object? contractNumber = freezed,Object? description = freezed,Object? startDate = freezed,Object? endDate = freezed,Object? status = freezed,Object? invitedAt = freezed,Object? acceptedAt = freezed,Object? suspendedAt = freezed,Object? terminatedAt = freezed,Object? terminationReason = freezed,Object? rejectedAt = freezed,Object? rejectionReason = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? deletedAt = freezed,Object? packageID = freezed,Object? invitationCodeID = freezed,Object? contractorCompany = freezed,}) {
  return _then(_ContractRelationNestedModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,uid: freezed == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String?,principalCompanyID: freezed == principalCompanyID ? _self.principalCompanyID : principalCompanyID // ignore: cast_nullable_to_non_nullable
as int?,contractorCompanyID: freezed == contractorCompanyID ? _self.contractorCompanyID : contractorCompanyID // ignore: cast_nullable_to_non_nullable
as int?,contractNumber: freezed == contractNumber ? _self.contractNumber : contractNumber // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as String?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,invitedAt: freezed == invitedAt ? _self.invitedAt : invitedAt // ignore: cast_nullable_to_non_nullable
as String?,acceptedAt: freezed == acceptedAt ? _self.acceptedAt : acceptedAt // ignore: cast_nullable_to_non_nullable
as String?,suspendedAt: freezed == suspendedAt ? _self.suspendedAt : suspendedAt // ignore: cast_nullable_to_non_nullable
as String?,terminatedAt: freezed == terminatedAt ? _self.terminatedAt : terminatedAt // ignore: cast_nullable_to_non_nullable
as String?,terminationReason: freezed == terminationReason ? _self.terminationReason : terminationReason // ignore: cast_nullable_to_non_nullable
as String?,rejectedAt: freezed == rejectedAt ? _self.rejectedAt : rejectedAt // ignore: cast_nullable_to_non_nullable
as String?,rejectionReason: freezed == rejectionReason ? _self.rejectionReason : rejectionReason // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as String?,packageID: freezed == packageID ? _self.packageID : packageID // ignore: cast_nullable_to_non_nullable
as int?,invitationCodeID: freezed == invitationCodeID ? _self.invitationCodeID : invitationCodeID // ignore: cast_nullable_to_non_nullable
as int?,contractorCompany: freezed == contractorCompany ? _self.contractorCompany : contractorCompany // ignore: cast_nullable_to_non_nullable
as ContractorCompanyNestedModel?,
  ));
}

/// Create a copy of ContractRelationNestedModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ContractorCompanyNestedModelCopyWith<$Res>? get contractorCompany {
    if (_self.contractorCompany == null) {
    return null;
  }

  return $ContractorCompanyNestedModelCopyWith<$Res>(_self.contractorCompany!, (value) {
    return _then(_self.copyWith(contractorCompany: value));
  });
}
}

// dart format on
