// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'created_by_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CreatedByResponseModel {

 int? get id; String? get uid; String? get firstName; String? get lastName;
/// Create a copy of CreatedByResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreatedByResponseModelCopyWith<CreatedByResponseModel> get copyWith => _$CreatedByResponseModelCopyWithImpl<CreatedByResponseModel>(this as CreatedByResponseModel, _$identity);

  /// Serializes this CreatedByResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreatedByResponseModel&&(identical(other.id, id) || other.id == id)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,uid,firstName,lastName);

@override
String toString() {
  return 'CreatedByResponseModel(id: $id, uid: $uid, firstName: $firstName, lastName: $lastName)';
}


}

/// @nodoc
abstract mixin class $CreatedByResponseModelCopyWith<$Res>  {
  factory $CreatedByResponseModelCopyWith(CreatedByResponseModel value, $Res Function(CreatedByResponseModel) _then) = _$CreatedByResponseModelCopyWithImpl;
@useResult
$Res call({
 int? id, String? uid, String? firstName, String? lastName
});




}
/// @nodoc
class _$CreatedByResponseModelCopyWithImpl<$Res>
    implements $CreatedByResponseModelCopyWith<$Res> {
  _$CreatedByResponseModelCopyWithImpl(this._self, this._then);

  final CreatedByResponseModel _self;
  final $Res Function(CreatedByResponseModel) _then;

/// Create a copy of CreatedByResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? uid = freezed,Object? firstName = freezed,Object? lastName = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,uid: freezed == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String?,firstName: freezed == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String?,lastName: freezed == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CreatedByResponseModel].
extension CreatedByResponseModelPatterns on CreatedByResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreatedByResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreatedByResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreatedByResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _CreatedByResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreatedByResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _CreatedByResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  String? uid,  String? firstName,  String? lastName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreatedByResponseModel() when $default != null:
return $default(_that.id,_that.uid,_that.firstName,_that.lastName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  String? uid,  String? firstName,  String? lastName)  $default,) {final _that = this;
switch (_that) {
case _CreatedByResponseModel():
return $default(_that.id,_that.uid,_that.firstName,_that.lastName);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  String? uid,  String? firstName,  String? lastName)?  $default,) {final _that = this;
switch (_that) {
case _CreatedByResponseModel() when $default != null:
return $default(_that.id,_that.uid,_that.firstName,_that.lastName);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreatedByResponseModel implements CreatedByResponseModel {
  const _CreatedByResponseModel({this.id, this.uid, this.firstName, this.lastName});
  factory _CreatedByResponseModel.fromJson(Map<String, dynamic> json) => _$CreatedByResponseModelFromJson(json);

@override final  int? id;
@override final  String? uid;
@override final  String? firstName;
@override final  String? lastName;

/// Create a copy of CreatedByResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreatedByResponseModelCopyWith<_CreatedByResponseModel> get copyWith => __$CreatedByResponseModelCopyWithImpl<_CreatedByResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreatedByResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreatedByResponseModel&&(identical(other.id, id) || other.id == id)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,uid,firstName,lastName);

@override
String toString() {
  return 'CreatedByResponseModel(id: $id, uid: $uid, firstName: $firstName, lastName: $lastName)';
}


}

/// @nodoc
abstract mixin class _$CreatedByResponseModelCopyWith<$Res> implements $CreatedByResponseModelCopyWith<$Res> {
  factory _$CreatedByResponseModelCopyWith(_CreatedByResponseModel value, $Res Function(_CreatedByResponseModel) _then) = __$CreatedByResponseModelCopyWithImpl;
@override @useResult
$Res call({
 int? id, String? uid, String? firstName, String? lastName
});




}
/// @nodoc
class __$CreatedByResponseModelCopyWithImpl<$Res>
    implements _$CreatedByResponseModelCopyWith<$Res> {
  __$CreatedByResponseModelCopyWithImpl(this._self, this._then);

  final _CreatedByResponseModel _self;
  final $Res Function(_CreatedByResponseModel) _then;

/// Create a copy of CreatedByResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? uid = freezed,Object? firstName = freezed,Object? lastName = freezed,}) {
  return _then(_CreatedByResponseModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,uid: freezed == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String?,firstName: freezed == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String?,lastName: freezed == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
