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
@JsonKey(includeIfNull: false) String? get status;/// Filter by work scope UID
@JsonKey(includeIfNull: false) String? get workScopeUID;/// Filter by road UID
@JsonKey(includeIfNull: false) String? get roadUID;/// Filter by created by admin ID
@JsonKey(includeIfNull: false) int? get createdByID;/// Filter by date range - start date
@JsonKey(includeIfNull: false) String? get fromDate;/// Filter by date range - end date
@JsonKey(includeIfNull: false) String? get toDate;/// Search term for report name
@JsonKey(includeIfNull: false) String? get search;/// Contractor Relation Filter
@JsonKey(includeIfNull: false) String? get contractorRelationUID;/// Sort field
@JsonKey(includeIfNull: false) String? get sortBy;/// Sort order (asc/desc)
@JsonKey(includeIfNull: false) String? get sortOrder;/// Expand relations
@JsonKey(includeIfNull: false) List<String>? get expand;
/// Create a copy of DailyReportFilterModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DailyReportFilterModelCopyWith<DailyReportFilterModel> get copyWith => _$DailyReportFilterModelCopyWithImpl<DailyReportFilterModel>(this as DailyReportFilterModel, _$identity);

  /// Serializes this DailyReportFilterModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DailyReportFilterModel&&(identical(other.page, page) || other.page == page)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.status, status) || other.status == status)&&(identical(other.workScopeUID, workScopeUID) || other.workScopeUID == workScopeUID)&&(identical(other.roadUID, roadUID) || other.roadUID == roadUID)&&(identical(other.createdByID, createdByID) || other.createdByID == createdByID)&&(identical(other.fromDate, fromDate) || other.fromDate == fromDate)&&(identical(other.toDate, toDate) || other.toDate == toDate)&&(identical(other.search, search) || other.search == search)&&(identical(other.contractorRelationUID, contractorRelationUID) || other.contractorRelationUID == contractorRelationUID)&&(identical(other.sortBy, sortBy) || other.sortBy == sortBy)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder)&&const DeepCollectionEquality().equals(other.expand, expand));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,page,limit,status,workScopeUID,roadUID,createdByID,fromDate,toDate,search,contractorRelationUID,sortBy,sortOrder,const DeepCollectionEquality().hash(expand));

@override
String toString() {
  return 'DailyReportFilterModel(page: $page, limit: $limit, status: $status, workScopeUID: $workScopeUID, roadUID: $roadUID, createdByID: $createdByID, fromDate: $fromDate, toDate: $toDate, search: $search, contractorRelationUID: $contractorRelationUID, sortBy: $sortBy, sortOrder: $sortOrder, expand: $expand)';
}


}

