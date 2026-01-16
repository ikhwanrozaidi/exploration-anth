// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'program_quantity_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProgramQuantityModel {

 int? get id; String? get uid; int? get programID; int? get quantityTypeID; int? get sequenceNo; String? get totalLength; String? get notes; String? get createdAt; String? get updatedAt; QuantityTypeNestedModel? get quantityType; List<ProgramQuantityValueModel>? get quantityValues; List<ProgramQuantitySegmentModel>? get segments;
/// Create a copy of ProgramQuantityModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProgramQuantityModelCopyWith<ProgramQuantityModel> get copyWith => _$ProgramQuantityModelCopyWithImpl<ProgramQuantityModel>(this as ProgramQuantityModel, _$identity);

  /// Serializes this ProgramQuantityModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProgramQuantityModel&&(identical(other.id, id) || other.id == id)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.programID, programID) || other.programID == programID)&&(identical(other.quantityTypeID, quantityTypeID) || other.quantityTypeID == quantityTypeID)&&(identical(other.sequenceNo, sequenceNo) || other.sequenceNo == sequenceNo)&&(identical(other.totalLength, totalLength) || other.totalLength == totalLength)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.quantityType, quantityType) || other.quantityType == quantityType)&&const DeepCollectionEquality().equals(other.quantityValues, quantityValues)&&const DeepCollectionEquality().equals(other.segments, segments));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,uid,programID,quantityTypeID,sequenceNo,totalLength,notes,createdAt,updatedAt,quantityType,const DeepCollectionEquality().hash(quantityValues),const DeepCollectionEquality().hash(segments));

@override
String toString() {
  return 'ProgramQuantityModel(id: $id, uid: $uid, programID: $programID, quantityTypeID: $quantityTypeID, sequenceNo: $sequenceNo, totalLength: $totalLength, notes: $notes, createdAt: $createdAt, updatedAt: $updatedAt, quantityType: $quantityType, quantityValues: $quantityValues, segments: $segments)';
}


}

/// @nodoc
abstract mixin class $ProgramQuantityModelCopyWith<$Res>  {
  factory $ProgramQuantityModelCopyWith(ProgramQuantityModel value, $Res Function(ProgramQuantityModel) _then) = _$ProgramQuantityModelCopyWithImpl;
@useResult
$Res call({
 int? id, String? uid, int? programID, int? quantityTypeID, int? sequenceNo, String? totalLength, String? notes, String? createdAt, String? updatedAt, QuantityTypeNestedModel? quantityType, List<ProgramQuantityValueModel>? quantityValues, List<ProgramQuantitySegmentModel>? segments
});


$QuantityTypeNestedModelCopyWith<$Res>? get quantityType;

}
/// @nodoc
class _$ProgramQuantityModelCopyWithImpl<$Res>
    implements $ProgramQuantityModelCopyWith<$Res> {
  _$ProgramQuantityModelCopyWithImpl(this._self, this._then);

  final ProgramQuantityModel _self;
  final $Res Function(ProgramQuantityModel) _then;

/// Create a copy of ProgramQuantityModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? uid = freezed,Object? programID = freezed,Object? quantityTypeID = freezed,Object? sequenceNo = freezed,Object? totalLength = freezed,Object? notes = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? quantityType = freezed,Object? quantityValues = freezed,Object? segments = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,uid: freezed == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String?,programID: freezed == programID ? _self.programID : programID // ignore: cast_nullable_to_non_nullable
as int?,quantityTypeID: freezed == quantityTypeID ? _self.quantityTypeID : quantityTypeID // ignore: cast_nullable_to_non_nullable
as int?,sequenceNo: freezed == sequenceNo ? _self.sequenceNo : sequenceNo // ignore: cast_nullable_to_non_nullable
as int?,totalLength: freezed == totalLength ? _self.totalLength : totalLength // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,quantityType: freezed == quantityType ? _self.quantityType : quantityType // ignore: cast_nullable_to_non_nullable
as QuantityTypeNestedModel?,quantityValues: freezed == quantityValues ? _self.quantityValues : quantityValues // ignore: cast_nullable_to_non_nullable
as List<ProgramQuantityValueModel>?,segments: freezed == segments ? _self.segments : segments // ignore: cast_nullable_to_non_nullable
as List<ProgramQuantitySegmentModel>?,
  ));
}
/// Create a copy of ProgramQuantityModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$QuantityTypeNestedModelCopyWith<$Res>? get quantityType {
    if (_self.quantityType == null) {
    return null;
  }

  return $QuantityTypeNestedModelCopyWith<$Res>(_self.quantityType!, (value) {
    return _then(_self.copyWith(quantityType: value));
  });
}
}


