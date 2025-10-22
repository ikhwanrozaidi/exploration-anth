// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'daily_report_view_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DailyReportViewEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DailyReportViewEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DailyReportViewEvent()';
}


}

/// @nodoc
class $DailyReportViewEventCopyWith<$Res>  {
$DailyReportViewEventCopyWith(DailyReportViewEvent _, $Res Function(DailyReportViewEvent) __);
}


/// Adds pattern-matching-related methods to [DailyReportViewEvent].
extension DailyReportViewEventPatterns on DailyReportViewEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoadDailyReports value)?  loadDailyReports,TResult Function( ClearDailyReportCache value)?  clearCache,TResult Function( LoadRoadsForEdit value)?  loadRoadsForEdit,TResult Function( SelectRoadForEdit value)?  selectRoadForEdit,TResult Function( UpdateSectionForEdit value)?  updateSectionForEdit,TResult Function( ClearRoadEditData value)?  clearRoadEditData,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoadDailyReports() when loadDailyReports != null:
return loadDailyReports(_that);case ClearDailyReportCache() when clearCache != null:
return clearCache(_that);case LoadRoadsForEdit() when loadRoadsForEdit != null:
return loadRoadsForEdit(_that);case SelectRoadForEdit() when selectRoadForEdit != null:
return selectRoadForEdit(_that);case UpdateSectionForEdit() when updateSectionForEdit != null:
return updateSectionForEdit(_that);case ClearRoadEditData() when clearRoadEditData != null:
return clearRoadEditData(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoadDailyReports value)  loadDailyReports,required TResult Function( ClearDailyReportCache value)  clearCache,required TResult Function( LoadRoadsForEdit value)  loadRoadsForEdit,required TResult Function( SelectRoadForEdit value)  selectRoadForEdit,required TResult Function( UpdateSectionForEdit value)  updateSectionForEdit,required TResult Function( ClearRoadEditData value)  clearRoadEditData,}){
final _that = this;
switch (_that) {
case LoadDailyReports():
return loadDailyReports(_that);case ClearDailyReportCache():
return clearCache(_that);case LoadRoadsForEdit():
return loadRoadsForEdit(_that);case SelectRoadForEdit():
return selectRoadForEdit(_that);case UpdateSectionForEdit():
return updateSectionForEdit(_that);case ClearRoadEditData():
return clearRoadEditData(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoadDailyReports value)?  loadDailyReports,TResult? Function( ClearDailyReportCache value)?  clearCache,TResult? Function( LoadRoadsForEdit value)?  loadRoadsForEdit,TResult? Function( SelectRoadForEdit value)?  selectRoadForEdit,TResult? Function( UpdateSectionForEdit value)?  updateSectionForEdit,TResult? Function( ClearRoadEditData value)?  clearRoadEditData,}){
final _that = this;
switch (_that) {
case LoadDailyReports() when loadDailyReports != null:
return loadDailyReports(_that);case ClearDailyReportCache() when clearCache != null:
return clearCache(_that);case LoadRoadsForEdit() when loadRoadsForEdit != null:
return loadRoadsForEdit(_that);case SelectRoadForEdit() when selectRoadForEdit != null:
return selectRoadForEdit(_that);case UpdateSectionForEdit() when updateSectionForEdit != null:
return updateSectionForEdit(_that);case ClearRoadEditData() when clearRoadEditData != null:
return clearRoadEditData(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String companyUID,  int page,  int limit,  String sortOrder,  bool forceRefresh)?  loadDailyReports,TResult Function()?  clearCache,TResult Function( String districtName,  bool forceRefresh)?  loadRoadsForEdit,TResult Function( Road selectedRoad)?  selectRoadForEdit,TResult Function( String section)?  updateSectionForEdit,TResult Function()?  clearRoadEditData,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LoadDailyReports() when loadDailyReports != null:
return loadDailyReports(_that.companyUID,_that.page,_that.limit,_that.sortOrder,_that.forceRefresh);case ClearDailyReportCache() when clearCache != null:
return clearCache();case LoadRoadsForEdit() when loadRoadsForEdit != null:
return loadRoadsForEdit(_that.districtName,_that.forceRefresh);case SelectRoadForEdit() when selectRoadForEdit != null:
return selectRoadForEdit(_that.selectedRoad);case UpdateSectionForEdit() when updateSectionForEdit != null:
return updateSectionForEdit(_that.section);case ClearRoadEditData() when clearRoadEditData != null:
return clearRoadEditData();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String companyUID,  int page,  int limit,  String sortOrder,  bool forceRefresh)  loadDailyReports,required TResult Function()  clearCache,required TResult Function( String districtName,  bool forceRefresh)  loadRoadsForEdit,required TResult Function( Road selectedRoad)  selectRoadForEdit,required TResult Function( String section)  updateSectionForEdit,required TResult Function()  clearRoadEditData,}) {final _that = this;
switch (_that) {
case LoadDailyReports():
return loadDailyReports(_that.companyUID,_that.page,_that.limit,_that.sortOrder,_that.forceRefresh);case ClearDailyReportCache():
return clearCache();case LoadRoadsForEdit():
return loadRoadsForEdit(_that.districtName,_that.forceRefresh);case SelectRoadForEdit():
return selectRoadForEdit(_that.selectedRoad);case UpdateSectionForEdit():
return updateSectionForEdit(_that.section);case ClearRoadEditData():
return clearRoadEditData();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String companyUID,  int page,  int limit,  String sortOrder,  bool forceRefresh)?  loadDailyReports,TResult? Function()?  clearCache,TResult? Function( String districtName,  bool forceRefresh)?  loadRoadsForEdit,TResult? Function( Road selectedRoad)?  selectRoadForEdit,TResult? Function( String section)?  updateSectionForEdit,TResult? Function()?  clearRoadEditData,}) {final _that = this;
switch (_that) {
case LoadDailyReports() when loadDailyReports != null:
return loadDailyReports(_that.companyUID,_that.page,_that.limit,_that.sortOrder,_that.forceRefresh);case ClearDailyReportCache() when clearCache != null:
return clearCache();case LoadRoadsForEdit() when loadRoadsForEdit != null:
return loadRoadsForEdit(_that.districtName,_that.forceRefresh);case SelectRoadForEdit() when selectRoadForEdit != null:
return selectRoadForEdit(_that.selectedRoad);case UpdateSectionForEdit() when updateSectionForEdit != null:
return updateSectionForEdit(_that.section);case ClearRoadEditData() when clearRoadEditData != null:
return clearRoadEditData();case _:
  return null;

}
}

}

