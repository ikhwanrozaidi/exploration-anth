// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'report_creation_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ReportData {

 ReportApiData get apiData; ReportSelections get selections; ReportFormData get formData;
/// Create a copy of ReportData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReportDataCopyWith<ReportData> get copyWith => _$ReportDataCopyWithImpl<ReportData>(this as ReportData, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReportData&&(identical(other.apiData, apiData) || other.apiData == apiData)&&(identical(other.selections, selections) || other.selections == selections)&&(identical(other.formData, formData) || other.formData == formData));
}


@override
int get hashCode => Object.hash(runtimeType,apiData,selections,formData);

@override
String toString() {
  return 'ReportData(apiData: $apiData, selections: $selections, formData: $formData)';
}


}

/// @nodoc
abstract mixin class $ReportDataCopyWith<$Res>  {
  factory $ReportDataCopyWith(ReportData value, $Res Function(ReportData) _then) = _$ReportDataCopyWithImpl;
@useResult
$Res call({
 ReportApiData apiData, ReportSelections selections, ReportFormData formData
});


$ReportApiDataCopyWith<$Res> get apiData;$ReportSelectionsCopyWith<$Res> get selections;$ReportFormDataCopyWith<$Res> get formData;

}
/// @nodoc
class _$ReportDataCopyWithImpl<$Res>
    implements $ReportDataCopyWith<$Res> {
  _$ReportDataCopyWithImpl(this._self, this._then);

  final ReportData _self;
  final $Res Function(ReportData) _then;

/// Create a copy of ReportData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? apiData = null,Object? selections = null,Object? formData = null,}) {
  return _then(_self.copyWith(
apiData: null == apiData ? _self.apiData : apiData // ignore: cast_nullable_to_non_nullable
as ReportApiData,selections: null == selections ? _self.selections : selections // ignore: cast_nullable_to_non_nullable
as ReportSelections,formData: null == formData ? _self.formData : formData // ignore: cast_nullable_to_non_nullable
as ReportFormData,
  ));
}
/// Create a copy of ReportData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReportApiDataCopyWith<$Res> get apiData {
  
  return $ReportApiDataCopyWith<$Res>(_self.apiData, (value) {
    return _then(_self.copyWith(apiData: value));
  });
}/// Create a copy of ReportData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReportSelectionsCopyWith<$Res> get selections {
  
  return $ReportSelectionsCopyWith<$Res>(_self.selections, (value) {
    return _then(_self.copyWith(selections: value));
  });
}/// Create a copy of ReportData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReportFormDataCopyWith<$Res> get formData {
  
  return $ReportFormDataCopyWith<$Res>(_self.formData, (value) {
    return _then(_self.copyWith(formData: value));
  });
}
}


/// Adds pattern-matching-related methods to [ReportData].
extension ReportDataPatterns on ReportData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReportData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReportData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReportData value)  $default,){
final _that = this;
switch (_that) {
case _ReportData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReportData value)?  $default,){
final _that = this;
switch (_that) {
case _ReportData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ReportApiData apiData,  ReportSelections selections,  ReportFormData formData)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReportData() when $default != null:
return $default(_that.apiData,_that.selections,_that.formData);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ReportApiData apiData,  ReportSelections selections,  ReportFormData formData)  $default,) {final _that = this;
switch (_that) {
case _ReportData():
return $default(_that.apiData,_that.selections,_that.formData);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ReportApiData apiData,  ReportSelections selections,  ReportFormData formData)?  $default,) {final _that = this;
switch (_that) {
case _ReportData() when $default != null:
return $default(_that.apiData,_that.selections,_that.formData);case _:
  return null;

}
}

}

/// @nodoc


class _ReportData implements ReportData {
  const _ReportData({required this.apiData, required this.selections, required this.formData});
  

@override final  ReportApiData apiData;
@override final  ReportSelections selections;
@override final  ReportFormData formData;

/// Create a copy of ReportData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReportDataCopyWith<_ReportData> get copyWith => __$ReportDataCopyWithImpl<_ReportData>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReportData&&(identical(other.apiData, apiData) || other.apiData == apiData)&&(identical(other.selections, selections) || other.selections == selections)&&(identical(other.formData, formData) || other.formData == formData));
}


@override
int get hashCode => Object.hash(runtimeType,apiData,selections,formData);

@override
String toString() {
  return 'ReportData(apiData: $apiData, selections: $selections, formData: $formData)';
}


}

/// @nodoc
abstract mixin class _$ReportDataCopyWith<$Res> implements $ReportDataCopyWith<$Res> {
  factory _$ReportDataCopyWith(_ReportData value, $Res Function(_ReportData) _then) = __$ReportDataCopyWithImpl;
@override @useResult
$Res call({
 ReportApiData apiData, ReportSelections selections, ReportFormData formData
});


@override $ReportApiDataCopyWith<$Res> get apiData;@override $ReportSelectionsCopyWith<$Res> get selections;@override $ReportFormDataCopyWith<$Res> get formData;

}
/// @nodoc
class __$ReportDataCopyWithImpl<$Res>
    implements _$ReportDataCopyWith<$Res> {
  __$ReportDataCopyWithImpl(this._self, this._then);

  final _ReportData _self;
  final $Res Function(_ReportData) _then;

/// Create a copy of ReportData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? apiData = null,Object? selections = null,Object? formData = null,}) {
  return _then(_ReportData(
apiData: null == apiData ? _self.apiData : apiData // ignore: cast_nullable_to_non_nullable
as ReportApiData,selections: null == selections ? _self.selections : selections // ignore: cast_nullable_to_non_nullable
as ReportSelections,formData: null == formData ? _self.formData : formData // ignore: cast_nullable_to_non_nullable
as ReportFormData,
  ));
}

