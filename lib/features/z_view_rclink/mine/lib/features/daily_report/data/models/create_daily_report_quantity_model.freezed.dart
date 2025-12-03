// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_daily_report_quantity_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CreateDailyReportQuantityModel {

/// Work quantity type UID
 String get quantityTypeUID;/// Sequence number for multiple entries of same type
 int get sequenceNo;/// Total length/measurement (for segment-based quantities)
 double? get totalLength;/// Notes for this quantity entry
 String? get notes;/// Field values for this quantity
 List<CreateDailyReportQuantityFieldModel> get quantityValues;/// Segment breakdowns (for quantities with segment support)
 List<CreateDailyReportSegmentModel>? get segments;
/// Create a copy of CreateDailyReportQuantityModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateDailyReportQuantityModelCopyWith<CreateDailyReportQuantityModel> get copyWith => _$CreateDailyReportQuantityModelCopyWithImpl<CreateDailyReportQuantityModel>(this as CreateDailyReportQuantityModel, _$identity);

  /// Serializes this CreateDailyReportQuantityModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateDailyReportQuantityModel&&(identical(other.quantityTypeUID, quantityTypeUID) || other.quantityTypeUID == quantityTypeUID)&&(identical(other.sequenceNo, sequenceNo) || other.sequenceNo == sequenceNo)&&(identical(other.totalLength, totalLength) || other.totalLength == totalLength)&&(identical(other.notes, notes) || other.notes == notes)&&const DeepCollectionEquality().equals(other.quantityValues, quantityValues)&&const DeepCollectionEquality().equals(other.segments, segments));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,quantityTypeUID,sequenceNo,totalLength,notes,const DeepCollectionEquality().hash(quantityValues),const DeepCollectionEquality().hash(segments));

@override
String toString() {
  return 'CreateDailyReportQuantityModel(quantityTypeUID: $quantityTypeUID, sequenceNo: $sequenceNo, totalLength: $totalLength, notes: $notes, quantityValues: $quantityValues, segments: $segments)';
}


}

/// @nodoc
abstract mixin class $CreateDailyReportQuantityModelCopyWith<$Res>  {
  factory $CreateDailyReportQuantityModelCopyWith(CreateDailyReportQuantityModel value, $Res Function(CreateDailyReportQuantityModel) _then) = _$CreateDailyReportQuantityModelCopyWithImpl;
@useResult
$Res call({
 String quantityTypeUID, int sequenceNo, double? totalLength, String? notes, List<CreateDailyReportQuantityFieldModel> quantityValues, List<CreateDailyReportSegmentModel>? segments
});




}
/// @nodoc
class _$CreateDailyReportQuantityModelCopyWithImpl<$Res>
    implements $CreateDailyReportQuantityModelCopyWith<$Res> {
  _$CreateDailyReportQuantityModelCopyWithImpl(this._self, this._then);

  final CreateDailyReportQuantityModel _self;
  final $Res Function(CreateDailyReportQuantityModel) _then;

/// Create a copy of CreateDailyReportQuantityModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? quantityTypeUID = null,Object? sequenceNo = null,Object? totalLength = freezed,Object? notes = freezed,Object? quantityValues = null,Object? segments = freezed,}) {
  return _then(_self.copyWith(
quantityTypeUID: null == quantityTypeUID ? _self.quantityTypeUID : quantityTypeUID // ignore: cast_nullable_to_non_nullable
as String,sequenceNo: null == sequenceNo ? _self.sequenceNo : sequenceNo // ignore: cast_nullable_to_non_nullable
as int,totalLength: freezed == totalLength ? _self.totalLength : totalLength // ignore: cast_nullable_to_non_nullable
as double?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,quantityValues: null == quantityValues ? _self.quantityValues : quantityValues // ignore: cast_nullable_to_non_nullable
as List<CreateDailyReportQuantityFieldModel>,segments: freezed == segments ? _self.segments : segments // ignore: cast_nullable_to_non_nullable
as List<CreateDailyReportSegmentModel>?,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateDailyReportQuantityModel].
extension CreateDailyReportQuantityModelPatterns on CreateDailyReportQuantityModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateDailyReportQuantityModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateDailyReportQuantityModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateDailyReportQuantityModel value)  $default,){
final _that = this;
switch (_that) {
case _CreateDailyReportQuantityModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateDailyReportQuantityModel value)?  $default,){
final _that = this;
switch (_that) {
case _CreateDailyReportQuantityModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String quantityTypeUID,  int sequenceNo,  double? totalLength,  String? notes,  List<CreateDailyReportQuantityFieldModel> quantityValues,  List<CreateDailyReportSegmentModel>? segments)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateDailyReportQuantityModel() when $default != null:
return $default(_that.quantityTypeUID,_that.sequenceNo,_that.totalLength,_that.notes,_that.quantityValues,_that.segments);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String quantityTypeUID,  int sequenceNo,  double? totalLength,  String? notes,  List<CreateDailyReportQuantityFieldModel> quantityValues,  List<CreateDailyReportSegmentModel>? segments)  $default,) {final _that = this;
switch (_that) {
case _CreateDailyReportQuantityModel():
return $default(_that.quantityTypeUID,_that.sequenceNo,_that.totalLength,_that.notes,_that.quantityValues,_that.segments);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String quantityTypeUID,  int sequenceNo,  double? totalLength,  String? notes,  List<CreateDailyReportQuantityFieldModel> quantityValues,  List<CreateDailyReportSegmentModel>? segments)?  $default,) {final _that = this;
switch (_that) {
case _CreateDailyReportQuantityModel() when $default != null:
return $default(_that.quantityTypeUID,_that.sequenceNo,_that.totalLength,_that.notes,_that.quantityValues,_that.segments);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreateDailyReportQuantityModel implements CreateDailyReportQuantityModel {
  const _CreateDailyReportQuantityModel({required this.quantityTypeUID, this.sequenceNo = 1, this.totalLength, this.notes, required final  List<CreateDailyReportQuantityFieldModel> quantityValues, final  List<CreateDailyReportSegmentModel>? segments}): _quantityValues = quantityValues,_segments = segments;
  factory _CreateDailyReportQuantityModel.fromJson(Map<String, dynamic> json) => _$CreateDailyReportQuantityModelFromJson(json);

/// Work quantity type UID
@override final  String quantityTypeUID;
/// Sequence number for multiple entries of same type
@override@JsonKey() final  int sequenceNo;
/// Total length/measurement (for segment-based quantities)
@override final  double? totalLength;
/// Notes for this quantity entry
@override final  String? notes;
/// Field values for this quantity
 final  List<CreateDailyReportQuantityFieldModel> _quantityValues;
/// Field values for this quantity
@override List<CreateDailyReportQuantityFieldModel> get quantityValues {
  if (_quantityValues is EqualUnmodifiableListView) return _quantityValues;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_quantityValues);
}

/// Segment breakdowns (for quantities with segment support)
 final  List<CreateDailyReportSegmentModel>? _segments;
/// Segment breakdowns (for quantities with segment support)
@override List<CreateDailyReportSegmentModel>? get segments {
  final value = _segments;
  if (value == null) return null;
  if (_segments is EqualUnmodifiableListView) return _segments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of CreateDailyReportQuantityModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateDailyReportQuantityModelCopyWith<_CreateDailyReportQuantityModel> get copyWith => __$CreateDailyReportQuantityModelCopyWithImpl<_CreateDailyReportQuantityModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateDailyReportQuantityModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateDailyReportQuantityModel&&(identical(other.quantityTypeUID, quantityTypeUID) || other.quantityTypeUID == quantityTypeUID)&&(identical(other.sequenceNo, sequenceNo) || other.sequenceNo == sequenceNo)&&(identical(other.totalLength, totalLength) || other.totalLength == totalLength)&&(identical(other.notes, notes) || other.notes == notes)&&const DeepCollectionEquality().equals(other._quantityValues, _quantityValues)&&const DeepCollectionEquality().equals(other._segments, _segments));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,quantityTypeUID,sequenceNo,totalLength,notes,const DeepCollectionEquality().hash(_quantityValues),const DeepCollectionEquality().hash(_segments));

@override
String toString() {
  return 'CreateDailyReportQuantityModel(quantityTypeUID: $quantityTypeUID, sequenceNo: $sequenceNo, totalLength: $totalLength, notes: $notes, quantityValues: $quantityValues, segments: $segments)';
}


}

