// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'submit_program_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SubmitProgramRequestModel {

 String get workScopeUID; List<RoadInputModel> get roads; List<PeriodModel> get periods; String? get contractRelationUID; String get name; String get description; double? get latitude; double? get longitude; List<QuantityInputModel>? get quantities;
/// Create a copy of SubmitProgramRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SubmitProgramRequestModelCopyWith<SubmitProgramRequestModel> get copyWith => _$SubmitProgramRequestModelCopyWithImpl<SubmitProgramRequestModel>(this as SubmitProgramRequestModel, _$identity);

  /// Serializes this SubmitProgramRequestModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubmitProgramRequestModel&&(identical(other.workScopeUID, workScopeUID) || other.workScopeUID == workScopeUID)&&const DeepCollectionEquality().equals(other.roads, roads)&&const DeepCollectionEquality().equals(other.periods, periods)&&(identical(other.contractRelationUID, contractRelationUID) || other.contractRelationUID == contractRelationUID)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&const DeepCollectionEquality().equals(other.quantities, quantities));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,workScopeUID,const DeepCollectionEquality().hash(roads),const DeepCollectionEquality().hash(periods),contractRelationUID,name,description,latitude,longitude,const DeepCollectionEquality().hash(quantities));

@override
String toString() {
  return 'SubmitProgramRequestModel(workScopeUID: $workScopeUID, roads: $roads, periods: $periods, contractRelationUID: $contractRelationUID, name: $name, description: $description, latitude: $latitude, longitude: $longitude, quantities: $quantities)';
}


}

/// @nodoc
abstract mixin class $SubmitProgramRequestModelCopyWith<$Res>  {
  factory $SubmitProgramRequestModelCopyWith(SubmitProgramRequestModel value, $Res Function(SubmitProgramRequestModel) _then) = _$SubmitProgramRequestModelCopyWithImpl;
@useResult
$Res call({
 String workScopeUID, List<RoadInputModel> roads, List<PeriodModel> periods, String? contractRelationUID, String name, String description, double? latitude, double? longitude, List<QuantityInputModel>? quantities
});




}
/// @nodoc
class _$SubmitProgramRequestModelCopyWithImpl<$Res>
    implements $SubmitProgramRequestModelCopyWith<$Res> {
  _$SubmitProgramRequestModelCopyWithImpl(this._self, this._then);

  final SubmitProgramRequestModel _self;
  final $Res Function(SubmitProgramRequestModel) _then;

/// Create a copy of SubmitProgramRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? workScopeUID = null,Object? roads = null,Object? periods = null,Object? contractRelationUID = freezed,Object? name = null,Object? description = null,Object? latitude = freezed,Object? longitude = freezed,Object? quantities = freezed,}) {
  return _then(_self.copyWith(
workScopeUID: null == workScopeUID ? _self.workScopeUID : workScopeUID // ignore: cast_nullable_to_non_nullable
as String,roads: null == roads ? _self.roads : roads // ignore: cast_nullable_to_non_nullable
as List<RoadInputModel>,periods: null == periods ? _self.periods : periods // ignore: cast_nullable_to_non_nullable
as List<PeriodModel>,contractRelationUID: freezed == contractRelationUID ? _self.contractRelationUID : contractRelationUID // ignore: cast_nullable_to_non_nullable
as String?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,quantities: freezed == quantities ? _self.quantities : quantities // ignore: cast_nullable_to_non_nullable
as List<QuantityInputModel>?,
  ));
}

}


