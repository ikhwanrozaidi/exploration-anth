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

 int? get id; String? get uid; int? get programID; int? get quantityTypeID; int? get sequenceNo; String? get totalLength; String? get notes; String? get createdAt; String? get updatedAt; QuantityTypeNestedModel? get quantityType; List<Map<String, dynamic>>? get quantityValues; List<Map<String, dynamic>>? get segments;
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
 int? id, String? uid, int? programID, int? quantityTypeID, int? sequenceNo, String? totalLength, String? notes, String? createdAt, String? updatedAt, QuantityTypeNestedModel? quantityType, List<Map<String, dynamic>>? quantityValues, List<Map<String, dynamic>>? segments
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
as List<Map<String, dynamic>>?,segments: freezed == segments ? _self.segments : segments // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>?,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  String? uid,  int? programID,  int? quantityTypeID,  int? sequenceNo,  String? totalLength,  String? notes,  String? createdAt,  String? updatedAt,  QuantityTypeNestedModel? quantityType,  List<Map<String, dynamic>>? quantityValues,  List<Map<String, dynamic>>? segments)?  $default,{required TResult orElse(),}) {final _that = this;
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  String? uid,  int? programID,  int? quantityTypeID,  int? sequenceNo,  String? totalLength,  String? notes,  String? createdAt,  String? updatedAt,  QuantityTypeNestedModel? quantityType,  List<Map<String, dynamic>>? quantityValues,  List<Map<String, dynamic>>? segments)  $default,) {final _that = this;
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  String? uid,  int? programID,  int? quantityTypeID,  int? sequenceNo,  String? totalLength,  String? notes,  String? createdAt,  String? updatedAt,  QuantityTypeNestedModel? quantityType,  List<Map<String, dynamic>>? quantityValues,  List<Map<String, dynamic>>? segments)?  $default,) {final _that = this;
switch (_that) {
case _ProgramQuantityModel() when $default != null:
return $default(_that.id,_that.uid,_that.programID,_that.quantityTypeID,_that.sequenceNo,_that.totalLength,_that.notes,_that.createdAt,_that.updatedAt,_that.quantityType,_that.quantityValues,_that.segments);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProgramQuantityModel extends ProgramQuantityModel {
  const _ProgramQuantityModel({this.id, this.uid, this.programID, this.quantityTypeID, this.sequenceNo, this.totalLength, this.notes, this.createdAt, this.updatedAt, this.quantityType, final  List<Map<String, dynamic>>? quantityValues, final  List<Map<String, dynamic>>? segments}): _quantityValues = quantityValues,_segments = segments,super._();
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
 final  List<Map<String, dynamic>>? _quantityValues;
@override List<Map<String, dynamic>>? get quantityValues {
  final value = _quantityValues;
  if (value == null) return null;
  if (_quantityValues is EqualUnmodifiableListView) return _quantityValues;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<Map<String, dynamic>>? _segments;
@override List<Map<String, dynamic>>? get segments {
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
 int? id, String? uid, int? programID, int? quantityTypeID, int? sequenceNo, String? totalLength, String? notes, String? createdAt, String? updatedAt, QuantityTypeNestedModel? quantityType, List<Map<String, dynamic>>? quantityValues, List<Map<String, dynamic>>? segments
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
as List<Map<String, dynamic>>?,segments: freezed == segments ? _self._segments : segments // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>?,
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

// dart format on