/// Create a copy of ReportData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReportApiDataCopyWith<$Res> get apiData {
  
  return $ReportApiDataCopyWith<$Res>(_self.apiData, (value) {
    return _then(_self.copyWith(apiData: value));
  });
}/// Create a copy of ReportData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReportSelectionsCopyWith<$Res> get selections {
  
  return $ReportSelectionsCopyWith<$Res>(_self.selections, (value) {
    return _then(_self.copyWith(selections: value));
  });
}/// Create a copy of ReportData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReportFormDataCopyWith<$Res> get formData {
  
  return $ReportFormDataCopyWith<$Res>(_self.formData, (value) {
    return _then(_self.copyWith(formData: value));
  });
}
}

/// @nodoc
mixin _$ReportApiData {

 List<ScopeOfWork>? get workScopes; List<Province>? get states; List<District>? get districts; List<Road>? get roads; List<WorkQuantityType>? get quantities; List<WorkEquipment>? get equipment;
/// Create a copy of ReportApiData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReportApiDataCopyWith<ReportApiData> get copyWith => _$ReportApiDataCopyWithImpl<ReportApiData>(this as ReportApiData, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReportApiData&&const DeepCollectionEquality().equals(other.workScopes, workScopes)&&const DeepCollectionEquality().equals(other.states, states)&&const DeepCollectionEquality().equals(other.districts, districts)&&const DeepCollectionEquality().equals(other.roads, roads)&&const DeepCollectionEquality().equals(other.quantities, quantities)&&const DeepCollectionEquality().equals(other.equipment, equipment));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(workScopes),const DeepCollectionEquality().hash(states),const DeepCollectionEquality().hash(districts),const DeepCollectionEquality().hash(roads),const DeepCollectionEquality().hash(quantities),const DeepCollectionEquality().hash(equipment));

@override
String toString() {
  return 'ReportApiData(workScopes: $workScopes, states: $states, districts: $districts, roads: $roads, quantities: $quantities, equipment: $equipment)';
}


}

/// @nodoc
abstract mixin class $ReportApiDataCopyWith<$Res>  {
  factory $ReportApiDataCopyWith(ReportApiData value, $Res Function(ReportApiData) _then) = _$ReportApiDataCopyWithImpl;
@useResult
$Res call({
 List<ScopeOfWork>? workScopes, List<Province>? states, List<District>? districts, List<Road>? roads, List<WorkQuantityType>? quantities, List<WorkEquipment>? equipment
});




}
/// @nodoc
class _$ReportApiDataCopyWithImpl<$Res>
    implements $ReportApiDataCopyWith<$Res> {
  _$ReportApiDataCopyWithImpl(this._self, this._then);

  final ReportApiData _self;
  final $Res Function(ReportApiData) _then;

/// Create a copy of ReportApiData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? workScopes = freezed,Object? states = freezed,Object? districts = freezed,Object? roads = freezed,Object? quantities = freezed,Object? equipment = freezed,}) {
  return _then(_self.copyWith(
workScopes: freezed == workScopes ? _self.workScopes : workScopes // ignore: cast_nullable_to_non_nullable
as List<ScopeOfWork>?,states: freezed == states ? _self.states : states // ignore: cast_nullable_to_non_nullable
as List<Province>?,districts: freezed == districts ? _self.districts : districts // ignore: cast_nullable_to_non_nullable
as List<District>?,roads: freezed == roads ? _self.roads : roads // ignore: cast_nullable_to_non_nullable
as List<Road>?,quantities: freezed == quantities ? _self.quantities : quantities // ignore: cast_nullable_to_non_nullable
as List<WorkQuantityType>?,equipment: freezed == equipment ? _self.equipment : equipment // ignore: cast_nullable_to_non_nullable
as List<WorkEquipment>?,
  ));
}

}


/// Adds pattern-matching-related methods to [ReportApiData].
extension ReportApiDataPatterns on ReportApiData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReportApiData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReportApiData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReportApiData value)  $default,){
final _that = this;
switch (_that) {
case _ReportApiData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReportApiData value)?  $default,){
final _that = this;
switch (_that) {
case _ReportApiData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ScopeOfWork>? workScopes,  List<Province>? states,  List<District>? districts,  List<Road>? roads,  List<WorkQuantityType>? quantities,  List<WorkEquipment>? equipment)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReportApiData() when $default != null:
return $default(_that.workScopes,_that.states,_that.districts,_that.roads,_that.quantities,_that.equipment);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ScopeOfWork>? workScopes,  List<Province>? states,  List<District>? districts,  List<Road>? roads,  List<WorkQuantityType>? quantities,  List<WorkEquipment>? equipment)  $default,) {final _that = this;
switch (_that) {
case _ReportApiData():
return $default(_that.workScopes,_that.states,_that.districts,_that.roads,_that.quantities,_that.equipment);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ScopeOfWork>? workScopes,  List<Province>? states,  List<District>? districts,  List<Road>? roads,  List<WorkQuantityType>? quantities,  List<WorkEquipment>? equipment)?  $default,) {final _that = this;
switch (_that) {
case _ReportApiData() when $default != null:
return $default(_that.workScopes,_that.states,_that.districts,_that.roads,_that.quantities,_that.equipment);case _:
  return null;

}
}

}

