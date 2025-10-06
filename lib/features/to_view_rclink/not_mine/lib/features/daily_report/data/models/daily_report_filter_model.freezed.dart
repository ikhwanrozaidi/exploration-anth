// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'daily_report_filter_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DailyReportFilterModel {

/// Page number for pagination
 int get page;/// Number of items per page
 int get limit;/// Filter by report status
 String? get status;/// Filter by work scope UID
 String? get workScopeUID;/// Filter by road UID
 String? get roadUID;/// Filter by created by admin ID
 int? get createdByID;/// Filter by date range - start date
 DateTime? get startDate;/// Filter by date range - end date
 DateTime? get endDate;/// Search term for report name
 String? get search;/// Sort field
 String? get sortBy;/// Sort order (asc/desc)
 String? get sortOrder;/// Expand relations
 List<String>? get expand;
/// Create a copy of DailyReportFilterModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DailyReportFilterModelCopyWith<DailyReportFilterModel> get copyWith => _$DailyReportFilterModelCopyWithImpl<DailyReportFilterModel>(this as DailyReportFilterModel, _$identity);

  /// Serializes this DailyReportFilterModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DailyReportFilterModel&&(identical(other.page, page) || other.page == page)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.status, status) || other.status == status)&&(identical(other.workScopeUID, workScopeUID) || other.workScopeUID == workScopeUID)&&(identical(other.roadUID, roadUID) || other.roadUID == roadUID)&&(identical(other.createdByID, createdByID) || other.createdByID == createdByID)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.search, search) || other.search == search)&&(identical(other.sortBy, sortBy) || other.sortBy == sortBy)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder)&&const DeepCollectionEquality().equals(other.expand, expand));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,page,limit,status,workScopeUID,roadUID,createdByID,startDate,endDate,search,sortBy,sortOrder,const DeepCollectionEquality().hash(expand));

@override
String toString() {
  return 'DailyReportFilterModel(page: $page, limit: $limit, status: $status, workScopeUID: $workScopeUID, roadUID: $roadUID, createdByID: $createdByID, startDate: $startDate, endDate: $endDate, search: $search, sortBy: $sortBy, sortOrder: $sortOrder, expand: $expand)';
}


}

/// @nodoc
abstract mixin class $DailyReportFilterModelCopyWith<$Res>  {
  factory $DailyReportFilterModelCopyWith(DailyReportFilterModel value, $Res Function(DailyReportFilterModel) _then) = _$DailyReportFilterModelCopyWithImpl;
@useResult
$Res call({
 int page, int limit, String? status, String? workScopeUID, String? roadUID, int? createdByID, DateTime? startDate, DateTime? endDate, String? search, String? sortBy, String? sortOrder, List<String>? expand
});




}
/// @nodoc
class _$DailyReportFilterModelCopyWithImpl<$Res>
    implements $DailyReportFilterModelCopyWith<$Res> {
  _$DailyReportFilterModelCopyWithImpl(this._self, this._then);

  final DailyReportFilterModel _self;
  final $Res Function(DailyReportFilterModel) _then;

/// Create a copy of DailyReportFilterModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? page = null,Object? limit = null,Object? status = freezed,Object? workScopeUID = freezed,Object? roadUID = freezed,Object? createdByID = freezed,Object? startDate = freezed,Object? endDate = freezed,Object? search = freezed,Object? sortBy = freezed,Object? sortOrder = freezed,Object? expand = freezed,}) {
  return _then(_self.copyWith(
page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,workScopeUID: freezed == workScopeUID ? _self.workScopeUID : workScopeUID // ignore: cast_nullable_to_non_nullable
as String?,roadUID: freezed == roadUID ? _self.roadUID : roadUID // ignore: cast_nullable_to_non_nullable
as String?,createdByID: freezed == createdByID ? _self.createdByID : createdByID // ignore: cast_nullable_to_non_nullable
as int?,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,search: freezed == search ? _self.search : search // ignore: cast_nullable_to_non_nullable
as String?,sortBy: freezed == sortBy ? _self.sortBy : sortBy // ignore: cast_nullable_to_non_nullable
as String?,sortOrder: freezed == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as String?,expand: freezed == expand ? _self.expand : expand // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}

}


/// Adds pattern-matching-related methods to [DailyReportFilterModel].
extension DailyReportFilterModelPatterns on DailyReportFilterModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DailyReportFilterModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DailyReportFilterModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DailyReportFilterModel value)  $default,){
final _that = this;
switch (_that) {
case _DailyReportFilterModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DailyReportFilterModel value)?  $default,){
final _that = this;
switch (_that) {
case _DailyReportFilterModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int page,  int limit,  String? status,  String? workScopeUID,  String? roadUID,  int? createdByID,  DateTime? startDate,  DateTime? endDate,  String? search,  String? sortBy,  String? sortOrder,  List<String>? expand)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DailyReportFilterModel() when $default != null:
return $default(_that.page,_that.limit,_that.status,_that.workScopeUID,_that.roadUID,_that.createdByID,_that.startDate,_that.endDate,_that.search,_that.sortBy,_that.sortOrder,_that.expand);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int page,  int limit,  String? status,  String? workScopeUID,  String? roadUID,  int? createdByID,  DateTime? startDate,  DateTime? endDate,  String? search,  String? sortBy,  String? sortOrder,  List<String>? expand)  $default,) {final _that = this;
switch (_that) {
case _DailyReportFilterModel():
return $default(_that.page,_that.limit,_that.status,_that.workScopeUID,_that.roadUID,_that.createdByID,_that.startDate,_that.endDate,_that.search,_that.sortBy,_that.sortOrder,_that.expand);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int page,  int limit,  String? status,  String? workScopeUID,  String? roadUID,  int? createdByID,  DateTime? startDate,  DateTime? endDate,  String? search,  String? sortBy,  String? sortOrder,  List<String>? expand)?  $default,) {final _that = this;
switch (_that) {
case _DailyReportFilterModel() when $default != null:
return $default(_that.page,_that.limit,_that.status,_that.workScopeUID,_that.roadUID,_that.createdByID,_that.startDate,_that.endDate,_that.search,_that.sortBy,_that.sortOrder,_that.expand);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DailyReportFilterModel implements DailyReportFilterModel {
  const _DailyReportFilterModel({this.page = 1, this.limit = 10, this.status, this.workScopeUID, this.roadUID, this.createdByID, this.startDate, this.endDate, this.search, this.sortBy, this.sortOrder, final  List<String>? expand}): _expand = expand;
  factory _DailyReportFilterModel.fromJson(Map<String, dynamic> json) => _$DailyReportFilterModelFromJson(json);

/// Page number for pagination
@override@JsonKey() final  int page;
/// Number of items per page
@override@JsonKey() final  int limit;
/// Filter by report status
@override final  String? status;
/// Filter by work scope UID
@override final  String? workScopeUID;
/// Filter by road UID
@override final  String? roadUID;
/// Filter by created by admin ID
@override final  int? createdByID;
/// Filter by date range - start date
@override final  DateTime? startDate;
/// Filter by date range - end date
@override final  DateTime? endDate;
/// Search term for report name
@override final  String? search;
/// Sort field
@override final  String? sortBy;
/// Sort order (asc/desc)
@override final  String? sortOrder;
/// Expand relations
 final  List<String>? _expand;
/// Expand relations
@override List<String>? get expand {
  final value = _expand;
  if (value == null) return null;
  if (_expand is EqualUnmodifiableListView) return _expand;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of DailyReportFilterModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DailyReportFilterModelCopyWith<_DailyReportFilterModel> get copyWith => __$DailyReportFilterModelCopyWithImpl<_DailyReportFilterModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DailyReportFilterModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DailyReportFilterModel&&(identical(other.page, page) || other.page == page)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.status, status) || other.status == status)&&(identical(other.workScopeUID, workScopeUID) || other.workScopeUID == workScopeUID)&&(identical(other.roadUID, roadUID) || other.roadUID == roadUID)&&(identical(other.createdByID, createdByID) || other.createdByID == createdByID)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.search, search) || other.search == search)&&(identical(other.sortBy, sortBy) || other.sortBy == sortBy)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder)&&const DeepCollectionEquality().equals(other._expand, _expand));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,page,limit,status,workScopeUID,roadUID,createdByID,startDate,endDate,search,sortBy,sortOrder,const DeepCollectionEquality().hash(_expand));

