// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'package_data_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PackageDataResponseModel {

 PackageModel? get package; List<CountryModel>? get countries; List<ProvinceModel>? get states; List<DistrictModel>? get districts; List<RoadModel>? get roads; List<PackageRoadModel>? get packageRoads;
/// Create a copy of PackageDataResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PackageDataResponseModelCopyWith<PackageDataResponseModel> get copyWith => _$PackageDataResponseModelCopyWithImpl<PackageDataResponseModel>(this as PackageDataResponseModel, _$identity);

  /// Serializes this PackageDataResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PackageDataResponseModel&&(identical(other.package, package) || other.package == package)&&const DeepCollectionEquality().equals(other.countries, countries)&&const DeepCollectionEquality().equals(other.states, states)&&const DeepCollectionEquality().equals(other.districts, districts)&&const DeepCollectionEquality().equals(other.roads, roads)&&const DeepCollectionEquality().equals(other.packageRoads, packageRoads));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,package,const DeepCollectionEquality().hash(countries),const DeepCollectionEquality().hash(states),const DeepCollectionEquality().hash(districts),const DeepCollectionEquality().hash(roads),const DeepCollectionEquality().hash(packageRoads));

@override
String toString() {
  return 'PackageDataResponseModel(package: $package, countries: $countries, states: $states, districts: $districts, roads: $roads, packageRoads: $packageRoads)';
}


}

/// @nodoc
abstract mixin class $PackageDataResponseModelCopyWith<$Res>  {
  factory $PackageDataResponseModelCopyWith(PackageDataResponseModel value, $Res Function(PackageDataResponseModel) _then) = _$PackageDataResponseModelCopyWithImpl;
@useResult
$Res call({
 PackageModel? package, List<CountryModel>? countries, List<ProvinceModel>? states, List<DistrictModel>? districts, List<RoadModel>? roads, List<PackageRoadModel>? packageRoads
});


$PackageModelCopyWith<$Res>? get package;

}
/// @nodoc
class _$PackageDataResponseModelCopyWithImpl<$Res>
    implements $PackageDataResponseModelCopyWith<$Res> {
  _$PackageDataResponseModelCopyWithImpl(this._self, this._then);

  final PackageDataResponseModel _self;
  final $Res Function(PackageDataResponseModel) _then;

/// Create a copy of PackageDataResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? package = freezed,Object? countries = freezed,Object? states = freezed,Object? districts = freezed,Object? roads = freezed,Object? packageRoads = freezed,}) {
  return _then(_self.copyWith(
package: freezed == package ? _self.package : package // ignore: cast_nullable_to_non_nullable
as PackageModel?,countries: freezed == countries ? _self.countries : countries // ignore: cast_nullable_to_non_nullable
as List<CountryModel>?,states: freezed == states ? _self.states : states // ignore: cast_nullable_to_non_nullable
as List<ProvinceModel>?,districts: freezed == districts ? _self.districts : districts // ignore: cast_nullable_to_non_nullable
as List<DistrictModel>?,roads: freezed == roads ? _self.roads : roads // ignore: cast_nullable_to_non_nullable
as List<RoadModel>?,packageRoads: freezed == packageRoads ? _self.packageRoads : packageRoads // ignore: cast_nullable_to_non_nullable
as List<PackageRoadModel>?,
  ));
}
/// Create a copy of PackageDataResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PackageModelCopyWith<$Res>? get package {
    if (_self.package == null) {
    return null;
  }

  return $PackageModelCopyWith<$Res>(_self.package!, (value) {
    return _then(_self.copyWith(package: value));
  });
}
}


