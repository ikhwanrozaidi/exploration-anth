// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LoginState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LoginState()';
}


}

/// @nodoc
class $LoginStateCopyWith<$Res>  {
$LoginStateCopyWith(LoginState _, $Res Function(LoginState) __);
}


/// Adds pattern-matching-related methods to [LoginState].
extension LoginStatePatterns on LoginState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoginInitial value)?  initial,TResult Function( LoginLoading value)?  loading,TResult Function( LoginOtpRequired value)?  otpRequired,TResult Function( LoginAuthenticated value)?  authenticated,TResult Function( LoginSuccess value)?  success,TResult Function( LoginUnauthenticated value)?  unauthenticated,TResult Function( LoginLoggedOut value)?  loggedOut,TResult Function( LoginFailure value)?  failure,TResult Function( LoginForgotPasswordOtpRequired value)?  forgotPasswordOtpRequired,TResult Function( LoginChangePasswordRequired value)?  changePasswordRequired,TResult Function( LoginPasswordChanged value)?  passwordChanged,TResult Function( LoginCredentialsLoaded value)?  credentialsLoaded,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoginInitial() when initial != null:
return initial(_that);case LoginLoading() when loading != null:
return loading(_that);case LoginOtpRequired() when otpRequired != null:
return otpRequired(_that);case LoginAuthenticated() when authenticated != null:
return authenticated(_that);case LoginSuccess() when success != null:
return success(_that);case LoginUnauthenticated() when unauthenticated != null:
return unauthenticated(_that);case LoginLoggedOut() when loggedOut != null:
return loggedOut(_that);case LoginFailure() when failure != null:
return failure(_that);case LoginForgotPasswordOtpRequired() when forgotPasswordOtpRequired != null:
return forgotPasswordOtpRequired(_that);case LoginChangePasswordRequired() when changePasswordRequired != null:
return changePasswordRequired(_that);case LoginPasswordChanged() when passwordChanged != null:
return passwordChanged(_that);case LoginCredentialsLoaded() when credentialsLoaded != null:
return credentialsLoaded(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoginInitial value)  initial,required TResult Function( LoginLoading value)  loading,required TResult Function( LoginOtpRequired value)  otpRequired,required TResult Function( LoginAuthenticated value)  authenticated,required TResult Function( LoginSuccess value)  success,required TResult Function( LoginUnauthenticated value)  unauthenticated,required TResult Function( LoginLoggedOut value)  loggedOut,required TResult Function( LoginFailure value)  failure,required TResult Function( LoginForgotPasswordOtpRequired value)  forgotPasswordOtpRequired,required TResult Function( LoginChangePasswordRequired value)  changePasswordRequired,required TResult Function( LoginPasswordChanged value)  passwordChanged,required TResult Function( LoginCredentialsLoaded value)  credentialsLoaded,}){
final _that = this;
switch (_that) {
case LoginInitial():
return initial(_that);case LoginLoading():
return loading(_that);case LoginOtpRequired():
return otpRequired(_that);case LoginAuthenticated():
return authenticated(_that);case LoginSuccess():
return success(_that);case LoginUnauthenticated():
return unauthenticated(_that);case LoginLoggedOut():
return loggedOut(_that);case LoginFailure():
return failure(_that);case LoginForgotPasswordOtpRequired():
return forgotPasswordOtpRequired(_that);case LoginChangePasswordRequired():
return changePasswordRequired(_that);case LoginPasswordChanged():
return passwordChanged(_that);case LoginCredentialsLoaded():
return credentialsLoaded(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoginInitial value)?  initial,TResult? Function( LoginLoading value)?  loading,TResult? Function( LoginOtpRequired value)?  otpRequired,TResult? Function( LoginAuthenticated value)?  authenticated,TResult? Function( LoginSuccess value)?  success,TResult? Function( LoginUnauthenticated value)?  unauthenticated,TResult? Function( LoginLoggedOut value)?  loggedOut,TResult? Function( LoginFailure value)?  failure,TResult? Function( LoginForgotPasswordOtpRequired value)?  forgotPasswordOtpRequired,TResult? Function( LoginChangePasswordRequired value)?  changePasswordRequired,TResult? Function( LoginPasswordChanged value)?  passwordChanged,TResult? Function( LoginCredentialsLoaded value)?  credentialsLoaded,}){
final _that = this;
switch (_that) {
case LoginInitial() when initial != null:
return initial(_that);case LoginLoading() when loading != null:
return loading(_that);case LoginOtpRequired() when otpRequired != null:
return otpRequired(_that);case LoginAuthenticated() when authenticated != null:
return authenticated(_that);case LoginSuccess() when success != null:
return success(_that);case LoginUnauthenticated() when unauthenticated != null:
return unauthenticated(_that);case LoginLoggedOut() when loggedOut != null:
return loggedOut(_that);case LoginFailure() when failure != null:
return failure(_that);case LoginForgotPasswordOtpRequired() when forgotPasswordOtpRequired != null:
return forgotPasswordOtpRequired(_that);case LoginChangePasswordRequired() when changePasswordRequired != null:
return changePasswordRequired(_that);case LoginPasswordChanged() when passwordChanged != null:
return passwordChanged(_that);case LoginCredentialsLoaded() when credentialsLoaded != null:
return credentialsLoaded(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( String email,  String message)?  otpRequired,TResult Function( AuthResult authResult,  Admin admin)?  authenticated,TResult Function( Admin admin)?  success,TResult Function()?  unauthenticated,TResult Function()?  loggedOut,TResult Function( String message)?  failure,TResult Function( String email,  String message)?  forgotPasswordOtpRequired,TResult Function( String email,  String message)?  changePasswordRequired,TResult Function( String message)?  passwordChanged,TResult Function( String email,  String password)?  credentialsLoaded,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LoginInitial() when initial != null:
return initial();case LoginLoading() when loading != null:
return loading();case LoginOtpRequired() when otpRequired != null:
return otpRequired(_that.email,_that.message);case LoginAuthenticated() when authenticated != null:
return authenticated(_that.authResult,_that.admin);case LoginSuccess() when success != null:
return success(_that.admin);case LoginUnauthenticated() when unauthenticated != null:
return unauthenticated();case LoginLoggedOut() when loggedOut != null:
return loggedOut();case LoginFailure() when failure != null:
return failure(_that.message);case LoginForgotPasswordOtpRequired() when forgotPasswordOtpRequired != null:
return forgotPasswordOtpRequired(_that.email,_that.message);case LoginChangePasswordRequired() when changePasswordRequired != null:
return changePasswordRequired(_that.email,_that.message);case LoginPasswordChanged() when passwordChanged != null:
return passwordChanged(_that.message);case LoginCredentialsLoaded() when credentialsLoaded != null:
return credentialsLoaded(_that.email,_that.password);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( String email,  String message)  otpRequired,required TResult Function( AuthResult authResult,  Admin admin)  authenticated,required TResult Function( Admin admin)  success,required TResult Function()  unauthenticated,required TResult Function()  loggedOut,required TResult Function( String message)  failure,required TResult Function( String email,  String message)  forgotPasswordOtpRequired,required TResult Function( String email,  String message)  changePasswordRequired,required TResult Function( String message)  passwordChanged,required TResult Function( String email,  String password)  credentialsLoaded,}) {final _that = this;
switch (_that) {
case LoginInitial():
return initial();case LoginLoading():
return loading();case LoginOtpRequired():
return otpRequired(_that.email,_that.message);case LoginAuthenticated():
return authenticated(_that.authResult,_that.admin);case LoginSuccess():
return success(_that.admin);case LoginUnauthenticated():
return unauthenticated();case LoginLoggedOut():
return loggedOut();case LoginFailure():
return failure(_that.message);case LoginForgotPasswordOtpRequired():
return forgotPasswordOtpRequired(_that.email,_that.message);case LoginChangePasswordRequired():
return changePasswordRequired(_that.email,_that.message);case LoginPasswordChanged():
return passwordChanged(_that.message);case LoginCredentialsLoaded():
return credentialsLoaded(_that.email,_that.password);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( String email,  String message)?  otpRequired,TResult? Function( AuthResult authResult,  Admin admin)?  authenticated,TResult? Function( Admin admin)?  success,TResult? Function()?  unauthenticated,TResult? Function()?  loggedOut,TResult? Function( String message)?  failure,TResult? Function( String email,  String message)?  forgotPasswordOtpRequired,TResult? Function( String email,  String message)?  changePasswordRequired,TResult? Function( String message)?  passwordChanged,TResult? Function( String email,  String password)?  credentialsLoaded,}) {final _that = this;
switch (_that) {
case LoginInitial() when initial != null:
return initial();case LoginLoading() when loading != null:
return loading();case LoginOtpRequired() when otpRequired != null:
return otpRequired(_that.email,_that.message);case LoginAuthenticated() when authenticated != null:
return authenticated(_that.authResult,_that.admin);case LoginSuccess() when success != null:
return success(_that.admin);case LoginUnauthenticated() when unauthenticated != null:
return unauthenticated();case LoginLoggedOut() when loggedOut != null:
return loggedOut();case LoginFailure() when failure != null:
return failure(_that.message);case LoginForgotPasswordOtpRequired() when forgotPasswordOtpRequired != null:
return forgotPasswordOtpRequired(_that.email,_that.message);case LoginChangePasswordRequired() when changePasswordRequired != null:
return changePasswordRequired(_that.email,_that.message);case LoginPasswordChanged() when passwordChanged != null:
return passwordChanged(_that.message);case LoginCredentialsLoaded() when credentialsLoaded != null:
return credentialsLoaded(_that.email,_that.password);case _:
  return null;

}
}

}

