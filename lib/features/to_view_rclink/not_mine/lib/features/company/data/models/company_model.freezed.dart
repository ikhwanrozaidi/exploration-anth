// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'company_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CompanyModel {

 int get id; String get uid; String get name; String get regNo; String get cidbNo; String get address; String get postalCode; String get city; String get state; String get country; String get phone; String get email; String get website; String get companyType; bool get bumiputera; String? get einvoiceTinNo; DateTime? get registrationDate; DateTime get createdAt; DateTime get updatedAt; DateTime? get deletedAt; int get ownerID; AdminRoleModel? get adminRole;@JsonKey(defaultValue: 0) int? get adminCount; String? get defaultBankAcc; String? get defaultBankAccType;
/// Create a copy of CompanyModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CompanyModelCopyWith<CompanyModel> get copyWith => _$CompanyModelCopyWithImpl<CompanyModel>(this as CompanyModel, _$identity);

  /// Serializes this CompanyModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CompanyModel&&(identical(other.id, id) || other.id == id)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.name, name) || other.name == name)&&(identical(other.regNo, regNo) || other.regNo == regNo)&&(identical(other.cidbNo, cidbNo) || other.cidbNo == cidbNo)&&(identical(other.address, address) || other.address == address)&&(identical(other.postalCode, postalCode) || other.postalCode == postalCode)&&(identical(other.city, city) || other.city == city)&&(identical(other.state, state) || other.state == state)&&(identical(other.country, country) || other.country == country)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.email, email) || other.email == email)&&(identical(other.website, website) || other.website == website)&&(identical(other.companyType, companyType) || other.companyType == companyType)&&(identical(other.bumiputera, bumiputera) || other.bumiputera == bumiputera)&&(identical(other.einvoiceTinNo, einvoiceTinNo) || other.einvoiceTinNo == einvoiceTinNo)&&(identical(other.registrationDate, registrationDate) || other.registrationDate == registrationDate)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt)&&(identical(other.ownerID, ownerID) || other.ownerID == ownerID)&&(identical(other.adminRole, adminRole) || other.adminRole == adminRole)&&(identical(other.adminCount, adminCount) || other.adminCount == adminCount)&&(identical(other.defaultBankAcc, defaultBankAcc) || other.defaultBankAcc == defaultBankAcc)&&(identical(other.defaultBankAccType, defaultBankAccType) || other.defaultBankAccType == defaultBankAccType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,uid,name,regNo,cidbNo,address,postalCode,city,state,country,phone,email,website,companyType,bumiputera,einvoiceTinNo,registrationDate,createdAt,updatedAt,deletedAt,ownerID,adminRole,adminCount,defaultBankAcc,defaultBankAccType]);

@override
String toString() {
  return 'CompanyModel(id: $id, uid: $uid, name: $name, regNo: $regNo, cidbNo: $cidbNo, address: $address, postalCode: $postalCode, city: $city, state: $state, country: $country, phone: $phone, email: $email, website: $website, companyType: $companyType, bumiputera: $bumiputera, einvoiceTinNo: $einvoiceTinNo, registrationDate: $registrationDate, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt, ownerID: $ownerID, adminRole: $adminRole, adminCount: $adminCount, defaultBankAcc: $defaultBankAcc, defaultBankAccType: $defaultBankAccType)';
}


}

