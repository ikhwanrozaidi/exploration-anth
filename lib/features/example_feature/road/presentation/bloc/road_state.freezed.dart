// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'road_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RoadState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RoadState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RoadState()';
}


}

/// @nodoc
class $RoadStateCopyWith<$Res>  {
$RoadStateCopyWith(RoadState _, $Res Function(RoadState) __);
}


/// Adds pattern-matching-related methods to [RoadState].
extension RoadStatePatterns on RoadState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( RoadInitial value)?  initial,TResult Function( RoadLoading value)?  loading,TResult Function( RoadLoaded value)?  loaded,TResult Function( RoadError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case RoadInitial() when initial != null:
return initial(_that);case RoadLoading() when loading != null:
return loading(_that);case RoadLoaded() when loaded != null:
return loaded(_that);case RoadError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( RoadInitial value)  initial,required TResult Function( RoadLoading value)  loading,required TResult Function( RoadLoaded value)  loaded,required TResult Function( RoadError value)  error,}){
final _that = this;
switch (_that) {
case RoadInitial():
return initial(_that);case RoadLoading():
return loading(_that);case RoadLoaded():
return loaded(_that);case RoadError():
return error(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( RoadInitial value)?  initial,TResult? Function( RoadLoading value)?  loading,TResult? Function( RoadLoaded value)?  loaded,TResult? Function( RoadError value)?  error,}){
final _that = this;
switch (_that) {
case RoadInitial() when initial != null:
return initial(_that);case RoadLoading() when loading != null:
return loading(_that);case RoadLoaded() when loaded != null:
return loaded(_that);case RoadError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<Country> allCountries,  List<Province> allProvinces,  List<District> allDistricts,  List<Road> allRoads,  List<Province> provinces,  List<District> districts,  List<Road> roads,  Province? selectedProvince,  District? selectedDistrict,  Road? selectedRoad,  List<Road> selectedRoads)?  loaded,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case RoadInitial() when initial != null:
return initial();case RoadLoading() when loading != null:
return loading();case RoadLoaded() when loaded != null:
return loaded(_that.allCountries,_that.allProvinces,_that.allDistricts,_that.allRoads,_that.provinces,_that.districts,_that.roads,_that.selectedProvince,_that.selectedDistrict,_that.selectedRoad,_that.selectedRoads);case RoadError() when error != null:
return error(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<Country> allCountries,  List<Province> allProvinces,  List<District> allDistricts,  List<Road> allRoads,  List<Province> provinces,  List<District> districts,  List<Road> roads,  Province? selectedProvince,  District? selectedDistrict,  Road? selectedRoad,  List<Road> selectedRoads)  loaded,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case RoadInitial():
return initial();case RoadLoading():
return loading();case RoadLoaded():
return loaded(_that.allCountries,_that.allProvinces,_that.allDistricts,_that.allRoads,_that.provinces,_that.districts,_that.roads,_that.selectedProvince,_that.selectedDistrict,_that.selectedRoad,_that.selectedRoads);case RoadError():
return error(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<Country> allCountries,  List<Province> allProvinces,  List<District> allDistricts,  List<Road> allRoads,  List<Province> provinces,  List<District> districts,  List<Road> roads,  Province? selectedProvince,  District? selectedDistrict,  Road? selectedRoad,  List<Road> selectedRoads)?  loaded,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case RoadInitial() when initial != null:
return initial();case RoadLoading() when loading != null:
return loading();case RoadLoaded() when loaded != null:
return loaded(_that.allCountries,_that.allProvinces,_that.allDistricts,_that.allRoads,_that.provinces,_that.districts,_that.roads,_that.selectedProvince,_that.selectedDistrict,_that.selectedRoad,_that.selectedRoads);case RoadError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class RoadInitial implements RoadState {
  const RoadInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RoadInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RoadState.initial()';
}


}




/// @nodoc


class RoadLoading implements RoadState {
  const RoadLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RoadLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RoadState.loading()';
}


}