/// @nodoc


class LoginInitial implements LoginState {
  const LoginInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LoginState.initial()';
}


}




/// @nodoc


class LoginLoading implements LoginState {
  const LoginLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LoginState.loading()';
}


}




/// @nodoc


class LoginOtpRequired implements LoginState {
  const LoginOtpRequired(this.email, this.message);
  

 final  String email;
 final  String message;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoginOtpRequiredCopyWith<LoginOtpRequired> get copyWith => _$LoginOtpRequiredCopyWithImpl<LoginOtpRequired>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginOtpRequired&&(identical(other.email, email) || other.email == email)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,email,message);

@override
String toString() {
  return 'LoginState.otpRequired(email: $email, message: $message)';
}


}

/// @nodoc
abstract mixin class $LoginOtpRequiredCopyWith<$Res> implements $LoginStateCopyWith<$Res> {
  factory $LoginOtpRequiredCopyWith(LoginOtpRequired value, $Res Function(LoginOtpRequired) _then) = _$LoginOtpRequiredCopyWithImpl;
@useResult
$Res call({
 String email, String message
});




}
/// @nodoc
class _$LoginOtpRequiredCopyWithImpl<$Res>
    implements $LoginOtpRequiredCopyWith<$Res> {
  _$LoginOtpRequiredCopyWithImpl(this._self, this._then);

  final LoginOtpRequired _self;
  final $Res Function(LoginOtpRequired) _then;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? email = null,Object? message = null,}) {
  return _then(LoginOtpRequired(
null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class LoginAuthenticated implements LoginState {
  const LoginAuthenticated(this.authResult, this.admin);
  

 final  AuthResult authResult;
 final  Admin admin;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoginAuthenticatedCopyWith<LoginAuthenticated> get copyWith => _$LoginAuthenticatedCopyWithImpl<LoginAuthenticated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginAuthenticated&&(identical(other.authResult, authResult) || other.authResult == authResult)&&(identical(other.admin, admin) || other.admin == admin));
}


@override
int get hashCode => Object.hash(runtimeType,authResult,admin);

@override
String toString() {
  return 'LoginState.authenticated(authResult: $authResult, admin: $admin)';
}


}

/// @nodoc
abstract mixin class $LoginAuthenticatedCopyWith<$Res> implements $LoginStateCopyWith<$Res> {
  factory $LoginAuthenticatedCopyWith(LoginAuthenticated value, $Res Function(LoginAuthenticated) _then) = _$LoginAuthenticatedCopyWithImpl;
@useResult
$Res call({
 AuthResult authResult, Admin admin
});




}
/// @nodoc
class _$LoginAuthenticatedCopyWithImpl<$Res>
    implements $LoginAuthenticatedCopyWith<$Res> {
  _$LoginAuthenticatedCopyWithImpl(this._self, this._then);

  final LoginAuthenticated _self;
  final $Res Function(LoginAuthenticated) _then;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? authResult = null,Object? admin = null,}) {
  return _then(LoginAuthenticated(
null == authResult ? _self.authResult : authResult // ignore: cast_nullable_to_non_nullable
as AuthResult,null == admin ? _self.admin : admin // ignore: cast_nullable_to_non_nullable
as Admin,
  ));
}


}

