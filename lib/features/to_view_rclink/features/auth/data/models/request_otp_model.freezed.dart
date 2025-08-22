// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'request_otp_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RequestOtpModel {

 String get phone;
/// Create a copy of RequestOtpModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RequestOtpModelCopyWith<RequestOtpModel> get copyWith => _$RequestOtpModelCopyWithImpl<RequestOtpModel>(this as RequestOtpModel, _$identity);

  /// Serializes this RequestOtpModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RequestOtpModel&&(identical(other.phone, phone) || other.phone == phone));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,phone);

@override
String toString() {
  return 'RequestOtpModel(phone: $phone)';
}


}

/// @nodoc
abstract mixin class $RequestOtpModelCopyWith<$Res>  {
  factory $RequestOtpModelCopyWith(RequestOtpModel value, $Res Function(RequestOtpModel) _then) = _$RequestOtpModelCopyWithImpl;
@useResult
$Res call({
 String phone
});




}
/// @nodoc
class _$RequestOtpModelCopyWithImpl<$Res>
    implements $RequestOtpModelCopyWith<$Res> {
  _$RequestOtpModelCopyWithImpl(this._self, this._then);

  final RequestOtpModel _self;
  final $Res Function(RequestOtpModel) _then;

/// Create a copy of RequestOtpModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? phone = null,}) {
  return _then(_self.copyWith(
phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [RequestOtpModel].
extension RequestOtpModelPatterns on RequestOtpModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RequestOtpModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RequestOtpModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RequestOtpModel value)  $default,){
final _that = this;
switch (_that) {
case _RequestOtpModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RequestOtpModel value)?  $default,){
final _that = this;
switch (_that) {
case _RequestOtpModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String phone)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RequestOtpModel() when $default != null:
return $default(_that.phone);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String phone)  $default,) {final _that = this;
switch (_that) {
case _RequestOtpModel():
return $default(_that.phone);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String phone)?  $default,) {final _that = this;
switch (_that) {
case _RequestOtpModel() when $default != null:
return $default(_that.phone);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RequestOtpModel implements RequestOtpModel {
  const _RequestOtpModel({required this.phone});
  factory _RequestOtpModel.fromJson(Map<String, dynamic> json) => _$RequestOtpModelFromJson(json);

@override final  String phone;

/// Create a copy of RequestOtpModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RequestOtpModelCopyWith<_RequestOtpModel> get copyWith => __$RequestOtpModelCopyWithImpl<_RequestOtpModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RequestOtpModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RequestOtpModel&&(identical(other.phone, phone) || other.phone == phone));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,phone);

@override
String toString() {
  return 'RequestOtpModel(phone: $phone)';
}


}

/// @nodoc
abstract mixin class _$RequestOtpModelCopyWith<$Res> implements $RequestOtpModelCopyWith<$Res> {
  factory _$RequestOtpModelCopyWith(_RequestOtpModel value, $Res Function(_RequestOtpModel) _then) = __$RequestOtpModelCopyWithImpl;
@override @useResult
$Res call({
 String phone
});




}
/// @nodoc
class __$RequestOtpModelCopyWithImpl<$Res>
    implements _$RequestOtpModelCopyWith<$Res> {
  __$RequestOtpModelCopyWithImpl(this._self, this._then);

  final _RequestOtpModel _self;
  final $Res Function(_RequestOtpModel) _then;

/// Create a copy of RequestOtpModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? phone = null,}) {
  return _then(_RequestOtpModel(
phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
