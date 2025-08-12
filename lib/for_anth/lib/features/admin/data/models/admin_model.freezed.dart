// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'admin_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AdminModel {

 int get id; String get uid; String get phone; String? get firstName; String? get lastName; String? get email; DateTime get updatedAt; DateTime get createdAt;
/// Create a copy of AdminModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AdminModelCopyWith<AdminModel> get copyWith => _$AdminModelCopyWithImpl<AdminModel>(this as AdminModel, _$identity);

  /// Serializes this AdminModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AdminModel&&(identical(other.id, id) || other.id == id)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.email, email) || other.email == email)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,uid,phone,firstName,lastName,email,updatedAt,createdAt);

@override
String toString() {
  return 'AdminModel(id: $id, uid: $uid, phone: $phone, firstName: $firstName, lastName: $lastName, email: $email, updatedAt: $updatedAt, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $AdminModelCopyWith<$Res>  {
  factory $AdminModelCopyWith(AdminModel value, $Res Function(AdminModel) _then) = _$AdminModelCopyWithImpl;
@useResult
$Res call({
 int id, String uid, String phone, String? firstName, String? lastName, String? email, DateTime updatedAt, DateTime createdAt
});




}
/// @nodoc
class _$AdminModelCopyWithImpl<$Res>
    implements $AdminModelCopyWith<$Res> {
  _$AdminModelCopyWithImpl(this._self, this._then);

  final AdminModel _self;
  final $Res Function(AdminModel) _then;

/// Create a copy of AdminModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? uid = null,Object? phone = null,Object? firstName = freezed,Object? lastName = freezed,Object? email = freezed,Object? updatedAt = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,firstName: freezed == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String?,lastName: freezed == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [AdminModel].
extension AdminModelPatterns on AdminModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AdminModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AdminModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AdminModel value)  $default,){
final _that = this;
switch (_that) {
case _AdminModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AdminModel value)?  $default,){
final _that = this;
switch (_that) {
case _AdminModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String uid,  String phone,  String? firstName,  String? lastName,  String? email,  DateTime updatedAt,  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AdminModel() when $default != null:
return $default(_that.id,_that.uid,_that.phone,_that.firstName,_that.lastName,_that.email,_that.updatedAt,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String uid,  String phone,  String? firstName,  String? lastName,  String? email,  DateTime updatedAt,  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _AdminModel():
return $default(_that.id,_that.uid,_that.phone,_that.firstName,_that.lastName,_that.email,_that.updatedAt,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String uid,  String phone,  String? firstName,  String? lastName,  String? email,  DateTime updatedAt,  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _AdminModel() when $default != null:
return $default(_that.id,_that.uid,_that.phone,_that.firstName,_that.lastName,_that.email,_that.updatedAt,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AdminModel implements AdminModel {
  const _AdminModel({required this.id, required this.uid, required this.phone, this.firstName, this.lastName, this.email, required this.updatedAt, required this.createdAt});
  factory _AdminModel.fromJson(Map<String, dynamic> json) => _$AdminModelFromJson(json);

@override final  int id;
@override final  String uid;
@override final  String phone;
@override final  String? firstName;
@override final  String? lastName;
@override final  String? email;
@override final  DateTime updatedAt;
@override final  DateTime createdAt;

/// Create a copy of AdminModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AdminModelCopyWith<_AdminModel> get copyWith => __$AdminModelCopyWithImpl<_AdminModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AdminModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AdminModel&&(identical(other.id, id) || other.id == id)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.email, email) || other.email == email)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,uid,phone,firstName,lastName,email,updatedAt,createdAt);

@override
String toString() {
  return 'AdminModel(id: $id, uid: $uid, phone: $phone, firstName: $firstName, lastName: $lastName, email: $email, updatedAt: $updatedAt, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$AdminModelCopyWith<$Res> implements $AdminModelCopyWith<$Res> {
  factory _$AdminModelCopyWith(_AdminModel value, $Res Function(_AdminModel) _then) = __$AdminModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String uid, String phone, String? firstName, String? lastName, String? email, DateTime updatedAt, DateTime createdAt
});




}
/// @nodoc
class __$AdminModelCopyWithImpl<$Res>
    implements _$AdminModelCopyWith<$Res> {
  __$AdminModelCopyWithImpl(this._self, this._then);

  final _AdminModel _self;
  final $Res Function(_AdminModel) _then;

/// Create a copy of AdminModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? uid = null,Object? phone = null,Object? firstName = freezed,Object? lastName = freezed,Object? email = freezed,Object? updatedAt = null,Object? createdAt = null,}) {
  return _then(_AdminModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,firstName: freezed == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String?,lastName: freezed == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
