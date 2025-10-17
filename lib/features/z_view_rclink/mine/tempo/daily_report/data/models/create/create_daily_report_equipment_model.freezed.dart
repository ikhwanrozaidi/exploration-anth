// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_daily_report_equipment_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CreateDailyReportEquipmentModel {

/// Work equipment UID
 String get workEquipmentUID;
/// Create a copy of CreateDailyReportEquipmentModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateDailyReportEquipmentModelCopyWith<CreateDailyReportEquipmentModel> get copyWith => _$CreateDailyReportEquipmentModelCopyWithImpl<CreateDailyReportEquipmentModel>(this as CreateDailyReportEquipmentModel, _$identity);

  /// Serializes this CreateDailyReportEquipmentModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateDailyReportEquipmentModel&&(identical(other.workEquipmentUID, workEquipmentUID) || other.workEquipmentUID == workEquipmentUID));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,workEquipmentUID);

@override
String toString() {
  return 'CreateDailyReportEquipmentModel(workEquipmentUID: $workEquipmentUID)';
}


}

/// @nodoc
abstract mixin class $CreateDailyReportEquipmentModelCopyWith<$Res>  {
  factory $CreateDailyReportEquipmentModelCopyWith(CreateDailyReportEquipmentModel value, $Res Function(CreateDailyReportEquipmentModel) _then) = _$CreateDailyReportEquipmentModelCopyWithImpl;
@useResult
$Res call({
 String workEquipmentUID
});




}
/// @nodoc
class _$CreateDailyReportEquipmentModelCopyWithImpl<$Res>
    implements $CreateDailyReportEquipmentModelCopyWith<$Res> {
  _$CreateDailyReportEquipmentModelCopyWithImpl(this._self, this._then);

  final CreateDailyReportEquipmentModel _self;
  final $Res Function(CreateDailyReportEquipmentModel) _then;

/// Create a copy of CreateDailyReportEquipmentModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? workEquipmentUID = null,}) {
  return _then(_self.copyWith(
workEquipmentUID: null == workEquipmentUID ? _self.workEquipmentUID : workEquipmentUID // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateDailyReportEquipmentModel].
extension CreateDailyReportEquipmentModelPatterns on CreateDailyReportEquipmentModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateDailyReportEquipmentModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateDailyReportEquipmentModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateDailyReportEquipmentModel value)  $default,){
final _that = this;
switch (_that) {
case _CreateDailyReportEquipmentModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateDailyReportEquipmentModel value)?  $default,){
final _that = this;
switch (_that) {
case _CreateDailyReportEquipmentModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String workEquipmentUID)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateDailyReportEquipmentModel() when $default != null:
return $default(_that.workEquipmentUID);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String workEquipmentUID)  $default,) {final _that = this;
switch (_that) {
case _CreateDailyReportEquipmentModel():
return $default(_that.workEquipmentUID);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String workEquipmentUID)?  $default,) {final _that = this;
switch (_that) {
case _CreateDailyReportEquipmentModel() when $default != null:
return $default(_that.workEquipmentUID);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreateDailyReportEquipmentModel implements CreateDailyReportEquipmentModel {
  const _CreateDailyReportEquipmentModel({required this.workEquipmentUID});
  factory _CreateDailyReportEquipmentModel.fromJson(Map<String, dynamic> json) => _$CreateDailyReportEquipmentModelFromJson(json);

/// Work equipment UID
@override final  String workEquipmentUID;

/// Create a copy of CreateDailyReportEquipmentModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateDailyReportEquipmentModelCopyWith<_CreateDailyReportEquipmentModel> get copyWith => __$CreateDailyReportEquipmentModelCopyWithImpl<_CreateDailyReportEquipmentModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateDailyReportEquipmentModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateDailyReportEquipmentModel&&(identical(other.workEquipmentUID, workEquipmentUID) || other.workEquipmentUID == workEquipmentUID));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,workEquipmentUID);

@override
String toString() {
  return 'CreateDailyReportEquipmentModel(workEquipmentUID: $workEquipmentUID)';
}


}

/// @nodoc
abstract mixin class _$CreateDailyReportEquipmentModelCopyWith<$Res> implements $CreateDailyReportEquipmentModelCopyWith<$Res> {
  factory _$CreateDailyReportEquipmentModelCopyWith(_CreateDailyReportEquipmentModel value, $Res Function(_CreateDailyReportEquipmentModel) _then) = __$CreateDailyReportEquipmentModelCopyWithImpl;
@override @useResult
$Res call({
 String workEquipmentUID
});




}
/// @nodoc
class __$CreateDailyReportEquipmentModelCopyWithImpl<$Res>
    implements _$CreateDailyReportEquipmentModelCopyWith<$Res> {
  __$CreateDailyReportEquipmentModelCopyWithImpl(this._self, this._then);

  final _CreateDailyReportEquipmentModel _self;
  final $Res Function(_CreateDailyReportEquipmentModel) _then;

/// Create a copy of CreateDailyReportEquipmentModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? workEquipmentUID = null,}) {
  return _then(_CreateDailyReportEquipmentModel(
workEquipmentUID: null == workEquipmentUID ? _self.workEquipmentUID : workEquipmentUID // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