/// Adds pattern-matching-related methods to [ProgramQuantityModel].
extension ProgramQuantityModelPatterns on ProgramQuantityModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProgramQuantityModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProgramQuantityModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProgramQuantityModel value)  $default,){
final _that = this;
switch (_that) {
case _ProgramQuantityModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProgramQuantityModel value)?  $default,){
final _that = this;
switch (_that) {
case _ProgramQuantityModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  String? uid,  int? programID,  int? quantityTypeID,  int? sequenceNo,  String? totalLength,  String? notes,  String? createdAt,  String? updatedAt,  QuantityTypeNestedModel? quantityType,  List<ProgramQuantityValueModel>? quantityValues,  List<ProgramQuantitySegmentModel>? segments)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProgramQuantityModel() when $default != null:
return $default(_that.id,_that.uid,_that.programID,_that.quantityTypeID,_that.sequenceNo,_that.totalLength,_that.notes,_that.createdAt,_that.updatedAt,_that.quantityType,_that.quantityValues,_that.segments);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  String? uid,  int? programID,  int? quantityTypeID,  int? sequenceNo,  String? totalLength,  String? notes,  String? createdAt,  String? updatedAt,  QuantityTypeNestedModel? quantityType,  List<ProgramQuantityValueModel>? quantityValues,  List<ProgramQuantitySegmentModel>? segments)  $default,) {final _that = this;
switch (_that) {
case _ProgramQuantityModel():
return $default(_that.id,_that.uid,_that.programID,_that.quantityTypeID,_that.sequenceNo,_that.totalLength,_that.notes,_that.createdAt,_that.updatedAt,_that.quantityType,_that.quantityValues,_that.segments);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  String? uid,  int? programID,  int? quantityTypeID,  int? sequenceNo,  String? totalLength,  String? notes,  String? createdAt,  String? updatedAt,  QuantityTypeNestedModel? quantityType,  List<ProgramQuantityValueModel>? quantityValues,  List<ProgramQuantitySegmentModel>? segments)?  $default,) {final _that = this;
switch (_that) {
case _ProgramQuantityModel() when $default != null:
return $default(_that.id,_that.uid,_that.programID,_that.quantityTypeID,_that.sequenceNo,_that.totalLength,_that.notes,_that.createdAt,_that.updatedAt,_that.quantityType,_that.quantityValues,_that.segments);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProgramQuantityModel implements ProgramQuantityModel {
  const _ProgramQuantityModel({this.id, this.uid, this.programID, this.quantityTypeID, this.sequenceNo, this.totalLength, this.notes, this.createdAt, this.updatedAt, this.quantityType, final  List<ProgramQuantityValueModel>? quantityValues, final  List<ProgramQuantitySegmentModel>? segments}): _quantityValues = quantityValues,_segments = segments;
  factory _ProgramQuantityModel.fromJson(Map<String, dynamic> json) => _$ProgramQuantityModelFromJson(json);

@override final  int? id;
@override final  String? uid;
@override final  int? programID;
@override final  int? quantityTypeID;
@override final  int? sequenceNo;
@override final  String? totalLength;
@override final  String? notes;
@override final  String? createdAt;
@override final  String? updatedAt;
@override final  QuantityTypeNestedModel? quantityType;
 final  List<ProgramQuantityValueModel>? _quantityValues;
@override List<ProgramQuantityValueModel>? get quantityValues {
  final value = _quantityValues;
  if (value == null) return null;
  if (_quantityValues is EqualUnmodifiableListView) return _quantityValues;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<ProgramQuantitySegmentModel>? _segments;
@override List<ProgramQuantitySegmentModel>? get segments {
  final value = _segments;
  if (value == null) return null;
  if (_segments is EqualUnmodifiableListView) return _segments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of ProgramQuantityModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProgramQuantityModelCopyWith<_ProgramQuantityModel> get copyWith => __$ProgramQuantityModelCopyWithImpl<_ProgramQuantityModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProgramQuantityModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProgramQuantityModel&&(identical(other.id, id) || other.id == id)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.programID, programID) || other.programID == programID)&&(identical(other.quantityTypeID, quantityTypeID) || other.quantityTypeID == quantityTypeID)&&(identical(other.sequenceNo, sequenceNo) || other.sequenceNo == sequenceNo)&&(identical(other.totalLength, totalLength) || other.totalLength == totalLength)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.quantityType, quantityType) || other.quantityType == quantityType)&&const DeepCollectionEquality().equals(other._quantityValues, _quantityValues)&&const DeepCollectionEquality().equals(other._segments, _segments));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,uid,programID,quantityTypeID,sequenceNo,totalLength,notes,createdAt,updatedAt,quantityType,const DeepCollectionEquality().hash(_quantityValues),const DeepCollectionEquality().hash(_segments));

