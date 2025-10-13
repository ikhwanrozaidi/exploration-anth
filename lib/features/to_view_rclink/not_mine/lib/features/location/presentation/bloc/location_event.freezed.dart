// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'location_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LocationEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LocationEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LocationEvent()';
}


}

/// @nodoc
class $LocationEventCopyWith<$Res>  {
$LocationEventCopyWith(LocationEvent _, $Res Function(LocationEvent) __);
}


/// Adds pattern-matching-related methods to [LocationEvent].
extension LocationEventPatterns on LocationEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoadProvinces value)?  loadProvinces,TResult Function( LoadDistricts value)?  loadDistricts,TResult Function( LoadRoads value)?  loadRoads,TResult Function( SelectProvince value)?  selectProvince,TResult Function( SelectDistrict value)?  selectDistrict,TResult Function( SelectRoad value)?  selectRoad,TResult Function( ClearSelections value)?  clearSelections,TResult Function( ClearCache value)?  clearCache,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoadProvinces() when loadProvinces != null:
return loadProvinces(_that);case LoadDistricts() when loadDistricts != null:
return loadDistricts(_that);case LoadRoads() when loadRoads != null:
return loadRoads(_that);case SelectProvince() when selectProvince != null:
return selectProvince(_that);case SelectDistrict() when selectDistrict != null:
return selectDistrict(_that);case SelectRoad() when selectRoad != null:
return selectRoad(_that);case ClearSelections() when clearSelections != null:
return clearSelections(_that);case ClearCache() when clearCache != null:
return clearCache(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoadProvinces value)  loadProvinces,required TResult Function( LoadDistricts value)  loadDistricts,required TResult Function( LoadRoads value)  loadRoads,required TResult Function( SelectProvince value)  selectProvince,required TResult Function( SelectDistrict value)  selectDistrict,required TResult Function( SelectRoad value)  selectRoad,required TResult Function( ClearSelections value)  clearSelections,required TResult Function( ClearCache value)  clearCache,}){
final _that = this;
switch (_that) {
case LoadProvinces():
return loadProvinces(_that);case LoadDistricts():
return loadDistricts(_that);case LoadRoads():
return loadRoads(_that);case SelectProvince():
return selectProvince(_that);case SelectDistrict():
return selectDistrict(_that);case SelectRoad():
return selectRoad(_that);case ClearSelections():
return clearSelections(_that);case ClearCache():
return clearCache(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoadProvinces value)?  loadProvinces,TResult? Function( LoadDistricts value)?  loadDistricts,TResult? Function( LoadRoads value)?  loadRoads,TResult? Function( SelectProvince value)?  selectProvince,TResult? Function( SelectDistrict value)?  selectDistrict,TResult? Function( SelectRoad value)?  selectRoad,TResult? Function( ClearSelections value)?  clearSelections,TResult? Function( ClearCache value)?  clearCache,}){
final _that = this;
switch (_that) {
case LoadProvinces() when loadProvinces != null:
return loadProvinces(_that);case LoadDistricts() when loadDistricts != null:
return loadDistricts(_that);case LoadRoads() when loadRoads != null:
return loadRoads(_that);case SelectProvince() when selectProvince != null:
return selectProvince(_that);case SelectDistrict() when selectDistrict != null:
return selectDistrict(_that);case SelectRoad() when selectRoad != null:
return selectRoad(_that);case ClearSelections() when clearSelections != null:
return clearSelections(_that);case ClearCache() when clearCache != null:
return clearCache(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String? countryUid,  bool forceRefresh)?  loadProvinces,TResult Function( String? provinceUid,  bool forceRefresh)?  loadDistricts,TResult Function( String? districtUid,  bool forceRefresh)?  loadRoads,TResult Function( String uid)?  selectProvince,TResult Function( String uid)?  selectDistrict,TResult Function( String uid)?  selectRoad,TResult Function()?  clearSelections,TResult Function()?  clearCache,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LoadProvinces() when loadProvinces != null:
return loadProvinces(_that.countryUid,_that.forceRefresh);case LoadDistricts() when loadDistricts != null:
return loadDistricts(_that.provinceUid,_that.forceRefresh);case LoadRoads() when loadRoads != null:
return loadRoads(_that.districtUid,_that.forceRefresh);case SelectProvince() when selectProvince != null:
return selectProvince(_that.uid);case SelectDistrict() when selectDistrict != null:
return selectDistrict(_that.uid);case SelectRoad() when selectRoad != null:
return selectRoad(_that.uid);case ClearSelections() when clearSelections != null:
return clearSelections();case ClearCache() when clearCache != null:
return clearCache();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String? countryUid,  bool forceRefresh)  loadProvinces,required TResult Function( String? provinceUid,  bool forceRefresh)  loadDistricts,required TResult Function( String? districtUid,  bool forceRefresh)  loadRoads,required TResult Function( String uid)  selectProvince,required TResult Function( String uid)  selectDistrict,required TResult Function( String uid)  selectRoad,required TResult Function()  clearSelections,required TResult Function()  clearCache,}) {final _that = this;
switch (_that) {
case LoadProvinces():
return loadProvinces(_that.countryUid,_that.forceRefresh);case LoadDistricts():
return loadDistricts(_that.provinceUid,_that.forceRefresh);case LoadRoads():
return loadRoads(_that.districtUid,_that.forceRefresh);case SelectProvince():
return selectProvince(_that.uid);case SelectDistrict():
return selectDistrict(_that.uid);case SelectRoad():
return selectRoad(_that.uid);case ClearSelections():
return clearSelections();case ClearCache():
return clearCache();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String? countryUid,  bool forceRefresh)?  loadProvinces,TResult? Function( String? provinceUid,  bool forceRefresh)?  loadDistricts,TResult? Function( String? districtUid,  bool forceRefresh)?  loadRoads,TResult? Function( String uid)?  selectProvince,TResult? Function( String uid)?  selectDistrict,TResult? Function( String uid)?  selectRoad,TResult? Function()?  clearSelections,TResult? Function()?  clearCache,}) {final _that = this;
switch (_that) {
case LoadProvinces() when loadProvinces != null:
return loadProvinces(_that.countryUid,_that.forceRefresh);case LoadDistricts() when loadDistricts != null:
return loadDistricts(_that.provinceUid,_that.forceRefresh);case LoadRoads() when loadRoads != null:
return loadRoads(_that.districtUid,_that.forceRefresh);case SelectProvince() when selectProvince != null:
return selectProvince(_that.uid);case SelectDistrict() when selectDistrict != null:
return selectDistrict(_that.uid);case SelectRoad() when selectRoad != null:
return selectRoad(_that.uid);case ClearSelections() when clearSelections != null:
return clearSelections();case ClearCache() when clearCache != null:
return clearCache();case _:
  return null;

}
}

}