/// @nodoc


class LoginSuccess implements LoginState {
  const LoginSuccess(this.admin);
  

 final  Admin admin;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoginSuccessCopyWith<LoginSuccess> get copyWith => _$LoginSuccessCopyWithImpl<LoginSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginSuccess&&(identical(other.admin, admin) || other.admin == admin));
}


@override
int get hashCode => Object.hash(runtimeType,admin);

@override
String toString() {
  return 'LoginState.success(admin: $admin)';
}


}

/// @nodoc
abstract mixin class $LoginSuccessCopyWith<$Res> implements $LoginStateCopyWith<$Res> {
  factory $LoginSuccessCopyWith(LoginSuccess value, $Res Function(LoginSuccess) _then) = _$LoginSuccessCopyWithImpl;
@useResult
$Res call({
 Admin admin
});




}
/// @nodoc
class _$LoginSuccessCopyWithImpl<$Res>
    implements $LoginSuccessCopyWith<$Res> {
  _$LoginSuccessCopyWithImpl(this._self, this._then);

  final LoginSuccess _self;
  final $Res Function(LoginSuccess) _then;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? admin = null,}) {
  return _then(LoginSuccess(
null == admin ? _self.admin : admin // ignore: cast_nullable_to_non_nullable
as Admin,
  ));
}


}

