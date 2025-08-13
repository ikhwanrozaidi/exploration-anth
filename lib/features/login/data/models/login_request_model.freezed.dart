// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LoginRequestModel {

 String get email; String get password;
/// Create a copy of LoginRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoginRequestModelCopyWith<LoginRequestModel> get copyWith => _$LoginRequestModelCopyWithImpl<LoginRequestModel>(this as LoginRequestModel, _$identity);

  /// Serializes this LoginRequestModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginRequestModel&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,email,password);

@override
String toString() {
  return 'LoginRequestModel(email: $email, password: $password)';
}


}

/// @nodoc
abstract mixin class $LoginRequestModelCopyWith<$Res>  {
  factory $LoginRequestModelCopyWith(LoginRequestModel value, $Res Function(LoginRequestModel) _then) = _$LoginRequestModelCopyWithImpl;
@useResult
$Res call({
 String email, String password
});




}
/// @nodoc
class _$LoginRequestModelCopyWithImpl<$Res>
    implements $LoginRequestModelCopyWith<$Res> {
  _$LoginRequestModelCopyWithImpl(this._self, this._then);

  final LoginRequestModel _self;
  final $Res Function(LoginRequestModel) _then;

/// Create a copy of LoginRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? email = null,Object? password = null,}) {
  return _then(_self.copyWith(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [LoginRequestModel].
extension LoginRequestModelPatterns on LoginRequestModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LoginRequestModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoginRequestModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LoginRequestModel value)  $default,){
final _that = this;
switch (_that) {
case _LoginRequestModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LoginRequestModel value)?  $default,){
final _that = this;
switch (_that) {
case _LoginRequestModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String email,  String password)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoginRequestModel() when $default != null:
return $default(_that.email,_that.password);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String email,  String password)  $default,) {final _that = this;
switch (_that) {
case _LoginRequestModel():
return $default(_that.email,_that.password);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String email,  String password)?  $default,) {final _that = this;
switch (_that) {
case _LoginRequestModel() when $default != null:
return $default(_that.email,_that.password);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LoginRequestModel implements LoginRequestModel {
  const _LoginRequestModel({required this.email, required this.password});
  factory _LoginRequestModel.fromJson(Map<String, dynamic> json) => _$LoginRequestModelFromJson(json);

@override final  String email;
@override final  String password;

/// Create a copy of LoginRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoginRequestModelCopyWith<_LoginRequestModel> get copyWith => __$LoginRequestModelCopyWithImpl<_LoginRequestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LoginRequestModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoginRequestModel&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,email,password);

@override
String toString() {
  return 'LoginRequestModel(email: $email, password: $password)';
}


}

/// @nodoc
abstract mixin class _$LoginRequestModelCopyWith<$Res> implements $LoginRequestModelCopyWith<$Res> {
  factory _$LoginRequestModelCopyWith(_LoginRequestModel value, $Res Function(_LoginRequestModel) _then) = __$LoginRequestModelCopyWithImpl;
@override @useResult
$Res call({
 String email, String password
});




}
/// @nodoc
class __$LoginRequestModelCopyWithImpl<$Res>
    implements _$LoginRequestModelCopyWith<$Res> {
  __$LoginRequestModelCopyWithImpl(this._self, this._then);

  final _LoginRequestModel _self;
  final $Res Function(_LoginRequestModel) _then;

/// Create a copy of LoginRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? email = null,Object? password = null,}) {
  return _then(_LoginRequestModel(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$VerifyOtpRequestModel {

 String get email; String get otp;
/// Create a copy of VerifyOtpRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VerifyOtpRequestModelCopyWith<VerifyOtpRequestModel> get copyWith => _$VerifyOtpRequestModelCopyWithImpl<VerifyOtpRequestModel>(this as VerifyOtpRequestModel, _$identity);

  /// Serializes this VerifyOtpRequestModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VerifyOtpRequestModel&&(identical(other.email, email) || other.email == email)&&(identical(other.otp, otp) || other.otp == otp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,email,otp);

@override
String toString() {
  return 'VerifyOtpRequestModel(email: $email, otp: $otp)';
}


}

/// @nodoc
abstract mixin class $VerifyOtpRequestModelCopyWith<$Res>  {
  factory $VerifyOtpRequestModelCopyWith(VerifyOtpRequestModel value, $Res Function(VerifyOtpRequestModel) _then) = _$VerifyOtpRequestModelCopyWithImpl;
@useResult
$Res call({
 String email, String otp
});




}
/// @nodoc
class _$VerifyOtpRequestModelCopyWithImpl<$Res>
    implements $VerifyOtpRequestModelCopyWith<$Res> {
  _$VerifyOtpRequestModelCopyWithImpl(this._self, this._then);

  final VerifyOtpRequestModel _self;
  final $Res Function(VerifyOtpRequestModel) _then;

/// Create a copy of VerifyOtpRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? email = null,Object? otp = null,}) {
  return _then(_self.copyWith(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,otp: null == otp ? _self.otp : otp // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [VerifyOtpRequestModel].
extension VerifyOtpRequestModelPatterns on VerifyOtpRequestModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VerifyOtpRequestModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VerifyOtpRequestModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VerifyOtpRequestModel value)  $default,){
final _that = this;
switch (_that) {
case _VerifyOtpRequestModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VerifyOtpRequestModel value)?  $default,){
final _that = this;
switch (_that) {
case _VerifyOtpRequestModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String email,  String otp)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VerifyOtpRequestModel() when $default != null:
return $default(_that.email,_that.otp);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String email,  String otp)  $default,) {final _that = this;
switch (_that) {
case _VerifyOtpRequestModel():
return $default(_that.email,_that.otp);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String email,  String otp)?  $default,) {final _that = this;
switch (_that) {
case _VerifyOtpRequestModel() when $default != null:
return $default(_that.email,_that.otp);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VerifyOtpRequestModel implements VerifyOtpRequestModel {
  const _VerifyOtpRequestModel({required this.email, required this.otp});
  factory _VerifyOtpRequestModel.fromJson(Map<String, dynamic> json) => _$VerifyOtpRequestModelFromJson(json);

@override final  String email;
@override final  String otp;

/// Create a copy of VerifyOtpRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VerifyOtpRequestModelCopyWith<_VerifyOtpRequestModel> get copyWith => __$VerifyOtpRequestModelCopyWithImpl<_VerifyOtpRequestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VerifyOtpRequestModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VerifyOtpRequestModel&&(identical(other.email, email) || other.email == email)&&(identical(other.otp, otp) || other.otp == otp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,email,otp);

@override
String toString() {
  return 'VerifyOtpRequestModel(email: $email, otp: $otp)';
}


}

/// @nodoc
abstract mixin class _$VerifyOtpRequestModelCopyWith<$Res> implements $VerifyOtpRequestModelCopyWith<$Res> {
  factory _$VerifyOtpRequestModelCopyWith(_VerifyOtpRequestModel value, $Res Function(_VerifyOtpRequestModel) _then) = __$VerifyOtpRequestModelCopyWithImpl;
@override @useResult
$Res call({
 String email, String otp
});




}
/// @nodoc
class __$VerifyOtpRequestModelCopyWithImpl<$Res>
    implements _$VerifyOtpRequestModelCopyWith<$Res> {
  __$VerifyOtpRequestModelCopyWithImpl(this._self, this._then);

  final _VerifyOtpRequestModel _self;
  final $Res Function(_VerifyOtpRequestModel) _then;

/// Create a copy of VerifyOtpRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? email = null,Object? otp = null,}) {
  return _then(_VerifyOtpRequestModel(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,otp: null == otp ? _self.otp : otp // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$LoginResponseModel {

 String get message;
/// Create a copy of LoginResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoginResponseModelCopyWith<LoginResponseModel> get copyWith => _$LoginResponseModelCopyWithImpl<LoginResponseModel>(this as LoginResponseModel, _$identity);

  /// Serializes this LoginResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginResponseModel&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'LoginResponseModel(message: $message)';
}


}

/// @nodoc
abstract mixin class $LoginResponseModelCopyWith<$Res>  {
  factory $LoginResponseModelCopyWith(LoginResponseModel value, $Res Function(LoginResponseModel) _then) = _$LoginResponseModelCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$LoginResponseModelCopyWithImpl<$Res>
    implements $LoginResponseModelCopyWith<$Res> {
  _$LoginResponseModelCopyWithImpl(this._self, this._then);

  final LoginResponseModel _self;
  final $Res Function(LoginResponseModel) _then;

/// Create a copy of LoginResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? message = null,}) {
  return _then(_self.copyWith(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [LoginResponseModel].
extension LoginResponseModelPatterns on LoginResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LoginResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoginResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LoginResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _LoginResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LoginResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _LoginResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String message)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoginResponseModel() when $default != null:
return $default(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String message)  $default,) {final _that = this;
switch (_that) {
case _LoginResponseModel():
return $default(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String message)?  $default,) {final _that = this;
switch (_that) {
case _LoginResponseModel() when $default != null:
return $default(_that.message);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LoginResponseModel implements LoginResponseModel {
  const _LoginResponseModel({required this.message});
  factory _LoginResponseModel.fromJson(Map<String, dynamic> json) => _$LoginResponseModelFromJson(json);

@override final  String message;

/// Create a copy of LoginResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoginResponseModelCopyWith<_LoginResponseModel> get copyWith => __$LoginResponseModelCopyWithImpl<_LoginResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LoginResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoginResponseModel&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'LoginResponseModel(message: $message)';
}


}

/// @nodoc
abstract mixin class _$LoginResponseModelCopyWith<$Res> implements $LoginResponseModelCopyWith<$Res> {
  factory _$LoginResponseModelCopyWith(_LoginResponseModel value, $Res Function(_LoginResponseModel) _then) = __$LoginResponseModelCopyWithImpl;
@override @useResult
$Res call({
 String message
});




}
/// @nodoc
class __$LoginResponseModelCopyWithImpl<$Res>
    implements _$LoginResponseModelCopyWith<$Res> {
  __$LoginResponseModelCopyWithImpl(this._self, this._then);

  final _LoginResponseModel _self;
  final $Res Function(_LoginResponseModel) _then;

/// Create a copy of LoginResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_LoginResponseModel(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$VerifyOtpResponseModel {

 String get id; String get accesstoken; String get refreshToken;
/// Create a copy of VerifyOtpResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VerifyOtpResponseModelCopyWith<VerifyOtpResponseModel> get copyWith => _$VerifyOtpResponseModelCopyWithImpl<VerifyOtpResponseModel>(this as VerifyOtpResponseModel, _$identity);

  /// Serializes this VerifyOtpResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VerifyOtpResponseModel&&(identical(other.id, id) || other.id == id)&&(identical(other.accesstoken, accesstoken) || other.accesstoken == accesstoken)&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,accesstoken,refreshToken);

@override
String toString() {
  return 'VerifyOtpResponseModel(id: $id, accesstoken: $accesstoken, refreshToken: $refreshToken)';
}


}

/// @nodoc
abstract mixin class $VerifyOtpResponseModelCopyWith<$Res>  {
  factory $VerifyOtpResponseModelCopyWith(VerifyOtpResponseModel value, $Res Function(VerifyOtpResponseModel) _then) = _$VerifyOtpResponseModelCopyWithImpl;
@useResult
$Res call({
 String id, String accesstoken, String refreshToken
});




}
/// @nodoc
class _$VerifyOtpResponseModelCopyWithImpl<$Res>
    implements $VerifyOtpResponseModelCopyWith<$Res> {
  _$VerifyOtpResponseModelCopyWithImpl(this._self, this._then);

  final VerifyOtpResponseModel _self;
  final $Res Function(VerifyOtpResponseModel) _then;

/// Create a copy of VerifyOtpResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? accesstoken = null,Object? refreshToken = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,accesstoken: null == accesstoken ? _self.accesstoken : accesstoken // ignore: cast_nullable_to_non_nullable
as String,refreshToken: null == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [VerifyOtpResponseModel].
extension VerifyOtpResponseModelPatterns on VerifyOtpResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VerifyOtpResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VerifyOtpResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VerifyOtpResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _VerifyOtpResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VerifyOtpResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _VerifyOtpResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String accesstoken,  String refreshToken)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VerifyOtpResponseModel() when $default != null:
return $default(_that.id,_that.accesstoken,_that.refreshToken);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String accesstoken,  String refreshToken)  $default,) {final _that = this;
switch (_that) {
case _VerifyOtpResponseModel():
return $default(_that.id,_that.accesstoken,_that.refreshToken);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String accesstoken,  String refreshToken)?  $default,) {final _that = this;
switch (_that) {
case _VerifyOtpResponseModel() when $default != null:
return $default(_that.id,_that.accesstoken,_that.refreshToken);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VerifyOtpResponseModel implements VerifyOtpResponseModel {
  const _VerifyOtpResponseModel({required this.id, required this.accesstoken, required this.refreshToken});
  factory _VerifyOtpResponseModel.fromJson(Map<String, dynamic> json) => _$VerifyOtpResponseModelFromJson(json);

@override final  String id;
@override final  String accesstoken;
@override final  String refreshToken;

/// Create a copy of VerifyOtpResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VerifyOtpResponseModelCopyWith<_VerifyOtpResponseModel> get copyWith => __$VerifyOtpResponseModelCopyWithImpl<_VerifyOtpResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VerifyOtpResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VerifyOtpResponseModel&&(identical(other.id, id) || other.id == id)&&(identical(other.accesstoken, accesstoken) || other.accesstoken == accesstoken)&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,accesstoken,refreshToken);

@override
String toString() {
  return 'VerifyOtpResponseModel(id: $id, accesstoken: $accesstoken, refreshToken: $refreshToken)';
}


}

/// @nodoc
abstract mixin class _$VerifyOtpResponseModelCopyWith<$Res> implements $VerifyOtpResponseModelCopyWith<$Res> {
  factory _$VerifyOtpResponseModelCopyWith(_VerifyOtpResponseModel value, $Res Function(_VerifyOtpResponseModel) _then) = __$VerifyOtpResponseModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String accesstoken, String refreshToken
});




}
/// @nodoc
class __$VerifyOtpResponseModelCopyWithImpl<$Res>
    implements _$VerifyOtpResponseModelCopyWith<$Res> {
  __$VerifyOtpResponseModelCopyWithImpl(this._self, this._then);

  final _VerifyOtpResponseModel _self;
  final $Res Function(_VerifyOtpResponseModel) _then;

/// Create a copy of VerifyOtpResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? accesstoken = null,Object? refreshToken = null,}) {
  return _then(_VerifyOtpResponseModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,accesstoken: null == accesstoken ? _self.accesstoken : accesstoken // ignore: cast_nullable_to_non_nullable
as String,refreshToken: null == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$ForgotPasswordRequestModel {

 String get email;
/// Create a copy of ForgotPasswordRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ForgotPasswordRequestModelCopyWith<ForgotPasswordRequestModel> get copyWith => _$ForgotPasswordRequestModelCopyWithImpl<ForgotPasswordRequestModel>(this as ForgotPasswordRequestModel, _$identity);

  /// Serializes this ForgotPasswordRequestModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ForgotPasswordRequestModel&&(identical(other.email, email) || other.email == email));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,email);

@override
String toString() {
  return 'ForgotPasswordRequestModel(email: $email)';
}


}

/// @nodoc
abstract mixin class $ForgotPasswordRequestModelCopyWith<$Res>  {
  factory $ForgotPasswordRequestModelCopyWith(ForgotPasswordRequestModel value, $Res Function(ForgotPasswordRequestModel) _then) = _$ForgotPasswordRequestModelCopyWithImpl;
@useResult
$Res call({
 String email
});




}
/// @nodoc
class _$ForgotPasswordRequestModelCopyWithImpl<$Res>
    implements $ForgotPasswordRequestModelCopyWith<$Res> {
  _$ForgotPasswordRequestModelCopyWithImpl(this._self, this._then);

  final ForgotPasswordRequestModel _self;
  final $Res Function(ForgotPasswordRequestModel) _then;

/// Create a copy of ForgotPasswordRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? email = null,}) {
  return _then(_self.copyWith(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ForgotPasswordRequestModel].
extension ForgotPasswordRequestModelPatterns on ForgotPasswordRequestModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ForgotPasswordRequestModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ForgotPasswordRequestModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ForgotPasswordRequestModel value)  $default,){
final _that = this;
switch (_that) {
case _ForgotPasswordRequestModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ForgotPasswordRequestModel value)?  $default,){
final _that = this;
switch (_that) {
case _ForgotPasswordRequestModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String email)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ForgotPasswordRequestModel() when $default != null:
return $default(_that.email);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String email)  $default,) {final _that = this;
switch (_that) {
case _ForgotPasswordRequestModel():
return $default(_that.email);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String email)?  $default,) {final _that = this;
switch (_that) {
case _ForgotPasswordRequestModel() when $default != null:
return $default(_that.email);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ForgotPasswordRequestModel implements ForgotPasswordRequestModel {
  const _ForgotPasswordRequestModel({required this.email});
  factory _ForgotPasswordRequestModel.fromJson(Map<String, dynamic> json) => _$ForgotPasswordRequestModelFromJson(json);

@override final  String email;

/// Create a copy of ForgotPasswordRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ForgotPasswordRequestModelCopyWith<_ForgotPasswordRequestModel> get copyWith => __$ForgotPasswordRequestModelCopyWithImpl<_ForgotPasswordRequestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ForgotPasswordRequestModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ForgotPasswordRequestModel&&(identical(other.email, email) || other.email == email));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,email);

@override
String toString() {
  return 'ForgotPasswordRequestModel(email: $email)';
}


}

/// @nodoc
abstract mixin class _$ForgotPasswordRequestModelCopyWith<$Res> implements $ForgotPasswordRequestModelCopyWith<$Res> {
  factory _$ForgotPasswordRequestModelCopyWith(_ForgotPasswordRequestModel value, $Res Function(_ForgotPasswordRequestModel) _then) = __$ForgotPasswordRequestModelCopyWithImpl;
@override @useResult
$Res call({
 String email
});




}
/// @nodoc
class __$ForgotPasswordRequestModelCopyWithImpl<$Res>
    implements _$ForgotPasswordRequestModelCopyWith<$Res> {
  __$ForgotPasswordRequestModelCopyWithImpl(this._self, this._then);

  final _ForgotPasswordRequestModel _self;
  final $Res Function(_ForgotPasswordRequestModel) _then;

/// Create a copy of ForgotPasswordRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? email = null,}) {
  return _then(_ForgotPasswordRequestModel(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$VerifyOtpForgotRequestModel {

 String get email; String get otpForgot;
/// Create a copy of VerifyOtpForgotRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VerifyOtpForgotRequestModelCopyWith<VerifyOtpForgotRequestModel> get copyWith => _$VerifyOtpForgotRequestModelCopyWithImpl<VerifyOtpForgotRequestModel>(this as VerifyOtpForgotRequestModel, _$identity);

  /// Serializes this VerifyOtpForgotRequestModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VerifyOtpForgotRequestModel&&(identical(other.email, email) || other.email == email)&&(identical(other.otpForgot, otpForgot) || other.otpForgot == otpForgot));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,email,otpForgot);

@override
String toString() {
  return 'VerifyOtpForgotRequestModel(email: $email, otpForgot: $otpForgot)';
}


}

/// @nodoc
abstract mixin class $VerifyOtpForgotRequestModelCopyWith<$Res>  {
  factory $VerifyOtpForgotRequestModelCopyWith(VerifyOtpForgotRequestModel value, $Res Function(VerifyOtpForgotRequestModel) _then) = _$VerifyOtpForgotRequestModelCopyWithImpl;
@useResult
$Res call({
 String email, String otpForgot
});




}
/// @nodoc
class _$VerifyOtpForgotRequestModelCopyWithImpl<$Res>
    implements $VerifyOtpForgotRequestModelCopyWith<$Res> {
  _$VerifyOtpForgotRequestModelCopyWithImpl(this._self, this._then);

  final VerifyOtpForgotRequestModel _self;
  final $Res Function(VerifyOtpForgotRequestModel) _then;

/// Create a copy of VerifyOtpForgotRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? email = null,Object? otpForgot = null,}) {
  return _then(_self.copyWith(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,otpForgot: null == otpForgot ? _self.otpForgot : otpForgot // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [VerifyOtpForgotRequestModel].
extension VerifyOtpForgotRequestModelPatterns on VerifyOtpForgotRequestModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VerifyOtpForgotRequestModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VerifyOtpForgotRequestModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VerifyOtpForgotRequestModel value)  $default,){
final _that = this;
switch (_that) {
case _VerifyOtpForgotRequestModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VerifyOtpForgotRequestModel value)?  $default,){
final _that = this;
switch (_that) {
case _VerifyOtpForgotRequestModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String email,  String otpForgot)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VerifyOtpForgotRequestModel() when $default != null:
return $default(_that.email,_that.otpForgot);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String email,  String otpForgot)  $default,) {final _that = this;
switch (_that) {
case _VerifyOtpForgotRequestModel():
return $default(_that.email,_that.otpForgot);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String email,  String otpForgot)?  $default,) {final _that = this;
switch (_that) {
case _VerifyOtpForgotRequestModel() when $default != null:
return $default(_that.email,_that.otpForgot);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VerifyOtpForgotRequestModel implements VerifyOtpForgotRequestModel {
  const _VerifyOtpForgotRequestModel({required this.email, required this.otpForgot});
  factory _VerifyOtpForgotRequestModel.fromJson(Map<String, dynamic> json) => _$VerifyOtpForgotRequestModelFromJson(json);

@override final  String email;
@override final  String otpForgot;

/// Create a copy of VerifyOtpForgotRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VerifyOtpForgotRequestModelCopyWith<_VerifyOtpForgotRequestModel> get copyWith => __$VerifyOtpForgotRequestModelCopyWithImpl<_VerifyOtpForgotRequestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VerifyOtpForgotRequestModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VerifyOtpForgotRequestModel&&(identical(other.email, email) || other.email == email)&&(identical(other.otpForgot, otpForgot) || other.otpForgot == otpForgot));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,email,otpForgot);

@override
String toString() {
  return 'VerifyOtpForgotRequestModel(email: $email, otpForgot: $otpForgot)';
}


}

/// @nodoc
abstract mixin class _$VerifyOtpForgotRequestModelCopyWith<$Res> implements $VerifyOtpForgotRequestModelCopyWith<$Res> {
  factory _$VerifyOtpForgotRequestModelCopyWith(_VerifyOtpForgotRequestModel value, $Res Function(_VerifyOtpForgotRequestModel) _then) = __$VerifyOtpForgotRequestModelCopyWithImpl;
@override @useResult
$Res call({
 String email, String otpForgot
});




}
/// @nodoc
class __$VerifyOtpForgotRequestModelCopyWithImpl<$Res>
    implements _$VerifyOtpForgotRequestModelCopyWith<$Res> {
  __$VerifyOtpForgotRequestModelCopyWithImpl(this._self, this._then);

  final _VerifyOtpForgotRequestModel _self;
  final $Res Function(_VerifyOtpForgotRequestModel) _then;

/// Create a copy of VerifyOtpForgotRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? email = null,Object? otpForgot = null,}) {
  return _then(_VerifyOtpForgotRequestModel(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,otpForgot: null == otpForgot ? _self.otpForgot : otpForgot // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$ChangePasswordRequestModel {

 String get email; String get newPassword;
/// Create a copy of ChangePasswordRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChangePasswordRequestModelCopyWith<ChangePasswordRequestModel> get copyWith => _$ChangePasswordRequestModelCopyWithImpl<ChangePasswordRequestModel>(this as ChangePasswordRequestModel, _$identity);

  /// Serializes this ChangePasswordRequestModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChangePasswordRequestModel&&(identical(other.email, email) || other.email == email)&&(identical(other.newPassword, newPassword) || other.newPassword == newPassword));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,email,newPassword);

@override
String toString() {
  return 'ChangePasswordRequestModel(email: $email, newPassword: $newPassword)';
}


}

/// @nodoc
abstract mixin class $ChangePasswordRequestModelCopyWith<$Res>  {
  factory $ChangePasswordRequestModelCopyWith(ChangePasswordRequestModel value, $Res Function(ChangePasswordRequestModel) _then) = _$ChangePasswordRequestModelCopyWithImpl;
@useResult
$Res call({
 String email, String newPassword
});




}
/// @nodoc
class _$ChangePasswordRequestModelCopyWithImpl<$Res>
    implements $ChangePasswordRequestModelCopyWith<$Res> {
  _$ChangePasswordRequestModelCopyWithImpl(this._self, this._then);

  final ChangePasswordRequestModel _self;
  final $Res Function(ChangePasswordRequestModel) _then;

/// Create a copy of ChangePasswordRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? email = null,Object? newPassword = null,}) {
  return _then(_self.copyWith(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,newPassword: null == newPassword ? _self.newPassword : newPassword // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ChangePasswordRequestModel].
extension ChangePasswordRequestModelPatterns on ChangePasswordRequestModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChangePasswordRequestModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChangePasswordRequestModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChangePasswordRequestModel value)  $default,){
final _that = this;
switch (_that) {
case _ChangePasswordRequestModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChangePasswordRequestModel value)?  $default,){
final _that = this;
switch (_that) {
case _ChangePasswordRequestModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String email,  String newPassword)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChangePasswordRequestModel() when $default != null:
return $default(_that.email,_that.newPassword);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String email,  String newPassword)  $default,) {final _that = this;
switch (_that) {
case _ChangePasswordRequestModel():
return $default(_that.email,_that.newPassword);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String email,  String newPassword)?  $default,) {final _that = this;
switch (_that) {
case _ChangePasswordRequestModel() when $default != null:
return $default(_that.email,_that.newPassword);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChangePasswordRequestModel implements ChangePasswordRequestModel {
  const _ChangePasswordRequestModel({required this.email, required this.newPassword});
  factory _ChangePasswordRequestModel.fromJson(Map<String, dynamic> json) => _$ChangePasswordRequestModelFromJson(json);

@override final  String email;
@override final  String newPassword;

/// Create a copy of ChangePasswordRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChangePasswordRequestModelCopyWith<_ChangePasswordRequestModel> get copyWith => __$ChangePasswordRequestModelCopyWithImpl<_ChangePasswordRequestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChangePasswordRequestModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChangePasswordRequestModel&&(identical(other.email, email) || other.email == email)&&(identical(other.newPassword, newPassword) || other.newPassword == newPassword));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,email,newPassword);

@override
String toString() {
  return 'ChangePasswordRequestModel(email: $email, newPassword: $newPassword)';
}


}

/// @nodoc
abstract mixin class _$ChangePasswordRequestModelCopyWith<$Res> implements $ChangePasswordRequestModelCopyWith<$Res> {
  factory _$ChangePasswordRequestModelCopyWith(_ChangePasswordRequestModel value, $Res Function(_ChangePasswordRequestModel) _then) = __$ChangePasswordRequestModelCopyWithImpl;
@override @useResult
$Res call({
 String email, String newPassword
});




}
/// @nodoc
class __$ChangePasswordRequestModelCopyWithImpl<$Res>
    implements _$ChangePasswordRequestModelCopyWith<$Res> {
  __$ChangePasswordRequestModelCopyWithImpl(this._self, this._then);

  final _ChangePasswordRequestModel _self;
  final $Res Function(_ChangePasswordRequestModel) _then;

/// Create a copy of ChangePasswordRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? email = null,Object? newPassword = null,}) {
  return _then(_ChangePasswordRequestModel(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,newPassword: null == newPassword ? _self.newPassword : newPassword // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
