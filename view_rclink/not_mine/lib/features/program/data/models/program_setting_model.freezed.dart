// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'program_setting_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProgramSettingModel {

 int? get id; String? get uid; int? get companyID; int? get workScopeID; String? get calculationType;// SECTION_BASED, FIXED_COUNT
 String? get inputLabel; String? get inputValue; String? get dividerValue; String? get dividerLabel; String? get unitMeasurement;// METER, NUMBER
 bool? get photoRequired; bool? get isActive; int? get createdByID; String? get createdAt; String? get updatedAt; String? get deletedAt; WorkScopeNestedModel? get workScope; CreatedByNestedModel? get createdBy; List<QuantityTypeNestedModel>? get quantityTypes;
/// Create a copy of ProgramSettingModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProgramSettingModelCopyWith<ProgramSettingModel> get copyWith => _$ProgramSettingModelCopyWithImpl<ProgramSettingModel>(this as ProgramSettingModel, _$identity);

  /// Serializes this ProgramSettingModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProgramSettingModel&&(identical(other.id, id) || other.id == id)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.companyID, companyID) || other.companyID == companyID)&&(identical(other.workScopeID, workScopeID) || other.workScopeID == workScopeID)&&(identical(other.calculationType, calculationType) || other.calculationType == calculationType)&&(identical(other.inputLabel, inputLabel) || other.inputLabel == inputLabel)&&(identical(other.inputValue, inputValue) || other.inputValue == inputValue)&&(identical(other.dividerValue, dividerValue) || other.dividerValue == dividerValue)&&(identical(other.dividerLabel, dividerLabel) || other.dividerLabel == dividerLabel)&&(identical(other.unitMeasurement, unitMeasurement) || other.unitMeasurement == unitMeasurement)&&(identical(other.photoRequired, photoRequired) || other.photoRequired == photoRequired)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.createdByID, createdByID) || other.createdByID == createdByID)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt)&&(identical(other.workScope, workScope) || other.workScope == workScope)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&const DeepCollectionEquality().equals(other.quantityTypes, quantityTypes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,uid,companyID,workScopeID,calculationType,inputLabel,inputValue,dividerValue,dividerLabel,unitMeasurement,photoRequired,isActive,createdByID,createdAt,updatedAt,deletedAt,workScope,createdBy,const DeepCollectionEquality().hash(quantityTypes)]);

@override
String toString() {
  return 'ProgramSettingModel(id: $id, uid: $uid, companyID: $companyID, workScopeID: $workScopeID, calculationType: $calculationType, inputLabel: $inputLabel, inputValue: $inputValue, dividerValue: $dividerValue, dividerLabel: $dividerLabel, unitMeasurement: $unitMeasurement, photoRequired: $photoRequired, isActive: $isActive, createdByID: $createdByID, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt, workScope: $workScope, createdBy: $createdBy, quantityTypes: $quantityTypes)';
}


}

