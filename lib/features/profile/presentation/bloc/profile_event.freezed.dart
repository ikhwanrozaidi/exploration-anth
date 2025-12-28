// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProfileEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileEvent()';
}


}

/// @nodoc
class $ProfileEventCopyWith<$Res>  {
$ProfileEventCopyWith(ProfileEvent _, $Res Function(ProfileEvent) __);
}


/// Adds pattern-matching-related methods to [ProfileEvent].
extension ProfileEventPatterns on ProfileEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoadProfile value)?  loadProfile,TResult Function( RefreshProfile value)?  refreshProfile,TResult Function( UpdateProfile value)?  updateProfile,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoadProfile() when loadProfile != null:
return loadProfile(_that);case RefreshProfile() when refreshProfile != null:
return refreshProfile(_that);case UpdateProfile() when updateProfile != null:
return updateProfile(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoadProfile value)  loadProfile,required TResult Function( RefreshProfile value)  refreshProfile,required TResult Function( UpdateProfile value)  updateProfile,}){
final _that = this;
switch (_that) {
case LoadProfile():
return loadProfile(_that);case RefreshProfile():
return refreshProfile(_that);case UpdateProfile():
return updateProfile(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoadProfile value)?  loadProfile,TResult? Function( RefreshProfile value)?  refreshProfile,TResult? Function( UpdateProfile value)?  updateProfile,}){
final _that = this;
switch (_that) {
case LoadProfile() when loadProfile != null:
return loadProfile(_that);case RefreshProfile() when refreshProfile != null:
return refreshProfile(_that);case UpdateProfile() when updateProfile != null:
return updateProfile(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loadProfile,TResult Function()?  refreshProfile,TResult Function( String? email,  String? phone,  String? country,  String? firstName,  String? lastName,  String? fullName,  String? address,  String? birthDate,  String? profilePicture)?  updateProfile,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LoadProfile() when loadProfile != null:
return loadProfile();case RefreshProfile() when refreshProfile != null:
return refreshProfile();case UpdateProfile() when updateProfile != null:
return updateProfile(_that.email,_that.phone,_that.country,_that.firstName,_that.lastName,_that.fullName,_that.address,_that.birthDate,_that.profilePicture);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loadProfile,required TResult Function()  refreshProfile,required TResult Function( String? email,  String? phone,  String? country,  String? firstName,  String? lastName,  String? fullName,  String? address,  String? birthDate,  String? profilePicture)  updateProfile,}) {final _that = this;
switch (_that) {
case LoadProfile():
return loadProfile();case RefreshProfile():
return refreshProfile();case UpdateProfile():
return updateProfile(_that.email,_that.phone,_that.country,_that.firstName,_that.lastName,_that.fullName,_that.address,_that.birthDate,_that.profilePicture);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loadProfile,TResult? Function()?  refreshProfile,TResult? Function( String? email,  String? phone,  String? country,  String? firstName,  String? lastName,  String? fullName,  String? address,  String? birthDate,  String? profilePicture)?  updateProfile,}) {final _that = this;
switch (_that) {
case LoadProfile() when loadProfile != null:
return loadProfile();case RefreshProfile() when refreshProfile != null:
return refreshProfile();case UpdateProfile() when updateProfile != null:
return updateProfile(_that.email,_that.phone,_that.country,_that.firstName,_that.lastName,_that.fullName,_that.address,_that.birthDate,_that.profilePicture);case _:
  return null;

}
}

}

/// @nodoc


class LoadProfile implements ProfileEvent {
  const LoadProfile();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadProfile);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileEvent.loadProfile()';
}


}




/// @nodoc


class RefreshProfile implements ProfileEvent {
  const RefreshProfile();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RefreshProfile);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileEvent.refreshProfile()';
}


}




/// @nodoc


class UpdateProfile implements ProfileEvent {
  const UpdateProfile({this.email, this.phone, this.country, this.firstName, this.lastName, this.fullName, this.address, this.birthDate, this.profilePicture});
  

 final  String? email;
 final  String? phone;
 final  String? country;
 final  String? firstName;
 final  String? lastName;
 final  String? fullName;
 final  String? address;
 final  String? birthDate;
 final  String? profilePicture;

/// Create a copy of ProfileEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateProfileCopyWith<UpdateProfile> get copyWith => _$UpdateProfileCopyWithImpl<UpdateProfile>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateProfile&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.country, country) || other.country == country)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.address, address) || other.address == address)&&(identical(other.birthDate, birthDate) || other.birthDate == birthDate)&&(identical(other.profilePicture, profilePicture) || other.profilePicture == profilePicture));
}


@override
int get hashCode => Object.hash(runtimeType,email,phone,country,firstName,lastName,fullName,address,birthDate,profilePicture);

@override
String toString() {
  return 'ProfileEvent.updateProfile(email: $email, phone: $phone, country: $country, firstName: $firstName, lastName: $lastName, fullName: $fullName, address: $address, birthDate: $birthDate, profilePicture: $profilePicture)';
}


}

/// @nodoc
abstract mixin class $UpdateProfileCopyWith<$Res> implements $ProfileEventCopyWith<$Res> {
  factory $UpdateProfileCopyWith(UpdateProfile value, $Res Function(UpdateProfile) _then) = _$UpdateProfileCopyWithImpl;
@useResult
$Res call({
 String? email, String? phone, String? country, String? firstName, String? lastName, String? fullName, String? address, String? birthDate, String? profilePicture
});




}
/// @nodoc
class _$UpdateProfileCopyWithImpl<$Res>
    implements $UpdateProfileCopyWith<$Res> {
  _$UpdateProfileCopyWithImpl(this._self, this._then);

  final UpdateProfile _self;
  final $Res Function(UpdateProfile) _then;

/// Create a copy of ProfileEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? email = freezed,Object? phone = freezed,Object? country = freezed,Object? firstName = freezed,Object? lastName = freezed,Object? fullName = freezed,Object? address = freezed,Object? birthDate = freezed,Object? profilePicture = freezed,}) {
  return _then(UpdateProfile(
email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,country: freezed == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String?,firstName: freezed == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String?,lastName: freezed == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String?,fullName: freezed == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,birthDate: freezed == birthDate ? _self.birthDate : birthDate // ignore: cast_nullable_to_non_nullable
as String?,profilePicture: freezed == profilePicture ? _self.profilePicture : profilePicture // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
