// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'created_by_nested_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CreatedByNestedModel {

 int? get id; String? get uid; String? get firstName; String? get lastName; String? get phone; String? get email;
/// Create a copy of CreatedByNestedModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreatedByNestedModelCopyWith<CreatedByNestedModel> get copyWith => _$CreatedByNestedModelCopyWithImpl<CreatedByNestedModel>(this as CreatedByNestedModel, _$identity);

  /// Serializes this CreatedByNestedModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreatedByNestedModel&&(identical(other.id, id) || other.id == id)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.email, email) || other.email == email));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,uid,firstName,lastName,phone,email);

@override
String toString() {
  return 'CreatedByNestedModel(id: $id, uid: $uid, firstName: $firstName, lastName: $lastName, phone: $phone, email: $email)';
}


}

/// @nodoc
abstract mixin class $CreatedByNestedModelCopyWith<$Res>  {
  factory $CreatedByNestedModelCopyWith(CreatedByNestedModel value, $Res Function(CreatedByNestedModel) _then) = _$CreatedByNestedModelCopyWithImpl;
@useResult
$Res call({
 int? id, String? uid, String? firstName, String? lastName, String? phone, String? email
});




}
/// @nodoc
class _$CreatedByNestedModelCopyWithImpl<$Res>
    implements $CreatedByNestedModelCopyWith<$Res> {
  _$CreatedByNestedModelCopyWithImpl(this._self, this._then);

  final CreatedByNestedModel _self;
  final $Res Function(CreatedByNestedModel) _then;

/// Create a copy of CreatedByNestedModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? uid = freezed,Object? firstName = freezed,Object? lastName = freezed,Object? phone = freezed,Object? email = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,uid: freezed == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String?,firstName: freezed == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String?,lastName: freezed == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CreatedByNestedModel].
extension CreatedByNestedModelPatterns on CreatedByNestedModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreatedByNestedModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreatedByNestedModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreatedByNestedModel value)  $default,){
final _that = this;
switch (_that) {
case _CreatedByNestedModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreatedByNestedModel value)?  $default,){
final _that = this;
switch (_that) {
case _CreatedByNestedModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  String? uid,  String? firstName,  String? lastName,  String? phone,  String? email)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreatedByNestedModel() when $default != null:
return $default(_that.id,_that.uid,_that.firstName,_that.lastName,_that.phone,_that.email);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  String? uid,  String? firstName,  String? lastName,  String? phone,  String? email)  $default,) {final _that = this;
switch (_that) {
case _CreatedByNestedModel():
return $default(_that.id,_that.uid,_that.firstName,_that.lastName,_that.phone,_that.email);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  String? uid,  String? firstName,  String? lastName,  String? phone,  String? email)?  $default,) {final _that = this;
switch (_that) {
case _CreatedByNestedModel() when $default != null:
return $default(_that.id,_that.uid,_that.firstName,_that.lastName,_that.phone,_that.email);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreatedByNestedModel implements CreatedByNestedModel {
  const _CreatedByNestedModel({this.id, this.uid, this.firstName, this.lastName, this.phone, this.email});
  factory _CreatedByNestedModel.fromJson(Map<String, dynamic> json) => _$CreatedByNestedModelFromJson(json);

@override final  int? id;
@override final  String? uid;
@override final  String? firstName;
@override final  String? lastName;
@override final  String? phone;
@override final  String? email;

/// Create a copy of CreatedByNestedModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreatedByNestedModelCopyWith<_CreatedByNestedModel> get copyWith => __$CreatedByNestedModelCopyWithImpl<_CreatedByNestedModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreatedByNestedModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreatedByNestedModel&&(identical(other.id, id) || other.id == id)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.email, email) || other.email == email));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,uid,firstName,lastName,phone,email);

@override
String toString() {
  return 'CreatedByNestedModel(id: $id, uid: $uid, firstName: $firstName, lastName: $lastName, phone: $phone, email: $email)';
}


}

/// @nodoc
abstract mixin class _$CreatedByNestedModelCopyWith<$Res> implements $CreatedByNestedModelCopyWith<$Res> {
  factory _$CreatedByNestedModelCopyWith(_CreatedByNestedModel value, $Res Function(_CreatedByNestedModel) _then) = __$CreatedByNestedModelCopyWithImpl;
@override @useResult
$Res call({
 int? id, String? uid, String? firstName, String? lastName, String? phone, String? email
});




}
/// @nodoc
class __$CreatedByNestedModelCopyWithImpl<$Res>
    implements _$CreatedByNestedModelCopyWith<$Res> {
  __$CreatedByNestedModelCopyWithImpl(this._self, this._then);

  final _CreatedByNestedModel _self;
  final $Res Function(_CreatedByNestedModel) _then;

/// Create a copy of CreatedByNestedModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? uid = freezed,Object? firstName = freezed,Object? lastName = freezed,Object? phone = freezed,Object? email = freezed,}) {
  return _then(_CreatedByNestedModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,uid: freezed == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String?,firstName: freezed == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String?,lastName: freezed == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
