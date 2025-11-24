// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'warning_equipment_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WarningEquipmentModel {

 WorkEquipmentModel get workEquipment;
/// Create a copy of WarningEquipmentModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WarningEquipmentModelCopyWith<WarningEquipmentModel> get copyWith => _$WarningEquipmentModelCopyWithImpl<WarningEquipmentModel>(this as WarningEquipmentModel, _$identity);

  /// Serializes this WarningEquipmentModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WarningEquipmentModel&&(identical(other.workEquipment, workEquipment) || other.workEquipment == workEquipment));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,workEquipment);

@override
String toString() {
  return 'WarningEquipmentModel(workEquipment: $workEquipment)';
}


}

/// @nodoc
abstract mixin class $WarningEquipmentModelCopyWith<$Res>  {
  factory $WarningEquipmentModelCopyWith(WarningEquipmentModel value, $Res Function(WarningEquipmentModel) _then) = _$WarningEquipmentModelCopyWithImpl;
@useResult
$Res call({
 WorkEquipmentModel workEquipment
});


$WorkEquipmentModelCopyWith<$Res> get workEquipment;

}
/// @nodoc
class _$WarningEquipmentModelCopyWithImpl<$Res>
    implements $WarningEquipmentModelCopyWith<$Res> {
  _$WarningEquipmentModelCopyWithImpl(this._self, this._then);

  final WarningEquipmentModel _self;
  final $Res Function(WarningEquipmentModel) _then;

/// Create a copy of WarningEquipmentModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? workEquipment = null,}) {
  return _then(_self.copyWith(
workEquipment: null == workEquipment ? _self.workEquipment : workEquipment // ignore: cast_nullable_to_non_nullable
as WorkEquipmentModel,
  ));
}
/// Create a copy of WarningEquipmentModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WorkEquipmentModelCopyWith<$Res> get workEquipment {
  
  return $WorkEquipmentModelCopyWith<$Res>(_self.workEquipment, (value) {
    return _then(_self.copyWith(workEquipment: value));
  });
}
}


/// Adds pattern-matching-related methods to [WarningEquipmentModel].
extension WarningEquipmentModelPatterns on WarningEquipmentModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WarningEquipmentModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WarningEquipmentModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WarningEquipmentModel value)  $default,){
final _that = this;
switch (_that) {
case _WarningEquipmentModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WarningEquipmentModel value)?  $default,){
final _that = this;
switch (_that) {
case _WarningEquipmentModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( WorkEquipmentModel workEquipment)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WarningEquipmentModel() when $default != null:
return $default(_that.workEquipment);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( WorkEquipmentModel workEquipment)  $default,) {final _that = this;
switch (_that) {
case _WarningEquipmentModel():
return $default(_that.workEquipment);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( WorkEquipmentModel workEquipment)?  $default,) {final _that = this;
switch (_that) {
case _WarningEquipmentModel() when $default != null:
return $default(_that.workEquipment);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WarningEquipmentModel implements WarningEquipmentModel {
  const _WarningEquipmentModel({required this.workEquipment});
  factory _WarningEquipmentModel.fromJson(Map<String, dynamic> json) => _$WarningEquipmentModelFromJson(json);

@override final  WorkEquipmentModel workEquipment;

/// Create a copy of WarningEquipmentModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WarningEquipmentModelCopyWith<_WarningEquipmentModel> get copyWith => __$WarningEquipmentModelCopyWithImpl<_WarningEquipmentModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WarningEquipmentModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WarningEquipmentModel&&(identical(other.workEquipment, workEquipment) || other.workEquipment == workEquipment));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,workEquipment);

@override
String toString() {
  return 'WarningEquipmentModel(workEquipment: $workEquipment)';
}


}

/// @nodoc
abstract mixin class _$WarningEquipmentModelCopyWith<$Res> implements $WarningEquipmentModelCopyWith<$Res> {
  factory _$WarningEquipmentModelCopyWith(_WarningEquipmentModel value, $Res Function(_WarningEquipmentModel) _then) = __$WarningEquipmentModelCopyWithImpl;
@override @useResult
$Res call({
 WorkEquipmentModel workEquipment
});


@override $WorkEquipmentModelCopyWith<$Res> get workEquipment;

}
/// @nodoc
class __$WarningEquipmentModelCopyWithImpl<$Res>
    implements _$WarningEquipmentModelCopyWith<$Res> {
  __$WarningEquipmentModelCopyWithImpl(this._self, this._then);

  final _WarningEquipmentModel _self;
  final $Res Function(_WarningEquipmentModel) _then;

/// Create a copy of WarningEquipmentModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? workEquipment = null,}) {
  return _then(_WarningEquipmentModel(
workEquipment: null == workEquipment ? _self.workEquipment : workEquipment // ignore: cast_nullable_to_non_nullable
as WorkEquipmentModel,
  ));
}

/// Create a copy of WarningEquipmentModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WorkEquipmentModelCopyWith<$Res> get workEquipment {
  
  return $WorkEquipmentModelCopyWith<$Res>(_self.workEquipment, (value) {
    return _then(_self.copyWith(workEquipment: value));
  });
}
}

// dart format on