/// @nodoc
abstract mixin class $CompanyModelCopyWith<$Res>  {
  factory $CompanyModelCopyWith(CompanyModel value, $Res Function(CompanyModel) _then) = _$CompanyModelCopyWithImpl;
@useResult
$Res call({
 int id, String uid, String name, String regNo, String cidbNo, String address, String postalCode, String city, String state, String country, String phone, String email, String website, String companyType, bool bumiputera, String? einvoiceTinNo, DateTime? registrationDate, DateTime createdAt, DateTime updatedAt, DateTime? deletedAt, int ownerID, AdminRoleModel? adminRole,@JsonKey(defaultValue: 0) int? adminCount, String? defaultBankAcc, String? defaultBankAccType
});


$AdminRoleModelCopyWith<$Res>? get adminRole;

}
/// @nodoc
class _$CompanyModelCopyWithImpl<$Res>
    implements $CompanyModelCopyWith<$Res> {
  _$CompanyModelCopyWithImpl(this._self, this._then);

  final CompanyModel _self;
  final $Res Function(CompanyModel) _then;

/// Create a copy of CompanyModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? uid = null,Object? name = null,Object? regNo = null,Object? cidbNo = null,Object? address = null,Object? postalCode = null,Object? city = null,Object? state = null,Object? country = null,Object? phone = null,Object? email = null,Object? website = null,Object? companyType = null,Object? bumiputera = null,Object? einvoiceTinNo = freezed,Object? registrationDate = freezed,Object? createdAt = null,Object? updatedAt = null,Object? deletedAt = freezed,Object? ownerID = null,Object? adminRole = freezed,Object? adminCount = freezed,Object? defaultBankAcc = freezed,Object? defaultBankAccType = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,regNo: null == regNo ? _self.regNo : regNo // ignore: cast_nullable_to_non_nullable
as String,cidbNo: null == cidbNo ? _self.cidbNo : cidbNo // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,postalCode: null == postalCode ? _self.postalCode : postalCode // ignore: cast_nullable_to_non_nullable
as String,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as String,country: null == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,website: null == website ? _self.website : website // ignore: cast_nullable_to_non_nullable
as String,companyType: null == companyType ? _self.companyType : companyType // ignore: cast_nullable_to_non_nullable
as String,bumiputera: null == bumiputera ? _self.bumiputera : bumiputera // ignore: cast_nullable_to_non_nullable
as bool,einvoiceTinNo: freezed == einvoiceTinNo ? _self.einvoiceTinNo : einvoiceTinNo // ignore: cast_nullable_to_non_nullable
as String?,registrationDate: freezed == registrationDate ? _self.registrationDate : registrationDate // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,ownerID: null == ownerID ? _self.ownerID : ownerID // ignore: cast_nullable_to_non_nullable
as int,adminRole: freezed == adminRole ? _self.adminRole : adminRole // ignore: cast_nullable_to_non_nullable
as AdminRoleModel?,adminCount: freezed == adminCount ? _self.adminCount : adminCount // ignore: cast_nullable_to_non_nullable
as int?,defaultBankAcc: freezed == defaultBankAcc ? _self.defaultBankAcc : defaultBankAcc // ignore: cast_nullable_to_non_nullable
as String?,defaultBankAccType: freezed == defaultBankAccType ? _self.defaultBankAccType : defaultBankAccType // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of CompanyModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AdminRoleModelCopyWith<$Res>? get adminRole {
    if (_self.adminRole == null) {
    return null;
  }

  return $AdminRoleModelCopyWith<$Res>(_self.adminRole!, (value) {
    return _then(_self.copyWith(adminRole: value));
  });
}
}


