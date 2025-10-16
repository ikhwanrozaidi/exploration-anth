// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuthState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthState()';
}


}

/// @nodoc
class $AuthStateCopyWith<$Res>  {
$AuthStateCopyWith(AuthState _, $Res Function(AuthState) __);
}


/// Adds pattern-matching-related methods to [AuthState].
extension AuthStatePatterns on AuthState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( AuthInitial value)?  initial,TResult Function( AuthLoading value)?  loading,TResult Function( AuthOtpSent value)?  otpSent,TResult Function( Authenticated value)?  authenticated,TResult Function( AuthSessionExpiring value)?  sessionExpiring,TResult Function( Unauthenticated value)?  unauthenticated,TResult Function( AuthFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case AuthInitial() when initial != null:
return initial(_that);case AuthLoading() when loading != null:
return loading(_that);case AuthOtpSent() when otpSent != null:
return otpSent(_that);case Authenticated() when authenticated != null:
return authenticated(_that);case AuthSessionExpiring() when sessionExpiring != null:
return sessionExpiring(_that);case Unauthenticated() when unauthenticated != null:
return unauthenticated(_that);case AuthFailure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( AuthInitial value)  initial,required TResult Function( AuthLoading value)  loading,required TResult Function( AuthOtpSent value)  otpSent,required TResult Function( Authenticated value)  authenticated,required TResult Function( AuthSessionExpiring value)  sessionExpiring,required TResult Function( Unauthenticated value)  unauthenticated,required TResult Function( AuthFailure value)  failure,}){
final _that = this;
switch (_that) {
case AuthInitial():
return initial(_that);case AuthLoading():
return loading(_that);case AuthOtpSent():
return otpSent(_that);case Authenticated():
return authenticated(_that);case AuthSessionExpiring():
return sessionExpiring(_that);case Unauthenticated():
return unauthenticated(_that);case AuthFailure():
return failure(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( AuthInitial value)?  initial,TResult? Function( AuthLoading value)?  loading,TResult? Function( AuthOtpSent value)?  otpSent,TResult? Function( Authenticated value)?  authenticated,TResult? Function( AuthSessionExpiring value)?  sessionExpiring,TResult? Function( Unauthenticated value)?  unauthenticated,TResult? Function( AuthFailure value)?  failure,}){
final _that = this;
switch (_that) {
case AuthInitial() when initial != null:
return initial(_that);case AuthLoading() when loading != null:
return loading(_that);case AuthOtpSent() when otpSent != null:
return otpSent(_that);case Authenticated() when authenticated != null:
return authenticated(_that);case AuthSessionExpiring() when sessionExpiring != null:
return sessionExpiring(_that);case Unauthenticated() when unauthenticated != null:
return unauthenticated(_that);case AuthFailure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( OtpResponse data)?  otpSent,TResult Function( Tokens tokens,  Admin? currentAdmin)?  authenticated,TResult Function( Duration timeLeft)?  sessionExpiring,TResult Function( String? reason)?  unauthenticated,TResult Function( String message)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case AuthInitial() when initial != null:
return initial();case AuthLoading() when loading != null:
return loading();case AuthOtpSent() when otpSent != null:
return otpSent(_that.data);case Authenticated() when authenticated != null:
return authenticated(_that.tokens,_that.currentAdmin);case AuthSessionExpiring() when sessionExpiring != null:
return sessionExpiring(_that.timeLeft);case Unauthenticated() when unauthenticated != null:
return unauthenticated(_that.reason);case AuthFailure() when failure != null:
return failure(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( OtpResponse data)  otpSent,required TResult Function( Tokens tokens,  Admin? currentAdmin)  authenticated,required TResult Function( Duration timeLeft)  sessionExpiring,required TResult Function( String? reason)  unauthenticated,required TResult Function( String message)  failure,}) {final _that = this;
switch (_that) {
case AuthInitial():
return initial();case AuthLoading():
return loading();case AuthOtpSent():
return otpSent(_that.data);case Authenticated():
return authenticated(_that.tokens,_that.currentAdmin);case AuthSessionExpiring():
return sessionExpiring(_that.timeLeft);case Unauthenticated():
return unauthenticated(_that.reason);case AuthFailure():
return failure(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( OtpResponse data)?  otpSent,TResult? Function( Tokens tokens,  Admin? currentAdmin)?  authenticated,TResult? Function( Duration timeLeft)?  sessionExpiring,TResult? Function( String? reason)?  unauthenticated,TResult? Function( String message)?  failure,}) {final _that = this;
switch (_that) {
case AuthInitial() when initial != null:
return initial();case AuthLoading() when loading != null:
return loading();case AuthOtpSent() when otpSent != null:
return otpSent(_that.data);case Authenticated() when authenticated != null:
return authenticated(_that.tokens,_that.currentAdmin);case AuthSessionExpiring() when sessionExpiring != null:
return sessionExpiring(_that.timeLeft);case Unauthenticated() when unauthenticated != null:
return unauthenticated(_that.reason);case AuthFailure() when failure != null:
return failure(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class AuthInitial implements AuthState {
  const AuthInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthState.initial()';
}


}




/// @nodoc


class AuthLoading implements AuthState {
  const AuthLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthState.loading()';
}


}




/// @nodoc


class AuthOtpSent implements AuthState {
  const AuthOtpSent(this.data);
  

 final  OtpResponse data;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthOtpSentCopyWith<AuthOtpSent> get copyWith => _$AuthOtpSentCopyWithImpl<AuthOtpSent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthOtpSent&&(identical(other.data, data) || other.data == data));
}


@override
int get hashCode => Object.hash(runtimeType,data);

@override
String toString() {
  return 'AuthState.otpSent(data: $data)';
}


}

/// @nodoc
abstract mixin class $AuthOtpSentCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory $AuthOtpSentCopyWith(AuthOtpSent value, $Res Function(AuthOtpSent) _then) = _$AuthOtpSentCopyWithImpl;
@useResult
$Res call({
 OtpResponse data
});




}
/// @nodoc
class _$AuthOtpSentCopyWithImpl<$Res>
    implements $AuthOtpSentCopyWith<$Res> {
  _$AuthOtpSentCopyWithImpl(this._self, this._then);

  final AuthOtpSent _self;
  final $Res Function(AuthOtpSent) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(AuthOtpSent(
null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as OtpResponse,
  ));
}


}