/// @nodoc


class RoadLoaded implements RoadState {
  const RoadLoaded({final  List<Country> allCountries = const [], final  List<Province> allProvinces = const [], final  List<District> allDistricts = const [], final  List<Road> allRoads = const [], final  List<Province> provinces = const [], final  List<District> districts = const [], final  List<Road> roads = const [], this.selectedProvince, this.selectedDistrict, this.selectedRoad, final  List<Road> selectedRoads = const []}): _allCountries = allCountries,_allProvinces = allProvinces,_allDistricts = allDistricts,_allRoads = allRoads,_provinces = provinces,_districts = districts,_roads = roads,_selectedRoads = selectedRoads;
  

 final  List<Country> _allCountries;
@JsonKey() List<Country> get allCountries {
  if (_allCountries is EqualUnmodifiableListView) return _allCountries;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_allCountries);
}

 final  List<Province> _allProvinces;
@JsonKey() List<Province> get allProvinces {
  if (_allProvinces is EqualUnmodifiableListView) return _allProvinces;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_allProvinces);
}

 final  List<District> _allDistricts;
@JsonKey() List<District> get allDistricts {
  if (_allDistricts is EqualUnmodifiableListView) return _allDistricts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_allDistricts);
}

 final  List<Road> _allRoads;
@JsonKey() List<Road> get allRoads {
  if (_allRoads is EqualUnmodifiableListView) return _allRoads;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_allRoads);
}

 final  List<Province> _provinces;
@JsonKey() List<Province> get provinces {
  if (_provinces is EqualUnmodifiableListView) return _provinces;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_provinces);
}

 final  List<District> _districts;
@JsonKey() List<District> get districts {
  if (_districts is EqualUnmodifiableListView) return _districts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_districts);
}

 final  List<Road> _roads;
@JsonKey() List<Road> get roads {
  if (_roads is EqualUnmodifiableListView) return _roads;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_roads);
}

 final  Province? selectedProvince;
 final  District? selectedDistrict;
 final  Road? selectedRoad;
 final  List<Road> _selectedRoads;
@JsonKey() List<Road> get selectedRoads {
  if (_selectedRoads is EqualUnmodifiableListView) return _selectedRoads;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_selectedRoads);
}


/// Create a copy of RoadState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RoadLoadedCopyWith<RoadLoaded> get copyWith => _$RoadLoadedCopyWithImpl<RoadLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RoadLoaded&&const DeepCollectionEquality().equals(other._allCountries, _allCountries)&&const DeepCollectionEquality().equals(other._allProvinces, _allProvinces)&&const DeepCollectionEquality().equals(other._allDistricts, _allDistricts)&&const DeepCollectionEquality().equals(other._allRoads, _allRoads)&&const DeepCollectionEquality().equals(other._provinces, _provinces)&&const DeepCollectionEquality().equals(other._districts, _districts)&&const DeepCollectionEquality().equals(other._roads, _roads)&&(identical(other.selectedProvince, selectedProvince) || other.selectedProvince == selectedProvince)&&(identical(other.selectedDistrict, selectedDistrict) || other.selectedDistrict == selectedDistrict)&&(identical(other.selectedRoad, selectedRoad) || other.selectedRoad == selectedRoad)&&const DeepCollectionEquality().equals(other._selectedRoads, _selectedRoads));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_allCountries),const DeepCollectionEquality().hash(_allProvinces),const DeepCollectionEquality().hash(_allDistricts),const DeepCollectionEquality().hash(_allRoads),const DeepCollectionEquality().hash(_provinces),const DeepCollectionEquality().hash(_districts),const DeepCollectionEquality().hash(_roads),selectedProvince,selectedDistrict,selectedRoad,const DeepCollectionEquality().hash(_selectedRoads));