/// @nodoc
abstract mixin class $ProgramSettingModelCopyWith<$Res>  {
  factory $ProgramSettingModelCopyWith(ProgramSettingModel value, $Res Function(ProgramSettingModel) _then) = _$ProgramSettingModelCopyWithImpl;
@useResult
$Res call({
 int? id, String? uid, int? companyID, int? workScopeID, String? calculationType, String? inputLabel, String? inputValue, String? dividerValue, String? dividerLabel, String? unitMeasurement, bool? photoRequired, bool? isActive, int? createdByID, String? createdAt, String? updatedAt, String? deletedAt, WorkScopeNestedModel? workScope, CreatedByNestedModel? createdBy, List<QuantityTypeNestedModel>? quantityTypes
});


$WorkScopeNestedModelCopyWith<$Res>? get workScope;$CreatedByNestedModelCopyWith<$Res>? get createdBy;

}
/// @nodoc
class _$ProgramSettingModelCopyWithImpl<$Res>
    implements $ProgramSettingModelCopyWith<$Res> {
  _$ProgramSettingModelCopyWithImpl(this._self, this._then);

  final ProgramSettingModel _self;
  final $Res Function(ProgramSettingModel) _then;

/// Create a copy of ProgramSettingModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? uid = freezed,Object? companyID = freezed,Object? workScopeID = freezed,Object? calculationType = freezed,Object? inputLabel = freezed,Object? inputValue = freezed,Object? dividerValue = freezed,Object? dividerLabel = freezed,Object? unitMeasurement = freezed,Object? photoRequired = freezed,Object? isActive = freezed,Object? createdByID = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? deletedAt = freezed,Object? workScope = freezed,Object? createdBy = freezed,Object? quantityTypes = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,uid: freezed == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String?,companyID: freezed == companyID ? _self.companyID : companyID // ignore: cast_nullable_to_non_nullable
as int?,workScopeID: freezed == workScopeID ? _self.workScopeID : workScopeID // ignore: cast_nullable_to_non_nullable
as int?,calculationType: freezed == calculationType ? _self.calculationType : calculationType // ignore: cast_nullable_to_non_nullable
as String?,inputLabel: freezed == inputLabel ? _self.inputLabel : inputLabel // ignore: cast_nullable_to_non_nullable
as String?,inputValue: freezed == inputValue ? _self.inputValue : inputValue // ignore: cast_nullable_to_non_nullable
as String?,dividerValue: freezed == dividerValue ? _self.dividerValue : dividerValue // ignore: cast_nullable_to_non_nullable
as String?,dividerLabel: freezed == dividerLabel ? _self.dividerLabel : dividerLabel // ignore: cast_nullable_to_non_nullable
as String?,unitMeasurement: freezed == unitMeasurement ? _self.unitMeasurement : unitMeasurement // ignore: cast_nullable_to_non_nullable
as String?,photoRequired: freezed == photoRequired ? _self.photoRequired : photoRequired // ignore: cast_nullable_to_non_nullable
as bool?,isActive: freezed == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool?,createdByID: freezed == createdByID ? _self.createdByID : createdByID // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as String?,workScope: freezed == workScope ? _self.workScope : workScope // ignore: cast_nullable_to_non_nullable
as WorkScopeNestedModel?,createdBy: freezed == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as CreatedByNestedModel?,quantityTypes: freezed == quantityTypes ? _self.quantityTypes : quantityTypes // ignore: cast_nullable_to_non_nullable
as List<QuantityTypeNestedModel>?,
  ));
}
/// Create a copy of ProgramSettingModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WorkScopeNestedModelCopyWith<$Res>? get workScope {
    if (_self.workScope == null) {
    return null;
  }

  return $WorkScopeNestedModelCopyWith<$Res>(_self.workScope!, (value) {
    return _then(_self.copyWith(workScope: value));
  });
}/// Create a copy of ProgramSettingModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CreatedByNestedModelCopyWith<$Res>? get createdBy {
    if (_self.createdBy == null) {
    return null;
  }

  return $CreatedByNestedModelCopyWith<$Res>(_self.createdBy!, (value) {
    return _then(_self.copyWith(createdBy: value));
  });
}
}


