// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'road_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RoadEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RoadEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RoadEvent()';
}


}

/// @nodoc
class $RoadEventCopyWith<$Res>  {
$RoadEventCopyWith(RoadEvent _, $Res Function(RoadEvent) __);
}


/// Adds pattern-matching-related methods to [RoadEvent].
extension RoadEventPatterns on RoadEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoadRoadProvinces value)?  loadProvinces,TResult Function( LoadRoadDistricts value)?  loadDistricts,TResult Function( LoadRoadRoads value)?  loadRoads,TResult Function( SelectRoadProvince value)?  selectProvince,TResult Function( SelectRoadDistrict value)?  selectDistrict,TResult Function( SelectRoadRoad value)?  selectRoad,TResult Function( ClearRoadSelections value)?  clearSelections,TResult Function( ClearRoadCache value)?  clearCache,TResult Function( AddRoadSelection value)?  addRoadSelection,TResult Function( RemoveRoadSelection value)?  removeRoadSelection,TResult Function( ClearMultipleSelections value)?  clearMultipleSelections,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoadRoadProvinces() when loadProvinces != null:
return loadProvinces(_that);case LoadRoadDistricts() when loadDistricts != null:
return loadDistricts(_that);case LoadRoadRoads() when loadRoads != null:
return loadRoads(_that);case SelectRoadProvince() when selectProvince != null:
return selectProvince(_that);case SelectRoadDistrict() when selectDistrict != null:
return selectDistrict(_that);case SelectRoadRoad() when selectRoad != null:
return selectRoad(_that);case ClearRoadSelections() when clearSelections != null:
return clearSelections(_that);case ClearRoadCache() when clearCache != null:
return clearCache(_that);case AddRoadSelection() when addRoadSelection != null:
return addRoadSelection(_that);case RemoveRoadSelection() when removeRoadSelection != null:
return removeRoadSelection(_that);case ClearMultipleSelections() when clearMultipleSelections != null:
return clearMultipleSelections(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoadRoadProvinces value)  loadProvinces,required TResult Function( LoadRoadDistricts value)  loadDistricts,required TResult Function( LoadRoadRoads value)  loadRoads,required TResult Function( SelectRoadProvince value)  selectProvince,required TResult Function( SelectRoadDistrict value)  selectDistrict,required TResult Function( SelectRoadRoad value)  selectRoad,required TResult Function( ClearRoadSelections value)  clearSelections,required TResult Function( ClearRoadCache value)  clearCache,required TResult Function( AddRoadSelection value)  addRoadSelection,required TResult Function( RemoveRoadSelection value)  removeRoadSelection,required TResult Function( ClearMultipleSelections value)  clearMultipleSelections,}){
final _that = this;
switch (_that) {
case LoadRoadProvinces():
return loadProvinces(_that);case LoadRoadDistricts():
return loadDistricts(_that);case LoadRoadRoads():
return loadRoads(_that);case SelectRoadProvince():
return selectProvince(_that);case SelectRoadDistrict():
return selectDistrict(_that);case SelectRoadRoad():
return selectRoad(_that);case ClearRoadSelections():
return clearSelections(_that);case ClearRoadCache():
return clearCache(_that);case AddRoadSelection():
return addRoadSelection(_that);case RemoveRoadSelection():
return removeRoadSelection(_that);case ClearMultipleSelections():
return clearMultipleSelections(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoadRoadProvinces value)?  loadProvinces,TResult? Function( LoadRoadDistricts value)?  loadDistricts,TResult? Function( LoadRoadRoads value)?  loadRoads,TResult? Function( SelectRoadProvince value)?  selectProvince,TResult? Function( SelectRoadDistrict value)?  selectDistrict,TResult? Function( SelectRoadRoad value)?  selectRoad,TResult? Function( ClearRoadSelections value)?  clearSelections,TResult? Function( ClearRoadCache value)?  clearCache,TResult? Function( AddRoadSelection value)?  addRoadSelection,TResult? Function( RemoveRoadSelection value)?  removeRoadSelection,TResult? Function( ClearMultipleSelections value)?  clearMultipleSelections,}){
final _that = this;
switch (_that) {
case LoadRoadProvinces() when loadProvinces != null:
return loadProvinces(_that);case LoadRoadDistricts() when loadDistricts != null:
return loadDistricts(_that);case LoadRoadRoads() when loadRoads != null:
return loadRoads(_that);case SelectRoadProvince() when selectProvince != null:
return selectProvince(_that);case SelectRoadDistrict() when selectDistrict != null:
return selectDistrict(_that);case SelectRoadRoad() when selectRoad != null:
return selectRoad(_that);case ClearRoadSelections() when clearSelections != null:
return clearSelections(_that);case ClearRoadCache() when clearCache != null:
return clearCache(_that);case AddRoadSelection() when addRoadSelection != null:
return addRoadSelection(_that);case RemoveRoadSelection() when removeRoadSelection != null:
return removeRoadSelection(_that);case ClearMultipleSelections() when clearMultipleSelections != null:
return clearMultipleSelections(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String? countryUid,  bool forceRefresh)?  loadProvinces,TResult Function( String provinceUid,  bool forceRefresh)?  loadDistricts,TResult Function( String districtUid,  bool forceRefresh)?  loadRoads,TResult Function( String uid)?  selectProvince,TResult Function( String uid)?  selectDistrict,TResult Function( String uid)?  selectRoad,TResult Function()?  clearSelections,TResult Function()?  clearCache,TResult Function( String uid)?  addRoadSelection,TResult Function( String uid)?  removeRoadSelection,TResult Function()?  clearMultipleSelections,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LoadRoadProvinces() when loadProvinces != null:
return loadProvinces(_that.countryUid,_that.forceRefresh);case LoadRoadDistricts() when loadDistricts != null:
return loadDistricts(_that.provinceUid,_that.forceRefresh);case LoadRoadRoads() when loadRoads != null:
return loadRoads(_that.districtUid,_that.forceRefresh);case SelectRoadProvince() when selectProvince != null:
return selectProvince(_that.uid);case SelectRoadDistrict() when selectDistrict != null:
return selectDistrict(_that.uid);case SelectRoadRoad() when selectRoad != null:
return selectRoad(_that.uid);case ClearRoadSelections() when clearSelections != null:
return clearSelections();case ClearRoadCache() when clearCache != null:
return clearCache();case AddRoadSelection() when addRoadSelection != null:
return addRoadSelection(_that.uid);case RemoveRoadSelection() when removeRoadSelection != null:
return removeRoadSelection(_that.uid);case ClearMultipleSelections() when clearMultipleSelections != null:
return clearMultipleSelections();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String? countryUid,  bool forceRefresh)  loadProvinces,required TResult Function( String provinceUid,  bool forceRefresh)  loadDistricts,required TResult Function( String districtUid,  bool forceRefresh)  loadRoads,required TResult Function( String uid)  selectProvince,required TResult Function( String uid)  selectDistrict,required TResult Function( String uid)  selectRoad,required TResult Function()  clearSelections,required TResult Function()  clearCache,required TResult Function( String uid)  addRoadSelection,required TResult Function( String uid)  removeRoadSelection,required TResult Function()  clearMultipleSelections,}) {final _that = this;
switch (_that) {
case LoadRoadProvinces():
return loadProvinces(_that.countryUid,_that.forceRefresh);case LoadRoadDistricts():
return loadDistricts(_that.provinceUid,_that.forceRefresh);case LoadRoadRoads():
return loadRoads(_that.districtUid,_that.forceRefresh);case SelectRoadProvince():
return selectProvince(_that.uid);case SelectRoadDistrict():
return selectDistrict(_that.uid);case SelectRoadRoad():
return selectRoad(_that.uid);case ClearRoadSelections():
return clearSelections();case ClearRoadCache():
return clearCache();case AddRoadSelection():
return addRoadSelection(_that.uid);case RemoveRoadSelection():
return removeRoadSelection(_that.uid);case ClearMultipleSelections():
return clearMultipleSelections();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String? countryUid,  bool forceRefresh)?  loadProvinces,TResult? Function( String provinceUid,  bool forceRefresh)?  loadDistricts,TResult? Function( String districtUid,  bool forceRefresh)?  loadRoads,TResult? Function( String uid)?  selectProvince,TResult? Function( String uid)?  selectDistrict,TResult? Function( String uid)?  selectRoad,TResult? Function()?  clearSelections,TResult? Function()?  clearCache,TResult? Function( String uid)?  addRoadSelection,TResult? Function( String uid)?  removeRoadSelection,TResult? Function()?  clearMultipleSelections,}) {final _that = this;
switch (_that) {
case LoadRoadProvinces() when loadProvinces != null:
return loadProvinces(_that.countryUid,_that.forceRefresh);case LoadRoadDistricts() when loadDistricts != null:
return loadDistricts(_that.provinceUid,_that.forceRefresh);case LoadRoadRoads() when loadRoads != null:
return loadRoads(_that.districtUid,_that.forceRefresh);case SelectRoadProvince() when selectProvince != null:
return selectProvince(_that.uid);case SelectRoadDistrict() when selectDistrict != null:
return selectDistrict(_that.uid);case SelectRoadRoad() when selectRoad != null:
return selectRoad(_that.uid);case ClearRoadSelections() when clearSelections != null:
return clearSelections();case ClearRoadCache() when clearCache != null:
return clearCache();case AddRoadSelection() when addRoadSelection != null:
return addRoadSelection(_that.uid);case RemoveRoadSelection() when removeRoadSelection != null:
return removeRoadSelection(_that.uid);case ClearMultipleSelections() when clearMultipleSelections != null:
return clearMultipleSelections();case _:
  return null;

}
}

}

