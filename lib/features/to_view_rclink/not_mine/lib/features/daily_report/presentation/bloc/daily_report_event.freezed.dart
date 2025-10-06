// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'daily_report_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DailyReportEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DailyReportEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DailyReportEvent()';
}


}

/// @nodoc
class $DailyReportEventCopyWith<$Res>  {
$DailyReportEventCopyWith(DailyReportEvent _, $Res Function(DailyReportEvent) __);
}


/// Adds pattern-matching-related methods to [DailyReportEvent].
extension DailyReportEventPatterns on DailyReportEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoadDailyReports value)?  loadDailyReports,TResult Function( ClearDailyReportCache value)?  clearCache,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoadDailyReports() when loadDailyReports != null:
return loadDailyReports(_that);case ClearDailyReportCache() when clearCache != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoadDailyReports value)  loadDailyReports,required TResult Function( ClearDailyReportCache value)  clearCache,}){
final _that = this;
switch (_that) {
case LoadDailyReports():
return loadDailyReports(_that);case ClearDailyReportCache():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoadDailyReports value)?  loadDailyReports,TResult? Function( ClearDailyReportCache value)?  clearCache,}){
final _that = this;
switch (_that) {
case LoadDailyReports() when loadDailyReports != null:
return loadDailyReports(_that);case ClearDailyReportCache() when clearCache != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String companyUID,  int page,  int limit,  String sortOrder,  bool forceRefresh)?  loadDailyReports,TResult Function()?  clearCache,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LoadDailyReports() when loadDailyReports != null:
return loadDailyReports(_that.companyUID,_that.page,_that.limit,_that.sortOrder,_that.forceRefresh);case ClearDailyReportCache() when clearCache != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String companyUID,  int page,  int limit,  String sortOrder,  bool forceRefresh)  loadDailyReports,required TResult Function()  clearCache,}) {final _that = this;
switch (_that) {
case LoadDailyReports():
return loadDailyReports(_that.companyUID,_that.page,_that.limit,_that.sortOrder,_that.forceRefresh);case ClearDailyReportCache():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String companyUID,  int page,  int limit,  String sortOrder,  bool forceRefresh)?  loadDailyReports,TResult? Function()?  clearCache,}) {final _that = this;
switch (_that) {
case LoadDailyReports() when loadDailyReports != null:
return loadDailyReports(_that.companyUID,_that.page,_that.limit,_that.sortOrder,_that.forceRefresh);case ClearDailyReportCache() when clearCache != null:
return clearCache();case _:
  return null;

}
}

}

/// @nodoc


class LoadDailyReports implements DailyReportEvent {
  const LoadDailyReports({required this.companyUID, this.page = 1, this.limit = 10, this.sortOrder = 'asc', this.forceRefresh = false});
  

 final  String companyUID;
@JsonKey() final  int page;
@JsonKey() final  int limit;
@JsonKey() final  String sortOrder;
@JsonKey() final  bool forceRefresh;

/// Create a copy of DailyReportEvent
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
  return 'DailyReportEvent.loadDailyReports(companyUID: $companyUID, page: $page, limit: $limit, sortOrder: $sortOrder, forceRefresh: $forceRefresh)';
}


}

/// @nodoc
abstract mixin class $LoadDailyReportsCopyWith<$Res> implements $DailyReportEventCopyWith<$Res> {
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

/// Create a copy of DailyReportEvent
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


class ClearDailyReportCache implements DailyReportEvent {
  const ClearDailyReportCache();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClearDailyReportCache);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DailyReportEvent.clearCache()';
}


}




// dart format on