/// @nodoc


class _ReportApiData implements ReportApiData {
  const _ReportApiData({final  List<ScopeOfWork>? workScopes, final  List<Province>? states, final  List<District>? districts, final  List<Road>? roads, final  List<WorkQuantityType>? quantities, final  List<WorkEquipment>? equipment}): _workScopes = workScopes,_states = states,_districts = districts,_roads = roads,_quantities = quantities,_equipment = equipment;
  

 final  List<ScopeOfWork>? _workScopes;
@override List<ScopeOfWork>? get workScopes {
  final value = _workScopes;
  if (value == null) return null;
  if (_workScopes is EqualUnmodifiableListView) return _workScopes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<Province>? _states;
@override List<Province>? get states {
  final value = _states;
  if (value == null) return null;
  if (_states is EqualUnmodifiableListView) return _states;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<District>? _districts;
@override List<District>? get districts {
  final value = _districts;
  if (value == null) return null;
  if (_districts is EqualUnmodifiableListView) return _districts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<Road>? _roads;
@override List<Road>? get roads {
  final value = _roads;
  if (value == null) return null;
  if (_roads is EqualUnmodifiableListView) return _roads;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<WorkQuantityType>? _quantities;
@override List<WorkQuantityType>? get quantities {
  final value = _quantities;
  if (value == null) return null;
  if (_quantities is EqualUnmodifiableListView) return _quantities;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<WorkEquipment>? _equipment;
@override List<WorkEquipment>? get equipment {
  final value = _equipment;
  if (value == null) return null;
  if (_equipment is EqualUnmodifiableListView) return _equipment;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of ReportApiData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReportApiDataCopyWith<_ReportApiData> get copyWith => __$ReportApiDataCopyWithImpl<_ReportApiData>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReportApiData&&const DeepCollectionEquality().equals(other._workScopes, _workScopes)&&const DeepCollectionEquality().equals(other._states, _states)&&const DeepCollectionEquality().equals(other._districts, _districts)&&const DeepCollectionEquality().equals(other._roads, _roads)&&const DeepCollectionEquality().equals(other._quantities, _quantities)&&const DeepCollectionEquality().equals(other._equipment, _equipment));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_workScopes),const DeepCollectionEquality().hash(_states),const DeepCollectionEquality().hash(_districts),const DeepCollectionEquality().hash(_roads),const DeepCollectionEquality().hash(_quantities),const DeepCollectionEquality().hash(_equipment));

@override
String toString() {
  return 'ReportApiData(workScopes: $workScopes, states: $states, districts: $districts, roads: $roads, quantities: $quantities, equipment: $equipment)';
}


}

/// @nodoc
abstract mixin class _$ReportApiDataCopyWith<$Res> implements $ReportApiDataCopyWith<$Res> {
  factory _$ReportApiDataCopyWith(_ReportApiData value, $Res Function(_ReportApiData) _then) = __$ReportApiDataCopyWithImpl;
@override @useResult
$Res call({
 List<ScopeOfWork>? workScopes, List<Province>? states, List<District>? districts, List<Road>? roads, List<WorkQuantityType>? quantities, List<WorkEquipment>? equipment
});




}
/// @nodoc
class __$ReportApiDataCopyWithImpl<$Res>
    implements _$ReportApiDataCopyWith<$Res> {
  __$ReportApiDataCopyWithImpl(this._self, this._then);

  final _ReportApiData _self;
  final $Res Function(_ReportApiData) _then;

/// Create a copy of ReportApiData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? workScopes = freezed,Object? states = freezed,Object? districts = freezed,Object? roads = freezed,Object? quantities = freezed,Object? equipment = freezed,}) {
  return _then(_ReportApiData(
workScopes: freezed == workScopes ? _self._workScopes : workScopes // ignore: cast_nullable_to_non_nullable
as List<ScopeOfWork>?,states: freezed == states ? _self._states : states // ignore: cast_nullable_to_non_nullable
as List<Province>?,districts: freezed == districts ? _self._districts : districts // ignore: cast_nullable_to_non_nullable
as List<District>?,roads: freezed == roads ? _self._roads : roads // ignore: cast_nullable_to_non_nullable
as List<Road>?,quantities: freezed == quantities ? _self._quantities : quantities // ignore: cast_nullable_to_non_nullable
as List<WorkQuantityType>?,equipment: freezed == equipment ? _self._equipment : equipment // ignore: cast_nullable_to_non_nullable
as List<WorkEquipment>?,
  ));
}


}

/// @nodoc
mixin _$ReportSelections {

 String? get selectedScopeUid; ScopeOfWork? get selectedScope; String? get selectedWeather; String? get selectedStateUid; Province? get selectedState; String? get selectedDistrictUid; District? get selectedDistrict; String? get selectedRoadUid; Road? get selectedRoad; String? get section; String? get sectionError; List<String> get selectedQuantityTypeUids; List<WorkQuantityType> get selectedQuantityTypes; List<String> get selectedEquipmentUids; List<WorkEquipment> get selectedEquipment;
/// Create a copy of ReportSelections
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReportSelectionsCopyWith<ReportSelections> get copyWith => _$ReportSelectionsCopyWithImpl<ReportSelections>(this as ReportSelections, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReportSelections&&(identical(other.selectedScopeUid, selectedScopeUid) || other.selectedScopeUid == selectedScopeUid)&&(identical(other.selectedScope, selectedScope) || other.selectedScope == selectedScope)&&(identical(other.selectedWeather, selectedWeather) || other.selectedWeather == selectedWeather)&&(identical(other.selectedStateUid, selectedStateUid) || other.selectedStateUid == selectedStateUid)&&(identical(other.selectedState, selectedState) || other.selectedState == selectedState)&&(identical(other.selectedDistrictUid, selectedDistrictUid) || other.selectedDistrictUid == selectedDistrictUid)&&(identical(other.selectedDistrict, selectedDistrict) || other.selectedDistrict == selectedDistrict)&&(identical(other.selectedRoadUid, selectedRoadUid) || other.selectedRoadUid == selectedRoadUid)&&(identical(other.selectedRoad, selectedRoad) || other.selectedRoad == selectedRoad)&&(identical(other.section, section) || other.section == section)&&(identical(other.sectionError, sectionError) || other.sectionError == sectionError)&&const DeepCollectionEquality().equals(other.selectedQuantityTypeUids, selectedQuantityTypeUids)&&const DeepCollectionEquality().equals(other.selectedQuantityTypes, selectedQuantityTypes)&&const DeepCollectionEquality().equals(other.selectedEquipmentUids, selectedEquipmentUids)&&const DeepCollectionEquality().equals(other.selectedEquipment, selectedEquipment));
}


@override
int get hashCode => Object.hash(runtimeType,selectedScopeUid,selectedScope,selectedWeather,selectedStateUid,selectedState,selectedDistrictUid,selectedDistrict,selectedRoadUid,selectedRoad,section,sectionError,const DeepCollectionEquality().hash(selectedQuantityTypeUids),const DeepCollectionEquality().hash(selectedQuantityTypes),const DeepCollectionEquality().hash(selectedEquipmentUids),const DeepCollectionEquality().hash(selectedEquipment));

@override
String toString() {
  return 'ReportSelections(selectedScopeUid: $selectedScopeUid, selectedScope: $selectedScope, selectedWeather: $selectedWeather, selectedStateUid: $selectedStateUid, selectedState: $selectedState, selectedDistrictUid: $selectedDistrictUid, selectedDistrict: $selectedDistrict, selectedRoadUid: $selectedRoadUid, selectedRoad: $selectedRoad, section: $section, sectionError: $sectionError, selectedQuantityTypeUids: $selectedQuantityTypeUids, selectedQuantityTypes: $selectedQuantityTypes, selectedEquipmentUids: $selectedEquipmentUids, selectedEquipment: $selectedEquipment)';
}


}

/// @nodoc
abstract mixin class $ReportSelectionsCopyWith<$Res>  {
  factory $ReportSelectionsCopyWith(ReportSelections value, $Res Function(ReportSelections) _then) = _$ReportSelectionsCopyWithImpl;
@useResult
$Res call({
 String? selectedScopeUid, ScopeOfWork? selectedScope, String? selectedWeather, String? selectedStateUid, Province? selectedState, String? selectedDistrictUid, District? selectedDistrict, String? selectedRoadUid, Road? selectedRoad, String? section, String? sectionError, List<String> selectedQuantityTypeUids, List<WorkQuantityType> selectedQuantityTypes, List<String> selectedEquipmentUids, List<WorkEquipment> selectedEquipment
});




}
/// @nodoc
class _$ReportSelectionsCopyWithImpl<$Res>
    implements $ReportSelectionsCopyWith<$Res> {
  _$ReportSelectionsCopyWithImpl(this._self, this._then);

  final ReportSelections _self;
  final $Res Function(ReportSelections) _then;

/// Create a copy of ReportSelections
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? selectedScopeUid = freezed,Object? selectedScope = freezed,Object? selectedWeather = freezed,Object? selectedStateUid = freezed,Object? selectedState = freezed,Object? selectedDistrictUid = freezed,Object? selectedDistrict = freezed,Object? selectedRoadUid = freezed,Object? selectedRoad = freezed,Object? section = freezed,Object? sectionError = freezed,Object? selectedQuantityTypeUids = null,Object? selectedQuantityTypes = null,Object? selectedEquipmentUids = null,Object? selectedEquipment = null,}) {
  return _then(_self.copyWith(
selectedScopeUid: freezed == selectedScopeUid ? _self.selectedScopeUid : selectedScopeUid // ignore: cast_nullable_to_non_nullable
as String?,selectedScope: freezed == selectedScope ? _self.selectedScope : selectedScope // ignore: cast_nullable_to_non_nullable
as ScopeOfWork?,selectedWeather: freezed == selectedWeather ? _self.selectedWeather : selectedWeather // ignore: cast_nullable_to_non_nullable
as String?,selectedStateUid: freezed == selectedStateUid ? _self.selectedStateUid : selectedStateUid // ignore: cast_nullable_to_non_nullable
as String?,selectedState: freezed == selectedState ? _self.selectedState : selectedState // ignore: cast_nullable_to_non_nullable
as Province?,selectedDistrictUid: freezed == selectedDistrictUid ? _self.selectedDistrictUid : selectedDistrictUid // ignore: cast_nullable_to_non_nullable
as String?,selectedDistrict: freezed == selectedDistrict ? _self.selectedDistrict : selectedDistrict // ignore: cast_nullable_to_non_nullable
as District?,selectedRoadUid: freezed == selectedRoadUid ? _self.selectedRoadUid : selectedRoadUid // ignore: cast_nullable_to_non_nullable
as String?,selectedRoad: freezed == selectedRoad ? _self.selectedRoad : selectedRoad // ignore: cast_nullable_to_non_nullable
as Road?,section: freezed == section ? _self.section : section // ignore: cast_nullable_to_non_nullable
as String?,sectionError: freezed == sectionError ? _self.sectionError : sectionError // ignore: cast_nullable_to_non_nullable
as String?,selectedQuantityTypeUids: null == selectedQuantityTypeUids ? _self.selectedQuantityTypeUids : selectedQuantityTypeUids // ignore: cast_nullable_to_non_nullable
as List<String>,selectedQuantityTypes: null == selectedQuantityTypes ? _self.selectedQuantityTypes : selectedQuantityTypes // ignore: cast_nullable_to_non_nullable
as List<WorkQuantityType>,selectedEquipmentUids: null == selectedEquipmentUids ? _self.selectedEquipmentUids : selectedEquipmentUids // ignore: cast_nullable_to_non_nullable
as List<String>,selectedEquipment: null == selectedEquipment ? _self.selectedEquipment : selectedEquipment // ignore: cast_nullable_to_non_nullable
as List<WorkEquipment>,
  ));
}

}


