// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'work_scope_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WorkScopeResponseModel {

 String get uid; String get name; String get code;
/// Create a copy of WorkScopeResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WorkScopeResponseModelCopyWith<WorkScopeResponseModel> get copyWith => _$WorkScopeResponseModelCopyWithImpl<WorkScopeResponseModel>(this as WorkScopeResponseModel, _$identity);

  /// Serializes this WorkScopeResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WorkScopeResponseModel&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.name, name) || other.name == name)&&(identical(other.code, code) || other.code == code));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,uid,name,code);

@override
String toString() {
  return 'WorkScopeResponseModel(uid: $uid, name: $name, code: $code)';
}


}

/// @nodoc
abstract mixin class $WorkScopeResponseModelCopyWith<$Res>  {
  factory $WorkScopeResponseModelCopyWith(WorkScopeResponseModel value, $Res Function(WorkScopeResponseModel) _then) = _$WorkScopeResponseModelCopyWithImpl;
@useResult
$Res call({
 String uid, String name, String code
});




}
/// @nodoc
class _$WorkScopeResponseModelCopyWithImpl<$Res>
    implements $WorkScopeResponseModelCopyWith<$Res> {
  _$WorkScopeResponseModelCopyWithImpl(this._self, this._then);

  final WorkScopeResponseModel _self;
  final $Res Function(WorkScopeResponseModel) _then;

/// Create a copy of WorkScopeResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? uid = null,Object? name = null,Object? code = null,}) {
  return _then(_self.copyWith(
uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [WorkScopeResponseModel].
extension WorkScopeResponseModelPatterns on WorkScopeResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WorkScopeResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WorkScopeResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WorkScopeResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _WorkScopeResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WorkScopeResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _WorkScopeResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String uid,  String name,  String code)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WorkScopeResponseModel() when $default != null:
return $default(_that.uid,_that.name,_that.code);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String uid,  String name,  String code)  $default,) {final _that = this;
switch (_that) {
case _WorkScopeResponseModel():
return $default(_that.uid,_that.name,_that.code);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String uid,  String name,  String code)?  $default,) {final _that = this;
switch (_that) {
case _WorkScopeResponseModel() when $default != null:
return $default(_that.uid,_that.name,_that.code);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WorkScopeResponseModel extends WorkScopeResponseModel {
  const _WorkScopeResponseModel({required this.uid, required this.name, required this.code}): super._();
  factory _WorkScopeResponseModel.fromJson(Map<String, dynamic> json) => _$WorkScopeResponseModelFromJson(json);

@override final  String uid;
@override final  String name;
@override final  String code;

/// Create a copy of WorkScopeResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WorkScopeResponseModelCopyWith<_WorkScopeResponseModel> get copyWith => __$WorkScopeResponseModelCopyWithImpl<_WorkScopeResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WorkScopeResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WorkScopeResponseModel&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.name, name) || other.name == name)&&(identical(other.code, code) || other.code == code));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,uid,name,code);

@override
String toString() {
  return 'WorkScopeResponseModel(uid: $uid, name: $name, code: $code)';
}


}

/// @nodoc
abstract mixin class _$WorkScopeResponseModelCopyWith<$Res> implements $WorkScopeResponseModelCopyWith<$Res> {
  factory _$WorkScopeResponseModelCopyWith(_WorkScopeResponseModel value, $Res Function(_WorkScopeResponseModel) _then) = __$WorkScopeResponseModelCopyWithImpl;
@override @useResult
$Res call({
 String uid, String name, String code
});




}
/// @nodoc
class __$WorkScopeResponseModelCopyWithImpl<$Res>
    implements _$WorkScopeResponseModelCopyWith<$Res> {
  __$WorkScopeResponseModelCopyWithImpl(this._self, this._then);

  final _WorkScopeResponseModel _self;
  final $Res Function(_WorkScopeResponseModel) _then;

/// Create a copy of WorkScopeResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? uid = null,Object? name = null,Object? code = null,}) {
  return _then(_WorkScopeResponseModel(
uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
