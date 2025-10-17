// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quantitytype_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$QuantityTypeResponseModel {

 String? get name; String? get code; String? get uid; int? get displayOrder; bool? get hasSegmentBreakdown; double? get segmentSize; double? get maxSegmentLength;
/// Create a copy of QuantityTypeResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuantityTypeResponseModelCopyWith<QuantityTypeResponseModel> get copyWith => _$QuantityTypeResponseModelCopyWithImpl<QuantityTypeResponseModel>(this as QuantityTypeResponseModel, _$identity);

  /// Serializes this QuantityTypeResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuantityTypeResponseModel&&(identical(other.name, name) || other.name == name)&&(identical(other.code, code) || other.code == code)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.displayOrder, displayOrder) || other.displayOrder == displayOrder)&&(identical(other.hasSegmentBreakdown, hasSegmentBreakdown) || other.hasSegmentBreakdown == hasSegmentBreakdown)&&(identical(other.segmentSize, segmentSize) || other.segmentSize == segmentSize)&&(identical(other.maxSegmentLength, maxSegmentLength) || other.maxSegmentLength == maxSegmentLength));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,code,uid,displayOrder,hasSegmentBreakdown,segmentSize,maxSegmentLength);

@override
String toString() {
  return 'QuantityTypeResponseModel(name: $name, code: $code, uid: $uid, displayOrder: $displayOrder, hasSegmentBreakdown: $hasSegmentBreakdown, segmentSize: $segmentSize, maxSegmentLength: $maxSegmentLength)';
}


}

