// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'work_scope_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WorkScopeModel {

 String get name; String get code; String get uid;
/// Create a copy of WorkScopeModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WorkScopeModelCopyWith<WorkScopeModel> get copyWith => _$WorkScopeModelCopyWithImpl<WorkScopeModel>(this as WorkScopeModel, _$identity);

  /// Serializes this WorkScopeModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WorkScopeModel&&(identical(other.name, name) || other.name == name)&&(identical(other.code, code) || other.code == code)&&(identical(other.uid, uid) || other.uid == uid));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,code,uid);

@override
String toString() {
  return 'WorkScopeModel(name: $name, code: $code, uid: $uid)';
}


}

/// @nodoc
abstract mixin class $WorkScopeModelCopyWith<$Res>  {
  factory $WorkScopeModelCopyWith(WorkScopeModel value, $Res Function(WorkScopeModel) _then) = _$WorkScopeModelCopyWithImpl;
@useResult
$Res call({
 String name, String code, String uid
});




}
/// @nodoc
class _$WorkScopeModelCopyWithImpl<$Res>
    implements $WorkScopeModelCopyWith<$Res> {
  _$WorkScopeModelCopyWithImpl(this._self, this._then);

  final WorkScopeModel _self;
  final $Res Function(WorkScopeModel) _then;

/// Create a copy of WorkScopeModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? code = null,Object? uid = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [WorkScopeModel].
extension WorkScopeModelPatterns on WorkScopeModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WorkScopeModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WorkScopeModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WorkScopeModel value)  $default,){
final _that = this;
switch (_that) {
case _WorkScopeModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WorkScopeModel value)?  $default,){
final _that = this;
switch (_that) {
case _WorkScopeModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String code,  String uid)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WorkScopeModel() when $default != null:
return $default(_that.name,_that.code,_that.uid);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String code,  String uid)  $default,) {final _that = this;
switch (_that) {
case _WorkScopeModel():
return $default(_that.name,_that.code,_that.uid);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String code,  String uid)?  $default,) {final _that = this;
switch (_that) {
case _WorkScopeModel() when $default != null:
return $default(_that.name,_that.code,_that.uid);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WorkScopeModel extends WorkScopeModel {
  const _WorkScopeModel({required this.name, required this.code, required this.uid}): super._();
  factory _WorkScopeModel.fromJson(Map<String, dynamic> json) => _$WorkScopeModelFromJson(json);

@override final  String name;
@override final  String code;
@override final  String uid;

/// Create a copy of WorkScopeModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WorkScopeModelCopyWith<_WorkScopeModel> get copyWith => __$WorkScopeModelCopyWithImpl<_WorkScopeModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WorkScopeModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WorkScopeModel&&(identical(other.name, name) || other.name == name)&&(identical(other.code, code) || other.code == code)&&(identical(other.uid, uid) || other.uid == uid));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,code,uid);

@override
String toString() {
  return 'WorkScopeModel(name: $name, code: $code, uid: $uid)';
}


}

/// @nodoc
abstract mixin class _$WorkScopeModelCopyWith<$Res> implements $WorkScopeModelCopyWith<$Res> {
  factory _$WorkScopeModelCopyWith(_WorkScopeModel value, $Res Function(_WorkScopeModel) _then) = __$WorkScopeModelCopyWithImpl;
@override @useResult
$Res call({
 String name, String code, String uid
});




}
/// @nodoc
class __$WorkScopeModelCopyWithImpl<$Res>
    implements _$WorkScopeModelCopyWith<$Res> {
  __$WorkScopeModelCopyWithImpl(this._self, this._then);

  final _WorkScopeModel _self;
  final $Res Function(_WorkScopeModel) _then;

/// Create a copy of WorkScopeModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? code = null,Object? uid = null,}) {
  return _then(_WorkScopeModel(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
