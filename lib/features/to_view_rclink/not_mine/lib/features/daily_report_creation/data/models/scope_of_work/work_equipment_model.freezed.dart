// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'work_equipment_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WorkEquipmentModel {

 int get id; String get uid; String get name; String get code;
/// Create a copy of WorkEquipmentModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WorkEquipmentModelCopyWith<WorkEquipmentModel> get copyWith => _$WorkEquipmentModelCopyWithImpl<WorkEquipmentModel>(this as WorkEquipmentModel, _$identity);

  /// Serializes this WorkEquipmentModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WorkEquipmentModel&&(identical(other.id, id) || other.id == id)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.name, name) || other.name == name)&&(identical(other.code, code) || other.code == code));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,uid,name,code);

@override
String toString() {
  return 'WorkEquipmentModel(id: $id, uid: $uid, name: $name, code: $code)';
}


}

/// @nodoc
abstract mixin class $WorkEquipmentModelCopyWith<$Res>  {
  factory $WorkEquipmentModelCopyWith(WorkEquipmentModel value, $Res Function(WorkEquipmentModel) _then) = _$WorkEquipmentModelCopyWithImpl;
@useResult
$Res call({
 int id, String uid, String name, String code
});




}
/// @nodoc
class _$WorkEquipmentModelCopyWithImpl<$Res>
    implements $WorkEquipmentModelCopyWith<$Res> {
  _$WorkEquipmentModelCopyWithImpl(this._self, this._then);

  final WorkEquipmentModel _self;
  final $Res Function(WorkEquipmentModel) _then;

/// Create a copy of WorkEquipmentModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? uid = null,Object? name = null,Object? code = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [WorkEquipmentModel].
extension WorkEquipmentModelPatterns on WorkEquipmentModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WorkEquipmentModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WorkEquipmentModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WorkEquipmentModel value)  $default,){
final _that = this;
switch (_that) {
case _WorkEquipmentModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WorkEquipmentModel value)?  $default,){
final _that = this;
switch (_that) {
case _WorkEquipmentModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String uid,  String name,  String code)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WorkEquipmentModel() when $default != null:
return $default(_that.id,_that.uid,_that.name,_that.code);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String uid,  String name,  String code)  $default,) {final _that = this;
switch (_that) {
case _WorkEquipmentModel():
return $default(_that.id,_that.uid,_that.name,_that.code);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String uid,  String name,  String code)?  $default,) {final _that = this;
switch (_that) {
case _WorkEquipmentModel() when $default != null:
return $default(_that.id,_that.uid,_that.name,_that.code);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WorkEquipmentModel extends WorkEquipmentModel {
  const _WorkEquipmentModel({required this.id, required this.uid, required this.name, required this.code}): super._();
  factory _WorkEquipmentModel.fromJson(Map<String, dynamic> json) => _$WorkEquipmentModelFromJson(json);

@override final  int id;
@override final  String uid;
@override final  String name;
@override final  String code;

/// Create a copy of WorkEquipmentModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WorkEquipmentModelCopyWith<_WorkEquipmentModel> get copyWith => __$WorkEquipmentModelCopyWithImpl<_WorkEquipmentModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WorkEquipmentModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WorkEquipmentModel&&(identical(other.id, id) || other.id == id)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.name, name) || other.name == name)&&(identical(other.code, code) || other.code == code));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,uid,name,code);

@override
String toString() {
  return 'WorkEquipmentModel(id: $id, uid: $uid, name: $name, code: $code)';
}


}

/// @nodoc
abstract mixin class _$WorkEquipmentModelCopyWith<$Res> implements $WorkEquipmentModelCopyWith<$Res> {
  factory _$WorkEquipmentModelCopyWith(_WorkEquipmentModel value, $Res Function(_WorkEquipmentModel) _then) = __$WorkEquipmentModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String uid, String name, String code
});




}
/// @nodoc
class __$WorkEquipmentModelCopyWithImpl<$Res>
    implements _$WorkEquipmentModelCopyWith<$Res> {
  __$WorkEquipmentModelCopyWithImpl(this._self, this._then);

  final _WorkEquipmentModel _self;
  final $Res Function(_WorkEquipmentModel) _then;

/// Create a copy of WorkEquipmentModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? uid = null,Object? name = null,Object? code = null,}) {
  return _then(_WorkEquipmentModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