/// @nodoc


class Authenticated implements AuthState {
  const Authenticated(this.tokens, {this.currentAdmin});
  

 final  Tokens tokens;
 final  Admin? currentAdmin;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthenticatedCopyWith<Authenticated> get copyWith => _$AuthenticatedCopyWithImpl<Authenticated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Authenticated&&(identical(other.tokens, tokens) || other.tokens == tokens)&&(identical(other.currentAdmin, currentAdmin) || other.currentAdmin == currentAdmin));
}


@override
int get hashCode => Object.hash(runtimeType,tokens,currentAdmin);

@override
String toString() {
  return 'AuthState.authenticated(tokens: $tokens, currentAdmin: $currentAdmin)';
}


}

/// @nodoc
abstract mixin class $AuthenticatedCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory $AuthenticatedCopyWith(Authenticated value, $Res Function(Authenticated) _then) = _$AuthenticatedCopyWithImpl;
@useResult
$Res call({
 Tokens tokens, Admin? currentAdmin
});




}
/// @nodoc
class _$AuthenticatedCopyWithImpl<$Res>
    implements $AuthenticatedCopyWith<$Res> {
  _$AuthenticatedCopyWithImpl(this._self, this._then);

  final Authenticated _self;
  final $Res Function(Authenticated) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? tokens = null,Object? currentAdmin = freezed,}) {
  return _then(Authenticated(
null == tokens ? _self.tokens : tokens // ignore: cast_nullable_to_non_nullable
as Tokens,currentAdmin: freezed == currentAdmin ? _self.currentAdmin : currentAdmin // ignore: cast_nullable_to_non_nullable
as Admin?,
  ));
}


}

/// @nodoc


class AuthSessionExpiring implements AuthState {
  const AuthSessionExpiring(this.timeLeft);
  

 final  Duration timeLeft;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthSessionExpiringCopyWith<AuthSessionExpiring> get copyWith => _$AuthSessionExpiringCopyWithImpl<AuthSessionExpiring>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthSessionExpiring&&(identical(other.timeLeft, timeLeft) || other.timeLeft == timeLeft));
}


@override
int get hashCode => Object.hash(runtimeType,timeLeft);

@override
String toString() {
  return 'AuthState.sessionExpiring(timeLeft: $timeLeft)';
}


}

/// @nodoc
abstract mixin class $AuthSessionExpiringCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory $AuthSessionExpiringCopyWith(AuthSessionExpiring value, $Res Function(AuthSessionExpiring) _then) = _$AuthSessionExpiringCopyWithImpl;
@useResult
$Res call({
 Duration timeLeft
});




}
/// @nodoc
class _$AuthSessionExpiringCopyWithImpl<$Res>
    implements $AuthSessionExpiringCopyWith<$Res> {
  _$AuthSessionExpiringCopyWithImpl(this._self, this._then);

  final AuthSessionExpiring _self;
  final $Res Function(AuthSessionExpiring) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? timeLeft = null,}) {
  return _then(AuthSessionExpiring(
null == timeLeft ? _self.timeLeft : timeLeft // ignore: cast_nullable_to_non_nullable
as Duration,
  ));
}


}

/// @nodoc


class Unauthenticated implements AuthState {
  const Unauthenticated({this.reason});
  

 final  String? reason;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UnauthenticatedCopyWith<Unauthenticated> get copyWith => _$UnauthenticatedCopyWithImpl<Unauthenticated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Unauthenticated&&(identical(other.reason, reason) || other.reason == reason));
}


@override
int get hashCode => Object.hash(runtimeType,reason);

@override
String toString() {
  return 'AuthState.unauthenticated(reason: $reason)';
}


}

/// @nodoc
abstract mixin class $UnauthenticatedCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory $UnauthenticatedCopyWith(Unauthenticated value, $Res Function(Unauthenticated) _then) = _$UnauthenticatedCopyWithImpl;
@useResult
$Res call({
 String? reason
});




}
/// @nodoc
class _$UnauthenticatedCopyWithImpl<$Res>
    implements $UnauthenticatedCopyWith<$Res> {
  _$UnauthenticatedCopyWithImpl(this._self, this._then);

  final Unauthenticated _self;
  final $Res Function(Unauthenticated) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? reason = freezed,}) {
  return _then(Unauthenticated(
reason: freezed == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class AuthFailure implements AuthState {
  const AuthFailure(this.message);
  

 final  String message;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthFailureCopyWith<AuthFailure> get copyWith => _$AuthFailureCopyWithImpl<AuthFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'AuthState.failure(message: $message)';
}


}

/// @nodoc
abstract mixin class $AuthFailureCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory $AuthFailureCopyWith(AuthFailure value, $Res Function(AuthFailure) _then) = _$AuthFailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$AuthFailureCopyWithImpl<$Res>
    implements $AuthFailureCopyWith<$Res> {
  _$AuthFailureCopyWithImpl(this._self, this._then);

  final AuthFailure _self;
  final $Res Function(AuthFailure) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(AuthFailure(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