/// Adds pattern-matching-related methods to [ReportSelections].
extension ReportSelectionsPatterns on ReportSelections {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReportSelections value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReportSelections() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReportSelections value)  $default,){
final _that = this;
switch (_that) {
case _ReportSelections():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReportSelections value)?  $default,){
final _that = this;
switch (_that) {
case _ReportSelections() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? selectedScopeUid,  ScopeOfWork? selectedScope,  String? selectedWeather,  String? selectedStateUid,  Province? selectedState,  String? selectedDistrictUid,  District? selectedDistrict,  String? selectedRoadUid,  Road? selectedRoad,  String? section,  String? sectionError,  List<String> selectedQuantityTypeUids,  List<WorkQuantityType> selectedQuantityTypes,  List<String> selectedEquipmentUids,  List<WorkEquipment> selectedEquipment)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReportSelections() when $default != null:
return $default(_that.selectedScopeUid,_that.selectedScope,_that.selectedWeather,_that.selectedStateUid,_that.selectedState,_that.selectedDistrictUid,_that.selectedDistrict,_that.selectedRoadUid,_that.selectedRoad,_that.section,_that.sectionError,_that.selectedQuantityTypeUids,_that.selectedQuantityTypes,_that.selectedEquipmentUids,_that.selectedEquipment);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? selectedScopeUid,  ScopeOfWork? selectedScope,  String? selectedWeather,  String? selectedStateUid,  Province? selectedState,  String? selectedDistrictUid,  District? selectedDistrict,  String? selectedRoadUid,  Road? selectedRoad,  String? section,  String? sectionError,  List<String> selectedQuantityTypeUids,  List<WorkQuantityType> selectedQuantityTypes,  List<String> selectedEquipmentUids,  List<WorkEquipment> selectedEquipment)  $default,) {final _that = this;
switch (_that) {
case _ReportSelections():
return $default(_that.selectedScopeUid,_that.selectedScope,_that.selectedWeather,_that.selectedStateUid,_that.selectedState,_that.selectedDistrictUid,_that.selectedDistrict,_that.selectedRoadUid,_that.selectedRoad,_that.section,_that.sectionError,_that.selectedQuantityTypeUids,_that.selectedQuantityTypes,_that.selectedEquipmentUids,_that.selectedEquipment);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? selectedScopeUid,  ScopeOfWork? selectedScope,  String? selectedWeather,  String? selectedStateUid,  Province? selectedState,  String? selectedDistrictUid,  District? selectedDistrict,  String? selectedRoadUid,  Road? selectedRoad,  String? section,  String? sectionError,  List<String> selectedQuantityTypeUids,  List<WorkQuantityType> selectedQuantityTypes,  List<String> selectedEquipmentUids,  List<WorkEquipment> selectedEquipment)?  $default,) {final _that = this;
switch (_that) {
case _ReportSelections() when $default != null:
return $default(_that.selectedScopeUid,_that.selectedScope,_that.selectedWeather,_that.selectedStateUid,_that.selectedState,_that.selectedDistrictUid,_that.selectedDistrict,_that.selectedRoadUid,_that.selectedRoad,_that.section,_that.sectionError,_that.selectedQuantityTypeUids,_that.selectedQuantityTypes,_that.selectedEquipmentUids,_that.selectedEquipment);case _:
  return null;

}
}

}