/// Adds pattern-matching-related methods to [ProgramSettingModel].
extension ProgramSettingModelPatterns on ProgramSettingModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProgramSettingModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProgramSettingModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProgramSettingModel value)  $default,){
final _that = this;
switch (_that) {
case _ProgramSettingModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProgramSettingModel value)?  $default,){
final _that = this;
switch (_that) {
case _ProgramSettingModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  String? uid,  int? companyID,  int? workScopeID,  String? calculationType,  String? inputLabel,  String? inputValue,  String? dividerValue,  String? dividerLabel,  String? unitMeasurement,  bool? photoRequired,  bool? isActive,  int? createdByID,  String? createdAt,  String? updatedAt,  String? deletedAt,  WorkScopeNestedModel? workScope,  CreatedByNestedModel? createdBy,  List<QuantityTypeNestedModel>? quantityTypes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProgramSettingModel() when $default != null:
return $default(_that.id,_that.uid,_that.companyID,_that.workScopeID,_that.calculationType,_that.inputLabel,_that.inputValue,_that.dividerValue,_that.dividerLabel,_that.unitMeasurement,_that.photoRequired,_that.isActive,_that.createdByID,_that.createdAt,_that.updatedAt,_that.deletedAt,_that.workScope,_that.createdBy,_that.quantityTypes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  String? uid,  int? companyID,  int? workScopeID,  String? calculationType,  String? inputLabel,  String? inputValue,  String? dividerValue,  String? dividerLabel,  String? unitMeasurement,  bool? photoRequired,  bool? isActive,  int? createdByID,  String? createdAt,  String? updatedAt,  String? deletedAt,  WorkScopeNestedModel? workScope,  CreatedByNestedModel? createdBy,  List<QuantityTypeNestedModel>? quantityTypes)  $default,) {final _that = this;
switch (_that) {
case _ProgramSettingModel():
return $default(_that.id,_that.uid,_that.companyID,_that.workScopeID,_that.calculationType,_that.inputLabel,_that.inputValue,_that.dividerValue,_that.dividerLabel,_that.unitMeasurement,_that.photoRequired,_that.isActive,_that.createdByID,_that.createdAt,_that.updatedAt,_that.deletedAt,_that.workScope,_that.createdBy,_that.quantityTypes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  String? uid,  int? companyID,  int? workScopeID,  String? calculationType,  String? inputLabel,  String? inputValue,  String? dividerValue,  String? dividerLabel,  String? unitMeasurement,  bool? photoRequired,  bool? isActive,  int? createdByID,  String? createdAt,  String? updatedAt,  String? deletedAt,  WorkScopeNestedModel? workScope,  CreatedByNestedModel? createdBy,  List<QuantityTypeNestedModel>? quantityTypes)?  $default,) {final _that = this;
switch (_that) {
case _ProgramSettingModel() when $default != null:
return $default(_that.id,_that.uid,_that.companyID,_that.workScopeID,_that.calculationType,_that.inputLabel,_that.inputValue,_that.dividerValue,_that.dividerLabel,_that.unitMeasurement,_that.photoRequired,_that.isActive,_that.createdByID,_that.createdAt,_that.updatedAt,_that.deletedAt,_that.workScope,_that.createdBy,_that.quantityTypes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProgramSettingModel implements ProgramSettingModel {
  const _ProgramSettingModel({this.id, this.uid, this.companyID, this.workScopeID, this.calculationType, this.inputLabel, this.inputValue, this.dividerValue, this.dividerLabel, this.unitMeasurement, this.photoRequired, this.isActive, this.createdByID, this.createdAt, this.updatedAt, this.deletedAt, this.workScope, this.createdBy, final  List<QuantityTypeNestedModel>? quantityTypes}): _quantityTypes = quantityTypes;
  factory _ProgramSettingModel.fromJson(Map<String, dynamic> json) => _$ProgramSettingModelFromJson(json);

@override final  int? id;
@override final  String? uid;
@override final  int? companyID;
@override final  int? workScopeID;
@override final  String? calculationType;
// SECTION_BASED, FIXED_COUNT
@override final  String? inputLabel;
@override final  String? inputValue;
@override final  String? dividerValue;
@override final  String? dividerLabel;
@override final  String? unitMeasurement;
// METER, NUMBER
@override final  bool? photoRequired;
@override final  bool? isActive;
@override final  int? createdByID;
@override final  String? createdAt;
@override final  String? updatedAt;
@override final  String? deletedAt;
@override final  WorkScopeNestedModel? workScope;
@override final  CreatedByNestedModel? createdBy;
 final  List<QuantityTypeNestedModel>? _quantityTypes;
@override List<QuantityTypeNestedModel>? get quantityTypes {
  final value = _quantityTypes;
  if (value == null) return null;
  if (_quantityTypes is EqualUnmodifiableListView) return _quantityTypes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of ProgramSettingModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProgramSettingModelCopyWith<_ProgramSettingModel> get copyWith => __$ProgramSettingModelCopyWithImpl<_ProgramSettingModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProgramSettingModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProgramSettingModel&&(identical(other.id, id) || other.id == id)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.companyID, companyID) || other.companyID == companyID)&&(identical(other.workScopeID, workScopeID) || other.workScopeID == workScopeID)&&(identical(other.calculationType, calculationType) || other.calculationType == calculationType)&&(identical(other.inputLabel, inputLabel) || other.inputLabel == inputLabel)&&(identical(other.inputValue, inputValue) || other.inputValue == inputValue)&&(identical(other.dividerValue, dividerValue) || other.dividerValue == dividerValue)&&(identical(other.dividerLabel, dividerLabel) || other.dividerLabel == dividerLabel)&&(identical(other.unitMeasurement, unitMeasurement) || other.unitMeasurement == unitMeasurement)&&(identical(other.photoRequired, photoRequired) || other.photoRequired == photoRequired)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.createdByID, createdByID) || other.createdByID == createdByID)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt)&&(identical(other.workScope, workScope) || other.workScope == workScope)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&const DeepCollectionEquality().equals(other._quantityTypes, _quantityTypes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,uid,companyID,workScopeID,calculationType,inputLabel,inputValue,dividerValue,dividerLabel,unitMeasurement,photoRequired,isActive,createdByID,createdAt,updatedAt,deletedAt,workScope,createdBy,const DeepCollectionEquality().hash(_quantityTypes)]);

@override
String toString() {
  return 'ProgramSettingModel(id: $id, uid: $uid, companyID: $companyID, workScopeID: $workScopeID, calculationType: $calculationType, inputLabel: $inputLabel, inputValue: $inputValue, dividerValue: $dividerValue, dividerLabel: $dividerLabel, unitMeasurement: $unitMeasurement, photoRequired: $photoRequired, isActive: $isActive, createdByID: $createdByID, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt, workScope: $workScope, createdBy: $createdBy, quantityTypes: $quantityTypes)';
}


}