/// @nodoc
abstract mixin class _$CreateDailyReportQuantityModelCopyWith<$Res> implements $CreateDailyReportQuantityModelCopyWith<$Res> {
  factory _$CreateDailyReportQuantityModelCopyWith(_CreateDailyReportQuantityModel value, $Res Function(_CreateDailyReportQuantityModel) _then) = __$CreateDailyReportQuantityModelCopyWithImpl;
@override @useResult
$Res call({
 String quantityTypeUID, int sequenceNo, double? totalLength, String? notes, List<CreateDailyReportQuantityFieldModel> quantityValues, List<CreateDailyReportSegmentModel>? segments
});




}
/// @nodoc
class __$CreateDailyReportQuantityModelCopyWithImpl<$Res>
    implements _$CreateDailyReportQuantityModelCopyWith<$Res> {
  __$CreateDailyReportQuantityModelCopyWithImpl(this._self, this._then);

  final _CreateDailyReportQuantityModel _self;
  final $Res Function(_CreateDailyReportQuantityModel) _then;

/// Create a copy of CreateDailyReportQuantityModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? quantityTypeUID = null,Object? sequenceNo = null,Object? totalLength = freezed,Object? notes = freezed,Object? quantityValues = null,Object? segments = freezed,}) {
  return _then(_CreateDailyReportQuantityModel(
quantityTypeUID: null == quantityTypeUID ? _self.quantityTypeUID : quantityTypeUID // ignore: cast_nullable_to_non_nullable
as String,sequenceNo: null == sequenceNo ? _self.sequenceNo : sequenceNo // ignore: cast_nullable_to_non_nullable
as int,totalLength: freezed == totalLength ? _self.totalLength : totalLength // ignore: cast_nullable_to_non_nullable
as double?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,quantityValues: null == quantityValues ? _self._quantityValues : quantityValues // ignore: cast_nullable_to_non_nullable
as List<CreateDailyReportQuantityFieldModel>,segments: freezed == segments ? _self._segments : segments // ignore: cast_nullable_to_non_nullable
as List<CreateDailyReportSegmentModel>?,
  ));
}


}

// dart format on