/// @nodoc


class _ReportSelections implements ReportSelections {
  const _ReportSelections({this.selectedScopeUid, this.selectedScope, this.selectedWeather, this.selectedStateUid, this.selectedState, this.selectedDistrictUid, this.selectedDistrict, this.selectedRoadUid, this.selectedRoad, this.section, this.sectionError, final  List<String> selectedQuantityTypeUids = const [], final  List<WorkQuantityType> selectedQuantityTypes = const [], final  List<String> selectedEquipmentUids = const [], final  List<WorkEquipment> selectedEquipment = const []}): _selectedQuantityTypeUids = selectedQuantityTypeUids,_selectedQuantityTypes = selectedQuantityTypes,_selectedEquipmentUids = selectedEquipmentUids,_selectedEquipment = selectedEquipment;
  

@override final  String? selectedScopeUid;
@override final  ScopeOfWork? selectedScope;
@override final  String? selectedWeather;
@override final  String? selectedStateUid;
@override final  Province? selectedState;
@override final  String? selectedDistrictUid;
@override final  District? selectedDistrict;
@override final  String? selectedRoadUid;
@override final  Road? selectedRoad;
@override final  String? section;
@override final  String? sectionError;
 final  List<String> _selectedQuantityTypeUids;
@override@JsonKey() List<String> get selectedQuantityTypeUids {
  if (_selectedQuantityTypeUids is EqualUnmodifiableListView) return _selectedQuantityTypeUids;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_selectedQuantityTypeUids);
}

 final  List<WorkQuantityType> _selectedQuantityTypes;
