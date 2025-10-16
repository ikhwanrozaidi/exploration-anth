// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'location_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LocationState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LocationState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LocationState()';
}


}

/// @nodoc
class $LocationStateCopyWith<$Res>  {
$LocationStateCopyWith(LocationState _, $Res Function(LocationState) __);
}


/// Adds pattern-matching-related methods to [LocationState].
extension LocationStatePatterns on LocationState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LocationInitial value)?  initial,TResult Function( LocationLoading value)?  loading,TResult Function( LocationLoaded value)?  loaded,TResult Function( LocationError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LocationInitial() when initial != null:
return initial(_that);case LocationLoading() when loading != null:
return loading(_that);case LocationLoaded() when loaded != null:
return loaded(_that);case LocationError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LocationInitial value)  initial,required TResult Function( LocationLoading value)  loading,required TResult Function( LocationLoaded value)  loaded,required TResult Function( LocationError value)  error,}){
final _that = this;
switch (_that) {
case LocationInitial():
return initial(_that);case LocationLoading():
return loading(_that);case LocationLoaded():
return loaded(_that);case LocationError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LocationInitial value)?  initial,TResult? Function( LocationLoading value)?  loading,TResult? Function( LocationLoaded value)?  loaded,TResult? Function( LocationError value)?  error,}){
final _that = this;
switch (_that) {
case LocationInitial() when initial != null:
return initial(_that);case LocationLoading() when loading != null:
return loading(_that);case LocationLoaded() when loaded != null:
return loaded(_that);case LocationError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<Province> provinces,  List<District> districts,  List<Road> roads,  Province? selectedProvince,  District? selectedDistrict,  Road? selectedRoad)?  loaded,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LocationInitial() when initial != null:
return initial();case LocationLoading() when loading != null:
return loading();case LocationLoaded() when loaded != null:
return loaded(_that.provinces,_that.districts,_that.roads,_that.selectedProvince,_that.selectedDistrict,_that.selectedRoad);case LocationError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<Province> provinces,  List<District> districts,  List<Road> roads,  Province? selectedProvince,  District? selectedDistrict,  Road? selectedRoad)  loaded,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case LocationInitial():
return initial();case LocationLoading():
return loading();case LocationLoaded():
return loaded(_that.provinces,_that.districts,_that.roads,_that.selectedProvince,_that.selectedDistrict,_that.selectedRoad);case LocationError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<Province> provinces,  List<District> districts,  List<Road> roads,  Province? selectedProvince,  District? selectedDistrict,  Road? selectedRoad)?  loaded,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case LocationInitial() when initial != null:
return initial();case LocationLoading() when loading != null:
return loading();case LocationLoaded() when loaded != null:
return loaded(_that.provinces,_that.districts,_that.roads,_that.selectedProvince,_that.selectedDistrict,_that.selectedRoad);case LocationError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class LocationInitial implements LocationState {
  const LocationInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LocationInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LocationState.initial()';
}


}




/// @nodoc


class LocationLoading implements LocationState {
  const LocationLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LocationLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LocationState.loading()';
}


}




/// @nodoc


class LocationLoaded implements LocationState {
  const LocationLoaded({final  List<Province> provinces = const [], final  List<District> districts = const [], final  List<Road> roads = const [], this.selectedProvince, this.selectedDistrict, this.selectedRoad}): _provinces = provinces,_districts = districts,_roads = roads;
  

// @Default([]) List<CountryLocation> countries,
 final  List<Province> _provinces;
// @Default([]) List<CountryLocation> countries,
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

// CountryLocation? selectedCountry,
 final  Province? selectedProvince;
 final  District? selectedDistrict;
 final  Road? selectedRoad;

/// Create a copy of LocationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LocationLoadedCopyWith<LocationLoaded> get copyWith => _$LocationLoadedCopyWithImpl<LocationLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LocationLoaded&&const DeepCollectionEquality().equals(other._provinces, _provinces)&&const DeepCollectionEquality().equals(other._districts, _districts)&&const DeepCollectionEquality().equals(other._roads, _roads)&&(identical(other.selectedProvince, selectedProvince) || other.selectedProvince == selectedProvince)&&(identical(other.selectedDistrict, selectedDistrict) || other.selectedDistrict == selectedDistrict)&&(identical(other.selectedRoad, selectedRoad) || other.selectedRoad == selectedRoad));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_provinces),const DeepCollectionEquality().hash(_districts),const DeepCollectionEquality().hash(_roads),selectedProvince,selectedDistrict,selectedRoad);

@override
String toString() {
  return 'LocationState.loaded(provinces: $provinces, districts: $districts, roads: $roads, selectedProvince: $selectedProvince, selectedDistrict: $selectedDistrict, selectedRoad: $selectedRoad)';
}


}

/// @nodoc
abstract mixin class $LocationLoadedCopyWith<$Res> implements $LocationStateCopyWith<$Res> {
  factory $LocationLoadedCopyWith(LocationLoaded value, $Res Function(LocationLoaded) _then) = _$LocationLoadedCopyWithImpl;
@useResult
$Res call({
 List<Province> provinces, List<District> districts, List<Road> roads, Province? selectedProvince, District? selectedDistrict, Road? selectedRoad
});




}
/// @nodoc
class _$LocationLoadedCopyWithImpl<$Res>
    implements $LocationLoadedCopyWith<$Res> {
  _$LocationLoadedCopyWithImpl(this._self, this._then);

  final LocationLoaded _self;
  final $Res Function(LocationLoaded) _then;

/// Create a copy of LocationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? provinces = null,Object? districts = null,Object? roads = null,Object? selectedProvince = freezed,Object? selectedDistrict = freezed,Object? selectedRoad = freezed,}) {
  return _then(LocationLoaded(
provinces: null == provinces ? _self._provinces : provinces // ignore: cast_nullable_to_non_nullable
as List<Province>,districts: null == districts ? _self._districts : districts // ignore: cast_nullable_to_non_nullable
as List<District>,roads: null == roads ? _self._roads : roads // ignore: cast_nullable_to_non_nullable
as List<Road>,selectedProvince: freezed == selectedProvince ? _self.selectedProvince : selectedProvince // ignore: cast_nullable_to_non_nullable
as Province?,selectedDistrict: freezed == selectedDistrict ? _self.selectedDistrict : selectedDistrict // ignore: cast_nullable_to_non_nullable
as District?,selectedRoad: freezed == selectedRoad ? _self.selectedRoad : selectedRoad // ignore: cast_nullable_to_non_nullable
as Road?,
  ));
}


}

/// @nodoc


class LocationError implements LocationState {
  const LocationError(this.message);
  

 final  String message;

/// Create a copy of LocationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LocationErrorCopyWith<LocationError> get copyWith => _$LocationErrorCopyWithImpl<LocationError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LocationError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'LocationState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $LocationErrorCopyWith<$Res> implements $LocationStateCopyWith<$Res> {
  factory $LocationErrorCopyWith(LocationError value, $Res Function(LocationError) _then) = _$LocationErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$LocationErrorCopyWithImpl<$Res>
    implements $LocationErrorCopyWith<$Res> {
  _$LocationErrorCopyWithImpl(this._self, this._then);

  final LocationError _self;
  final $Res Function(LocationError) _then;

/// Create a copy of LocationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(LocationError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