/// Adds pattern-matching-related methods to [SubmitProgramRequestModel].
extension SubmitProgramRequestModelPatterns on SubmitProgramRequestModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SubmitProgramRequestModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SubmitProgramRequestModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SubmitProgramRequestModel value)  $default,){
final _that = this;
switch (_that) {
case _SubmitProgramRequestModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SubmitProgramRequestModel value)?  $default,){
final _that = this;
switch (_that) {
case _SubmitProgramRequestModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String workScopeUID,  List<RoadInputModel> roads,  List<PeriodModel> periods,  String? contractRelationUID,  String name,  String description,  double? latitude,  double? longitude,  List<QuantityInputModel>? quantities)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SubmitProgramRequestModel() when $default != null:
return $default(_that.workScopeUID,_that.roads,_that.periods,_that.contractRelationUID,_that.name,_that.description,_that.latitude,_that.longitude,_that.quantities);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String workScopeUID,  List<RoadInputModel> roads,  List<PeriodModel> periods,  String? contractRelationUID,  String name,  String description,  double? latitude,  double? longitude,  List<QuantityInputModel>? quantities)  $default,) {final _that = this;
switch (_that) {
case _SubmitProgramRequestModel():
return $default(_that.workScopeUID,_that.roads,_that.periods,_that.contractRelationUID,_that.name,_that.description,_that.latitude,_that.longitude,_that.quantities);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String workScopeUID,  List<RoadInputModel> roads,  List<PeriodModel> periods,  String? contractRelationUID,  String name,  String description,  double? latitude,  double? longitude,  List<QuantityInputModel>? quantities)?  $default,) {final _that = this;
switch (_that) {
case _SubmitProgramRequestModel() when $default != null:
return $default(_that.workScopeUID,_that.roads,_that.periods,_that.contractRelationUID,_that.name,_that.description,_that.latitude,_that.longitude,_that.quantities);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SubmitProgramRequestModel implements SubmitProgramRequestModel {
  const _SubmitProgramRequestModel({required this.workScopeUID, required final  List<RoadInputModel> roads, required final  List<PeriodModel> periods, this.contractRelationUID, required this.name, required this.description, this.latitude, this.longitude, final  List<QuantityInputModel>? quantities}): _roads = roads,_periods = periods,_quantities = quantities;
  factory _SubmitProgramRequestModel.fromJson(Map<String, dynamic> json) => _$SubmitProgramRequestModelFromJson(json);

@override final  String workScopeUID;
 final  List<RoadInputModel> _roads;
@override List<RoadInputModel> get roads {
  if (_roads is EqualUnmodifiableListView) return _roads;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_roads);
}

 final  List<PeriodModel> _periods;
@override List<PeriodModel> get periods {
  if (_periods is EqualUnmodifiableListView) return _periods;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_periods);
}

@override final  String? contractRelationUID;
@override final  String name;
@override final  String description;
@override final  double? latitude;
@override final  double? longitude;
 final  List<QuantityInputModel>? _quantities;
@override List<QuantityInputModel>? get quantities {
  final value = _quantities;
  if (value == null) return null;
  if (_quantities is EqualUnmodifiableListView) return _quantities;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of SubmitProgramRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SubmitProgramRequestModelCopyWith<_SubmitProgramRequestModel> get copyWith => __$SubmitProgramRequestModelCopyWithImpl<_SubmitProgramRequestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SubmitProgramRequestModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SubmitProgramRequestModel&&(identical(other.workScopeUID, workScopeUID) || other.workScopeUID == workScopeUID)&&const DeepCollectionEquality().equals(other._roads, _roads)&&const DeepCollectionEquality().equals(other._periods, _periods)&&(identical(other.contractRelationUID, contractRelationUID) || other.contractRelationUID == contractRelationUID)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&const DeepCollectionEquality().equals(other._quantities, _quantities));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,workScopeUID,const DeepCollectionEquality().hash(_roads),const DeepCollectionEquality().hash(_periods),contractRelationUID,name,description,latitude,longitude,const DeepCollectionEquality().hash(_quantities));

@override
String toString() {
  return 'SubmitProgramRequestModel(workScopeUID: $workScopeUID, roads: $roads, periods: $periods, contractRelationUID: $contractRelationUID, name: $name, description: $description, latitude: $latitude, longitude: $longitude, quantities: $quantities)';
}


}

/// @nodoc
abstract mixin class _$SubmitProgramRequestModelCopyWith<$Res> implements $SubmitProgramRequestModelCopyWith<$Res> {
  factory _$SubmitProgramRequestModelCopyWith(_SubmitProgramRequestModel value, $Res Function(_SubmitProgramRequestModel) _then) = __$SubmitProgramRequestModelCopyWithImpl;
@override @useResult
$Res call({
 String workScopeUID, List<RoadInputModel> roads, List<PeriodModel> periods, String? contractRelationUID, String name, String description, double? latitude, double? longitude, List<QuantityInputModel>? quantities
});




}
/// @nodoc
class __$SubmitProgramRequestModelCopyWithImpl<$Res>
    implements _$SubmitProgramRequestModelCopyWith<$Res> {
  __$SubmitProgramRequestModelCopyWithImpl(this._self, this._then);

  final _SubmitProgramRequestModel _self;
  final $Res Function(_SubmitProgramRequestModel) _then;

/// Create a copy of SubmitProgramRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? workScopeUID = null,Object? roads = null,Object? periods = null,Object? contractRelationUID = freezed,Object? name = null,Object? description = null,Object? latitude = freezed,Object? longitude = freezed,Object? quantities = freezed,}) {
  return _then(_SubmitProgramRequestModel(
workScopeUID: null == workScopeUID ? _self.workScopeUID : workScopeUID // ignore: cast_nullable_to_non_nullable
as String,roads: null == roads ? _self._roads : roads // ignore: cast_nullable_to_non_nullable
as List<RoadInputModel>,periods: null == periods ? _self._periods : periods // ignore: cast_nullable_to_non_nullable
as List<PeriodModel>,contractRelationUID: freezed == contractRelationUID ? _self.contractRelationUID : contractRelationUID // ignore: cast_nullable_to_non_nullable
as String?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,quantities: freezed == quantities ? _self._quantities : quantities // ignore: cast_nullable_to_non_nullable
as List<QuantityInputModel>?,
  ));
}


}