@override@JsonKey() List<WorkQuantityType> get selectedQuantityTypes {
  if (_selectedQuantityTypes is EqualUnmodifiableListView) return _selectedQuantityTypes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_selectedQuantityTypes);
}

 final  List<String> _selectedEquipmentUids;
@override@JsonKey() List<String> get selectedEquipmentUids {
  if (_selectedEquipmentUids is EqualUnmodifiableListView) return _selectedEquipmentUids;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_selectedEquipmentUids);
}

 final  List<WorkEquipment> _selectedEquipment;
@override@JsonKey() List<WorkEquipment> get selectedEquipment {
  if (_selectedEquipment is EqualUnmodifiableListView) return _selectedEquipment;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_selectedEquipment);
}


/// Create a copy of ReportSelections
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReportSelectionsCopyWith<_ReportSelections> get copyWith => __$ReportSelectionsCopyWithImpl<_ReportSelections>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReportSelections&&(identical(other.selectedScopeUid, selectedScopeUid) || other.selectedScopeUid == selectedScopeUid)&&(identical(other.selectedScope, selectedScope) || other.selectedScope == selectedScope)&&(identical(other.selectedWeather, selectedWeather) || other.selectedWeather == selectedWeather)&&(identical(other.selectedStateUid, selectedStateUid) || other.selectedStateUid == selectedStateUid)&&(identical(other.selectedState, selectedState) || other.selectedState == selectedState)&&(identical(other.selectedDistrictUid, selectedDistrictUid) || other.selectedDistrictUid == selectedDistrictUid)&&(identical(other.selectedDistrict, selectedDistrict) || other.selectedDistrict == selectedDistrict)&&(identical(other.selectedRoadUid, selectedRoadUid) || other.selectedRoadUid == selectedRoadUid)&&(identical(other.selectedRoad, selectedRoad) || other.selectedRoad == selectedRoad)&&(identical(other.section, section) || other.section == section)&&(identical(other.sectionError, sectionError) || other.sectionError == sectionError)&&const DeepCollectionEquality().equals(other._selectedQuantityTypeUids, _selectedQuantityTypeUids)&&const DeepCollectionEquality().equals(other._selectedQuantityTypes, _selectedQuantityTypes)&&const DeepCollectionEquality().equals(other._selectedEquipmentUids, _selectedEquipmentUids)&&const DeepCollectionEquality().equals(other._selectedEquipment, _selectedEquipment));
}


@override
int get hashCode => Object.hash(runtimeType,selectedScopeUid,selectedScope,selectedWeather,selectedStateUid,selectedState,selectedDistrictUid,selectedDistrict,selectedRoadUid,selectedRoad,section,sectionError,const DeepCollectionEquality().hash(_selectedQuantityTypeUids),const DeepCollectionEquality().hash(_selectedQuantityTypes),const DeepCollectionEquality().hash(_selectedEquipmentUids),const DeepCollectionEquality().hash(_selectedEquipment));

@override
String toString() {
  return 'ReportSelections(selectedScopeUid: $selectedScopeUid, selectedScope: $selectedScope, selectedWeather: $selectedWeather, selectedStateUid: $selectedStateUid, selectedState: $selectedState, selectedDistrictUid: $selectedDistrictUid, selectedDistrict: $selectedDistrict, selectedRoadUid: $selectedRoadUid, selectedRoad: $selectedRoad, section: $section, sectionError: $sectionError, selectedQuantityTypeUids: $selectedQuantityTypeUids, selectedQuantityTypes: $selectedQuantityTypes, selectedEquipmentUids: $selectedEquipmentUids, selectedEquipment: $selectedEquipment)';
}


}