/// @nodoc
abstract mixin class $QuantityTypeResponseModelCopyWith<$Res>  {
  factory $QuantityTypeResponseModelCopyWith(QuantityTypeResponseModel value, $Res Function(QuantityTypeResponseModel) _then) = _$QuantityTypeResponseModelCopyWithImpl;
@useResult
$Res call({
 String? name, String? code, String? uid, int? displayOrder, bool? hasSegmentBreakdown, double? segmentSize, double? maxSegmentLength
});




}
/// @nodoc
class _$QuantityTypeResponseModelCopyWithImpl<$Res>
    implements $QuantityTypeResponseModelCopyWith<$Res> {
  _$QuantityTypeResponseModelCopyWithImpl(this._self, this._then);

  final QuantityTypeResponseModel _self;
  final $Res Function(QuantityTypeResponseModel) _then;

/// Create a copy of QuantityTypeResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = freezed,Object? code = freezed,Object? uid = freezed,Object? displayOrder = freezed,Object? hasSegmentBreakdown = freezed,Object? segmentSize = freezed,Object? maxSegmentLength = freezed,}) {
  return _then(_self.copyWith(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String?,uid: freezed == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String?,displayOrder: freezed == displayOrder ? _self.displayOrder : displayOrder // ignore: cast_nullable_to_non_nullable
as int?,hasSegmentBreakdown: freezed == hasSegmentBreakdown ? _self.hasSegmentBreakdown : hasSegmentBreakdown // ignore: cast_nullable_to_non_nullable
as bool?,segmentSize: freezed == segmentSize ? _self.segmentSize : segmentSize // ignore: cast_nullable_to_non_nullable
as double?,maxSegmentLength: freezed == maxSegmentLength ? _self.maxSegmentLength : maxSegmentLength // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [QuantityTypeResponseModel].
extension QuantityTypeResponseModelPatterns on QuantityTypeResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QuantityTypeResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QuantityTypeResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QuantityTypeResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _QuantityTypeResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QuantityTypeResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _QuantityTypeResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? name,  String? code,  String? uid,  int? displayOrder,  bool? hasSegmentBreakdown,  double? segmentSize,  double? maxSegmentLength)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QuantityTypeResponseModel() when $default != null:
return $default(_that.name,_that.code,_that.uid,_that.displayOrder,_that.hasSegmentBreakdown,_that.segmentSize,_that.maxSegmentLength);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? name,  String? code,  String? uid,  int? displayOrder,  bool? hasSegmentBreakdown,  double? segmentSize,  double? maxSegmentLength)  $default,) {final _that = this;
switch (_that) {
case _QuantityTypeResponseModel():
return $default(_that.name,_that.code,_that.uid,_that.displayOrder,_that.hasSegmentBreakdown,_that.segmentSize,_that.maxSegmentLength);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? name,  String? code,  String? uid,  int? displayOrder,  bool? hasSegmentBreakdown,  double? segmentSize,  double? maxSegmentLength)?  $default,) {final _that = this;
switch (_that) {
case _QuantityTypeResponseModel() when $default != null:
return $default(_that.name,_that.code,_that.uid,_that.displayOrder,_that.hasSegmentBreakdown,_that.segmentSize,_that.maxSegmentLength);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _QuantityTypeResponseModel extends QuantityTypeResponseModel {
  const _QuantityTypeResponseModel({this.name, this.code, this.uid, this.displayOrder, this.hasSegmentBreakdown, this.segmentSize, this.maxSegmentLength}): super._();
  factory _QuantityTypeResponseModel.fromJson(Map<String, dynamic> json) => _$QuantityTypeResponseModelFromJson(json);

@override final  String? name;
@override final  String? code;
@override final  String? uid;
@override final  int? displayOrder;
@override final  bool? hasSegmentBreakdown;
@override final  double? segmentSize;
@override final  double? maxSegmentLength;

/// Create a copy of QuantityTypeResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuantityTypeResponseModelCopyWith<_QuantityTypeResponseModel> get copyWith => __$QuantityTypeResponseModelCopyWithImpl<_QuantityTypeResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$QuantityTypeResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QuantityTypeResponseModel&&(identical(other.name, name) || other.name == name)&&(identical(other.code, code) || other.code == code)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.displayOrder, displayOrder) || other.displayOrder == displayOrder)&&(identical(other.hasSegmentBreakdown, hasSegmentBreakdown) || other.hasSegmentBreakdown == hasSegmentBreakdown)&&(identical(other.segmentSize, segmentSize) || other.segmentSize == segmentSize)&&(identical(other.maxSegmentLength, maxSegmentLength) || other.maxSegmentLength == maxSegmentLength));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,code,uid,displayOrder,hasSegmentBreakdown,segmentSize,maxSegmentLength);

@override
String toString() {
  return 'QuantityTypeResponseModel(name: $name, code: $code, uid: $uid, displayOrder: $displayOrder, hasSegmentBreakdown: $hasSegmentBreakdown, segmentSize: $segmentSize, maxSegmentLength: $maxSegmentLength)';
}


}

/// @nodoc
abstract mixin class _$QuantityTypeResponseModelCopyWith<$Res> implements $QuantityTypeResponseModelCopyWith<$Res> {
  factory _$QuantityTypeResponseModelCopyWith(_QuantityTypeResponseModel value, $Res Function(_QuantityTypeResponseModel) _then) = __$QuantityTypeResponseModelCopyWithImpl;
@override @useResult
$Res call({
 String? name, String? code, String? uid, int? displayOrder, bool? hasSegmentBreakdown, double? segmentSize, double? maxSegmentLength
});




}
/// @nodoc
class __$QuantityTypeResponseModelCopyWithImpl<$Res>
    implements _$QuantityTypeResponseModelCopyWith<$Res> {
  __$QuantityTypeResponseModelCopyWithImpl(this._self, this._then);

  final _QuantityTypeResponseModel _self;
  final $Res Function(_QuantityTypeResponseModel) _then;

/// Create a copy of QuantityTypeResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = freezed,Object? code = freezed,Object? uid = freezed,Object? displayOrder = freezed,Object? hasSegmentBreakdown = freezed,Object? segmentSize = freezed,Object? maxSegmentLength = freezed,}) {
  return _then(_QuantityTypeResponseModel(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String?,uid: freezed == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String?,displayOrder: freezed == displayOrder ? _self.displayOrder : displayOrder // ignore: cast_nullable_to_non_nullable
as int?,hasSegmentBreakdown: freezed == hasSegmentBreakdown ? _self.hasSegmentBreakdown : hasSegmentBreakdown // ignore: cast_nullable_to_non_nullable
as bool?,segmentSize: freezed == segmentSize ? _self.segmentSize : segmentSize // ignore: cast_nullable_to_non_nullable
as double?,maxSegmentLength: freezed == maxSegmentLength ? _self.maxSegmentLength : maxSegmentLength // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

// dart format on