@override
String toString() {
  return 'ProgramQuantityModel(id: $id, uid: $uid, programID: $programID, quantityTypeID: $quantityTypeID, sequenceNo: $sequenceNo, totalLength: $totalLength, notes: $notes, createdAt: $createdAt, updatedAt: $updatedAt, quantityType: $quantityType, quantityValues: $quantityValues, segments: $segments)';
}


}

/// @nodoc
abstract mixin class _$ProgramQuantityModelCopyWith<$Res> implements $ProgramQuantityModelCopyWith<$Res> {
  factory _$ProgramQuantityModelCopyWith(_ProgramQuantityModel value, $Res Function(_ProgramQuantityModel) _then) = __$ProgramQuantityModelCopyWithImpl;
@override @useResult
$Res call({
 int? id, String? uid, int? programID, int? quantityTypeID, int? sequenceNo, String? totalLength, String? notes, String? createdAt, String? updatedAt, QuantityTypeNestedModel? quantityType, List<ProgramQuantityValueModel>? quantityValues, List<ProgramQuantitySegmentModel>? segments
});


@override $QuantityTypeNestedModelCopyWith<$Res>? get quantityType;

}
/// @nodoc
class __$ProgramQuantityModelCopyWithImpl<$Res>
    implements _$ProgramQuantityModelCopyWith<$Res> {
  __$ProgramQuantityModelCopyWithImpl(this._self, this._then);

  final _ProgramQuantityModel _self;
  final $Res Function(_ProgramQuantityModel) _then;

/// Create a copy of ProgramQuantityModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? uid = freezed,Object? programID = freezed,Object? quantityTypeID = freezed,Object? sequenceNo = freezed,Object? totalLength = freezed,Object? notes = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? quantityType = freezed,Object? quantityValues = freezed,Object? segments = freezed,}) {
  return _then(_ProgramQuantityModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,uid: freezed == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String?,programID: freezed == programID ? _self.programID : programID // ignore: cast_nullable_to_non_nullable
as int?,quantityTypeID: freezed == quantityTypeID ? _self.quantityTypeID : quantityTypeID // ignore: cast_nullable_to_non_nullable
as int?,sequenceNo: freezed == sequenceNo ? _self.sequenceNo : sequenceNo // ignore: cast_nullable_to_non_nullable
as int?,totalLength: freezed == totalLength ? _self.totalLength : totalLength // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,quantityType: freezed == quantityType ? _self.quantityType : quantityType // ignore: cast_nullable_to_non_nullable
as QuantityTypeNestedModel?,quantityValues: freezed == quantityValues ? _self._quantityValues : quantityValues // ignore: cast_nullable_to_non_nullable
as List<ProgramQuantityValueModel>?,segments: freezed == segments ? _self._segments : segments // ignore: cast_nullable_to_non_nullable
as List<ProgramQuantitySegmentModel>?,
  ));
}

