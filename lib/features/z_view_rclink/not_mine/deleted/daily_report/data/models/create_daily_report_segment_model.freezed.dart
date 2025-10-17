// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_daily_report_segment_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CreateDailyReportSegmentModel {

/// Segment number (1, 2, 3...)
 int get segmentNumber;/// Start distance in meters
 double get startDistance;/// End distance in meters
 double get endDistance;/// Segment field values
 List<CreateDailyReportQuantityFieldModel> get segmentValues;
/// Create a copy of CreateDailyReportSegmentModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateDailyReportSegmentModelCopyWith<CreateDailyReportSegmentModel> get copyWith => _$CreateDailyReportSegmentModelCopyWithImpl<CreateDailyReportSegmentModel>(this as CreateDailyReportSegmentModel, _$identity);

  /// Serializes this CreateDailyReportSegmentModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateDailyReportSegmentModel&&(identical(other.segmentNumber, segmentNumber) || other.segmentNumber == segmentNumber)&&(identical(other.startDistance, startDistance) || other.startDistance == startDistance)&&(identical(other.endDistance, endDistance) || other.endDistance == endDistance)&&const DeepCollectionEquality().equals(other.segmentValues, segmentValues));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,segmentNumber,startDistance,endDistance,const DeepCollectionEquality().hash(segmentValues));

@override
String toString() {
  return 'CreateDailyReportSegmentModel(segmentNumber: $segmentNumber, startDistance: $startDistance, endDistance: $endDistance, segmentValues: $segmentValues)';
}


}