/// @nodoc


class LoadRoadProvinces implements RoadEvent {
  const LoadRoadProvinces({this.countryUid, this.forceRefresh = false});
  

 final  String? countryUid;
@JsonKey() final  bool forceRefresh;

/// Create a copy of RoadEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadRoadProvincesCopyWith<LoadRoadProvinces> get copyWith => _$LoadRoadProvincesCopyWithImpl<LoadRoadProvinces>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadRoadProvinces&&(identical(other.countryUid, countryUid) || other.countryUid == countryUid)&&(identical(other.forceRefresh, forceRefresh) || other.forceRefresh == forceRefresh));
}


@override
int get hashCode => Object.hash(runtimeType,countryUid,forceRefresh);

@override
String toString() {
  return 'RoadEvent.loadProvinces(countryUid: $countryUid, forceRefresh: $forceRefresh)';
}


}

/// @nodoc
abstract mixin class $LoadRoadProvincesCopyWith<$Res> implements $RoadEventCopyWith<$Res> {
  factory $LoadRoadProvincesCopyWith(LoadRoadProvinces value, $Res Function(LoadRoadProvinces) _then) = _$LoadRoadProvincesCopyWithImpl;
@useResult
$Res call({
 String? countryUid, bool forceRefresh
});




}
/// @nodoc
class _$LoadRoadProvincesCopyWithImpl<$Res>
    implements $LoadRoadProvincesCopyWith<$Res> {
  _$LoadRoadProvincesCopyWithImpl(this._self, this._then);

  final LoadRoadProvinces _self;
  final $Res Function(LoadRoadProvinces) _then;

/// Create a copy of RoadEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? countryUid = freezed,Object? forceRefresh = null,}) {
  return _then(LoadRoadProvinces(
countryUid: freezed == countryUid ? _self.countryUid : countryUid // ignore: cast_nullable_to_non_nullable
as String?,forceRefresh: null == forceRefresh ? _self.forceRefresh : forceRefresh // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class LoadRoadDistricts implements RoadEvent {
  const LoadRoadDistricts({required this.provinceUid, this.forceRefresh = false});
  

 final  String provinceUid;
@JsonKey() final  bool forceRefresh;

/// Create a copy of RoadEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadRoadDistrictsCopyWith<LoadRoadDistricts> get copyWith => _$LoadRoadDistrictsCopyWithImpl<LoadRoadDistricts>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadRoadDistricts&&(identical(other.provinceUid, provinceUid) || other.provinceUid == provinceUid)&&(identical(other.forceRefresh, forceRefresh) || other.forceRefresh == forceRefresh));
}


@override
int get hashCode => Object.hash(runtimeType,provinceUid,forceRefresh);

@override
String toString() {
  return 'RoadEvent.loadDistricts(provinceUid: $provinceUid, forceRefresh: $forceRefresh)';
}


}

/// @nodoc
abstract mixin class $LoadRoadDistrictsCopyWith<$Res> implements $RoadEventCopyWith<$Res> {
  factory $LoadRoadDistrictsCopyWith(LoadRoadDistricts value, $Res Function(LoadRoadDistricts) _then) = _$LoadRoadDistrictsCopyWithImpl;
@useResult
$Res call({
 String provinceUid, bool forceRefresh
});




}
/// @nodoc
class _$LoadRoadDistrictsCopyWithImpl<$Res>
    implements $LoadRoadDistrictsCopyWith<$Res> {
  _$LoadRoadDistrictsCopyWithImpl(this._self, this._then);

  final LoadRoadDistricts _self;
  final $Res Function(LoadRoadDistricts) _then;

/// Create a copy of RoadEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? provinceUid = null,Object? forceRefresh = null,}) {
  return _then(LoadRoadDistricts(
provinceUid: null == provinceUid ? _self.provinceUid : provinceUid // ignore: cast_nullable_to_non_nullable
as String,forceRefresh: null == forceRefresh ? _self.forceRefresh : forceRefresh // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class LoadRoadRoads implements RoadEvent {
  const LoadRoadRoads({required this.districtUid, this.forceRefresh = false});
  

 final  String districtUid;
@JsonKey() final  bool forceRefresh;

/// Create a copy of RoadEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadRoadRoadsCopyWith<LoadRoadRoads> get copyWith => _$LoadRoadRoadsCopyWithImpl<LoadRoadRoads>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadRoadRoads&&(identical(other.districtUid, districtUid) || other.districtUid == districtUid)&&(identical(other.forceRefresh, forceRefresh) || other.forceRefresh == forceRefresh));
}


@override
int get hashCode => Object.hash(runtimeType,districtUid,forceRefresh);

@override
String toString() {
  return 'RoadEvent.loadRoads(districtUid: $districtUid, forceRefresh: $forceRefresh)';
}


}

/// @nodoc
abstract mixin class $LoadRoadRoadsCopyWith<$Res> implements $RoadEventCopyWith<$Res> {
  factory $LoadRoadRoadsCopyWith(LoadRoadRoads value, $Res Function(LoadRoadRoads) _then) = _$LoadRoadRoadsCopyWithImpl;
@useResult
$Res call({
 String districtUid, bool forceRefresh
});




}
/// @nodoc
class _$LoadRoadRoadsCopyWithImpl<$Res>
    implements $LoadRoadRoadsCopyWith<$Res> {
  _$LoadRoadRoadsCopyWithImpl(this._self, this._then);

  final LoadRoadRoads _self;
  final $Res Function(LoadRoadRoads) _then;

/// Create a copy of RoadEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? districtUid = null,Object? forceRefresh = null,}) {
  return _then(LoadRoadRoads(
districtUid: null == districtUid ? _self.districtUid : districtUid // ignore: cast_nullable_to_non_nullable
as String,forceRefresh: null == forceRefresh ? _self.forceRefresh : forceRefresh // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class SelectRoadProvince implements RoadEvent {
  const SelectRoadProvince(this.uid);
  

 final  String uid;

/// Create a copy of RoadEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SelectRoadProvinceCopyWith<SelectRoadProvince> get copyWith => _$SelectRoadProvinceCopyWithImpl<SelectRoadProvince>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SelectRoadProvince&&(identical(other.uid, uid) || other.uid == uid));
}


@override
int get hashCode => Object.hash(runtimeType,uid);

@override
String toString() {
  return 'RoadEvent.selectProvince(uid: $uid)';
}


}

/// @nodoc
abstract mixin class $SelectRoadProvinceCopyWith<$Res> implements $RoadEventCopyWith<$Res> {
  factory $SelectRoadProvinceCopyWith(SelectRoadProvince value, $Res Function(SelectRoadProvince) _then) = _$SelectRoadProvinceCopyWithImpl;
@useResult
$Res call({
 String uid
});




}
/// @nodoc
class _$SelectRoadProvinceCopyWithImpl<$Res>
    implements $SelectRoadProvinceCopyWith<$Res> {
  _$SelectRoadProvinceCopyWithImpl(this._self, this._then);

  final SelectRoadProvince _self;
  final $Res Function(SelectRoadProvince) _then;

/// Create a copy of RoadEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? uid = null,}) {
  return _then(SelectRoadProvince(
null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class SelectRoadDistrict implements RoadEvent {
  const SelectRoadDistrict(this.uid);
  

 final  String uid;

/// Create a copy of RoadEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SelectRoadDistrictCopyWith<SelectRoadDistrict> get copyWith => _$SelectRoadDistrictCopyWithImpl<SelectRoadDistrict>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SelectRoadDistrict&&(identical(other.uid, uid) || other.uid == uid));
}


@override
int get hashCode => Object.hash(runtimeType,uid);

@override
String toString() {
  return 'RoadEvent.selectDistrict(uid: $uid)';
}


}

/// @nodoc
abstract mixin class $SelectRoadDistrictCopyWith<$Res> implements $RoadEventCopyWith<$Res> {
  factory $SelectRoadDistrictCopyWith(SelectRoadDistrict value, $Res Function(SelectRoadDistrict) _then) = _$SelectRoadDistrictCopyWithImpl;
@useResult
$Res call({
 String uid
});




}
/// @nodoc
class _$SelectRoadDistrictCopyWithImpl<$Res>
    implements $SelectRoadDistrictCopyWith<$Res> {
  _$SelectRoadDistrictCopyWithImpl(this._self, this._then);

  final SelectRoadDistrict _self;
  final $Res Function(SelectRoadDistrict) _then;

/// Create a copy of RoadEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? uid = null,}) {
  return _then(SelectRoadDistrict(
null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class SelectRoadRoad implements RoadEvent {
  const SelectRoadRoad(this.uid);
  

 final  String uid;

/// Create a copy of RoadEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SelectRoadRoadCopyWith<SelectRoadRoad> get copyWith => _$SelectRoadRoadCopyWithImpl<SelectRoadRoad>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SelectRoadRoad&&(identical(other.uid, uid) || other.uid == uid));
}


@override
int get hashCode => Object.hash(runtimeType,uid);

@override
String toString() {
  return 'RoadEvent.selectRoad(uid: $uid)';
}


}

/// @nodoc
abstract mixin class $SelectRoadRoadCopyWith<$Res> implements $RoadEventCopyWith<$Res> {
  factory $SelectRoadRoadCopyWith(SelectRoadRoad value, $Res Function(SelectRoadRoad) _then) = _$SelectRoadRoadCopyWithImpl;
@useResult
$Res call({
 String uid
});




}
/// @nodoc
class _$SelectRoadRoadCopyWithImpl<$Res>
    implements $SelectRoadRoadCopyWith<$Res> {
  _$SelectRoadRoadCopyWithImpl(this._self, this._then);

  final SelectRoadRoad _self;
  final $Res Function(SelectRoadRoad) _then;

/// Create a copy of RoadEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? uid = null,}) {
  return _then(SelectRoadRoad(
null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ClearRoadSelections implements RoadEvent {
  const ClearRoadSelections();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClearRoadSelections);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RoadEvent.clearSelections()';
}


}




/// @nodoc


class ClearRoadCache implements RoadEvent {
  const ClearRoadCache();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClearRoadCache);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RoadEvent.clearCache()';
}


}




/// @nodoc


class AddRoadSelection implements RoadEvent {
  const AddRoadSelection(this.uid);
  

 final  String uid;

/// Create a copy of RoadEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddRoadSelectionCopyWith<AddRoadSelection> get copyWith => _$AddRoadSelectionCopyWithImpl<AddRoadSelection>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddRoadSelection&&(identical(other.uid, uid) || other.uid == uid));
}


@override
int get hashCode => Object.hash(runtimeType,uid);

@override
String toString() {
  return 'RoadEvent.addRoadSelection(uid: $uid)';
}


}

/// @nodoc
abstract mixin class $AddRoadSelectionCopyWith<$Res> implements $RoadEventCopyWith<$Res> {
  factory $AddRoadSelectionCopyWith(AddRoadSelection value, $Res Function(AddRoadSelection) _then) = _$AddRoadSelectionCopyWithImpl;
@useResult
$Res call({
 String uid
});




}
/// @nodoc
class _$AddRoadSelectionCopyWithImpl<$Res>
    implements $AddRoadSelectionCopyWith<$Res> {
  _$AddRoadSelectionCopyWithImpl(this._self, this._then);

  final AddRoadSelection _self;
  final $Res Function(AddRoadSelection) _then;

/// Create a copy of RoadEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? uid = null,}) {
  return _then(AddRoadSelection(
null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class RemoveRoadSelection implements RoadEvent {
  const RemoveRoadSelection(this.uid);
  

 final  String uid;

/// Create a copy of RoadEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RemoveRoadSelectionCopyWith<RemoveRoadSelection> get copyWith => _$RemoveRoadSelectionCopyWithImpl<RemoveRoadSelection>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RemoveRoadSelection&&(identical(other.uid, uid) || other.uid == uid));
}


@override
int get hashCode => Object.hash(runtimeType,uid);

@override
String toString() {
  return 'RoadEvent.removeRoadSelection(uid: $uid)';
}


}

/// @nodoc
abstract mixin class $RemoveRoadSelectionCopyWith<$Res> implements $RoadEventCopyWith<$Res> {
  factory $RemoveRoadSelectionCopyWith(RemoveRoadSelection value, $Res Function(RemoveRoadSelection) _then) = _$RemoveRoadSelectionCopyWithImpl;
@useResult
$Res call({
 String uid
});




}
/// @nodoc
class _$RemoveRoadSelectionCopyWithImpl<$Res>
    implements $RemoveRoadSelectionCopyWith<$Res> {
  _$RemoveRoadSelectionCopyWithImpl(this._self, this._then);

  final RemoveRoadSelection _self;
  final $Res Function(RemoveRoadSelection) _then;

/// Create a copy of RoadEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? uid = null,}) {
  return _then(RemoveRoadSelection(
null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ClearMultipleSelections implements RoadEvent {
  const ClearMultipleSelections();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClearMultipleSelections);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RoadEvent.clearMultipleSelections()';
}


}




// dart format on