/// Create a copy of ProgramQuantityModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$QuantityTypeNestedModelCopyWith<$Res>? get quantityType {
    if (_self.quantityType == null) {
    return null;
  }

  return $QuantityTypeNestedModelCopyWith<$Res>(_self.quantityType!, (value) {
    return _then(_self.copyWith(quantityType: value));
  });
}
}


/// @nodoc
mixin _$ProgramQuantityValueModel {

 int? get id; int? get programQuantityID; int? get segmentID; int? get quantityFieldID; String? get value; String? get createdAt; String? get updatedAt; QuantityFieldNestedModel? get quantityField;
/// Create a copy of ProgramQuantityValueModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProgramQuantityValueModelCopyWith<ProgramQuantityValueModel> get copyWith => _$ProgramQuantityValueModelCopyWithImpl<ProgramQuantityValueModel>(this as ProgramQuantityValueModel, _$identity);

  /// Serializes this ProgramQuantityValueModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProgramQuantityValueModel&&(identical(other.id, id) || other.id == id)&&(identical(other.programQuantityID, programQuantityID) || other.programQuantityID == programQuantityID)&&(identical(other.segmentID, segmentID) || other.segmentID == segmentID)&&(identical(other.quantityFieldID, quantityFieldID) || other.quantityFieldID == quantityFieldID)&&(identical(other.value, value) || other.value == value)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.quantityField, quantityField) || other.quantityField == quantityField));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,programQuantityID,segmentID,quantityFieldID,value,createdAt,updatedAt,quantityField);

@override
String toString() {
  return 'ProgramQuantityValueModel(id: $id, programQuantityID: $programQuantityID, segmentID: $segmentID, quantityFieldID: $quantityFieldID, value: $value, createdAt: $createdAt, updatedAt: $updatedAt, quantityField: $quantityField)';
}


}

/// @nodoc
abstract mixin class $ProgramQuantityValueModelCopyWith<$Res>  {
  factory $ProgramQuantityValueModelCopyWith(ProgramQuantityValueModel value, $Res Function(ProgramQuantityValueModel) _then) = _$ProgramQuantityValueModelCopyWithImpl;
@useResult
$Res call({
 int? id, int? programQuantityID, int? segmentID, int? quantityFieldID, String? value, String? createdAt, String? updatedAt, QuantityFieldNestedModel? quantityField
});


$QuantityFieldNestedModelCopyWith<$Res>? get quantityField;

}
/// @nodoc
class _$ProgramQuantityValueModelCopyWithImpl<$Res>
    implements $ProgramQuantityValueModelCopyWith<$Res> {
  _$ProgramQuantityValueModelCopyWithImpl(this._self, this._then);

  final ProgramQuantityValueModel _self;
  final $Res Function(ProgramQuantityValueModel) _then;

/// Create a copy of ProgramQuantityValueModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? programQuantityID = freezed,Object? segmentID = freezed,Object? quantityFieldID = freezed,Object? value = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? quantityField = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,programQuantityID: freezed == programQuantityID ? _self.programQuantityID : programQuantityID // ignore: cast_nullable_to_non_nullable
as int?,segmentID: freezed == segmentID ? _self.segmentID : segmentID // ignore: cast_nullable_to_non_nullable
as int?,quantityFieldID: freezed == quantityFieldID ? _self.quantityFieldID : quantityFieldID // ignore: cast_nullable_to_non_nullable
as int?,value: freezed == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,quantityField: freezed == quantityField ? _self.quantityField : quantityField // ignore: cast_nullable_to_non_nullable
as QuantityFieldNestedModel?,
  ));
}
/// Create a copy of ProgramQuantityValueModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$QuantityFieldNestedModelCopyWith<$Res>? get quantityField {
    if (_self.quantityField == null) {
    return null;
  }

  return $QuantityFieldNestedModelCopyWith<$Res>(_self.quantityField!, (value) {
    return _then(_self.copyWith(quantityField: value));
  });
}
}