/// Adds pattern-matching-related methods to [CompanyModel].
extension CompanyModelPatterns on CompanyModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CompanyModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CompanyModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CompanyModel value)  $default,){
final _that = this;
switch (_that) {
case _CompanyModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CompanyModel value)?  $default,){
final _that = this;
switch (_that) {
case _CompanyModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String uid,  String name,  String regNo,  String cidbNo,  String address,  String postalCode,  String city,  String state,  String country,  String phone,  String email,  String website,  String companyType,  bool bumiputera,  String? einvoiceTinNo,  DateTime? registrationDate,  DateTime createdAt,  DateTime updatedAt,  DateTime? deletedAt,  int ownerID,  AdminRoleModel? adminRole, @JsonKey(defaultValue: 0)  int? adminCount,  String? defaultBankAcc,  String? defaultBankAccType)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CompanyModel() when $default != null:
return $default(_that.id,_that.uid,_that.name,_that.regNo,_that.cidbNo,_that.address,_that.postalCode,_that.city,_that.state,_that.country,_that.phone,_that.email,_that.website,_that.companyType,_that.bumiputera,_that.einvoiceTinNo,_that.registrationDate,_that.createdAt,_that.updatedAt,_that.deletedAt,_that.ownerID,_that.adminRole,_that.adminCount,_that.defaultBankAcc,_that.defaultBankAccType);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String uid,  String name,  String regNo,  String cidbNo,  String address,  String postalCode,  String city,  String state,  String country,  String phone,  String email,  String website,  String companyType,  bool bumiputera,  String? einvoiceTinNo,  DateTime? registrationDate,  DateTime createdAt,  DateTime updatedAt,  DateTime? deletedAt,  int ownerID,  AdminRoleModel? adminRole, @JsonKey(defaultValue: 0)  int? adminCount,  String? defaultBankAcc,  String? defaultBankAccType)  $default,) {final _that = this;
switch (_that) {
case _CompanyModel():
return $default(_that.id,_that.uid,_that.name,_that.regNo,_that.cidbNo,_that.address,_that.postalCode,_that.city,_that.state,_that.country,_that.phone,_that.email,_that.website,_that.companyType,_that.bumiputera,_that.einvoiceTinNo,_that.registrationDate,_that.createdAt,_that.updatedAt,_that.deletedAt,_that.ownerID,_that.adminRole,_that.adminCount,_that.defaultBankAcc,_that.defaultBankAccType);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String uid,  String name,  String regNo,  String cidbNo,  String address,  String postalCode,  String city,  String state,  String country,  String phone,  String email,  String website,  String companyType,  bool bumiputera,  String? einvoiceTinNo,  DateTime? registrationDate,  DateTime createdAt,  DateTime updatedAt,  DateTime? deletedAt,  int ownerID,  AdminRoleModel? adminRole, @JsonKey(defaultValue: 0)  int? adminCount,  String? defaultBankAcc,  String? defaultBankAccType)?  $default,) {final _that = this;
switch (_that) {
case _CompanyModel() when $default != null:
return $default(_that.id,_that.uid,_that.name,_that.regNo,_that.cidbNo,_that.address,_that.postalCode,_that.city,_that.state,_that.country,_that.phone,_that.email,_that.website,_that.companyType,_that.bumiputera,_that.einvoiceTinNo,_that.registrationDate,_that.createdAt,_that.updatedAt,_that.deletedAt,_that.ownerID,_that.adminRole,_that.adminCount,_that.defaultBankAcc,_that.defaultBankAccType);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CompanyModel extends CompanyModel {
  const _CompanyModel({required this.id, required this.uid, required this.name, required this.regNo, required this.cidbNo, required this.address, required this.postalCode, required this.city, required this.state, required this.country, required this.phone, required this.email, required this.website, required this.companyType, required this.bumiputera, this.einvoiceTinNo, this.registrationDate, required this.createdAt, required this.updatedAt, this.deletedAt, required this.ownerID, this.adminRole, @JsonKey(defaultValue: 0) this.adminCount, this.defaultBankAcc, this.defaultBankAccType}): super._();
  factory _CompanyModel.fromJson(Map<String, dynamic> json) => _$CompanyModelFromJson(json);

@override final  int id;
@override final  String uid;
@override final  String name;
@override final  String regNo;
@override final  String cidbNo;
@override final  String address;
@override final  String postalCode;
@override final  String city;
@override final  String state;
@override final  String country;
@override final  String phone;
@override final  String email;
@override final  String website;
@override final  String companyType;
@override final  bool bumiputera;
@override final  String? einvoiceTinNo;
@override final  DateTime? registrationDate;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;
@override final  DateTime? deletedAt;
@override final  int ownerID;
@override final  AdminRoleModel? adminRole;
@override@JsonKey(defaultValue: 0) final  int? adminCount;
@override final  String? defaultBankAcc;
@override final  String? defaultBankAccType;

/// Create a copy of CompanyModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CompanyModelCopyWith<_CompanyModel> get copyWith => __$CompanyModelCopyWithImpl<_CompanyModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CompanyModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CompanyModel&&(identical(other.id, id) || other.id == id)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.name, name) || other.name == name)&&(identical(other.regNo, regNo) || other.regNo == regNo)&&(identical(other.cidbNo, cidbNo) || other.cidbNo == cidbNo)&&(identical(other.address, address) || other.address == address)&&(identical(other.postalCode, postalCode) || other.postalCode == postalCode)&&(identical(other.city, city) || other.city == city)&&(identical(other.state, state) || other.state == state)&&(identical(other.country, country) || other.country == country)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.email, email) || other.email == email)&&(identical(other.website, website) || other.website == website)&&(identical(other.companyType, companyType) || other.companyType == companyType)&&(identical(other.bumiputera, bumiputera) || other.bumiputera == bumiputera)&&(identical(other.einvoiceTinNo, einvoiceTinNo) || other.einvoiceTinNo == einvoiceTinNo)&&(identical(other.registrationDate, registrationDate) || other.registrationDate == registrationDate)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt)&&(identical(other.ownerID, ownerID) || other.ownerID == ownerID)&&(identical(other.adminRole, adminRole) || other.adminRole == adminRole)&&(identical(other.adminCount, adminCount) || other.adminCount == adminCount)&&(identical(other.defaultBankAcc, defaultBankAcc) || other.defaultBankAcc == defaultBankAcc)&&(identical(other.defaultBankAccType, defaultBankAccType) || other.defaultBankAccType == defaultBankAccType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,uid,name,regNo,cidbNo,address,postalCode,city,state,country,phone,email,website,companyType,bumiputera,einvoiceTinNo,registrationDate,createdAt,updatedAt,deletedAt,ownerID,adminRole,adminCount,defaultBankAcc,defaultBankAccType]);

@override
String toString() {
  return 'CompanyModel(id: $id, uid: $uid, name: $name, regNo: $regNo, cidbNo: $cidbNo, address: $address, postalCode: $postalCode, city: $city, state: $state, country: $country, phone: $phone, email: $email, website: $website, companyType: $companyType, bumiputera: $bumiputera, einvoiceTinNo: $einvoiceTinNo, registrationDate: $registrationDate, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt, ownerID: $ownerID, adminRole: $adminRole, adminCount: $adminCount, defaultBankAcc: $defaultBankAcc, defaultBankAccType: $defaultBankAccType)';
}


}

/// @nodoc
abstract mixin class _$CompanyModelCopyWith<$Res> implements $CompanyModelCopyWith<$Res> {
  factory _$CompanyModelCopyWith(_CompanyModel value, $Res Function(_CompanyModel) _then) = __$CompanyModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String uid, String name, String regNo, String cidbNo, String address, String postalCode, String city, String state, String country, String phone, String email, String website, String companyType, bool bumiputera, String? einvoiceTinNo, DateTime? registrationDate, DateTime createdAt, DateTime updatedAt, DateTime? deletedAt, int ownerID, AdminRoleModel? adminRole,@JsonKey(defaultValue: 0) int? adminCount, String? defaultBankAcc, String? defaultBankAccType
});


@override $AdminRoleModelCopyWith<$Res>? get adminRole;

}
/// @nodoc
class __$CompanyModelCopyWithImpl<$Res>
    implements _$CompanyModelCopyWith<$Res> {
  __$CompanyModelCopyWithImpl(this._self, this._then);

  final _CompanyModel _self;
  final $Res Function(_CompanyModel) _then;

/// Create a copy of CompanyModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? uid = null,Object? name = null,Object? regNo = null,Object? cidbNo = null,Object? address = null,Object? postalCode = null,Object? city = null,Object? state = null,Object? country = null,Object? phone = null,Object? email = null,Object? website = null,Object? companyType = null,Object? bumiputera = null,Object? einvoiceTinNo = freezed,Object? registrationDate = freezed,Object? createdAt = null,Object? updatedAt = null,Object? deletedAt = freezed,Object? ownerID = null,Object? adminRole = freezed,Object? adminCount = freezed,Object? defaultBankAcc = freezed,Object? defaultBankAccType = freezed,}) {
  return _then(_CompanyModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,regNo: null == regNo ? _self.regNo : regNo // ignore: cast_nullable_to_non_nullable
as String,cidbNo: null == cidbNo ? _self.cidbNo : cidbNo // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,postalCode: null == postalCode ? _self.postalCode : postalCode // ignore: cast_nullable_to_non_nullable
as String,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as String,country: null == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,website: null == website ? _self.website : website // ignore: cast_nullable_to_non_nullable
as String,companyType: null == companyType ? _self.companyType : companyType // ignore: cast_nullable_to_non_nullable
as String,bumiputera: null == bumiputera ? _self.bumiputera : bumiputera // ignore: cast_nullable_to_non_nullable
as bool,einvoiceTinNo: freezed == einvoiceTinNo ? _self.einvoiceTinNo : einvoiceTinNo // ignore: cast_nullable_to_non_nullable
as String?,registrationDate: freezed == registrationDate ? _self.registrationDate : registrationDate // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,ownerID: null == ownerID ? _self.ownerID : ownerID // ignore: cast_nullable_to_non_nullable
as int,adminRole: freezed == adminRole ? _self.adminRole : adminRole // ignore: cast_nullable_to_non_nullable
as AdminRoleModel?,adminCount: freezed == adminCount ? _self.adminCount : adminCount // ignore: cast_nullable_to_non_nullable
as int?,defaultBankAcc: freezed == defaultBankAcc ? _self.defaultBankAcc : defaultBankAcc // ignore: cast_nullable_to_non_nullable
as String?,defaultBankAccType: freezed == defaultBankAccType ? _self.defaultBankAccType : defaultBankAccType // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of CompanyModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AdminRoleModelCopyWith<$Res>? get adminRole {
    if (_self.adminRole == null) {
    return null;
  }

  return $AdminRoleModelCopyWith<$Res>(_self.adminRole!, (value) {
    return _then(_self.copyWith(adminRole: value));
  });
}
}