@override
String toString() {
  return 'RoadState.loaded(allCountries: $allCountries, allProvinces: $allProvinces, allDistricts: $allDistricts, allRoads: $allRoads, provinces: $provinces, districts: $districts, roads: $roads, selectedProvince: $selectedProvince, selectedDistrict: $selectedDistrict, selectedRoad: $selectedRoad, selectedRoads: $selectedRoads)';
}


}

/// @nodoc
abstract mixin class $RoadLoadedCopyWith<$Res> implements $RoadStateCopyWith<$Res> {
  factory $RoadLoadedCopyWith(RoadLoaded value, $Res Function(RoadLoaded) _then) = _$RoadLoadedCopyWithImpl;
@useResult
$Res call({
 List<Country> allCountries, List<Province> allProvinces, List<District> allDistricts, List<Road> allRoads, List<Province> provinces, List<District> districts, List<Road> roads, Province? selectedProvince, District? selectedDistrict, Road? selectedRoad, List<Road> selectedRoads
});




}
/// @nodoc
class _$RoadLoadedCopyWithImpl<$Res>
    implements $RoadLoadedCopyWith<$Res> {
  _$RoadLoadedCopyWithImpl(this._self, this._then);

  final RoadLoaded _self;
  final $Res Function(RoadLoaded) _then;

/// Create a copy of RoadState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? allCountries = null,Object? allProvinces = null,Object? allDistricts = null,Object? allRoads = null,Object? provinces = null,Object? districts = null,Object? roads = null,Object? selectedProvince = freezed,Object? selectedDistrict = freezed,Object? selectedRoad = freezed,Object? selectedRoads = null,}) {
  return _then(RoadLoaded(
allCountries: null == allCountries ? _self._allCountries : allCountries // ignore: cast_nullable_to_non_nullable
as List<Country>,allProvinces: null == allProvinces ? _self._allProvinces : allProvinces // ignore: cast_nullable_to_non_nullable
as List<Province>,allDistricts: null == allDistricts ? _self._allDistricts : allDistricts // ignore: cast_nullable_to_non_nullable
as List<District>,allRoads: null == allRoads ? _self._allRoads : allRoads // ignore: cast_nullable_to_non_nullable
as List<Road>,provinces: null == provinces ? _self._provinces : provinces // ignore: cast_nullable_to_non_nullable
as List<Province>,districts: null == districts ? _self._districts : districts // ignore: cast_nullable_to_non_nullable
as List<District>,roads: null == roads ? _self._roads : roads // ignore: cast_nullable_to_non_nullable
as List<Road>,selectedProvince: freezed == selectedProvince ? _self.selectedProvince : selectedProvince // ignore: cast_nullable_to_non_nullable
as Province?,selectedDistrict: freezed == selectedDistrict ? _self.selectedDistrict : selectedDistrict // ignore: cast_nullable_to_non_nullable
as District?,selectedRoad: freezed == selectedRoad ? _self.selectedRoad : selectedRoad // ignore: cast_nullable_to_non_nullable
as Road?,selectedRoads: null == selectedRoads ? _self._selectedRoads : selectedRoads // ignore: cast_nullable_to_non_nullable
as List<Road>,
  ));
}


}

/// @nodoc


class RoadError implements RoadState {
  const RoadError(this.message);
  

 final  String message;

/// Create a copy of RoadState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RoadErrorCopyWith<RoadError> get copyWith => _$RoadErrorCopyWithImpl<RoadError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RoadError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'RoadState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $RoadErrorCopyWith<$Res> implements $RoadStateCopyWith<$Res> {
  factory $RoadErrorCopyWith(RoadError value, $Res Function(RoadError) _then) = _$RoadErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$RoadErrorCopyWithImpl<$Res>
    implements $RoadErrorCopyWith<$Res> {
  _$RoadErrorCopyWithImpl(this._self, this._then);

  final RoadError _self;
  final $Res Function(RoadError) _then;

/// Create a copy of RoadState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(RoadError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