/// Adds pattern-matching-related methods to [ProgramQuantityValueModel].
extension ProgramQuantityValueModelPatterns on ProgramQuantityValueModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProgramQuantityValueModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProgramQuantityValueModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProgramQuantityValueModel value)  $default,){
final _that = this;
switch (_that) {
case _ProgramQuantityValueModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProgramQuantityValueModel value)?  $default,){
final _that = this;
switch (_that) {
case _ProgramQuantityValueModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  int? programQuantityID,  int? segmentID,  int? quantityFieldID,  String? value,  String? createdAt,  String? updatedAt,  QuantityFieldNestedModel? quantityField)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProgramQuantityValueModel() when $default != null:
return $default(_that.id,_that.programQuantityID,_that.segmentID,_that.quantityFieldID,_that.value,_that.createdAt,_that.updatedAt,_that.quantityField);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  int? programQuantityID,  int? segmentID,  int? quantityFieldID,  String? value,  String? createdAt,  String? updatedAt,  QuantityFieldNestedModel? quantityField)  $default,) {final _that = this;
switch (_that) {
case _ProgramQuantityValueModel():
return $default(_that.id,_that.programQuantityID,_that.segmentID,_that.quantityFieldID,_that.value,_that.createdAt,_that.updatedAt,_that.quantityField);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  int? programQuantityID,  int? segmentID,  int? quantityFieldID,  String? value,  String? createdAt,  String? updatedAt,  QuantityFieldNestedModel? quantityField)?  $default,) {final _that = this;
switch (_that) {
case _ProgramQuantityValueModel() when $default != null:
return $default(_that.id,_that.programQuantityID,_that.segmentID,_that.quantityFieldID,_that.value,_that.createdAt,_that.updatedAt,_that.quantityField);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProgramQuantityValueModel implements ProgramQuantityValueModel {
  const _ProgramQuantityValueModel({this.id, this.programQuantityID, this.segmentID, this.quantityFieldID, this.value, this.createdAt, this.updatedAt, this.quantityField});
  factory _ProgramQuantityValueModel.fromJson(Map<String, dynamic> json) => _$ProgramQuantityValueModelFromJson(json);

@override final  int? id;
@override final  int? programQuantityID;
@override final  int? segmentID;
@override final  int? quantityFieldID;
@override final  String? value;
@override final  String? createdAt;
@override final  String? updatedAt;
@override final  QuantityFieldNestedModel? quantityField;

/// Create a copy of ProgramQuantityValueModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProgramQuantityValueModelCopyWith<_ProgramQuantityValueModel> get copyWith => __$ProgramQuantityValueModelCopyWithImpl<_ProgramQuantityValueModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProgramQuantityValueModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProgramQuantityValueModel&&(identical(other.id, id) || other.id == id)&&(identical(other.programQuantityID, programQuantityID) || other.programQuantityID == programQuantityID)&&(identical(other.segmentID, segmentID) || other.segmentID == segmentID)&&(identical(other.quantityFieldID, quantityFieldID) || other.quantityFieldID == quantityFieldID)&&(identical(other.value, value) || other.value == value)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.quantityField, quantityField) || other.quantityField == quantityField));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,programQuantityID,segmentID,quantityFieldID,value,createdAt,updatedAt,quantityField);

@override
String toString() {
  return 'ProgramQuantityValueModel(id: $id, programQuantityID: $programQuantityID, segmentID: $segmentID, quantityFieldID: $quantityFieldID, value: $value, createdAt: $createdAt, updatedAt: $updatedAt, quantityField: $quantityField)';
}


}

/// @nodoc
abstract mixin class _$ProgramQuantityValueModelCopyWith<$Res> implements $ProgramQuantityValueModelCopyWith<$Res> {
  factory _$ProgramQuantityValueModelCopyWith(_ProgramQuantityValueModel value, $Res Function(_ProgramQuantityValueModel) _then) = __$ProgramQuantityValueModelCopyWithImpl;
@override @useResult
$Res call({
 int? id, int? programQuantityID, int? segmentID, int? quantityFieldID, String? value, String? createdAt, String? updatedAt, QuantityFieldNestedModel? quantityField
});


@override $QuantityFieldNestedModelCopyWith<$Res>? get quantityField;

}
/// @nodoc
class __$ProgramQuantityValueModelCopyWithImpl<$Res>
    implements _$ProgramQuantityValueModelCopyWith<$Res> {
  __$ProgramQuantityValueModelCopyWithImpl(this._self, this._then);

  final _ProgramQuantityValueModel _self;
  final $Res Function(_ProgramQuantityValueModel) _then;

/// Create a copy of ProgramQuantityValueModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? programQuantityID = freezed,Object? segmentID = freezed,Object? quantityFieldID = freezed,Object? value = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? quantityField = freezed,}) {
  return _then(_ProgramQuantityValueModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,programQuantityID: freezed == programQuantityID ? _self.programQuantityID : programQuantityID // ignore: cast_nullable_to_non_nullable
as int?,segmentID: freezed == segmentID ? _self.segmentID : segmentID // ignore: cast_nullable_to_non_nullable
as int?,quantityFieldID: freezed == quantityFieldID ? _self.quantityFieldID : quantityFieldID // ignore: cast_nullable_to_non_nullable
as int?,value: freezed == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,quantityField: freezed == quantityField ? _self.quantityField : quantityField // ignore: cast_nullable_to_non_nullable
as QuantityFieldNestedModel?,
  ));
}

/// Create a copy of ProgramQuantityValueModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$QuantityFieldNestedModelCopyWith<$Res>? get quantityField {
    if (_self.quantityField == null) {
    return null;
  }

  return $QuantityFieldNestedModelCopyWith<$Res>(_self.quantityField!, (value) {
    return _then(_self.copyWith(quantityField: value));
  });
}
}