/// @nodoc


class LoadDailyReports implements DailyReportViewEvent {
  const LoadDailyReports({required this.companyUID, this.page = 1, this.limit = 10, this.sortOrder = 'asc', this.forceRefresh = false});
  

 final  String companyUID;
@JsonKey() final  int page;
@JsonKey() final  int limit;
@JsonKey() final  String sortOrder;
@JsonKey() final  bool forceRefresh;

/// Create a copy of DailyReportViewEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadDailyReportsCopyWith<LoadDailyReports> get copyWith => _$LoadDailyReportsCopyWithImpl<LoadDailyReports>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadDailyReports&&(identical(other.companyUID, companyUID) || other.companyUID == companyUID)&&(identical(other.page, page) || other.page == page)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder)&&(identical(other.forceRefresh, forceRefresh) || other.forceRefresh == forceRefresh));
}


@override
int get hashCode => Object.hash(runtimeType,companyUID,page,limit,sortOrder,forceRefresh);

@override
String toString() {
  return 'DailyReportViewEvent.loadDailyReports(companyUID: $companyUID, page: $page, limit: $limit, sortOrder: $sortOrder, forceRefresh: $forceRefresh)';
}


}

/// @nodoc
abstract mixin class $LoadDailyReportsCopyWith<$Res> implements $DailyReportViewEventCopyWith<$Res> {
  factory $LoadDailyReportsCopyWith(LoadDailyReports value, $Res Function(LoadDailyReports) _then) = _$LoadDailyReportsCopyWithImpl;
@useResult
$Res call({
 String companyUID, int page, int limit, String sortOrder, bool forceRefresh
});




}
/// @nodoc
class _$LoadDailyReportsCopyWithImpl<$Res>
    implements $LoadDailyReportsCopyWith<$Res> {
  _$LoadDailyReportsCopyWithImpl(this._self, this._then);

  final LoadDailyReports _self;
  final $Res Function(LoadDailyReports) _then;

/// Create a copy of DailyReportViewEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? companyUID = null,Object? page = null,Object? limit = null,Object? sortOrder = null,Object? forceRefresh = null,}) {
  return _then(LoadDailyReports(
companyUID: null == companyUID ? _self.companyUID : companyUID // ignore: cast_nullable_to_non_nullable
as String,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,sortOrder: null == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as String,forceRefresh: null == forceRefresh ? _self.forceRefresh : forceRefresh // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class ClearDailyReportCache implements DailyReportViewEvent {
  const ClearDailyReportCache();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClearDailyReportCache);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DailyReportViewEvent.clearCache()';
}


}




/// @nodoc


class LoadRoadsForEdit implements DailyReportViewEvent {
  const LoadRoadsForEdit({required this.districtName, this.forceRefresh = false});
  

 final  String districtName;
@JsonKey() final  bool forceRefresh;

/// Create a copy of DailyReportViewEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadRoadsForEditCopyWith<LoadRoadsForEdit> get copyWith => _$LoadRoadsForEditCopyWithImpl<LoadRoadsForEdit>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadRoadsForEdit&&(identical(other.districtName, districtName) || other.districtName == districtName)&&(identical(other.forceRefresh, forceRefresh) || other.forceRefresh == forceRefresh));
}