/// Adds pattern-matching-related methods to [PackageDataResponseModel].
extension PackageDataResponseModelPatterns on PackageDataResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PackageDataResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PackageDataResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PackageDataResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _PackageDataResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PackageDataResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _PackageDataResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PackageModel? package,  List<CountryModel>? countries,  List<ProvinceModel>? states,  List<DistrictModel>? districts,  List<RoadModel>? roads,  List<PackageRoadModel>? packageRoads)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PackageDataResponseModel() when $default != null:
return $default(_that.package,_that.countries,_that.states,_that.districts,_that.roads,_that.packageRoads);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PackageModel? package,  List<CountryModel>? countries,  List<ProvinceModel>? states,  List<DistrictModel>? districts,  List<RoadModel>? roads,  List<PackageRoadModel>? packageRoads)  $default,) {final _that = this;
switch (_that) {
case _PackageDataResponseModel():
return $default(_that.package,_that.countries,_that.states,_that.districts,_that.roads,_that.packageRoads);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PackageModel? package,  List<CountryModel>? countries,  List<ProvinceModel>? states,  List<DistrictModel>? districts,  List<RoadModel>? roads,  List<PackageRoadModel>? packageRoads)?  $default,) {final _that = this;
switch (_that) {
case _PackageDataResponseModel() when $default != null:
return $default(_that.package,_that.countries,_that.states,_that.districts,_that.roads,_that.packageRoads);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PackageDataResponseModel extends PackageDataResponseModel {
  const _PackageDataResponseModel({this.package, final  List<CountryModel>? countries, final  List<ProvinceModel>? states, final  List<DistrictModel>? districts, final  List<RoadModel>? roads, final  List<PackageRoadModel>? packageRoads}): _countries = countries,_states = states,_districts = districts,_roads = roads,_packageRoads = packageRoads,super._();
  factory _PackageDataResponseModel.fromJson(Map<String, dynamic> json) => _$PackageDataResponseModelFromJson(json);

@override final  PackageModel? package;
 final  List<CountryModel>? _countries;
@override List<CountryModel>? get countries {
  final value = _countries;
  if (value == null) return null;
  if (_countries is EqualUnmodifiableListView) return _countries;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<ProvinceModel>? _states;
@override List<ProvinceModel>? get states {
  final value = _states;
  if (value == null) return null;
  if (_states is EqualUnmodifiableListView) return _states;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<DistrictModel>? _districts;
@override List<DistrictModel>? get districts {
  final value = _districts;
  if (value == null) return null;
  if (_districts is EqualUnmodifiableListView) return _districts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<RoadModel>? _roads;
@override List<RoadModel>? get roads {
  final value = _roads;
  if (value == null) return null;
  if (_roads is EqualUnmodifiableListView) return _roads;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<PackageRoadModel>? _packageRoads;
@override List<PackageRoadModel>? get packageRoads {
  final value = _packageRoads;
  if (value == null) return null;
  if (_packageRoads is EqualUnmodifiableListView) return _packageRoads;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of PackageDataResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PackageDataResponseModelCopyWith<_PackageDataResponseModel> get copyWith => __$PackageDataResponseModelCopyWithImpl<_PackageDataResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PackageDataResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PackageDataResponseModel&&(identical(other.package, package) || other.package == package)&&const DeepCollectionEquality().equals(other._countries, _countries)&&const DeepCollectionEquality().equals(other._states, _states)&&const DeepCollectionEquality().equals(other._districts, _districts)&&const DeepCollectionEquality().equals(other._roads, _roads)&&const DeepCollectionEquality().equals(other._packageRoads, _packageRoads));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,package,const DeepCollectionEquality().hash(_countries),const DeepCollectionEquality().hash(_states),const DeepCollectionEquality().hash(_districts),const DeepCollectionEquality().hash(_roads),const DeepCollectionEquality().hash(_packageRoads));

@override
String toString() {
  return 'PackageDataResponseModel(package: $package, countries: $countries, states: $states, districts: $districts, roads: $roads, packageRoads: $packageRoads)';
}


}

/// @nodoc
abstract mixin class _$PackageDataResponseModelCopyWith<$Res> implements $PackageDataResponseModelCopyWith<$Res> {
  factory _$PackageDataResponseModelCopyWith(_PackageDataResponseModel value, $Res Function(_PackageDataResponseModel) _then) = __$PackageDataResponseModelCopyWithImpl;
@override @useResult
$Res call({
 PackageModel? package, List<CountryModel>? countries, List<ProvinceModel>? states, List<DistrictModel>? districts, List<RoadModel>? roads, List<PackageRoadModel>? packageRoads
});


@override $PackageModelCopyWith<$Res>? get package;

}
/// @nodoc
class __$PackageDataResponseModelCopyWithImpl<$Res>
    implements _$PackageDataResponseModelCopyWith<$Res> {
  __$PackageDataResponseModelCopyWithImpl(this._self, this._then);

  final _PackageDataResponseModel _self;
  final $Res Function(_PackageDataResponseModel) _then;

/// Create a copy of PackageDataResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? package = freezed,Object? countries = freezed,Object? states = freezed,Object? districts = freezed,Object? roads = freezed,Object? packageRoads = freezed,}) {
  return _then(_PackageDataResponseModel(
package: freezed == package ? _self.package : package // ignore: cast_nullable_to_non_nullable
as PackageModel?,countries: freezed == countries ? _self._countries : countries // ignore: cast_nullable_to_non_nullable
as List<CountryModel>?,states: freezed == states ? _self._states : states // ignore: cast_nullable_to_non_nullable
as List<ProvinceModel>?,districts: freezed == districts ? _self._districts : districts // ignore: cast_nullable_to_non_nullable
as List<DistrictModel>?,roads: freezed == roads ? _self._roads : roads // ignore: cast_nullable_to_non_nullable
as List<RoadModel>?,packageRoads: freezed == packageRoads ? _self._packageRoads : packageRoads // ignore: cast_nullable_to_non_nullable
as List<PackageRoadModel>?,
  ));
}

/// Create a copy of PackageDataResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PackageModelCopyWith<$Res>? get package {
    if (_self.package == null) {
    return null;
  }

  return $PackageModelCopyWith<$Res>(_self.package!, (value) {
    return _then(_self.copyWith(package: value));
  });
}
}

// dart format on