/// @nodoc
abstract mixin class _$ReportSelectionsCopyWith<$Res> implements $ReportSelectionsCopyWith<$Res> {
  factory _$ReportSelectionsCopyWith(_ReportSelections value, $Res Function(_ReportSelections) _then) = __$ReportSelectionsCopyWithImpl;
@override @useResult
$Res call({
 String? selectedScopeUid, ScopeOfWork? selectedScope, String? selectedWeather, String? selectedStateUid, Province? selectedState, String? selectedDistrictUid, District? selectedDistrict, String? selectedRoadUid, Road? selectedRoad, String? section, String? sectionError, List<String> selectedQuantityTypeUids, List<WorkQuantityType> selectedQuantityTypes, List<String> selectedEquipmentUids, List<WorkEquipment> selectedEquipment
});




}
/// @nodoc
class __$ReportSelectionsCopyWithImpl<$Res>
    implements _$ReportSelectionsCopyWith<$Res> {
  __$ReportSelectionsCopyWithImpl(this._self, this._then);

  final _ReportSelections _self;
  final $Res Function(_ReportSelections) _then;

/// Create a copy of ReportSelections
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? selectedScopeUid = freezed,Object? selectedScope = freezed,Object? selectedWeather = freezed,Object? selectedStateUid = freezed,Object? selectedState = freezed,Object? selectedDistrictUid = freezed,Object? selectedDistrict = freezed,Object? selectedRoadUid = freezed,Object? selectedRoad = freezed,Object? section = freezed,Object? sectionError = freezed,Object? selectedQuantityTypeUids = null,Object? selectedQuantityTypes = null,Object? selectedEquipmentUids = null,Object? selectedEquipment = null,}) {
  return _then(_ReportSelections(
selectedScopeUid: freezed == selectedScopeUid ? _self.selectedScopeUid : selectedScopeUid // ignore: cast_nullable_to_non_nullable
as String?,selectedScope: freezed == selectedScope ? _self.selectedScope : selectedScope // ignore: cast_nullable_to_non_nullable
as ScopeOfWork?,selectedWeather: freezed == selectedWeather ? _self.selectedWeather : selectedWeather // ignore: cast_nullable_to_non_nullable
as String?,selectedStateUid: freezed == selectedStateUid ? _self.selectedStateUid : selectedStateUid // ignore: cast_nullable_to_non_nullable
as String?,selectedState: freezed == selectedState ? _self.selectedState : selectedState // ignore: cast_nullable_to_non_nullable
as Province?,selectedDistrictUid: freezed == selectedDistrictUid ? _self.selectedDistrictUid : selectedDistrictUid // ignore: cast_nullable_to_non_nullable
as String?,selectedDistrict: freezed == selectedDistrict ? _self.selectedDistrict : selectedDistrict // ignore: cast_nullable_to_non_nullable
as District?,selectedRoadUid: freezed == selectedRoadUid ? _self.selectedRoadUid : selectedRoadUid // ignore: cast_nullable_to_non_nullable
as String?,selectedRoad: freezed == selectedRoad ? _self.selectedRoad : selectedRoad // ignore: cast_nullable_to_non_nullable
as Road?,section: freezed == section ? _self.section : section // ignore: cast_nullable_to_non_nullable
as String?,sectionError: freezed == sectionError ? _self.sectionError : sectionError // ignore: cast_nullable_to_non_nullable
as String?,selectedQuantityTypeUids: null == selectedQuantityTypeUids ? _self._selectedQuantityTypeUids : selectedQuantityTypeUids // ignore: cast_nullable_to_non_nullable
as List<String>,selectedQuantityTypes: null == selectedQuantityTypes ? _self._selectedQuantityTypes : selectedQuantityTypes // ignore: cast_nullable_to_non_nullable
as List<WorkQuantityType>,selectedEquipmentUids: null == selectedEquipmentUids ? _self._selectedEquipmentUids : selectedEquipmentUids // ignore: cast_nullable_to_non_nullable
as List<String>,selectedEquipment: null == selectedEquipment ? _self._selectedEquipment : selectedEquipment // ignore: cast_nullable_to_non_nullable
as List<WorkEquipment>,
  ));
}


}

/// @nodoc
mixin _$ReportFormData {

 Map<String, dynamic> get fieldValues; Map<String, List<String>> get imageFields; Map<String, String?> get fieldErrors; List<String> get validationErrors; bool get isFormValid;
/// Create a copy of ReportFormData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReportFormDataCopyWith<ReportFormData> get copyWith => _$ReportFormDataCopyWithImpl<ReportFormData>(this as ReportFormData, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReportFormData&&const DeepCollectionEquality().equals(other.fieldValues, fieldValues)&&const DeepCollectionEquality().equals(other.imageFields, imageFields)&&const DeepCollectionEquality().equals(other.fieldErrors, fieldErrors)&&const DeepCollectionEquality().equals(other.validationErrors, validationErrors)&&(identical(other.isFormValid, isFormValid) || other.isFormValid == isFormValid));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(fieldValues),const DeepCollectionEquality().hash(imageFields),const DeepCollectionEquality().hash(fieldErrors),const DeepCollectionEquality().hash(validationErrors),isFormValid);

@override
String toString() {
  return 'ReportFormData(fieldValues: $fieldValues, imageFields: $imageFields, fieldErrors: $fieldErrors, validationErrors: $validationErrors, isFormValid: $isFormValid)';
}


}

/// @nodoc
abstract mixin class $ReportFormDataCopyWith<$Res>  {
  factory $ReportFormDataCopyWith(ReportFormData value, $Res Function(ReportFormData) _then) = _$ReportFormDataCopyWithImpl;
@useResult
$Res call({
 Map<String, dynamic> fieldValues, Map<String, List<String>> imageFields, Map<String, String?> fieldErrors, List<String> validationErrors, bool isFormValid
});




}
/// @nodoc
class _$ReportFormDataCopyWithImpl<$Res>
    implements $ReportFormDataCopyWith<$Res> {
  _$ReportFormDataCopyWithImpl(this._self, this._then);

  final ReportFormData _self;
  final $Res Function(ReportFormData) _then;

/// Create a copy of ReportFormData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fieldValues = null,Object? imageFields = null,Object? fieldErrors = null,Object? validationErrors = null,Object? isFormValid = null,}) {
  return _then(_self.copyWith(
fieldValues: null == fieldValues ? _self.fieldValues : fieldValues // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,imageFields: null == imageFields ? _self.imageFields : imageFields // ignore: cast_nullable_to_non_nullable
as Map<String, List<String>>,fieldErrors: null == fieldErrors ? _self.fieldErrors : fieldErrors // ignore: cast_nullable_to_non_nullable
as Map<String, String?>,validationErrors: null == validationErrors ? _self.validationErrors : validationErrors // ignore: cast_nullable_to_non_nullable
as List<String>,isFormValid: null == isFormValid ? _self.isFormValid : isFormValid // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [ReportFormData].
extension ReportFormDataPatterns on ReportFormData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReportFormData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReportFormData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReportFormData value)  $default,){
final _that = this;
switch (_that) {
case _ReportFormData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReportFormData value)?  $default,){
final _that = this;
switch (_that) {
case _ReportFormData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Map<String, dynamic> fieldValues,  Map<String, List<String>> imageFields,  Map<String, String?> fieldErrors,  List<String> validationErrors,  bool isFormValid)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReportFormData() when $default != null:
return $default(_that.fieldValues,_that.imageFields,_that.fieldErrors,_that.validationErrors,_that.isFormValid);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Map<String, dynamic> fieldValues,  Map<String, List<String>> imageFields,  Map<String, String?> fieldErrors,  List<String> validationErrors,  bool isFormValid)  $default,) {final _that = this;
switch (_that) {
case _ReportFormData():
return $default(_that.fieldValues,_that.imageFields,_that.fieldErrors,_that.validationErrors,_that.isFormValid);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Map<String, dynamic> fieldValues,  Map<String, List<String>> imageFields,  Map<String, String?> fieldErrors,  List<String> validationErrors,  bool isFormValid)?  $default,) {final _that = this;
switch (_that) {
case _ReportFormData() when $default != null:
return $default(_that.fieldValues,_that.imageFields,_that.fieldErrors,_that.validationErrors,_that.isFormValid);case _:
  return null;

}
}

}