/// @nodoc
abstract mixin class $DailyReportFilterModelCopyWith<$Res>  {
  factory $DailyReportFilterModelCopyWith(DailyReportFilterModel value, $Res Function(DailyReportFilterModel) _then) = _$DailyReportFilterModelCopyWithImpl;
@useResult
$Res call({
 int page, int limit,@JsonKey(includeIfNull: false) String? status,@JsonKey(includeIfNull: false) String? workScopeUID,@JsonKey(includeIfNull: false) String? roadUID,@JsonKey(includeIfNull: false) int? createdByID,@JsonKey(includeIfNull: false) String? fromDate,@JsonKey(includeIfNull: false) String? toDate,@JsonKey(includeIfNull: false) String? search,@JsonKey(includeIfNull: false) String? contractorRelationUID,@JsonKey(includeIfNull: false) String? sortBy,@JsonKey(includeIfNull: false) String? sortOrder,@JsonKey(includeIfNull: false) List<String>? expand
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
@pragma('vm:prefer-inline') @override $Res call({Object? page = null,Object? limit = null,Object? status = freezed,Object? workScopeUID = freezed,Object? roadUID = freezed,Object? createdByID = freezed,Object? fromDate = freezed,Object? toDate = freezed,Object? search = freezed,Object? contractorRelationUID = freezed,Object? sortBy = freezed,Object? sortOrder = freezed,Object? expand = freezed,}) {
  return _then(_self.copyWith(
page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,workScopeUID: freezed == workScopeUID ? _self.workScopeUID : workScopeUID // ignore: cast_nullable_to_non_nullable
as String?,roadUID: freezed == roadUID ? _self.roadUID : roadUID // ignore: cast_nullable_to_non_nullable
as String?,createdByID: freezed == createdByID ? _self.createdByID : createdByID // ignore: cast_nullable_to_non_nullable
as int?,fromDate: freezed == fromDate ? _self.fromDate : fromDate // ignore: cast_nullable_to_non_nullable
as String?,toDate: freezed == toDate ? _self.toDate : toDate // ignore: cast_nullable_to_non_nullable
as String?,search: freezed == search ? _self.search : search // ignore: cast_nullable_to_non_nullable
as String?,contractorRelationUID: freezed == contractorRelationUID ? _self.contractorRelationUID : contractorRelationUID // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int page,  int limit, @JsonKey(includeIfNull: false)  String? status, @JsonKey(includeIfNull: false)  String? workScopeUID, @JsonKey(includeIfNull: false)  String? roadUID, @JsonKey(includeIfNull: false)  int? createdByID, @JsonKey(includeIfNull: false)  String? fromDate, @JsonKey(includeIfNull: false)  String? toDate, @JsonKey(includeIfNull: false)  String? search, @JsonKey(includeIfNull: false)  String? contractorRelationUID, @JsonKey(includeIfNull: false)  String? sortBy, @JsonKey(includeIfNull: false)  String? sortOrder, @JsonKey(includeIfNull: false)  List<String>? expand)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DailyReportFilterModel() when $default != null:
return $default(_that.page,_that.limit,_that.status,_that.workScopeUID,_that.roadUID,_that.createdByID,_that.fromDate,_that.toDate,_that.search,_that.contractorRelationUID,_that.sortBy,_that.sortOrder,_that.expand);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int page,  int limit, @JsonKey(includeIfNull: false)  String? status, @JsonKey(includeIfNull: false)  String? workScopeUID, @JsonKey(includeIfNull: false)  String? roadUID, @JsonKey(includeIfNull: false)  int? createdByID, @JsonKey(includeIfNull: false)  String? fromDate, @JsonKey(includeIfNull: false)  String? toDate, @JsonKey(includeIfNull: false)  String? search, @JsonKey(includeIfNull: false)  String? contractorRelationUID, @JsonKey(includeIfNull: false)  String? sortBy, @JsonKey(includeIfNull: false)  String? sortOrder, @JsonKey(includeIfNull: false)  List<String>? expand)  $default,) {final _that = this;
switch (_that) {
case _DailyReportFilterModel():
return $default(_that.page,_that.limit,_that.status,_that.workScopeUID,_that.roadUID,_that.createdByID,_that.fromDate,_that.toDate,_that.search,_that.contractorRelationUID,_that.sortBy,_that.sortOrder,_that.expand);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int page,  int limit, @JsonKey(includeIfNull: false)  String? status, @JsonKey(includeIfNull: false)  String? workScopeUID, @JsonKey(includeIfNull: false)  String? roadUID, @JsonKey(includeIfNull: false)  int? createdByID, @JsonKey(includeIfNull: false)  String? fromDate, @JsonKey(includeIfNull: false)  String? toDate, @JsonKey(includeIfNull: false)  String? search, @JsonKey(includeIfNull: false)  String? contractorRelationUID, @JsonKey(includeIfNull: false)  String? sortBy, @JsonKey(includeIfNull: false)  String? sortOrder, @JsonKey(includeIfNull: false)  List<String>? expand)?  $default,) {final _that = this;
switch (_that) {
case _DailyReportFilterModel() when $default != null:
return $default(_that.page,_that.limit,_that.status,_that.workScopeUID,_that.roadUID,_that.createdByID,_that.fromDate,_that.toDate,_that.search,_that.contractorRelationUID,_that.sortBy,_that.sortOrder,_that.expand);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DailyReportFilterModel implements DailyReportFilterModel {
  const _DailyReportFilterModel({this.page = 1, this.limit = 10, @JsonKey(includeIfNull: false) this.status, @JsonKey(includeIfNull: false) this.workScopeUID, @JsonKey(includeIfNull: false) this.roadUID, @JsonKey(includeIfNull: false) this.createdByID, @JsonKey(includeIfNull: false) this.fromDate, @JsonKey(includeIfNull: false) this.toDate, @JsonKey(includeIfNull: false) this.search, @JsonKey(includeIfNull: false) this.contractorRelationUID, @JsonKey(includeIfNull: false) this.sortBy, @JsonKey(includeIfNull: false) this.sortOrder, @JsonKey(includeIfNull: false) final  List<String>? expand}): _expand = expand;
  factory _DailyReportFilterModel.fromJson(Map<String, dynamic> json) => _$DailyReportFilterModelFromJson(json);

/// Page number for pagination
@override@JsonKey() final  int page;
/// Number of items per page
@override@JsonKey() final  int limit;
/// Filter by report status
@override@JsonKey(includeIfNull: false) final  String? status;
/// Filter by work scope UID
@override@JsonKey(includeIfNull: false) final  String? workScopeUID;
/// Filter by road UID
@override@JsonKey(includeIfNull: false) final  String? roadUID;
/// Filter by created by admin ID
@override@JsonKey(includeIfNull: false) final  int? createdByID;
/// Filter by date range - start date
@override@JsonKey(includeIfNull: false) final  String? fromDate;
/// Filter by date range - end date
@override@JsonKey(includeIfNull: false) final  String? toDate;
/// Search term for report name
@override@JsonKey(includeIfNull: false) final  String? search;
/// Contractor Relation Filter
@override@JsonKey(includeIfNull: false) final  String? contractorRelationUID;
/// Sort field
@override@JsonKey(includeIfNull: false) final  String? sortBy;
/// Sort order (asc/desc)
@override@JsonKey(includeIfNull: false) final  String? sortOrder;
/// Expand relations
 final  List<String>? _expand;
/// Expand relations
@override@JsonKey(includeIfNull: false) List<String>? get expand {
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DailyReportFilterModel&&(identical(other.page, page) || other.page == page)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.status, status) || other.status == status)&&(identical(other.workScopeUID, workScopeUID) || other.workScopeUID == workScopeUID)&&(identical(other.roadUID, roadUID) || other.roadUID == roadUID)&&(identical(other.createdByID, createdByID) || other.createdByID == createdByID)&&(identical(other.fromDate, fromDate) || other.fromDate == fromDate)&&(identical(other.toDate, toDate) || other.toDate == toDate)&&(identical(other.search, search) || other.search == search)&&(identical(other.contractorRelationUID, contractorRelationUID) || other.contractorRelationUID == contractorRelationUID)&&(identical(other.sortBy, sortBy) || other.sortBy == sortBy)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder)&&const DeepCollectionEquality().equals(other._expand, _expand));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,page,limit,status,workScopeUID,roadUID,createdByID,fromDate,toDate,search,contractorRelationUID,sortBy,sortOrder,const DeepCollectionEquality().hash(_expand));

@override
String toString() {
  return 'DailyReportFilterModel(page: $page, limit: $limit, status: $status, workScopeUID: $workScopeUID, roadUID: $roadUID, createdByID: $createdByID, fromDate: $fromDate, toDate: $toDate, search: $search, contractorRelationUID: $contractorRelationUID, sortBy: $sortBy, sortOrder: $sortOrder, expand: $expand)';
}


}

/// @nodoc
abstract mixin class _$DailyReportFilterModelCopyWith<$Res> implements $DailyReportFilterModelCopyWith<$Res> {
  factory _$DailyReportFilterModelCopyWith(_DailyReportFilterModel value, $Res Function(_DailyReportFilterModel) _then) = __$DailyReportFilterModelCopyWithImpl;
@override @useResult
$Res call({
 int page, int limit,@JsonKey(includeIfNull: false) String? status,@JsonKey(includeIfNull: false) String? workScopeUID,@JsonKey(includeIfNull: false) String? roadUID,@JsonKey(includeIfNull: false) int? createdByID,@JsonKey(includeIfNull: false) String? fromDate,@JsonKey(includeIfNull: false) String? toDate,@JsonKey(includeIfNull: false) String? search,@JsonKey(includeIfNull: false) String? contractorRelationUID,@JsonKey(includeIfNull: false) String? sortBy,@JsonKey(includeIfNull: false) String? sortOrder,@JsonKey(includeIfNull: false) List<String>? expand
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
@override @pragma('vm:prefer-inline') $Res call({Object? page = null,Object? limit = null,Object? status = freezed,Object? workScopeUID = freezed,Object? roadUID = freezed,Object? createdByID = freezed,Object? fromDate = freezed,Object? toDate = freezed,Object? search = freezed,Object? contractorRelationUID = freezed,Object? sortBy = freezed,Object? sortOrder = freezed,Object? expand = freezed,}) {
  return _then(_DailyReportFilterModel(
page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,workScopeUID: freezed == workScopeUID ? _self.workScopeUID : workScopeUID // ignore: cast_nullable_to_non_nullable
as String?,roadUID: freezed == roadUID ? _self.roadUID : roadUID // ignore: cast_nullable_to_non_nullable
as String?,createdByID: freezed == createdByID ? _self.createdByID : createdByID // ignore: cast_nullable_to_non_nullable
as int?,fromDate: freezed == fromDate ? _self.fromDate : fromDate // ignore: cast_nullable_to_non_nullable
as String?,toDate: freezed == toDate ? _self.toDate : toDate // ignore: cast_nullable_to_non_nullable
as String?,search: freezed == search ? _self.search : search // ignore: cast_nullable_to_non_nullable
as String?,contractorRelationUID: freezed == contractorRelationUID ? _self.contractorRelationUID : contractorRelationUID // ignore: cast_nullable_to_non_nullable
as String?,sortBy: freezed == sortBy ? _self.sortBy : sortBy // ignore: cast_nullable_to_non_nullable
as String?,sortOrder: freezed == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as String?,expand: freezed == expand ? _self._expand : expand // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}


}

// dart format on
