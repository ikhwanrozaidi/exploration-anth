// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'company_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CompanyResponseModel {

 String get uid; String get name;
/// Create a copy of CompanyResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CompanyResponseModelCopyWith<CompanyResponseModel> get copyWith => _$CompanyResponseModelCopyWithImpl<CompanyResponseModel>(this as CompanyResponseModel, _$identity);

  /// Serializes this CompanyResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CompanyResponseModel&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,uid,name);

@override
String toString() {
  return 'CompanyResponseModel(uid: $uid, name: $name)';
}


}

/// @nodoc
abstract mixin class $CompanyResponseModelCopyWith<$Res>  {
  factory $CompanyResponseModelCopyWith(CompanyResponseModel value, $Res Function(CompanyResponseModel) _then) = _$CompanyResponseModelCopyWithImpl;
@useResult
$Res call({
 String uid, String name
});




}
/// @nodoc
class _$CompanyResponseModelCopyWithImpl<$Res>
    implements $CompanyResponseModelCopyWith<$Res> {
  _$CompanyResponseModelCopyWithImpl(this._self, this._then);

  final CompanyResponseModel _self;
  final $Res Function(CompanyResponseModel) _then;

/// Create a copy of CompanyResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? uid = null,Object? name = null,}) {
  return _then(_self.copyWith(
uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CompanyResponseModel].
extension CompanyResponseModelPatterns on CompanyResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CompanyResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CompanyResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CompanyResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _CompanyResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CompanyResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _CompanyResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String uid,  String name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CompanyResponseModel() when $default != null:
return $default(_that.uid,_that.name);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String uid,  String name)  $default,) {final _that = this;
switch (_that) {
case _CompanyResponseModel():
return $default(_that.uid,_that.name);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String uid,  String name)?  $default,) {final _that = this;
switch (_that) {
case _CompanyResponseModel() when $default != null:
return $default(_that.uid,_that.name);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CompanyResponseModel extends CompanyResponseModel {
  const _CompanyResponseModel({required this.uid, required this.name}): super._();
  factory _CompanyResponseModel.fromJson(Map<String, dynamic> json) => _$CompanyResponseModelFromJson(json);

@override final  String uid;
@override final  String name;

/// Create a copy of CompanyResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CompanyResponseModelCopyWith<_CompanyResponseModel> get copyWith => __$CompanyResponseModelCopyWithImpl<_CompanyResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CompanyResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CompanyResponseModel&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,uid,name);

@override
String toString() {
  return 'CompanyResponseModel(uid: $uid, name: $name)';
}


}

/// @nodoc
abstract mixin class _$CompanyResponseModelCopyWith<$Res> implements $CompanyResponseModelCopyWith<$Res> {
  factory _$CompanyResponseModelCopyWith(_CompanyResponseModel value, $Res Function(_CompanyResponseModel) _then) = __$CompanyResponseModelCopyWithImpl;
@override @useResult
$Res call({
 String uid, String name
});




}
/// @nodoc
class __$CompanyResponseModelCopyWithImpl<$Res>
    implements _$CompanyResponseModelCopyWith<$Res> {
  __$CompanyResponseModelCopyWithImpl(this._self, this._then);

  final _CompanyResponseModel _self;
  final $Res Function(_CompanyResponseModel) _then;

/// Create a copy of CompanyResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? uid = null,Object? name = null,}) {
  return _then(_CompanyResponseModel(
uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