/// @nodoc
mixin _$RoadInputModel {

 String get roadUID; double? get fromSection; double? get toSection; double? get inputValue;
/// Create a copy of RoadInputModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RoadInputModelCopyWith<RoadInputModel> get copyWith => _$RoadInputModelCopyWithImpl<RoadInputModel>(this as RoadInputModel, _$identity);

  /// Serializes this RoadInputModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RoadInputModel&&(identical(other.roadUID, roadUID) || other.roadUID == roadUID)&&(identical(other.fromSection, fromSection) || other.fromSection == fromSection)&&(identical(other.toSection, toSection) || other.toSection == toSection)&&(identical(other.inputValue, inputValue) || other.inputValue == inputValue));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,roadUID,fromSection,toSection,inputValue);

@override
String toString() {
  return 'RoadInputModel(roadUID: $roadUID, fromSection: $fromSection, toSection: $toSection, inputValue: $inputValue)';
}


}

/// @nodoc
abstract mixin class $RoadInputModelCopyWith<$Res>  {
  factory $RoadInputModelCopyWith(RoadInputModel value, $Res Function(RoadInputModel) _then) = _$RoadInputModelCopyWithImpl;
@useResult
$Res call({
 String roadUID, double? fromSection, double? toSection, double? inputValue
});




}
/// @nodoc
class _$RoadInputModelCopyWithImpl<$Res>
    implements $RoadInputModelCopyWith<$Res> {
  _$RoadInputModelCopyWithImpl(this._self, this._then);

  final RoadInputModel _self;
  final $Res Function(RoadInputModel) _then;

/// Create a copy of RoadInputModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? roadUID = null,Object? fromSection = freezed,Object? toSection = freezed,Object? inputValue = freezed,}) {
  return _then(_self.copyWith(
roadUID: null == roadUID ? _self.roadUID : roadUID // ignore: cast_nullable_to_non_nullable
as String,fromSection: freezed == fromSection ? _self.fromSection : fromSection // ignore: cast_nullable_to_non_nullable
as double?,toSection: freezed == toSection ? _self.toSection : toSection // ignore: cast_nullable_to_non_nullable
as double?,inputValue: freezed == inputValue ? _self.inputValue : inputValue // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [RoadInputModel].
extension RoadInputModelPatterns on RoadInputModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RoadInputModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RoadInputModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RoadInputModel value)  $default,){
final _that = this;
switch (_that) {
case _RoadInputModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RoadInputModel value)?  $default,){
final _that = this;
switch (_that) {
case _RoadInputModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String roadUID,  double? fromSection,  double? toSection,  double? inputValue)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RoadInputModel() when $default != null:
return $default(_that.roadUID,_that.fromSection,_that.toSection,_that.inputValue);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String roadUID,  double? fromSection,  double? toSection,  double? inputValue)  $default,) {final _that = this;
switch (_that) {
case _RoadInputModel():
return $default(_that.roadUID,_that.fromSection,_that.toSection,_that.inputValue);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String roadUID,  double? fromSection,  double? toSection,  double? inputValue)?  $default,) {final _that = this;
switch (_that) {
case _RoadInputModel() when $default != null:
return $default(_that.roadUID,_that.fromSection,_that.toSection,_that.inputValue);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RoadInputModel implements RoadInputModel {
  const _RoadInputModel({required this.roadUID, this.fromSection, this.toSection, this.inputValue});
  factory _RoadInputModel.fromJson(Map<String, dynamic> json) => _$RoadInputModelFromJson(json);

@override final  String roadUID;
@override final  double? fromSection;
@override final  double? toSection;
@override final  double? inputValue;

/// Create a copy of RoadInputModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RoadInputModelCopyWith<_RoadInputModel> get copyWith => __$RoadInputModelCopyWithImpl<_RoadInputModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RoadInputModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RoadInputModel&&(identical(other.roadUID, roadUID) || other.roadUID == roadUID)&&(identical(other.fromSection, fromSection) || other.fromSection == fromSection)&&(identical(other.toSection, toSection) || other.toSection == toSection)&&(identical(other.inputValue, inputValue) || other.inputValue == inputValue));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,roadUID,fromSection,toSection,inputValue);

@override
String toString() {
  return 'RoadInputModel(roadUID: $roadUID, fromSection: $fromSection, toSection: $toSection, inputValue: $inputValue)';
}


}

/// @nodoc
abstract mixin class _$RoadInputModelCopyWith<$Res> implements $RoadInputModelCopyWith<$Res> {
  factory _$RoadInputModelCopyWith(_RoadInputModel value, $Res Function(_RoadInputModel) _then) = __$RoadInputModelCopyWithImpl;
@override @useResult
$Res call({
 String roadUID, double? fromSection, double? toSection, double? inputValue
});




}
/// @nodoc
class __$RoadInputModelCopyWithImpl<$Res>
    implements _$RoadInputModelCopyWith<$Res> {
  __$RoadInputModelCopyWithImpl(this._self, this._then);

  final _RoadInputModel _self;
  final $Res Function(_RoadInputModel) _then;

/// Create a copy of RoadInputModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? roadUID = null,Object? fromSection = freezed,Object? toSection = freezed,Object? inputValue = freezed,}) {
  return _then(_RoadInputModel(
roadUID: null == roadUID ? _self.roadUID : roadUID // ignore: cast_nullable_to_non_nullable
as String,fromSection: freezed == fromSection ? _self.fromSection : fromSection // ignore: cast_nullable_to_non_nullable
as double?,toSection: freezed == toSection ? _self.toSection : toSection // ignore: cast_nullable_to_non_nullable
as double?,inputValue: freezed == inputValue ? _self.inputValue : inputValue // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}


/// @nodoc
mixin _$PeriodModel {

 String get periodStart; String get periodEnd;
/// Create a copy of PeriodModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PeriodModelCopyWith<PeriodModel> get copyWith => _$PeriodModelCopyWithImpl<PeriodModel>(this as PeriodModel, _$identity);

  /// Serializes this PeriodModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PeriodModel&&(identical(other.periodStart, periodStart) || other.periodStart == periodStart)&&(identical(other.periodEnd, periodEnd) || other.periodEnd == periodEnd));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,periodStart,periodEnd);

@override
String toString() {
  return 'PeriodModel(periodStart: $periodStart, periodEnd: $periodEnd)';
}


}

/// @nodoc
abstract mixin class $PeriodModelCopyWith<$Res>  {
  factory $PeriodModelCopyWith(PeriodModel value, $Res Function(PeriodModel) _then) = _$PeriodModelCopyWithImpl;
@useResult
$Res call({
 String periodStart, String periodEnd
});




}
/// @nodoc
class _$PeriodModelCopyWithImpl<$Res>
    implements $PeriodModelCopyWith<$Res> {
  _$PeriodModelCopyWithImpl(this._self, this._then);

  final PeriodModel _self;
  final $Res Function(PeriodModel) _then;

/// Create a copy of PeriodModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? periodStart = null,Object? periodEnd = null,}) {
  return _then(_self.copyWith(
periodStart: null == periodStart ? _self.periodStart : periodStart // ignore: cast_nullable_to_non_nullable
as String,periodEnd: null == periodEnd ? _self.periodEnd : periodEnd // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [PeriodModel].
extension PeriodModelPatterns on PeriodModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PeriodModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PeriodModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PeriodModel value)  $default,){
final _that = this;
switch (_that) {
case _PeriodModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PeriodModel value)?  $default,){
final _that = this;
switch (_that) {
case _PeriodModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String periodStart,  String periodEnd)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PeriodModel() when $default != null:
return $default(_that.periodStart,_that.periodEnd);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String periodStart,  String periodEnd)  $default,) {final _that = this;
switch (_that) {
case _PeriodModel():
return $default(_that.periodStart,_that.periodEnd);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String periodStart,  String periodEnd)?  $default,) {final _that = this;
switch (_that) {
case _PeriodModel() when $default != null:
return $default(_that.periodStart,_that.periodEnd);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PeriodModel implements PeriodModel {
  const _PeriodModel({required this.periodStart, required this.periodEnd});
  factory _PeriodModel.fromJson(Map<String, dynamic> json) => _$PeriodModelFromJson(json);

@override final  String periodStart;
@override final  String periodEnd;

/// Create a copy of PeriodModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PeriodModelCopyWith<_PeriodModel> get copyWith => __$PeriodModelCopyWithImpl<_PeriodModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PeriodModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PeriodModel&&(identical(other.periodStart, periodStart) || other.periodStart == periodStart)&&(identical(other.periodEnd, periodEnd) || other.periodEnd == periodEnd));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,periodStart,periodEnd);

@override
String toString() {
  return 'PeriodModel(periodStart: $periodStart, periodEnd: $periodEnd)';
}


}

/// @nodoc
abstract mixin class _$PeriodModelCopyWith<$Res> implements $PeriodModelCopyWith<$Res> {
  factory _$PeriodModelCopyWith(_PeriodModel value, $Res Function(_PeriodModel) _then) = __$PeriodModelCopyWithImpl;
@override @useResult
$Res call({
 String periodStart, String periodEnd
});




}
/// @nodoc
class __$PeriodModelCopyWithImpl<$Res>
    implements _$PeriodModelCopyWith<$Res> {
  __$PeriodModelCopyWithImpl(this._self, this._then);

  final _PeriodModel _self;
  final $Res Function(_PeriodModel) _then;

/// Create a copy of PeriodModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? periodStart = null,Object? periodEnd = null,}) {
  return _then(_PeriodModel(
periodStart: null == periodStart ? _self.periodStart : periodStart // ignore: cast_nullable_to_non_nullable
as String,periodEnd: null == periodEnd ? _self.periodEnd : periodEnd // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$QuantityInputModel {

 String get quantityTypeUID; int get sequenceNo; double get totalLength; String get notes; List<QuantityValueInputModel> get quantityValues; List<QuantitySegmentInputModel> get segments;
/// Create a copy of QuantityInputModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuantityInputModelCopyWith<QuantityInputModel> get copyWith => _$QuantityInputModelCopyWithImpl<QuantityInputModel>(this as QuantityInputModel, _$identity);

  /// Serializes this QuantityInputModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuantityInputModel&&(identical(other.quantityTypeUID, quantityTypeUID) || other.quantityTypeUID == quantityTypeUID)&&(identical(other.sequenceNo, sequenceNo) || other.sequenceNo == sequenceNo)&&(identical(other.totalLength, totalLength) || other.totalLength == totalLength)&&(identical(other.notes, notes) || other.notes == notes)&&const DeepCollectionEquality().equals(other.quantityValues, quantityValues)&&const DeepCollectionEquality().equals(other.segments, segments));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,quantityTypeUID,sequenceNo,totalLength,notes,const DeepCollectionEquality().hash(quantityValues),const DeepCollectionEquality().hash(segments));

@override
String toString() {
  return 'QuantityInputModel(quantityTypeUID: $quantityTypeUID, sequenceNo: $sequenceNo, totalLength: $totalLength, notes: $notes, quantityValues: $quantityValues, segments: $segments)';
}


}

/// @nodoc
abstract mixin class $QuantityInputModelCopyWith<$Res>  {
  factory $QuantityInputModelCopyWith(QuantityInputModel value, $Res Function(QuantityInputModel) _then) = _$QuantityInputModelCopyWithImpl;
@useResult
$Res call({
 String quantityTypeUID, int sequenceNo, double totalLength, String notes, List<QuantityValueInputModel> quantityValues, List<QuantitySegmentInputModel> segments
});




}
/// @nodoc
class _$QuantityInputModelCopyWithImpl<$Res>
    implements $QuantityInputModelCopyWith<$Res> {
  _$QuantityInputModelCopyWithImpl(this._self, this._then);

  final QuantityInputModel _self;
  final $Res Function(QuantityInputModel) _then;

/// Create a copy of QuantityInputModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? quantityTypeUID = null,Object? sequenceNo = null,Object? totalLength = null,Object? notes = null,Object? quantityValues = null,Object? segments = null,}) {
  return _then(_self.copyWith(
quantityTypeUID: null == quantityTypeUID ? _self.quantityTypeUID : quantityTypeUID // ignore: cast_nullable_to_non_nullable
as String,sequenceNo: null == sequenceNo ? _self.sequenceNo : sequenceNo // ignore: cast_nullable_to_non_nullable
as int,totalLength: null == totalLength ? _self.totalLength : totalLength // ignore: cast_nullable_to_non_nullable
as double,notes: null == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String,quantityValues: null == quantityValues ? _self.quantityValues : quantityValues // ignore: cast_nullable_to_non_nullable
as List<QuantityValueInputModel>,segments: null == segments ? _self.segments : segments // ignore: cast_nullable_to_non_nullable
as List<QuantitySegmentInputModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [QuantityInputModel].
extension QuantityInputModelPatterns on QuantityInputModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QuantityInputModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QuantityInputModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QuantityInputModel value)  $default,){
final _that = this;
switch (_that) {
case _QuantityInputModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QuantityInputModel value)?  $default,){
final _that = this;
switch (_that) {
case _QuantityInputModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String quantityTypeUID,  int sequenceNo,  double totalLength,  String notes,  List<QuantityValueInputModel> quantityValues,  List<QuantitySegmentInputModel> segments)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QuantityInputModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String quantityTypeUID,  int sequenceNo,  double totalLength,  String notes,  List<QuantityValueInputModel> quantityValues,  List<QuantitySegmentInputModel> segments)  $default,) {final _that = this;
switch (_that) {
case _QuantityInputModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String quantityTypeUID,  int sequenceNo,  double totalLength,  String notes,  List<QuantityValueInputModel> quantityValues,  List<QuantitySegmentInputModel> segments)?  $default,) {final _that = this;
switch (_that) {
case _QuantityInputModel() when $default != null:
return $default(_that.quantityTypeUID,_that.sequenceNo,_that.totalLength,_that.notes,_that.quantityValues,_that.segments);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _QuantityInputModel implements QuantityInputModel {
  const _QuantityInputModel({required this.quantityTypeUID, required this.sequenceNo, required this.totalLength, required this.notes, required final  List<QuantityValueInputModel> quantityValues, required final  List<QuantitySegmentInputModel> segments}): _quantityValues = quantityValues,_segments = segments;
  factory _QuantityInputModel.fromJson(Map<String, dynamic> json) => _$QuantityInputModelFromJson(json);

@override final  String quantityTypeUID;
@override final  int sequenceNo;
@override final  double totalLength;
@override final  String notes;
 final  List<QuantityValueInputModel> _quantityValues;
@override List<QuantityValueInputModel> get quantityValues {
  if (_quantityValues is EqualUnmodifiableListView) return _quantityValues;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_quantityValues);
}

 final  List<QuantitySegmentInputModel> _segments;
@override List<QuantitySegmentInputModel> get segments {
  if (_segments is EqualUnmodifiableListView) return _segments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_segments);
}


/// Create a copy of QuantityInputModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuantityInputModelCopyWith<_QuantityInputModel> get copyWith => __$QuantityInputModelCopyWithImpl<_QuantityInputModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$QuantityInputModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QuantityInputModel&&(identical(other.quantityTypeUID, quantityTypeUID) || other.quantityTypeUID == quantityTypeUID)&&(identical(other.sequenceNo, sequenceNo) || other.sequenceNo == sequenceNo)&&(identical(other.totalLength, totalLength) || other.totalLength == totalLength)&&(identical(other.notes, notes) || other.notes == notes)&&const DeepCollectionEquality().equals(other._quantityValues, _quantityValues)&&const DeepCollectionEquality().equals(other._segments, _segments));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,quantityTypeUID,sequenceNo,totalLength,notes,const DeepCollectionEquality().hash(_quantityValues),const DeepCollectionEquality().hash(_segments));

@override
String toString() {
  return 'QuantityInputModel(quantityTypeUID: $quantityTypeUID, sequenceNo: $sequenceNo, totalLength: $totalLength, notes: $notes, quantityValues: $quantityValues, segments: $segments)';
}


}

/// @nodoc
abstract mixin class _$QuantityInputModelCopyWith<$Res> implements $QuantityInputModelCopyWith<$Res> {
  factory _$QuantityInputModelCopyWith(_QuantityInputModel value, $Res Function(_QuantityInputModel) _then) = __$QuantityInputModelCopyWithImpl;
@override @useResult
$Res call({
 String quantityTypeUID, int sequenceNo, double totalLength, String notes, List<QuantityValueInputModel> quantityValues, List<QuantitySegmentInputModel> segments
});




}
/// @nodoc
class __$QuantityInputModelCopyWithImpl<$Res>
    implements _$QuantityInputModelCopyWith<$Res> {
  __$QuantityInputModelCopyWithImpl(this._self, this._then);

  final _QuantityInputModel _self;
  final $Res Function(_QuantityInputModel) _then;

/// Create a copy of QuantityInputModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? quantityTypeUID = null,Object? sequenceNo = null,Object? totalLength = null,Object? notes = null,Object? quantityValues = null,Object? segments = null,}) {
  return _then(_QuantityInputModel(
quantityTypeUID: null == quantityTypeUID ? _self.quantityTypeUID : quantityTypeUID // ignore: cast_nullable_to_non_nullable
as String,sequenceNo: null == sequenceNo ? _self.sequenceNo : sequenceNo // ignore: cast_nullable_to_non_nullable
as int,totalLength: null == totalLength ? _self.totalLength : totalLength // ignore: cast_nullable_to_non_nullable
as double,notes: null == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String,quantityValues: null == quantityValues ? _self._quantityValues : quantityValues // ignore: cast_nullable_to_non_nullable
as List<QuantityValueInputModel>,segments: null == segments ? _self._segments : segments // ignore: cast_nullable_to_non_nullable
as List<QuantitySegmentInputModel>,
  ));
}


}


/// @nodoc
mixin _$QuantityValueInputModel {

 String get quantityFieldUID; String get value;
/// Create a copy of QuantityValueInputModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuantityValueInputModelCopyWith<QuantityValueInputModel> get copyWith => _$QuantityValueInputModelCopyWithImpl<QuantityValueInputModel>(this as QuantityValueInputModel, _$identity);

  /// Serializes this QuantityValueInputModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuantityValueInputModel&&(identical(other.quantityFieldUID, quantityFieldUID) || other.quantityFieldUID == quantityFieldUID)&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,quantityFieldUID,value);

@override
String toString() {
  return 'QuantityValueInputModel(quantityFieldUID: $quantityFieldUID, value: $value)';
}


}

/// @nodoc
abstract mixin class $QuantityValueInputModelCopyWith<$Res>  {
  factory $QuantityValueInputModelCopyWith(QuantityValueInputModel value, $Res Function(QuantityValueInputModel) _then) = _$QuantityValueInputModelCopyWithImpl;
@useResult
$Res call({
 String quantityFieldUID, String value
});




}
/// @nodoc
class _$QuantityValueInputModelCopyWithImpl<$Res>
    implements $QuantityValueInputModelCopyWith<$Res> {
  _$QuantityValueInputModelCopyWithImpl(this._self, this._then);

  final QuantityValueInputModel _self;
  final $Res Function(QuantityValueInputModel) _then;

/// Create a copy of QuantityValueInputModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? quantityFieldUID = null,Object? value = null,}) {
  return _then(_self.copyWith(
quantityFieldUID: null == quantityFieldUID ? _self.quantityFieldUID : quantityFieldUID // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [QuantityValueInputModel].
extension QuantityValueInputModelPatterns on QuantityValueInputModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QuantityValueInputModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QuantityValueInputModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QuantityValueInputModel value)  $default,){
final _that = this;
switch (_that) {
case _QuantityValueInputModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QuantityValueInputModel value)?  $default,){
final _that = this;
switch (_that) {
case _QuantityValueInputModel() when $default != null:
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
case _QuantityValueInputModel() when $default != null:
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
case _QuantityValueInputModel():
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
case _QuantityValueInputModel() when $default != null:
return $default(_that.quantityFieldUID,_that.value);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _QuantityValueInputModel implements QuantityValueInputModel {
  const _QuantityValueInputModel({required this.quantityFieldUID, required this.value});
  factory _QuantityValueInputModel.fromJson(Map<String, dynamic> json) => _$QuantityValueInputModelFromJson(json);

@override final  String quantityFieldUID;
@override final  String value;

/// Create a copy of QuantityValueInputModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuantityValueInputModelCopyWith<_QuantityValueInputModel> get copyWith => __$QuantityValueInputModelCopyWithImpl<_QuantityValueInputModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$QuantityValueInputModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QuantityValueInputModel&&(identical(other.quantityFieldUID, quantityFieldUID) || other.quantityFieldUID == quantityFieldUID)&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,quantityFieldUID,value);

@override
String toString() {
  return 'QuantityValueInputModel(quantityFieldUID: $quantityFieldUID, value: $value)';
}


}

/// @nodoc
abstract mixin class _$QuantityValueInputModelCopyWith<$Res> implements $QuantityValueInputModelCopyWith<$Res> {
  factory _$QuantityValueInputModelCopyWith(_QuantityValueInputModel value, $Res Function(_QuantityValueInputModel) _then) = __$QuantityValueInputModelCopyWithImpl;
@override @useResult
$Res call({
 String quantityFieldUID, String value
});




}
/// @nodoc
class __$QuantityValueInputModelCopyWithImpl<$Res>
    implements _$QuantityValueInputModelCopyWith<$Res> {
  __$QuantityValueInputModelCopyWithImpl(this._self, this._then);

  final _QuantityValueInputModel _self;
  final $Res Function(_QuantityValueInputModel) _then;

/// Create a copy of QuantityValueInputModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? quantityFieldUID = null,Object? value = null,}) {
  return _then(_QuantityValueInputModel(
quantityFieldUID: null == quantityFieldUID ? _self.quantityFieldUID : quantityFieldUID // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$QuantitySegmentInputModel {

 int get segmentNumber; int get startDistance; int get endDistance; List<QuantityValueInputModel> get segmentValues;
/// Create a copy of QuantitySegmentInputModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuantitySegmentInputModelCopyWith<QuantitySegmentInputModel> get copyWith => _$QuantitySegmentInputModelCopyWithImpl<QuantitySegmentInputModel>(this as QuantitySegmentInputModel, _$identity);

  /// Serializes this QuantitySegmentInputModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuantitySegmentInputModel&&(identical(other.segmentNumber, segmentNumber) || other.segmentNumber == segmentNumber)&&(identical(other.startDistance, startDistance) || other.startDistance == startDistance)&&(identical(other.endDistance, endDistance) || other.endDistance == endDistance)&&const DeepCollectionEquality().equals(other.segmentValues, segmentValues));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,segmentNumber,startDistance,endDistance,const DeepCollectionEquality().hash(segmentValues));

@override
String toString() {
  return 'QuantitySegmentInputModel(segmentNumber: $segmentNumber, startDistance: $startDistance, endDistance: $endDistance, segmentValues: $segmentValues)';
}


}

/// @nodoc
abstract mixin class $QuantitySegmentInputModelCopyWith<$Res>  {
  factory $QuantitySegmentInputModelCopyWith(QuantitySegmentInputModel value, $Res Function(QuantitySegmentInputModel) _then) = _$QuantitySegmentInputModelCopyWithImpl;
@useResult
$Res call({
 int segmentNumber, int startDistance, int endDistance, List<QuantityValueInputModel> segmentValues
});




}
/// @nodoc
class _$QuantitySegmentInputModelCopyWithImpl<$Res>
    implements $QuantitySegmentInputModelCopyWith<$Res> {
  _$QuantitySegmentInputModelCopyWithImpl(this._self, this._then);

  final QuantitySegmentInputModel _self;
  final $Res Function(QuantitySegmentInputModel) _then;

/// Create a copy of QuantitySegmentInputModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? segmentNumber = null,Object? startDistance = null,Object? endDistance = null,Object? segmentValues = null,}) {
  return _then(_self.copyWith(
segmentNumber: null == segmentNumber ? _self.segmentNumber : segmentNumber // ignore: cast_nullable_to_non_nullable
as int,startDistance: null == startDistance ? _self.startDistance : startDistance // ignore: cast_nullable_to_non_nullable
as int,endDistance: null == endDistance ? _self.endDistance : endDistance // ignore: cast_nullable_to_non_nullable
as int,segmentValues: null == segmentValues ? _self.segmentValues : segmentValues // ignore: cast_nullable_to_non_nullable
as List<QuantityValueInputModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [QuantitySegmentInputModel].
extension QuantitySegmentInputModelPatterns on QuantitySegmentInputModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QuantitySegmentInputModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QuantitySegmentInputModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QuantitySegmentInputModel value)  $default,){
final _that = this;
switch (_that) {
case _QuantitySegmentInputModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QuantitySegmentInputModel value)?  $default,){
final _that = this;
switch (_that) {
case _QuantitySegmentInputModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int segmentNumber,  int startDistance,  int endDistance,  List<QuantityValueInputModel> segmentValues)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QuantitySegmentInputModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int segmentNumber,  int startDistance,  int endDistance,  List<QuantityValueInputModel> segmentValues)  $default,) {final _that = this;
switch (_that) {
case _QuantitySegmentInputModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int segmentNumber,  int startDistance,  int endDistance,  List<QuantityValueInputModel> segmentValues)?  $default,) {final _that = this;
switch (_that) {
case _QuantitySegmentInputModel() when $default != null:
return $default(_that.segmentNumber,_that.startDistance,_that.endDistance,_that.segmentValues);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _QuantitySegmentInputModel implements QuantitySegmentInputModel {
  const _QuantitySegmentInputModel({required this.segmentNumber, required this.startDistance, required this.endDistance, required final  List<QuantityValueInputModel> segmentValues}): _segmentValues = segmentValues;
  factory _QuantitySegmentInputModel.fromJson(Map<String, dynamic> json) => _$QuantitySegmentInputModelFromJson(json);

@override final  int segmentNumber;
@override final  int startDistance;
@override final  int endDistance;
 final  List<QuantityValueInputModel> _segmentValues;
@override List<QuantityValueInputModel> get segmentValues {
  if (_segmentValues is EqualUnmodifiableListView) return _segmentValues;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_segmentValues);
}


/// Create a copy of QuantitySegmentInputModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuantitySegmentInputModelCopyWith<_QuantitySegmentInputModel> get copyWith => __$QuantitySegmentInputModelCopyWithImpl<_QuantitySegmentInputModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$QuantitySegmentInputModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QuantitySegmentInputModel&&(identical(other.segmentNumber, segmentNumber) || other.segmentNumber == segmentNumber)&&(identical(other.startDistance, startDistance) || other.startDistance == startDistance)&&(identical(other.endDistance, endDistance) || other.endDistance == endDistance)&&const DeepCollectionEquality().equals(other._segmentValues, _segmentValues));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,segmentNumber,startDistance,endDistance,const DeepCollectionEquality().hash(_segmentValues));

@override
String toString() {
  return 'QuantitySegmentInputModel(segmentNumber: $segmentNumber, startDistance: $startDistance, endDistance: $endDistance, segmentValues: $segmentValues)';
}


}

/// @nodoc
abstract mixin class _$QuantitySegmentInputModelCopyWith<$Res> implements $QuantitySegmentInputModelCopyWith<$Res> {
  factory _$QuantitySegmentInputModelCopyWith(_QuantitySegmentInputModel value, $Res Function(_QuantitySegmentInputModel) _then) = __$QuantitySegmentInputModelCopyWithImpl;
@override @useResult
$Res call({
 int segmentNumber, int startDistance, int endDistance, List<QuantityValueInputModel> segmentValues
});




}
/// @nodoc
class __$QuantitySegmentInputModelCopyWithImpl<$Res>
    implements _$QuantitySegmentInputModelCopyWith<$Res> {
  __$QuantitySegmentInputModelCopyWithImpl(this._self, this._then);

  final _QuantitySegmentInputModel _self;
  final $Res Function(_QuantitySegmentInputModel) _then;

/// Create a copy of QuantitySegmentInputModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? segmentNumber = null,Object? startDistance = null,Object? endDistance = null,Object? segmentValues = null,}) {
  return _then(_QuantitySegmentInputModel(
segmentNumber: null == segmentNumber ? _self.segmentNumber : segmentNumber // ignore: cast_nullable_to_non_nullable
as int,startDistance: null == startDistance ? _self.startDistance : startDistance // ignore: cast_nullable_to_non_nullable
as int,endDistance: null == endDistance ? _self.endDistance : endDistance // ignore: cast_nullable_to_non_nullable
as int,segmentValues: null == segmentValues ? _self._segmentValues : segmentValues // ignore: cast_nullable_to_non_nullable
as List<QuantityValueInputModel>,
  ));
}


}

// dart format on
