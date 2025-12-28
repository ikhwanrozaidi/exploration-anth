// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_profile_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UpdateProfileResponseModel {

 UserResponseModel get user; UserDetailResponseModel get userDetail;
/// Create a copy of UpdateProfileResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateProfileResponseModelCopyWith<UpdateProfileResponseModel> get copyWith => _$UpdateProfileResponseModelCopyWithImpl<UpdateProfileResponseModel>(this as UpdateProfileResponseModel, _$identity);

  /// Serializes this UpdateProfileResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateProfileResponseModel&&(identical(other.user, user) || other.user == user)&&(identical(other.userDetail, userDetail) || other.userDetail == userDetail));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,user,userDetail);

@override
String toString() {
  return 'UpdateProfileResponseModel(user: $user, userDetail: $userDetail)';
}


}

/// @nodoc
abstract mixin class $UpdateProfileResponseModelCopyWith<$Res>  {
  factory $UpdateProfileResponseModelCopyWith(UpdateProfileResponseModel value, $Res Function(UpdateProfileResponseModel) _then) = _$UpdateProfileResponseModelCopyWithImpl;
@useResult
$Res call({
 UserResponseModel user, UserDetailResponseModel userDetail
});


$UserResponseModelCopyWith<$Res> get user;$UserDetailResponseModelCopyWith<$Res> get userDetail;

}
/// @nodoc
class _$UpdateProfileResponseModelCopyWithImpl<$Res>
    implements $UpdateProfileResponseModelCopyWith<$Res> {
  _$UpdateProfileResponseModelCopyWithImpl(this._self, this._then);

  final UpdateProfileResponseModel _self;
  final $Res Function(UpdateProfileResponseModel) _then;

/// Create a copy of UpdateProfileResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? user = null,Object? userDetail = null,}) {
  return _then(_self.copyWith(
user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserResponseModel,userDetail: null == userDetail ? _self.userDetail : userDetail // ignore: cast_nullable_to_non_nullable
as UserDetailResponseModel,
  ));
}
/// Create a copy of UpdateProfileResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserResponseModelCopyWith<$Res> get user {
  
  return $UserResponseModelCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}/// Create a copy of UpdateProfileResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserDetailResponseModelCopyWith<$Res> get userDetail {
  
  return $UserDetailResponseModelCopyWith<$Res>(_self.userDetail, (value) {
    return _then(_self.copyWith(userDetail: value));
  });
}
}


/// Adds pattern-matching-related methods to [UpdateProfileResponseModel].
extension UpdateProfileResponseModelPatterns on UpdateProfileResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UpdateProfileResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UpdateProfileResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UpdateProfileResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _UpdateProfileResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UpdateProfileResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _UpdateProfileResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( UserResponseModel user,  UserDetailResponseModel userDetail)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UpdateProfileResponseModel() when $default != null:
return $default(_that.user,_that.userDetail);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( UserResponseModel user,  UserDetailResponseModel userDetail)  $default,) {final _that = this;
switch (_that) {
case _UpdateProfileResponseModel():
return $default(_that.user,_that.userDetail);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( UserResponseModel user,  UserDetailResponseModel userDetail)?  $default,) {final _that = this;
switch (_that) {
case _UpdateProfileResponseModel() when $default != null:
return $default(_that.user,_that.userDetail);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UpdateProfileResponseModel extends UpdateProfileResponseModel {
  const _UpdateProfileResponseModel({required this.user, required this.userDetail}): super._();
  factory _UpdateProfileResponseModel.fromJson(Map<String, dynamic> json) => _$UpdateProfileResponseModelFromJson(json);

@override final  UserResponseModel user;
@override final  UserDetailResponseModel userDetail;

/// Create a copy of UpdateProfileResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateProfileResponseModelCopyWith<_UpdateProfileResponseModel> get copyWith => __$UpdateProfileResponseModelCopyWithImpl<_UpdateProfileResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UpdateProfileResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateProfileResponseModel&&(identical(other.user, user) || other.user == user)&&(identical(other.userDetail, userDetail) || other.userDetail == userDetail));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,user,userDetail);

@override
String toString() {
  return 'UpdateProfileResponseModel(user: $user, userDetail: $userDetail)';
}


}

/// @nodoc
abstract mixin class _$UpdateProfileResponseModelCopyWith<$Res> implements $UpdateProfileResponseModelCopyWith<$Res> {
  factory _$UpdateProfileResponseModelCopyWith(_UpdateProfileResponseModel value, $Res Function(_UpdateProfileResponseModel) _then) = __$UpdateProfileResponseModelCopyWithImpl;
@override @useResult
$Res call({
 UserResponseModel user, UserDetailResponseModel userDetail
});


@override $UserResponseModelCopyWith<$Res> get user;@override $UserDetailResponseModelCopyWith<$Res> get userDetail;

}
/// @nodoc
class __$UpdateProfileResponseModelCopyWithImpl<$Res>
    implements _$UpdateProfileResponseModelCopyWith<$Res> {
  __$UpdateProfileResponseModelCopyWithImpl(this._self, this._then);

  final _UpdateProfileResponseModel _self;
  final $Res Function(_UpdateProfileResponseModel) _then;

/// Create a copy of UpdateProfileResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? user = null,Object? userDetail = null,}) {
  return _then(_UpdateProfileResponseModel(
user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserResponseModel,userDetail: null == userDetail ? _self.userDetail : userDetail // ignore: cast_nullable_to_non_nullable
as UserDetailResponseModel,
  ));
}

/// Create a copy of UpdateProfileResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserResponseModelCopyWith<$Res> get user {
  
  return $UserResponseModelCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}/// Create a copy of UpdateProfileResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserDetailResponseModelCopyWith<$Res> get userDetail {
  
  return $UserDetailResponseModelCopyWith<$Res>(_self.userDetail, (value) {
    return _then(_self.copyWith(userDetail: value));
  });
}
}

// dart format on