/// @nodoc
mixin _$AdminRoleModel {

 String get uid; String get name;
/// Create a copy of AdminRoleModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AdminRoleModelCopyWith<AdminRoleModel> get copyWith => _$AdminRoleModelCopyWithImpl<AdminRoleModel>(this as AdminRoleModel, _$identity);

  /// Serializes this AdminRoleModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AdminRoleModel&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,uid,name);

@override
String toString() {
  return 'AdminRoleModel(uid: $uid, name: $name)';
}


}

/// @nodoc
abstract mixin class $AdminRoleModelCopyWith<$Res>  {
  factory $AdminRoleModelCopyWith(AdminRoleModel value, $Res Function(AdminRoleModel) _then) = _$AdminRoleModelCopyWithImpl;
@useResult
$Res call({
 String uid, String name
});




}
/// @nodoc
class _$AdminRoleModelCopyWithImpl<$Res>
    implements $AdminRoleModelCopyWith<$Res> {
  _$AdminRoleModelCopyWithImpl(this._self, this._then);

  final AdminRoleModel _self;
  final $Res Function(AdminRoleModel) _then;

/// Create a copy of AdminRoleModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? uid = null,Object? name = null,}) {
  return _then(_self.copyWith(
uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [AdminRoleModel].
extension AdminRoleModelPatterns on AdminRoleModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AdminRoleModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AdminRoleModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AdminRoleModel value)  $default,){
final _that = this;
switch (_that) {
case _AdminRoleModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AdminRoleModel value)?  $default,){
final _that = this;
switch (_that) {
case _AdminRoleModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String uid,  String name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AdminRoleModel() when $default != null:
return $default(_that.uid,_that.name);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String uid,  String name)  $default,) {final _that = this;
switch (_that) {
case _AdminRoleModel():
return $default(_that.uid,_that.name);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String uid,  String name)?  $default,) {final _that = this;
switch (_that) {
case _AdminRoleModel() when $default != null:
return $default(_that.uid,_that.name);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AdminRoleModel extends AdminRoleModel {
  const _AdminRoleModel({required this.uid, required this.name}): super._();
  factory _AdminRoleModel.fromJson(Map<String, dynamic> json) => _$AdminRoleModelFromJson(json);

@override final  String uid;
@override final  String name;

/// Create a copy of AdminRoleModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AdminRoleModelCopyWith<_AdminRoleModel> get copyWith => __$AdminRoleModelCopyWithImpl<_AdminRoleModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AdminRoleModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AdminRoleModel&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,uid,name);

@override
String toString() {
  return 'AdminRoleModel(uid: $uid, name: $name)';
}


}

/// @nodoc
abstract mixin class _$AdminRoleModelCopyWith<$Res> implements $AdminRoleModelCopyWith<$Res> {
  factory _$AdminRoleModelCopyWith(_AdminRoleModel value, $Res Function(_AdminRoleModel) _then) = __$AdminRoleModelCopyWithImpl;
@override @useResult
$Res call({
 String uid, String name
});




}
/// @nodoc
class __$AdminRoleModelCopyWithImpl<$Res>
    implements _$AdminRoleModelCopyWith<$Res> {
  __$AdminRoleModelCopyWithImpl(this._self, this._then);

  final _AdminRoleModel _self;
  final $Res Function(_AdminRoleModel) _then;

/// Create a copy of AdminRoleModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? uid = null,Object? name = null,}) {
  return _then(_AdminRoleModel(
uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
