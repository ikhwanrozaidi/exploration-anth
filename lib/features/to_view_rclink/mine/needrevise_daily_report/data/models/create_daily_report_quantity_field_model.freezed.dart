// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_daily_report_quantity_field_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CreateDailyReportQuantityFieldModel {

/// Quantity field UID
 String get quantityFieldUID;/// Field value
 String get value;
/// Create a copy of CreateDailyReportQuantityFieldModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateDailyReportQuantityFieldModelCopyWith<CreateDailyReportQuantityFieldModel> get copyWith => _$CreateDailyReportQuantityFieldModelCopyWithImpl<CreateDailyReportQuantityFieldModel>(this as CreateDailyReportQuantityFieldModel, _$identity);

  /// Serializes this CreateDailyReportQuantityFieldModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateDailyReportQuantityFieldModel&&(identical(other.quantityFieldUID, quantityFieldUID) || other.quantityFieldUID == quantityFieldUID)&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,quantityFieldUID,value);

@override
String toString() {
  return 'CreateDailyReportQuantityFieldModel(quantityFieldUID: $quantityFieldUID, value: $value)';
}


}

/// @nodoc
abstract mixin class $CreateDailyReportQuantityFieldModelCopyWith<$Res>  {
  factory $CreateDailyReportQuantityFieldModelCopyWith(CreateDailyReportQuantityFieldModel value, $Res Function(CreateDailyReportQuantityFieldModel) _then) = _$CreateDailyReportQuantityFieldModelCopyWithImpl;
@useResult
$Res call({
 String quantityFieldUID, String value
});




}
/// @nodoc
class _$CreateDailyReportQuantityFieldModelCopyWithImpl<$Res>
    implements $CreateDailyReportQuantityFieldModelCopyWith<$Res> {
  _$CreateDailyReportQuantityFieldModelCopyWithImpl(this._self, this._then);

  final CreateDailyReportQuantityFieldModel _self;
  final $Res Function(CreateDailyReportQuantityFieldModel) _then;

/// Create a copy of CreateDailyReportQuantityFieldModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? quantityFieldUID = null,Object? value = null,}) {
  return _then(_self.copyWith(
quantityFieldUID: null == quantityFieldUID ? _self.quantityFieldUID : quantityFieldUID // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateDailyReportQuantityFieldModel].
extension CreateDailyReportQuantityFieldModelPatterns on CreateDailyReportQuantityFieldModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateDailyReportQuantityFieldModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateDailyReportQuantityFieldModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateDailyReportQuantityFieldModel value)  $default,){
final _that = this;
switch (_that) {
case _CreateDailyReportQuantityFieldModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateDailyReportQuantityFieldModel value)?  $default,){
final _that = this;
switch (_that) {
case _CreateDailyReportQuantityFieldModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String quantityFieldUID,  String value)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateDailyReportQuantityFieldModel() when $default != null:
return $default(_that.quantityFieldUID,_that.value);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String quantityFieldUID,  String value)  $default,) {final _that = this;
switch (_that) {
case _CreateDailyReportQuantityFieldModel():
return $default(_that.quantityFieldUID,_that.value);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String quantityFieldUID,  String value)?  $default,) {final _that = this;
switch (_that) {
case _CreateDailyReportQuantityFieldModel() when $default != null:
return $default(_that.quantityFieldUID,_that.value);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreateDailyReportQuantityFieldModel implements CreateDailyReportQuantityFieldModel {
  const _CreateDailyReportQuantityFieldModel({required this.quantityFieldUID, required this.value});
  factory _CreateDailyReportQuantityFieldModel.fromJson(Map<String, dynamic> json) => _$CreateDailyReportQuantityFieldModelFromJson(json);

/// Quantity field UID
@override final  String quantityFieldUID;
/// Field value
@override final  String value;

/// Create a copy of CreateDailyReportQuantityFieldModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateDailyReportQuantityFieldModelCopyWith<_CreateDailyReportQuantityFieldModel> get copyWith => __$CreateDailyReportQuantityFieldModelCopyWithImpl<_CreateDailyReportQuantityFieldModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateDailyReportQuantityFieldModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateDailyReportQuantityFieldModel&&(identical(other.quantityFieldUID, quantityFieldUID) || other.quantityFieldUID == quantityFieldUID)&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,quantityFieldUID,value);

@override
String toString() {
  return 'CreateDailyReportQuantityFieldModel(quantityFieldUID: $quantityFieldUID, value: $value)';
}


}

/// @nodoc
abstract mixin class _$CreateDailyReportQuantityFieldModelCopyWith<$Res> implements $CreateDailyReportQuantityFieldModelCopyWith<$Res> {
  factory _$CreateDailyReportQuantityFieldModelCopyWith(_CreateDailyReportQuantityFieldModel value, $Res Function(_CreateDailyReportQuantityFieldModel) _then) = __$CreateDailyReportQuantityFieldModelCopyWithImpl;
@override @useResult
$Res call({
 String quantityFieldUID, String value
});




}
/// @nodoc
class __$CreateDailyReportQuantityFieldModelCopyWithImpl<$Res>
    implements _$CreateDailyReportQuantityFieldModelCopyWith<$Res> {
  __$CreateDailyReportQuantityFieldModelCopyWithImpl(this._self, this._then);

  final _CreateDailyReportQuantityFieldModel _self;
  final $Res Function(_CreateDailyReportQuantityFieldModel) _then;

/// Create a copy of CreateDailyReportQuantityFieldModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? quantityFieldUID = null,Object? value = null,}) {
  return _then(_CreateDailyReportQuantityFieldModel(
quantityFieldUID: null == quantityFieldUID ? _self.quantityFieldUID : quantityFieldUID // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