/// @nodoc
abstract mixin class $CreateDailyReportSegmentModelCopyWith<$Res>  {
  factory $CreateDailyReportSegmentModelCopyWith(CreateDailyReportSegmentModel value, $Res Function(CreateDailyReportSegmentModel) _then) = _$CreateDailyReportSegmentModelCopyWithImpl;
@useResult
$Res call({
 int segmentNumber, double startDistance, double endDistance, List<CreateDailyReportQuantityFieldModel> segmentValues
});




}
/// @nodoc
class _$CreateDailyReportSegmentModelCopyWithImpl<$Res>
    implements $CreateDailyReportSegmentModelCopyWith<$Res> {
  _$CreateDailyReportSegmentModelCopyWithImpl(this._self, this._then);

  final CreateDailyReportSegmentModel _self;
  final $Res Function(CreateDailyReportSegmentModel) _then;

/// Create a copy of CreateDailyReportSegmentModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? segmentNumber = null,Object? startDistance = null,Object? endDistance = null,Object? segmentValues = null,}) {
  return _then(_self.copyWith(
segmentNumber: null == segmentNumber ? _self.segmentNumber : segmentNumber // ignore: cast_nullable_to_non_nullable
as int,startDistance: null == startDistance ? _self.startDistance : startDistance // ignore: cast_nullable_to_non_nullable
as double,endDistance: null == endDistance ? _self.endDistance : endDistance // ignore: cast_nullable_to_non_nullable
as double,segmentValues: null == segmentValues ? _self.segmentValues : segmentValues // ignore: cast_nullable_to_non_nullable
as List<CreateDailyReportQuantityFieldModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateDailyReportSegmentModel].
extension CreateDailyReportSegmentModelPatterns on CreateDailyReportSegmentModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateDailyReportSegmentModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateDailyReportSegmentModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateDailyReportSegmentModel value)  $default,){
final _that = this;
switch (_that) {
case _CreateDailyReportSegmentModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateDailyReportSegmentModel value)?  $default,){
final _that = this;
switch (_that) {
case _CreateDailyReportSegmentModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int segmentNumber,  double startDistance,  double endDistance,  List<CreateDailyReportQuantityFieldModel> segmentValues)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateDailyReportSegmentModel() when $default != null:
return $default(_that.segmentNumber,_that.startDistance,_that.endDistance,_that.segmentValues);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int segmentNumber,  double startDistance,  double endDistance,  List<CreateDailyReportQuantityFieldModel> segmentValues)  $default,) {final _that = this;
switch (_that) {
case _CreateDailyReportSegmentModel():
return $default(_that.segmentNumber,_that.startDistance,_that.endDistance,_that.segmentValues);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int segmentNumber,  double startDistance,  double endDistance,  List<CreateDailyReportQuantityFieldModel> segmentValues)?  $default,) {final _that = this;
switch (_that) {
case _CreateDailyReportSegmentModel() when $default != null:
return $default(_that.segmentNumber,_that.startDistance,_that.endDistance,_that.segmentValues);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreateDailyReportSegmentModel implements CreateDailyReportSegmentModel {
  const _CreateDailyReportSegmentModel({required this.segmentNumber, required this.startDistance, required this.endDistance, required final  List<CreateDailyReportQuantityFieldModel> segmentValues}): _segmentValues = segmentValues;
  factory _CreateDailyReportSegmentModel.fromJson(Map<String, dynamic> json) => _$CreateDailyReportSegmentModelFromJson(json);

/// Segment number (1, 2, 3...)
@override final  int segmentNumber;
/// Start distance in meters
@override final  double startDistance;
/// End distance in meters
@override final  double endDistance;
/// Segment field values
 final  List<CreateDailyReportQuantityFieldModel> _segmentValues;
/// Segment field values
@override List<CreateDailyReportQuantityFieldModel> get segmentValues {
  if (_segmentValues is EqualUnmodifiableListView) return _segmentValues;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_segmentValues);
}


/// Create a copy of CreateDailyReportSegmentModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateDailyReportSegmentModelCopyWith<_CreateDailyReportSegmentModel> get copyWith => __$CreateDailyReportSegmentModelCopyWithImpl<_CreateDailyReportSegmentModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateDailyReportSegmentModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateDailyReportSegmentModel&&(identical(other.segmentNumber, segmentNumber) || other.segmentNumber == segmentNumber)&&(identical(other.startDistance, startDistance) || other.startDistance == startDistance)&&(identical(other.endDistance, endDistance) || other.endDistance == endDistance)&&const DeepCollectionEquality().equals(other._segmentValues, _segmentValues));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,segmentNumber,startDistance,endDistance,const DeepCollectionEquality().hash(_segmentValues));

@override
String toString() {
  return 'CreateDailyReportSegmentModel(segmentNumber: $segmentNumber, startDistance: $startDistance, endDistance: $endDistance, segmentValues: $segmentValues)';
}


}

/// @nodoc
abstract mixin class _$CreateDailyReportSegmentModelCopyWith<$Res> implements $CreateDailyReportSegmentModelCopyWith<$Res> {
  factory _$CreateDailyReportSegmentModelCopyWith(_CreateDailyReportSegmentModel value, $Res Function(_CreateDailyReportSegmentModel) _then) = __$CreateDailyReportSegmentModelCopyWithImpl;
@override @useResult
$Res call({
 int segmentNumber, double startDistance, double endDistance, List<CreateDailyReportQuantityFieldModel> segmentValues
});




}
/// @nodoc
class __$CreateDailyReportSegmentModelCopyWithImpl<$Res>
    implements _$CreateDailyReportSegmentModelCopyWith<$Res> {
  __$CreateDailyReportSegmentModelCopyWithImpl(this._self, this._then);

  final _CreateDailyReportSegmentModel _self;
  final $Res Function(_CreateDailyReportSegmentModel) _then;

/// Create a copy of CreateDailyReportSegmentModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? segmentNumber = null,Object? startDistance = null,Object? endDistance = null,Object? segmentValues = null,}) {
  return _then(_CreateDailyReportSegmentModel(
segmentNumber: null == segmentNumber ? _self.segmentNumber : segmentNumber // ignore: cast_nullable_to_non_nullable
as int,startDistance: null == startDistance ? _self.startDistance : startDistance // ignore: cast_nullable_to_non_nullable
as double,endDistance: null == endDistance ? _self.endDistance : endDistance // ignore: cast_nullable_to_non_nullable
as double,segmentValues: null == segmentValues ? _self._segmentValues : segmentValues // ignore: cast_nullable_to_non_nullable
as List<CreateDailyReportQuantityFieldModel>,
  ));
}


}

// dart format on