/// @nodoc
abstract mixin class _$ProgramSettingModelCopyWith<$Res> implements $ProgramSettingModelCopyWith<$Res> {
  factory _$ProgramSettingModelCopyWith(_ProgramSettingModel value, $Res Function(_ProgramSettingModel) _then) = __$ProgramSettingModelCopyWithImpl;
@override @useResult
$Res call({
 int? id, String? uid, int? companyID, int? workScopeID, String? calculationType, String? inputLabel, String? inputValue, String? dividerValue, String? dividerLabel, String? unitMeasurement, bool? photoRequired, bool? isActive, int? createdByID, String? createdAt, String? updatedAt, String? deletedAt, WorkScopeNestedModel? workScope, CreatedByNestedModel? createdBy, List<QuantityTypeNestedModel>? quantityTypes
});


@override $WorkScopeNestedModelCopyWith<$Res>? get workScope;@override $CreatedByNestedModelCopyWith<$Res>? get createdBy;

}
/// @nodoc
class __$ProgramSettingModelCopyWithImpl<$Res>
    implements _$ProgramSettingModelCopyWith<$Res> {
  __$ProgramSettingModelCopyWithImpl(this._self, this._then);

  final _ProgramSettingModel _self;
  final $Res Function(_ProgramSettingModel) _then;

/// Create a copy of ProgramSettingModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? uid = freezed,Object? companyID = freezed,Object? workScopeID = freezed,Object? calculationType = freezed,Object? inputLabel = freezed,Object? inputValue = freezed,Object? dividerValue = freezed,Object? dividerLabel = freezed,Object? unitMeasurement = freezed,Object? photoRequired = freezed,Object? isActive = freezed,Object? createdByID = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? deletedAt = freezed,Object? workScope = freezed,Object? createdBy = freezed,Object? quantityTypes = freezed,}) {
  return _then(_ProgramSettingModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,uid: freezed == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String?,companyID: freezed == companyID ? _self.companyID : companyID // ignore: cast_nullable_to_non_nullable
as int?,workScopeID: freezed == workScopeID ? _self.workScopeID : workScopeID // ignore: cast_nullable_to_non_nullable
as int?,calculationType: freezed == calculationType ? _self.calculationType : calculationType // ignore: cast_nullable_to_non_nullable
as String?,inputLabel: freezed == inputLabel ? _self.inputLabel : inputLabel // ignore: cast_nullable_to_non_nullable
as String?,inputValue: freezed == inputValue ? _self.inputValue : inputValue // ignore: cast_nullable_to_non_nullable
as String?,dividerValue: freezed == dividerValue ? _self.dividerValue : dividerValue // ignore: cast_nullable_to_non_nullable
as String?,dividerLabel: freezed == dividerLabel ? _self.dividerLabel : dividerLabel // ignore: cast_nullable_to_non_nullable
as String?,unitMeasurement: freezed == unitMeasurement ? _self.unitMeasurement : unitMeasurement // ignore: cast_nullable_to_non_nullable
as String?,photoRequired: freezed == photoRequired ? _self.photoRequired : photoRequired // ignore: cast_nullable_to_non_nullable
as bool?,isActive: freezed == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool?,createdByID: freezed == createdByID ? _self.createdByID : createdByID // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as String?,workScope: freezed == workScope ? _self.workScope : workScope // ignore: cast_nullable_to_non_nullable
as WorkScopeNestedModel?,createdBy: freezed == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as CreatedByNestedModel?,quantityTypes: freezed == quantityTypes ? _self._quantityTypes : quantityTypes // ignore: cast_nullable_to_non_nullable
as List<QuantityTypeNestedModel>?,
  ));
}

/// Create a copy of ProgramSettingModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WorkScopeNestedModelCopyWith<$Res>? get workScope {
    if (_self.workScope == null) {
    return null;
  }

  return $WorkScopeNestedModelCopyWith<$Res>(_self.workScope!, (value) {
    return _then(_self.copyWith(workScope: value));
  });
}/// Create a copy of ProgramSettingModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CreatedByNestedModelCopyWith<$Res>? get createdBy {
    if (_self.createdBy == null) {
    return null;
  }

  return $CreatedByNestedModelCopyWith<$Res>(_self.createdBy!, (value) {
    return _then(_self.copyWith(createdBy: value));
  });
}
}

// dart format on