/// @nodoc
mixin _$ProgramQuantitySegmentModel {

 int? get id; int? get programQuantityID; int? get segmentNumber; String? get startDistance; String? get endDistance; String? get createdAt; String? get updatedAt; List<ProgramQuantityValueModel>? get segmentValues;
/// Create a copy of ProgramQuantitySegmentModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProgramQuantitySegmentModelCopyWith<ProgramQuantitySegmentModel> get copyWith => _$ProgramQuantitySegmentModelCopyWithImpl<ProgramQuantitySegmentModel>(this as ProgramQuantitySegmentModel, _$identity);

  /// Serializes this ProgramQuantitySegmentModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProgramQuantitySegmentModel&&(identical(other.id, id) || other.id == id)&&(identical(other.programQuantityID, programQuantityID) || other.programQuantityID == programQuantityID)&&(identical(other.segmentNumber, segmentNumber) || other.segmentNumber == segmentNumber)&&(identical(other.startDistance, startDistance) || other.startDistance == startDistance)&&(identical(other.endDistance, endDistance) || other.endDistance == endDistance)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other.segmentValues, segmentValues));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,programQuantityID,segmentNumber,startDistance,endDistance,createdAt,updatedAt,const DeepCollectionEquality().hash(segmentValues));

@override
String toString() {
  return 'ProgramQuantitySegmentModel(id: $id, programQuantityID: $programQuantityID, segmentNumber: $segmentNumber, startDistance: $startDistance, endDistance: $endDistance, createdAt: $createdAt, updatedAt: $updatedAt, segmentValues: $segmentValues)';
}


}