@override
int get hashCode => Object.hash(runtimeType,districtName,forceRefresh);

@override
String toString() {
  return 'DailyReportViewEvent.loadRoadsForEdit(districtName: $districtName, forceRefresh: $forceRefresh)';
}


}

/// @nodoc
abstract mixin class $LoadRoadsForEditCopyWith<$Res> implements $DailyReportViewEventCopyWith<$Res> {
  factory $LoadRoadsForEditCopyWith(LoadRoadsForEdit value, $Res Function(LoadRoadsForEdit) _then) = _$LoadRoadsForEditCopyWithImpl;
@useResult
$Res call({
 String districtName, bool forceRefresh
});




}
/// @nodoc
class _$LoadRoadsForEditCopyWithImpl<$Res>
    implements $LoadRoadsForEditCopyWith<$Res> {
  _$LoadRoadsForEditCopyWithImpl(this._self, this._then);

  final LoadRoadsForEdit _self;
  final $Res Function(LoadRoadsForEdit) _then;

/// Create a copy of DailyReportViewEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? districtName = null,Object? forceRefresh = null,}) {
  return _then(LoadRoadsForEdit(
districtName: null == districtName ? _self.districtName : districtName // ignore: cast_nullable_to_non_nullable
as String,forceRefresh: null == forceRefresh ? _self.forceRefresh : forceRefresh // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class SelectRoadForEdit implements DailyReportViewEvent {
  const SelectRoadForEdit({required this.selectedRoad});
  

 final  Road selectedRoad;

/// Create a copy of DailyReportViewEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SelectRoadForEditCopyWith<SelectRoadForEdit> get copyWith => _$SelectRoadForEditCopyWithImpl<SelectRoadForEdit>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SelectRoadForEdit&&(identical(other.selectedRoad, selectedRoad) || other.selectedRoad == selectedRoad));
}


@override
int get hashCode => Object.hash(runtimeType,selectedRoad);

@override
String toString() {
  return 'DailyReportViewEvent.selectRoadForEdit(selectedRoad: $selectedRoad)';
}


}

/// @nodoc
abstract mixin class $SelectRoadForEditCopyWith<$Res> implements $DailyReportViewEventCopyWith<$Res> {
  factory $SelectRoadForEditCopyWith(SelectRoadForEdit value, $Res Function(SelectRoadForEdit) _then) = _$SelectRoadForEditCopyWithImpl;
@useResult
$Res call({
 Road selectedRoad
});




}
/// @nodoc
class _$SelectRoadForEditCopyWithImpl<$Res>
    implements $SelectRoadForEditCopyWith<$Res> {
  _$SelectRoadForEditCopyWithImpl(this._self, this._then);

  final SelectRoadForEdit _self;
  final $Res Function(SelectRoadForEdit) _then;

/// Create a copy of DailyReportViewEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? selectedRoad = null,}) {
  return _then(SelectRoadForEdit(
selectedRoad: null == selectedRoad ? _self.selectedRoad : selectedRoad // ignore: cast_nullable_to_non_nullable
as Road,
  ));
}


}

/// @nodoc


class UpdateSectionForEdit implements DailyReportViewEvent {
  const UpdateSectionForEdit({required this.section});
  

 final  String section;

/// Create a copy of DailyReportViewEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateSectionForEditCopyWith<UpdateSectionForEdit> get copyWith => _$UpdateSectionForEditCopyWithImpl<UpdateSectionForEdit>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateSectionForEdit&&(identical(other.section, section) || other.section == section));
}


@override
int get hashCode => Object.hash(runtimeType,section);

@override
String toString() {
  return 'DailyReportViewEvent.updateSectionForEdit(section: $section)';
}


}

/// @nodoc
abstract mixin class $UpdateSectionForEditCopyWith<$Res> implements $DailyReportViewEventCopyWith<$Res> {
  factory $UpdateSectionForEditCopyWith(UpdateSectionForEdit value, $Res Function(UpdateSectionForEdit) _then) = _$UpdateSectionForEditCopyWithImpl;
@useResult
$Res call({
 String section
});




}
/// @nodoc
class _$UpdateSectionForEditCopyWithImpl<$Res>
    implements $UpdateSectionForEditCopyWith<$Res> {
  _$UpdateSectionForEditCopyWithImpl(this._self, this._then);

  final UpdateSectionForEdit _self;
  final $Res Function(UpdateSectionForEdit) _then;

/// Create a copy of DailyReportViewEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? section = null,}) {
  return _then(UpdateSectionForEdit(
section: null == section ? _self.section : section // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ClearRoadEditData implements DailyReportViewEvent {
  const ClearRoadEditData();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClearRoadEditData);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DailyReportViewEvent.clearRoadEditData()';
}


}




// dart format on