/// @nodoc


class LoadProvinces implements LocationEvent {
  const LoadProvinces({this.countryUid, this.forceRefresh = false});
  

 final  String? countryUid;
@JsonKey() final  bool forceRefresh;

/// Create a copy of LocationEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadProvincesCopyWith<LoadProvinces> get copyWith => _$LoadProvincesCopyWithImpl<LoadProvinces>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadProvinces&&(identical(other.countryUid, countryUid) || other.countryUid == countryUid)&&(identical(other.forceRefresh, forceRefresh) || other.forceRefresh == forceRefresh));
}


@override
int get hashCode => Object.hash(runtimeType,countryUid,forceRefresh);

@override
String toString() {
  return 'LocationEvent.loadProvinces(countryUid: $countryUid, forceRefresh: $forceRefresh)';
}


}

/// @nodoc
abstract mixin class $LoadProvincesCopyWith<$Res> implements $LocationEventCopyWith<$Res> {
  factory $LoadProvincesCopyWith(LoadProvinces value, $Res Function(LoadProvinces) _then) = _$LoadProvincesCopyWithImpl;
@useResult
$Res call({
 String? countryUid, bool forceRefresh
});




}
/// @nodoc
class _$LoadProvincesCopyWithImpl<$Res>
    implements $LoadProvincesCopyWith<$Res> {
  _$LoadProvincesCopyWithImpl(this._self, this._then);

  final LoadProvinces _self;
  final $Res Function(LoadProvinces) _then;

/// Create a copy of LocationEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? countryUid = freezed,Object? forceRefresh = null,}) {
  return _then(LoadProvinces(
countryUid: freezed == countryUid ? _self.countryUid : countryUid // ignore: cast_nullable_to_non_nullable
as String?,forceRefresh: null == forceRefresh ? _self.forceRefresh : forceRefresh // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class LoadDistricts implements LocationEvent {
  const LoadDistricts({this.provinceUid, this.forceRefresh = false});
  

 final  String? provinceUid;
@JsonKey() final  bool forceRefresh;

/// Create a copy of LocationEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadDistrictsCopyWith<LoadDistricts> get copyWith => _$LoadDistrictsCopyWithImpl<LoadDistricts>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadDistricts&&(identical(other.provinceUid, provinceUid) || other.provinceUid == provinceUid)&&(identical(other.forceRefresh, forceRefresh) || other.forceRefresh == forceRefresh));
}


@override
int get hashCode => Object.hash(runtimeType,provinceUid,forceRefresh);

@override
String toString() {
  return 'LocationEvent.loadDistricts(provinceUid: $provinceUid, forceRefresh: $forceRefresh)';
}


}

/// @nodoc
abstract mixin class $LoadDistrictsCopyWith<$Res> implements $LocationEventCopyWith<$Res> {
  factory $LoadDistrictsCopyWith(LoadDistricts value, $Res Function(LoadDistricts) _then) = _$LoadDistrictsCopyWithImpl;
@useResult
$Res call({
 String? provinceUid, bool forceRefresh
});




}
/// @nodoc
class _$LoadDistrictsCopyWithImpl<$Res>
    implements $LoadDistrictsCopyWith<$Res> {
  _$LoadDistrictsCopyWithImpl(this._self, this._then);

  final LoadDistricts _self;
  final $Res Function(LoadDistricts) _then;

/// Create a copy of LocationEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? provinceUid = freezed,Object? forceRefresh = null,}) {
  return _then(LoadDistricts(
provinceUid: freezed == provinceUid ? _self.provinceUid : provinceUid // ignore: cast_nullable_to_non_nullable
as String?,forceRefresh: null == forceRefresh ? _self.forceRefresh : forceRefresh // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class LoadRoads implements LocationEvent {
  const LoadRoads({this.districtUid, this.forceRefresh = false});
  

 final  String? districtUid;
@JsonKey() final  bool forceRefresh;

/// Create a copy of LocationEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadRoadsCopyWith<LoadRoads> get copyWith => _$LoadRoadsCopyWithImpl<LoadRoads>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadRoads&&(identical(other.districtUid, districtUid) || other.districtUid == districtUid)&&(identical(other.forceRefresh, forceRefresh) || other.forceRefresh == forceRefresh));
}


@override
int get hashCode => Object.hash(runtimeType,districtUid,forceRefresh);

@override
String toString() {
  return 'LocationEvent.loadRoads(districtUid: $districtUid, forceRefresh: $forceRefresh)';
}


}

/// @nodoc
abstract mixin class $LoadRoadsCopyWith<$Res> implements $LocationEventCopyWith<$Res> {
  factory $LoadRoadsCopyWith(LoadRoads value, $Res Function(LoadRoads) _then) = _$LoadRoadsCopyWithImpl;
@useResult
$Res call({
 String? districtUid, bool forceRefresh
});




}
/// @nodoc
class _$LoadRoadsCopyWithImpl<$Res>
    implements $LoadRoadsCopyWith<$Res> {
  _$LoadRoadsCopyWithImpl(this._self, this._then);

  final LoadRoads _self;
  final $Res Function(LoadRoads) _then;

/// Create a copy of LocationEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? districtUid = freezed,Object? forceRefresh = null,}) {
  return _then(LoadRoads(
districtUid: freezed == districtUid ? _self.districtUid : districtUid // ignore: cast_nullable_to_non_nullable
as String?,forceRefresh: null == forceRefresh ? _self.forceRefresh : forceRefresh // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class SelectProvince implements LocationEvent {
  const SelectProvince(this.uid);
  

 final  String uid;

/// Create a copy of LocationEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SelectProvinceCopyWith<SelectProvince> get copyWith => _$SelectProvinceCopyWithImpl<SelectProvince>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SelectProvince&&(identical(other.uid, uid) || other.uid == uid));
}


@override
int get hashCode => Object.hash(runtimeType,uid);

@override
String toString() {
  return 'LocationEvent.selectProvince(uid: $uid)';
}


}

/// @nodoc
abstract mixin class $SelectProvinceCopyWith<$Res> implements $LocationEventCopyWith<$Res> {
  factory $SelectProvinceCopyWith(SelectProvince value, $Res Function(SelectProvince) _then) = _$SelectProvinceCopyWithImpl;
@useResult
$Res call({
 String uid
});




}
/// @nodoc
class _$SelectProvinceCopyWithImpl<$Res>
    implements $SelectProvinceCopyWith<$Res> {
  _$SelectProvinceCopyWithImpl(this._self, this._then);

  final SelectProvince _self;
  final $Res Function(SelectProvince) _then;

/// Create a copy of LocationEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? uid = null,}) {
  return _then(SelectProvince(
null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class SelectDistrict implements LocationEvent {
  const SelectDistrict(this.uid);
  

 final  String uid;

/// Create a copy of LocationEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SelectDistrictCopyWith<SelectDistrict> get copyWith => _$SelectDistrictCopyWithImpl<SelectDistrict>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SelectDistrict&&(identical(other.uid, uid) || other.uid == uid));
}


@override
int get hashCode => Object.hash(runtimeType,uid);

@override
String toString() {
  return 'LocationEvent.selectDistrict(uid: $uid)';
}


}

/// @nodoc
abstract mixin class $SelectDistrictCopyWith<$Res> implements $LocationEventCopyWith<$Res> {
  factory $SelectDistrictCopyWith(SelectDistrict value, $Res Function(SelectDistrict) _then) = _$SelectDistrictCopyWithImpl;
@useResult
$Res call({
 String uid
});




}
/// @nodoc
class _$SelectDistrictCopyWithImpl<$Res>
    implements $SelectDistrictCopyWith<$Res> {
  _$SelectDistrictCopyWithImpl(this._self, this._then);

  final SelectDistrict _self;
  final $Res Function(SelectDistrict) _then;

/// Create a copy of LocationEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? uid = null,}) {
  return _then(SelectDistrict(
null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class SelectRoad implements LocationEvent {
  const SelectRoad(this.uid);
  

 final  String uid;

/// Create a copy of LocationEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SelectRoadCopyWith<SelectRoad> get copyWith => _$SelectRoadCopyWithImpl<SelectRoad>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SelectRoad&&(identical(other.uid, uid) || other.uid == uid));
}


@override
int get hashCode => Object.hash(runtimeType,uid);

@override
String toString() {
  return 'LocationEvent.selectRoad(uid: $uid)';
}


}

/// @nodoc
abstract mixin class $SelectRoadCopyWith<$Res> implements $LocationEventCopyWith<$Res> {
  factory $SelectRoadCopyWith(SelectRoad value, $Res Function(SelectRoad) _then) = _$SelectRoadCopyWithImpl;
@useResult
$Res call({
 String uid
});




}
/// @nodoc
class _$SelectRoadCopyWithImpl<$Res>
    implements $SelectRoadCopyWith<$Res> {
  _$SelectRoadCopyWithImpl(this._self, this._then);

  final SelectRoad _self;
  final $Res Function(SelectRoad) _then;

/// Create a copy of LocationEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? uid = null,}) {
  return _then(SelectRoad(
null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ClearSelections implements LocationEvent {
  const ClearSelections();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClearSelections);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LocationEvent.clearSelections()';
}


}




/// @nodoc


class ClearCache implements LocationEvent {
  const ClearCache();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClearCache);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LocationEvent.clearCache()';
}


}




// dart format on
