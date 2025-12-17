// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'otp_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OtpResponseModel {

 String get message; String get sentTo; String get email;
/// Create a copy of OtpResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OtpResponseModelCopyWith<OtpResponseModel> get copyWith => _$OtpResponseModelCopyWithImpl<OtpResponseModel>(this as OtpResponseModel, _$identity);

  /// Serializes this OtpResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OtpResponseModel&&(identical(other.message, message) || other.message == message)&&(identical(other.sentTo, sentTo) || other.sentTo == sentTo)&&(identical(other.email, email) || other.email == email));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,message,sentTo,email);

@override
String toString() {
  return 'OtpResponseModel(message: $message, sentTo: $sentTo, email: $email)';
}


}

/// @nodoc
abstract mixin class $OtpResponseModelCopyWith<$Res>  {
  factory $OtpResponseModelCopyWith(OtpResponseModel value, $Res Function(OtpResponseModel) _then) = _$OtpResponseModelCopyWithImpl;
@useResult
$Res call({
 String message, String sentTo, String email
});




}
/// @nodoc
class _$OtpResponseModelCopyWithImpl<$Res>
    implements $OtpResponseModelCopyWith<$Res> {
  _$OtpResponseModelCopyWithImpl(this._self, this._then);

  final OtpResponseModel _self;
  final $Res Function(OtpResponseModel) _then;

/// Create a copy of OtpResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? message = null,Object? sentTo = null,Object? email = null,}) {
  return _then(_self.copyWith(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,sentTo: null == sentTo ? _self.sentTo : sentTo // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [OtpResponseModel].
extension OtpResponseModelPatterns on OtpResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OtpResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OtpResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OtpResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _OtpResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OtpResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _OtpResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String message,  String sentTo,  String email)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OtpResponseModel() when $default != null:
return $default(_that.message,_that.sentTo,_that.email);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String message,  String sentTo,  String email)  $default,) {final _that = this;
switch (_that) {
case _OtpResponseModel():
return $default(_that.message,_that.sentTo,_that.email);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String message,  String sentTo,  String email)?  $default,) {final _that = this;
switch (_that) {
case _OtpResponseModel() when $default != null:
return $default(_that.message,_that.sentTo,_that.email);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OtpResponseModel implements OtpResponseModel {
  const _OtpResponseModel({required this.message, required this.sentTo, required this.email});
  factory _OtpResponseModel.fromJson(Map<String, dynamic> json) => _$OtpResponseModelFromJson(json);

@override final  String message;
@override final  String sentTo;
@override final  String email;

/// Create a copy of OtpResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OtpResponseModelCopyWith<_OtpResponseModel> get copyWith => __$OtpResponseModelCopyWithImpl<_OtpResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OtpResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OtpResponseModel&&(identical(other.message, message) || other.message == message)&&(identical(other.sentTo, sentTo) || other.sentTo == sentTo)&&(identical(other.email, email) || other.email == email));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,message,sentTo,email);

@override
String toString() {
  return 'OtpResponseModel(message: $message, sentTo: $sentTo, email: $email)';
}


}

/// @nodoc
abstract mixin class _$OtpResponseModelCopyWith<$Res> implements $OtpResponseModelCopyWith<$Res> {
  factory _$OtpResponseModelCopyWith(_OtpResponseModel value, $Res Function(_OtpResponseModel) _then) = __$OtpResponseModelCopyWithImpl;
@override @useResult
$Res call({
 String message, String sentTo, String email
});




}
/// @nodoc
class __$OtpResponseModelCopyWithImpl<$Res>
    implements _$OtpResponseModelCopyWith<$Res> {
  __$OtpResponseModelCopyWithImpl(this._self, this._then);

  final _OtpResponseModel _self;
  final $Res Function(_OtpResponseModel) _then;

/// Create a copy of OtpResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,Object? sentTo = null,Object? email = null,}) {
  return _then(_OtpResponseModel(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,sentTo: null == sentTo ? _self.sentTo : sentTo // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
