// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_detail_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserDetailResponseModel {

 int get userId; String get firstName; String get lastName; String get fullName; String? get address; String? get birthDate; String? get profilePicture; int get gatePoint; bool get verify; String? get vaccount;
/// Create a copy of UserDetailResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserDetailResponseModelCopyWith<UserDetailResponseModel> get copyWith => _$UserDetailResponseModelCopyWithImpl<UserDetailResponseModel>(this as UserDetailResponseModel, _$identity);

  /// Serializes this UserDetailResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserDetailResponseModel&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.address, address) || other.address == address)&&(identical(other.birthDate, birthDate) || other.birthDate == birthDate)&&(identical(other.profilePicture, profilePicture) || other.profilePicture == profilePicture)&&(identical(other.gatePoint, gatePoint) || other.gatePoint == gatePoint)&&(identical(other.verify, verify) || other.verify == verify)&&(identical(other.vaccount, vaccount) || other.vaccount == vaccount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,firstName,lastName,fullName,address,birthDate,profilePicture,gatePoint,verify,vaccount);

@override
String toString() {
  return 'UserDetailResponseModel(userId: $userId, firstName: $firstName, lastName: $lastName, fullName: $fullName, address: $address, birthDate: $birthDate, profilePicture: $profilePicture, gatePoint: $gatePoint, verify: $verify, vaccount: $vaccount)';
}


}