/// @nodoc
abstract mixin class $ProgramQuantitySegmentModelCopyWith<$Res>  {
  factory $ProgramQuantitySegmentModelCopyWith(ProgramQuantitySegmentModel value, $Res Function(ProgramQuantitySegmentModel) _then) = _$ProgramQuantitySegmentModelCopyWithImpl;
@useResult
$Res call({
 int? id, int? programQuantityID, int? segmentNumber, String? startDistance, String? endDistance, String? createdAt, String? updatedAt, List<ProgramQuantityValueModel>? segmentValues
});




}
/// @nodoc
class _$ProgramQuantitySegmentModelCopyWithImpl<$Res>
    implements $ProgramQuantitySegmentModelCopyWith<$Res> {
  _$ProgramQuantitySegmentModelCopyWithImpl(this._self, this._then);

  final ProgramQuantitySegmentModel _self;
  final $Res Function(ProgramQuantitySegmentModel) _then;

/// Create a copy of ProgramQuantitySegmentModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? programQuantityID = freezed,Object? segmentNumber = freezed,Object? startDistance = freezed,Object? endDistance = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? segmentValues = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,programQuantityID: freezed == programQuantityID ? _self.programQuantityID : programQuantityID // ignore: cast_nullable_to_non_nullable
as int?,segmentNumber: freezed == segmentNumber ? _self.segmentNumber : segmentNumber // ignore: cast_nullable_to_non_nullable
as int?,startDistance: freezed == startDistance ? _self.startDistance : startDistance // ignore: cast_nullable_to_non_nullable
as String?,endDistance: freezed == endDistance ? _self.endDistance : endDistance // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,segmentValues: freezed == segmentValues ? _self.segmentValues : segmentValues // ignore: cast_nullable_to_non_nullable
as List<ProgramQuantityValueModel>?,
  ));
}

}


/// Adds pattern-matching-related methods to [ProgramQuantitySegmentModel].
extension ProgramQuantitySegmentModelPatterns on ProgramQuantitySegmentModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProgramQuantitySegmentModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProgramQuantitySegmentModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProgramQuantitySegmentModel value)  $default,){
final _that = this;
switch (_that) {
case _ProgramQuantitySegmentModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProgramQuantitySegmentModel value)?  $default,){
final _that = this;
switch (_that) {
case _ProgramQuantitySegmentModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  int? programQuantityID,  int? segmentNumber,  String? startDistance,  String? endDistance,  String? createdAt,  String? updatedAt,  List<ProgramQuantityValueModel>? segmentValues)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProgramQuantitySegmentModel() when $default != null:
return $default(_that.id,_that.programQuantityID,_that.segmentNumber,_that.startDistance,_that.endDistance,_that.createdAt,_that.updatedAt,_that.segmentValues);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  int? programQuantityID,  int? segmentNumber,  String? startDistance,  String? endDistance,  String? createdAt,  String? updatedAt,  List<ProgramQuantityValueModel>? segmentValues)  $default,) {final _that = this;
switch (_that) {
case _ProgramQuantitySegmentModel():
return $default(_that.id,_that.programQuantityID,_that.segmentNumber,_that.startDistance,_that.endDistance,_that.createdAt,_that.updatedAt,_that.segmentValues);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  int? programQuantityID,  int? segmentNumber,  String? startDistance,  String? endDistance,  String? createdAt,  String? updatedAt,  List<ProgramQuantityValueModel>? segmentValues)?  $default,) {final _that = this;
switch (_that) {
case _ProgramQuantitySegmentModel() when $default != null:
return $default(_that.id,_that.programQuantityID,_that.segmentNumber,_that.startDistance,_that.endDistance,_that.createdAt,_that.updatedAt,_that.segmentValues);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProgramQuantitySegmentModel implements ProgramQuantitySegmentModel {
  const _ProgramQuantitySegmentModel({this.id, this.programQuantityID, this.segmentNumber, this.startDistance, this.endDistance, this.createdAt, this.updatedAt, final  List<ProgramQuantityValueModel>? segmentValues}): _segmentValues = segmentValues;
  factory _ProgramQuantitySegmentModel.fromJson(Map<String, dynamic> json) => _$ProgramQuantitySegmentModelFromJson(json);

@override final  int? id;
@override final  int? programQuantityID;
@override final  int? segmentNumber;
@override final  String? startDistance;
@override final  String? endDistance;
@override final  String? createdAt;
@override final  String? updatedAt;
 final  List<ProgramQuantityValueModel>? _segmentValues;
@override List<ProgramQuantityValueModel>? get segmentValues {
  final value = _segmentValues;
  if (value == null) return null;
  if (_segmentValues is EqualUnmodifiableListView) return _segmentValues;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of ProgramQuantitySegmentModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProgramQuantitySegmentModelCopyWith<_ProgramQuantitySegmentModel> get copyWith => __$ProgramQuantitySegmentModelCopyWithImpl<_ProgramQuantitySegmentModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProgramQuantitySegmentModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProgramQuantitySegmentModel&&(identical(other.id, id) || other.id == id)&&(identical(other.programQuantityID, programQuantityID) || other.programQuantityID == programQuantityID)&&(identical(other.segmentNumber, segmentNumber) || other.segmentNumber == segmentNumber)&&(identical(other.startDistance, startDistance) || other.startDistance == startDistance)&&(identical(other.endDistance, endDistance) || other.endDistance == endDistance)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other._segmentValues, _segmentValues));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,programQuantityID,segmentNumber,startDistance,endDistance,createdAt,updatedAt,const DeepCollectionEquality().hash(_segmentValues));

@override
String toString() {
  return 'ProgramQuantitySegmentModel(id: $id, programQuantityID: $programQuantityID, segmentNumber: $segmentNumber, startDistance: $startDistance, endDistance: $endDistance, createdAt: $createdAt, updatedAt: $updatedAt, segmentValues: $segmentValues)';
}


}

