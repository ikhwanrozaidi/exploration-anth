// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'daily_report_equipment_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DailyReportEquipmentModel {

 String get name; String get uid;
/// Create a copy of DailyReportEquipmentModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DailyReportEquipmentModelCopyWith<DailyReportEquipmentModel> get copyWith => _$DailyReportEquipmentModelCopyWithImpl<DailyReportEquipmentModel>(this as DailyReportEquipmentModel, _$identity);

  /// Serializes this DailyReportEquipmentModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DailyReportEquipmentModel&&(identical(other.name, name) || other.name == name)&&(identical(other.uid, uid) || other.uid == uid));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,uid);

@override
String toString() {
  return 'DailyReportEquipmentModel(name: $name, uid: $uid)';
}


}

/// @nodoc
abstract mixin class $DailyReportEquipmentModelCopyWith<$Res>  {
  factory $DailyReportEquipmentModelCopyWith(DailyReportEquipmentModel value, $Res Function(DailyReportEquipmentModel) _then) = _$DailyReportEquipmentModelCopyWithImpl;
@useResult
$Res call({
 String name, String uid
});




}
/// @nodoc
class _$DailyReportEquipmentModelCopyWithImpl<$Res>
    implements $DailyReportEquipmentModelCopyWith<$Res> {
  _$DailyReportEquipmentModelCopyWithImpl(this._self, this._then);

  final DailyReportEquipmentModel _self;
  final $Res Function(DailyReportEquipmentModel) _then;

/// Create a copy of DailyReportEquipmentModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? uid = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [DailyReportEquipmentModel].
extension DailyReportEquipmentModelPatterns on DailyReportEquipmentModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DailyReportEquipmentModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DailyReportEquipmentModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DailyReportEquipmentModel value)  $default,){
final _that = this;
switch (_that) {
case _DailyReportEquipmentModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DailyReportEquipmentModel value)?  $default,){
final _that = this;
switch (_that) {
case _DailyReportEquipmentModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String uid)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DailyReportEquipmentModel() when $default != null:
return $default(_that.name,_that.uid);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String uid)  $default,) {final _that = this;
switch (_that) {
case _DailyReportEquipmentModel():
return $default(_that.name,_that.uid);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String uid)?  $default,) {final _that = this;
switch (_that) {
case _DailyReportEquipmentModel() when $default != null:
return $default(_that.name,_that.uid);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DailyReportEquipmentModel extends DailyReportEquipmentModel {
  const _DailyReportEquipmentModel({required this.name, required this.uid}): super._();
  factory _DailyReportEquipmentModel.fromJson(Map<String, dynamic> json) => _$DailyReportEquipmentModelFromJson(json);

@override final  String name;
@override final  String uid;

/// Create a copy of DailyReportEquipmentModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DailyReportEquipmentModelCopyWith<_DailyReportEquipmentModel> get copyWith => __$DailyReportEquipmentModelCopyWithImpl<_DailyReportEquipmentModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DailyReportEquipmentModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DailyReportEquipmentModel&&(identical(other.name, name) || other.name == name)&&(identical(other.uid, uid) || other.uid == uid));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,uid);

@override
String toString() {
  return 'DailyReportEquipmentModel(name: $name, uid: $uid)';
}


}

/// @nodoc
abstract mixin class _$DailyReportEquipmentModelCopyWith<$Res> implements $DailyReportEquipmentModelCopyWith<$Res> {
  factory _$DailyReportEquipmentModelCopyWith(_DailyReportEquipmentModel value, $Res Function(_DailyReportEquipmentModel) _then) = __$DailyReportEquipmentModelCopyWithImpl;
@override @useResult
$Res call({
 String name, String uid
});




}
/// @nodoc
class __$DailyReportEquipmentModelCopyWithImpl<$Res>
    implements _$DailyReportEquipmentModelCopyWith<$Res> {
  __$DailyReportEquipmentModelCopyWithImpl(this._self, this._then);

  final _DailyReportEquipmentModel _self;
  final $Res Function(_DailyReportEquipmentModel) _then;

/// Create a copy of DailyReportEquipmentModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? uid = null,}) {
  return _then(_DailyReportEquipmentModel(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