/// @nodoc


class _ReportFormData implements ReportFormData {
  const _ReportFormData({final  Map<String, dynamic> fieldValues = const {}, final  Map<String, List<String>> imageFields = const {}, final  Map<String, String?> fieldErrors = const {}, final  List<String> validationErrors = const [], this.isFormValid = false}): _fieldValues = fieldValues,_imageFields = imageFields,_fieldErrors = fieldErrors,_validationErrors = validationErrors;
  

 final  Map<String, dynamic> _fieldValues;
@override@JsonKey() Map<String, dynamic> get fieldValues {
  if (_fieldValues is EqualUnmodifiableMapView) return _fieldValues;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_fieldValues);
}

 final  Map<String, List<String>> _imageFields;
@override@JsonKey() Map<String, List<String>> get imageFields {
  if (_imageFields is EqualUnmodifiableMapView) return _imageFields;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_imageFields);
}

 final  Map<String, String?> _fieldErrors;
@override@JsonKey() Map<String, String?> get fieldErrors {
  if (_fieldErrors is EqualUnmodifiableMapView) return _fieldErrors;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_fieldErrors);
}

 final  List<String> _validationErrors;
@override@JsonKey() List<String> get validationErrors {
  if (_validationErrors is EqualUnmodifiableListView) return _validationErrors;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_validationErrors);
}

@override@JsonKey() final  bool isFormValid;

/// Create a copy of ReportFormData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReportFormDataCopyWith<_ReportFormData> get copyWith => __$ReportFormDataCopyWithImpl<_ReportFormData>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReportFormData&&const DeepCollectionEquality().equals(other._fieldValues, _fieldValues)&&const DeepCollectionEquality().equals(other._imageFields, _imageFields)&&const DeepCollectionEquality().equals(other._fieldErrors, _fieldErrors)&&const DeepCollectionEquality().equals(other._validationErrors, _validationErrors)&&(identical(other.isFormValid, isFormValid) || other.isFormValid == isFormValid));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_fieldValues),const DeepCollectionEquality().hash(_imageFields),const DeepCollectionEquality().hash(_fieldErrors),const DeepCollectionEquality().hash(_validationErrors),isFormValid);

@override
String toString() {
  return 'ReportFormData(fieldValues: $fieldValues, imageFields: $imageFields, fieldErrors: $fieldErrors, validationErrors: $validationErrors, isFormValid: $isFormValid)';
}


}

/// @nodoc
abstract mixin class _$ReportFormDataCopyWith<$Res> implements $ReportFormDataCopyWith<$Res> {
  factory _$ReportFormDataCopyWith(_ReportFormData value, $Res Function(_ReportFormData) _then) = __$ReportFormDataCopyWithImpl;
@override @useResult
$Res call({
 Map<String, dynamic> fieldValues, Map<String, List<String>> imageFields, Map<String, String?> fieldErrors, List<String> validationErrors, bool isFormValid
});




}
/// @nodoc
class __$ReportFormDataCopyWithImpl<$Res>
    implements _$ReportFormDataCopyWith<$Res> {
  __$ReportFormDataCopyWithImpl(this._self, this._then);

  final _ReportFormData _self;
  final $Res Function(_ReportFormData) _then;

/// Create a copy of ReportFormData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fieldValues = null,Object? imageFields = null,Object? fieldErrors = null,Object? validationErrors = null,Object? isFormValid = null,}) {
  return _then(_ReportFormData(
fieldValues: null == fieldValues ? _self._fieldValues : fieldValues // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,imageFields: null == imageFields ? _self._imageFields : imageFields // ignore: cast_nullable_to_non_nullable
as Map<String, List<String>>,fieldErrors: null == fieldErrors ? _self._fieldErrors : fieldErrors // ignore: cast_nullable_to_non_nullable
as Map<String, String?>,validationErrors: null == validationErrors ? _self._validationErrors : validationErrors // ignore: cast_nullable_to_non_nullable
as List<String>,isFormValid: null == isFormValid ? _self.isFormValid : isFormValid // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