/// @nodoc
abstract mixin class _$ProgramQuantitySegmentModelCopyWith<$Res> implements $ProgramQuantitySegmentModelCopyWith<$Res> {
  factory _$ProgramQuantitySegmentModelCopyWith(_ProgramQuantitySegmentModel value, $Res Function(_ProgramQuantitySegmentModel) _then) = __$ProgramQuantitySegmentModelCopyWithImpl;
@override @useResult
$Res call({
 int? id, int? programQuantityID, int? segmentNumber, String? startDistance, String? endDistance, String? createdAt, String? updatedAt, List<ProgramQuantityValueModel>? segmentValues
});




}
/// @nodoc
class __$ProgramQuantitySegmentModelCopyWithImpl<$Res>
    implements _$ProgramQuantitySegmentModelCopyWith<$Res> {
  __$ProgramQuantitySegmentModelCopyWithImpl(this._self, this._then);

  final _ProgramQuantitySegmentModel _self;
  final $Res Function(_ProgramQuantitySegmentModel) _then;

/// Create a copy of ProgramQuantitySegmentModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? programQuantityID = freezed,Object? segmentNumber = freezed,Object? startDistance = freezed,Object? endDistance = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? segmentValues = freezed,}) {
  return _then(_ProgramQuantitySegmentModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,programQuantityID: freezed == programQuantityID ? _self.programQuantityID : programQuantityID // ignore: cast_nullable_to_non_nullable
as int?,segmentNumber: freezed == segmentNumber ? _self.segmentNumber : segmentNumber // ignore: cast_nullable_to_non_nullable
as int?,startDistance: freezed == startDistance ? _self.startDistance : startDistance // ignore: cast_nullable_to_non_nullable
as String?,endDistance: freezed == endDistance ? _self.endDistance : endDistance // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,segmentValues: freezed == segmentValues ? _self._segmentValues : segmentValues // ignore: cast_nullable_to_non_nullable
as List<ProgramQuantityValueModel>?,
  ));
}


}

// dart format on