/// @nodoc


class LoginUnauthenticated implements LoginState {
  const LoginUnauthenticated();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginUnauthenticated);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LoginState.unauthenticated()';
}


}




/// @nodoc


class LoginLoggedOut implements LoginState {
  const LoginLoggedOut();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginLoggedOut);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LoginState.loggedOut()';
}


}




/// @nodoc


class LoginFailure implements LoginState {
  const LoginFailure(this.message);
  

 final  String message;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoginFailureCopyWith<LoginFailure> get copyWith => _$LoginFailureCopyWithImpl<LoginFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'LoginState.failure(message: $message)';
}


}

/// @nodoc
abstract mixin class $LoginFailureCopyWith<$Res> implements $LoginStateCopyWith<$Res> {
  factory $LoginFailureCopyWith(LoginFailure value, $Res Function(LoginFailure) _then) = _$LoginFailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$LoginFailureCopyWithImpl<$Res>
    implements $LoginFailureCopyWith<$Res> {
  _$LoginFailureCopyWithImpl(this._self, this._then);

  final LoginFailure _self;
  final $Res Function(LoginFailure) _then;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(LoginFailure(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class LoginForgotPasswordOtpRequired implements LoginState {
  const LoginForgotPasswordOtpRequired(this.email, this.message);
  

 final  String email;
 final  String message;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoginForgotPasswordOtpRequiredCopyWith<LoginForgotPasswordOtpRequired> get copyWith => _$LoginForgotPasswordOtpRequiredCopyWithImpl<LoginForgotPasswordOtpRequired>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginForgotPasswordOtpRequired&&(identical(other.email, email) || other.email == email)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,email,message);

@override
String toString() {
  return 'LoginState.forgotPasswordOtpRequired(email: $email, message: $message)';
}


}

/// @nodoc
abstract mixin class $LoginForgotPasswordOtpRequiredCopyWith<$Res> implements $LoginStateCopyWith<$Res> {
  factory $LoginForgotPasswordOtpRequiredCopyWith(LoginForgotPasswordOtpRequired value, $Res Function(LoginForgotPasswordOtpRequired) _then) = _$LoginForgotPasswordOtpRequiredCopyWithImpl;
@useResult
$Res call({
 String email, String message
});




}
/// @nodoc
class _$LoginForgotPasswordOtpRequiredCopyWithImpl<$Res>
    implements $LoginForgotPasswordOtpRequiredCopyWith<$Res> {
  _$LoginForgotPasswordOtpRequiredCopyWithImpl(this._self, this._then);

  final LoginForgotPasswordOtpRequired _self;
  final $Res Function(LoginForgotPasswordOtpRequired) _then;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? email = null,Object? message = null,}) {
  return _then(LoginForgotPasswordOtpRequired(
null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class LoginChangePasswordRequired implements LoginState {
  const LoginChangePasswordRequired(this.email, this.message);
  

 final  String email;
 final  String message;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoginChangePasswordRequiredCopyWith<LoginChangePasswordRequired> get copyWith => _$LoginChangePasswordRequiredCopyWithImpl<LoginChangePasswordRequired>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginChangePasswordRequired&&(identical(other.email, email) || other.email == email)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,email,message);

@override
String toString() {
  return 'LoginState.changePasswordRequired(email: $email, message: $message)';
}


}

/// @nodoc
abstract mixin class $LoginChangePasswordRequiredCopyWith<$Res> implements $LoginStateCopyWith<$Res> {
  factory $LoginChangePasswordRequiredCopyWith(LoginChangePasswordRequired value, $Res Function(LoginChangePasswordRequired) _then) = _$LoginChangePasswordRequiredCopyWithImpl;
@useResult
$Res call({
 String email, String message
});




}
/// @nodoc
class _$LoginChangePasswordRequiredCopyWithImpl<$Res>
    implements $LoginChangePasswordRequiredCopyWith<$Res> {
  _$LoginChangePasswordRequiredCopyWithImpl(this._self, this._then);

  final LoginChangePasswordRequired _self;
  final $Res Function(LoginChangePasswordRequired) _then;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? email = null,Object? message = null,}) {
  return _then(LoginChangePasswordRequired(
null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class LoginPasswordChanged implements LoginState {
  const LoginPasswordChanged(this.message);
  

 final  String message;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoginPasswordChangedCopyWith<LoginPasswordChanged> get copyWith => _$LoginPasswordChangedCopyWithImpl<LoginPasswordChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginPasswordChanged&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'LoginState.passwordChanged(message: $message)';
}


}

/// @nodoc
abstract mixin class $LoginPasswordChangedCopyWith<$Res> implements $LoginStateCopyWith<$Res> {
  factory $LoginPasswordChangedCopyWith(LoginPasswordChanged value, $Res Function(LoginPasswordChanged) _then) = _$LoginPasswordChangedCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$LoginPasswordChangedCopyWithImpl<$Res>
    implements $LoginPasswordChangedCopyWith<$Res> {
  _$LoginPasswordChangedCopyWithImpl(this._self, this._then);

  final LoginPasswordChanged _self;
  final $Res Function(LoginPasswordChanged) _then;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(LoginPasswordChanged(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class LoginCredentialsLoaded implements LoginState {
  const LoginCredentialsLoaded(this.email, this.password);
  

 final  String email;
 final  String password;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoginCredentialsLoadedCopyWith<LoginCredentialsLoaded> get copyWith => _$LoginCredentialsLoadedCopyWithImpl<LoginCredentialsLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginCredentialsLoaded&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password));
}


@override
int get hashCode => Object.hash(runtimeType,email,password);

@override
String toString() {
  return 'LoginState.credentialsLoaded(email: $email, password: $password)';
}


}

/// @nodoc
abstract mixin class $LoginCredentialsLoadedCopyWith<$Res> implements $LoginStateCopyWith<$Res> {
  factory $LoginCredentialsLoadedCopyWith(LoginCredentialsLoaded value, $Res Function(LoginCredentialsLoaded) _then) = _$LoginCredentialsLoadedCopyWithImpl;
@useResult
$Res call({
 String email, String password
});




}
/// @nodoc
class _$LoginCredentialsLoadedCopyWithImpl<$Res>
    implements $LoginCredentialsLoadedCopyWith<$Res> {
  _$LoginCredentialsLoadedCopyWithImpl(this._self, this._then);

  final LoginCredentialsLoaded _self;
  final $Res Function(LoginCredentialsLoaded) _then;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? email = null,Object? password = null,}) {
  return _then(LoginCredentialsLoaded(
null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