/// @nodoc
abstract mixin class $UserDetailResponseModelCopyWith<$Res>  {
  factory $UserDetailResponseModelCopyWith(UserDetailResponseModel value, $Res Function(UserDetailResponseModel) _then) = _$UserDetailResponseModelCopyWithImpl;
@useResult
$Res call({
 int userId, String firstName, String lastName, String fullName, String? address, String? birthDate, String? profilePicture, int gatePoint, bool verify, String? vaccount
});




}
/// @nodoc
class _$UserDetailResponseModelCopyWithImpl<$Res>
    implements $UserDetailResponseModelCopyWith<$Res> {
  _$UserDetailResponseModelCopyWithImpl(this._self, this._then);

  final UserDetailResponseModel _self;
  final $Res Function(UserDetailResponseModel) _then;

/// Create a copy of UserDetailResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = null,Object? firstName = null,Object? lastName = null,Object? fullName = null,Object? address = freezed,Object? birthDate = freezed,Object? profilePicture = freezed,Object? gatePoint = null,Object? verify = null,Object? vaccount = freezed,}) {
  return _then(_self.copyWith(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,birthDate: freezed == birthDate ? _self.birthDate : birthDate // ignore: cast_nullable_to_non_nullable
as String?,profilePicture: freezed == profilePicture ? _self.profilePicture : profilePicture // ignore: cast_nullable_to_non_nullable
as String?,gatePoint: null == gatePoint ? _self.gatePoint : gatePoint // ignore: cast_nullable_to_non_nullable
as int,verify: null == verify ? _self.verify : verify // ignore: cast_nullable_to_non_nullable
as bool,vaccount: freezed == vaccount ? _self.vaccount : vaccount // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [UserDetailResponseModel].
extension UserDetailResponseModelPatterns on UserDetailResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserDetailResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserDetailResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserDetailResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _UserDetailResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserDetailResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _UserDetailResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int userId,  String firstName,  String lastName,  String fullName,  String? address,  String? birthDate,  String? profilePicture,  int gatePoint,  bool verify,  String? vaccount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserDetailResponseModel() when $default != null:
return $default(_that.userId,_that.firstName,_that.lastName,_that.fullName,_that.address,_that.birthDate,_that.profilePicture,_that.gatePoint,_that.verify,_that.vaccount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int userId,  String firstName,  String lastName,  String fullName,  String? address,  String? birthDate,  String? profilePicture,  int gatePoint,  bool verify,  String? vaccount)  $default,) {final _that = this;
switch (_that) {
case _UserDetailResponseModel():
return $default(_that.userId,_that.firstName,_that.lastName,_that.fullName,_that.address,_that.birthDate,_that.profilePicture,_that.gatePoint,_that.verify,_that.vaccount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int userId,  String firstName,  String lastName,  String fullName,  String? address,  String? birthDate,  String? profilePicture,  int gatePoint,  bool verify,  String? vaccount)?  $default,) {final _that = this;
switch (_that) {
case _UserDetailResponseModel() when $default != null:
return $default(_that.userId,_that.firstName,_that.lastName,_that.fullName,_that.address,_that.birthDate,_that.profilePicture,_that.gatePoint,_that.verify,_that.vaccount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserDetailResponseModel implements UserDetailResponseModel {
  const _UserDetailResponseModel({required this.userId, required this.firstName, required this.lastName, required this.fullName, this.address, this.birthDate, this.profilePicture, required this.gatePoint, required this.verify, this.vaccount});
  factory _UserDetailResponseModel.fromJson(Map<String, dynamic> json) => _$UserDetailResponseModelFromJson(json);

@override final  int userId;
@override final  String firstName;
@override final  String lastName;
@override final  String fullName;
@override final  String? address;
@override final  String? birthDate;
@override final  String? profilePicture;
@override final  int gatePoint;
@override final  bool verify;
@override final  String? vaccount;

/// Create a copy of UserDetailResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserDetailResponseModelCopyWith<_UserDetailResponseModel> get copyWith => __$UserDetailResponseModelCopyWithImpl<_UserDetailResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserDetailResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserDetailResponseModel&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.address, address) || other.address == address)&&(identical(other.birthDate, birthDate) || other.birthDate == birthDate)&&(identical(other.profilePicture, profilePicture) || other.profilePicture == profilePicture)&&(identical(other.gatePoint, gatePoint) || other.gatePoint == gatePoint)&&(identical(other.verify, verify) || other.verify == verify)&&(identical(other.vaccount, vaccount) || other.vaccount == vaccount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,firstName,lastName,fullName,address,birthDate,profilePicture,gatePoint,verify,vaccount);

@override
String toString() {
  return 'UserDetailResponseModel(userId: $userId, firstName: $firstName, lastName: $lastName, fullName: $fullName, address: $address, birthDate: $birthDate, profilePicture: $profilePicture, gatePoint: $gatePoint, verify: $verify, vaccount: $vaccount)';
}


}

/// @nodoc
abstract mixin class _$UserDetailResponseModelCopyWith<$Res> implements $UserDetailResponseModelCopyWith<$Res> {
  factory _$UserDetailResponseModelCopyWith(_UserDetailResponseModel value, $Res Function(_UserDetailResponseModel) _then) = __$UserDetailResponseModelCopyWithImpl;
@override @useResult
$Res call({
 int userId, String firstName, String lastName, String fullName, String? address, String? birthDate, String? profilePicture, int gatePoint, bool verify, String? vaccount
});




}
/// @nodoc
class __$UserDetailResponseModelCopyWithImpl<$Res>
    implements _$UserDetailResponseModelCopyWith<$Res> {
  __$UserDetailResponseModelCopyWithImpl(this._self, this._then);

  final _UserDetailResponseModel _self;
  final $Res Function(_UserDetailResponseModel) _then;

/// Create a copy of UserDetailResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? firstName = null,Object? lastName = null,Object? fullName = null,Object? address = freezed,Object? birthDate = freezed,Object? profilePicture = freezed,Object? gatePoint = null,Object? verify = null,Object? vaccount = freezed,}) {
  return _then(_UserDetailResponseModel(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,birthDate: freezed == birthDate ? _self.birthDate : birthDate // ignore: cast_nullable_to_non_nullable
as String?,profilePicture: freezed == profilePicture ? _self.profilePicture : profilePicture // ignore: cast_nullable_to_non_nullable
as String?,gatePoint: null == gatePoint ? _self.gatePoint : gatePoint // ignore: cast_nullable_to_non_nullable
as int,verify: null == verify ? _self.verify : verify // ignore: cast_nullable_to_non_nullable
as bool,vaccount: freezed == vaccount ? _self.vaccount : vaccount // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