@override
String toString() {
  return 'DailyReportFilterModel(page: $page, limit: $limit, status: $status, workScopeUID: $workScopeUID, roadUID: $roadUID, createdByID: $createdByID, startDate: $startDate, endDate: $endDate, search: $search, sortBy: $sortBy, sortOrder: $sortOrder, expand: $expand)';
}


}

/// @nodoc
abstract mixin class _$DailyReportFilterModelCopyWith<$Res> implements $DailyReportFilterModelCopyWith<$Res> {
  factory _$DailyReportFilterModelCopyWith(_DailyReportFilterModel value, $Res Function(_DailyReportFilterModel) _then) = __$DailyReportFilterModelCopyWithImpl;
@override @useResult
$Res call({
 int page, int limit, String? status, String? workScopeUID, String? roadUID, int? createdByID, DateTime? startDate, DateTime? endDate, String? search, String? sortBy, String? sortOrder, List<String>? expand
});




}
/// @nodoc
class __$DailyReportFilterModelCopyWithImpl<$Res>
    implements _$DailyReportFilterModelCopyWith<$Res> {
  __$DailyReportFilterModelCopyWithImpl(this._self, this._then);

  final _DailyReportFilterModel _self;
  final $Res Function(_DailyReportFilterModel) _then;

/// Create a copy of DailyReportFilterModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? page = null,Object? limit = null,Object? status = freezed,Object? workScopeUID = freezed,Object? roadUID = freezed,Object? createdByID = freezed,Object? startDate = freezed,Object? endDate = freezed,Object? search = freezed,Object? sortBy = freezed,Object? sortOrder = freezed,Object? expand = freezed,}) {
  return _then(_DailyReportFilterModel(
page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,workScopeUID: freezed == workScopeUID ? _self.workScopeUID : workScopeUID // ignore: cast_nullable_to_non_nullable
as String?,roadUID: freezed == roadUID ? _self.roadUID : roadUID // ignore: cast_nullable_to_non_nullable
as String?,createdByID: freezed == createdByID ? _self.createdByID : createdByID // ignore: cast_nullable_to_non_nullable
as int?,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,search: freezed == search ? _self.search : search // ignore: cast_nullable_to_non_nullable
as String?,sortBy: freezed == sortBy ? _self.sortBy : sortBy // ignore: cast_nullable_to_non_nullable
as String?,sortOrder: freezed == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as String?,expand: freezed == expand ? _self._expand : expand // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}


}

// dart format on
