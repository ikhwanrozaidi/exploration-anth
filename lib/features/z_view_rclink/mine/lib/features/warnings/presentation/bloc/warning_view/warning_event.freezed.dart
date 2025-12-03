// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'warning_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WarningEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WarningEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WarningEvent()';
}


}

/// @nodoc
class $WarningEventCopyWith<$Res>  {
$WarningEventCopyWith(WarningEvent _, $Res Function(WarningEvent) __);
}


/// Adds pattern-matching-related methods to [WarningEvent].
extension WarningEventPatterns on WarningEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoadWarnings value)?  loadWarnings,TResult Function( LoadMoreWarnings value)?  loadMoreWarnings,TResult Function( RefreshWarnings value)?  refreshWarnings,TResult Function( ClearWarningCache value)?  clearWarningCache,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoadWarnings() when loadWarnings != null:
return loadWarnings(_that);case LoadMoreWarnings() when loadMoreWarnings != null:
return loadMoreWarnings(_that);case RefreshWarnings() when refreshWarnings != null:
return refreshWarnings(_that);case ClearWarningCache() when clearWarningCache != null:
return clearWarningCache(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoadWarnings value)  loadWarnings,required TResult Function( LoadMoreWarnings value)  loadMoreWarnings,required TResult Function( RefreshWarnings value)  refreshWarnings,required TResult Function( ClearWarningCache value)  clearWarningCache,}){
final _that = this;
switch (_that) {
case LoadWarnings():
return loadWarnings(_that);case LoadMoreWarnings():
return loadMoreWarnings(_that);case RefreshWarnings():
return refreshWarnings(_that);case ClearWarningCache():
return clearWarningCache(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoadWarnings value)?  loadWarnings,TResult? Function( LoadMoreWarnings value)?  loadMoreWarnings,TResult? Function( RefreshWarnings value)?  refreshWarnings,TResult? Function( ClearWarningCache value)?  clearWarningCache,}){
final _that = this;
switch (_that) {
case LoadWarnings() when loadWarnings != null:
return loadWarnings(_that);case LoadMoreWarnings() when loadMoreWarnings != null:
return loadMoreWarnings(_that);case RefreshWarnings() when refreshWarnings != null:
return refreshWarnings(_that);case ClearWarningCache() when clearWarningCache != null:
return clearWarningCache(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String companyUID,  int page,  int limit,  String sortOrder,  List<String>? warningType,  String? roadUID,  String? workScopeUID,  String? contractRelationUID,  String? dailyReportUID,  bool? isResolved,  bool? requiresAction)?  loadWarnings,TResult Function( String companyUID,  int nextPage,  int limit,  String sortOrder,  List<String>? warningType,  String? roadUID,  String? workScopeUID,  String? contractRelationUID,  String? dailyReportUID,  bool? isResolved,  bool? requiresAction)?  loadMoreWarnings,TResult Function( String companyUID,  int page,  int limit,  String sortOrder,  List<String>? warningType,  String? roadUID,  String? workScopeUID,  String? contractRelationUID,  String? dailyReportUID,  bool? isResolved,  bool? requiresAction)?  refreshWarnings,TResult Function()?  clearWarningCache,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LoadWarnings() when loadWarnings != null:
return loadWarnings(_that.companyUID,_that.page,_that.limit,_that.sortOrder,_that.warningType,_that.roadUID,_that.workScopeUID,_that.contractRelationUID,_that.dailyReportUID,_that.isResolved,_that.requiresAction);case LoadMoreWarnings() when loadMoreWarnings != null:
return loadMoreWarnings(_that.companyUID,_that.nextPage,_that.limit,_that.sortOrder,_that.warningType,_that.roadUID,_that.workScopeUID,_that.contractRelationUID,_that.dailyReportUID,_that.isResolved,_that.requiresAction);case RefreshWarnings() when refreshWarnings != null:
return refreshWarnings(_that.companyUID,_that.page,_that.limit,_that.sortOrder,_that.warningType,_that.roadUID,_that.workScopeUID,_that.contractRelationUID,_that.dailyReportUID,_that.isResolved,_that.requiresAction);case ClearWarningCache() when clearWarningCache != null:
return clearWarningCache();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String companyUID,  int page,  int limit,  String sortOrder,  List<String>? warningType,  String? roadUID,  String? workScopeUID,  String? contractRelationUID,  String? dailyReportUID,  bool? isResolved,  bool? requiresAction)  loadWarnings,required TResult Function( String companyUID,  int nextPage,  int limit,  String sortOrder,  List<String>? warningType,  String? roadUID,  String? workScopeUID,  String? contractRelationUID,  String? dailyReportUID,  bool? isResolved,  bool? requiresAction)  loadMoreWarnings,required TResult Function( String companyUID,  int page,  int limit,  String sortOrder,  List<String>? warningType,  String? roadUID,  String? workScopeUID,  String? contractRelationUID,  String? dailyReportUID,  bool? isResolved,  bool? requiresAction)  refreshWarnings,required TResult Function()  clearWarningCache,}) {final _that = this;
switch (_that) {
case LoadWarnings():
return loadWarnings(_that.companyUID,_that.page,_that.limit,_that.sortOrder,_that.warningType,_that.roadUID,_that.workScopeUID,_that.contractRelationUID,_that.dailyReportUID,_that.isResolved,_that.requiresAction);case LoadMoreWarnings():
return loadMoreWarnings(_that.companyUID,_that.nextPage,_that.limit,_that.sortOrder,_that.warningType,_that.roadUID,_that.workScopeUID,_that.contractRelationUID,_that.dailyReportUID,_that.isResolved,_that.requiresAction);case RefreshWarnings():
return refreshWarnings(_that.companyUID,_that.page,_that.limit,_that.sortOrder,_that.warningType,_that.roadUID,_that.workScopeUID,_that.contractRelationUID,_that.dailyReportUID,_that.isResolved,_that.requiresAction);case ClearWarningCache():
return clearWarningCache();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String companyUID,  int page,  int limit,  String sortOrder,  List<String>? warningType,  String? roadUID,  String? workScopeUID,  String? contractRelationUID,  String? dailyReportUID,  bool? isResolved,  bool? requiresAction)?  loadWarnings,TResult? Function( String companyUID,  int nextPage,  int limit,  String sortOrder,  List<String>? warningType,  String? roadUID,  String? workScopeUID,  String? contractRelationUID,  String? dailyReportUID,  bool? isResolved,  bool? requiresAction)?  loadMoreWarnings,TResult? Function( String companyUID,  int page,  int limit,  String sortOrder,  List<String>? warningType,  String? roadUID,  String? workScopeUID,  String? contractRelationUID,  String? dailyReportUID,  bool? isResolved,  bool? requiresAction)?  refreshWarnings,TResult? Function()?  clearWarningCache,}) {final _that = this;
switch (_that) {
case LoadWarnings() when loadWarnings != null:
return loadWarnings(_that.companyUID,_that.page,_that.limit,_that.sortOrder,_that.warningType,_that.roadUID,_that.workScopeUID,_that.contractRelationUID,_that.dailyReportUID,_that.isResolved,_that.requiresAction);case LoadMoreWarnings() when loadMoreWarnings != null:
return loadMoreWarnings(_that.companyUID,_that.nextPage,_that.limit,_that.sortOrder,_that.warningType,_that.roadUID,_that.workScopeUID,_that.contractRelationUID,_that.dailyReportUID,_that.isResolved,_that.requiresAction);case RefreshWarnings() when refreshWarnings != null:
return refreshWarnings(_that.companyUID,_that.page,_that.limit,_that.sortOrder,_that.warningType,_that.roadUID,_that.workScopeUID,_that.contractRelationUID,_that.dailyReportUID,_that.isResolved,_that.requiresAction);case ClearWarningCache() when clearWarningCache != null:
return clearWarningCache();case _:
  return null;

}
}

}

/// @nodoc


class LoadWarnings implements WarningEvent {
  const LoadWarnings({required this.companyUID, this.page = 1, this.limit = 50, this.sortOrder = 'desc', final  List<String>? warningType, this.roadUID, this.workScopeUID, this.contractRelationUID, this.dailyReportUID, this.isResolved, this.requiresAction}): _warningType = warningType;
  

 final  String companyUID;
@JsonKey() final  int page;
@JsonKey() final  int limit;
@JsonKey() final  String sortOrder;
 final  List<String>? _warningType;
 List<String>? get warningType {
  final value = _warningType;
  if (value == null) return null;
  if (_warningType is EqualUnmodifiableListView) return _warningType;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  String? roadUID;
 final  String? workScopeUID;
 final  String? contractRelationUID;
 final  String? dailyReportUID;
 final  bool? isResolved;
 final  bool? requiresAction;

/// Create a copy of WarningEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadWarningsCopyWith<LoadWarnings> get copyWith => _$LoadWarningsCopyWithImpl<LoadWarnings>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadWarnings&&(identical(other.companyUID, companyUID) || other.companyUID == companyUID)&&(identical(other.page, page) || other.page == page)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder)&&const DeepCollectionEquality().equals(other._warningType, _warningType)&&(identical(other.roadUID, roadUID) || other.roadUID == roadUID)&&(identical(other.workScopeUID, workScopeUID) || other.workScopeUID == workScopeUID)&&(identical(other.contractRelationUID, contractRelationUID) || other.contractRelationUID == contractRelationUID)&&(identical(other.dailyReportUID, dailyReportUID) || other.dailyReportUID == dailyReportUID)&&(identical(other.isResolved, isResolved) || other.isResolved == isResolved)&&(identical(other.requiresAction, requiresAction) || other.requiresAction == requiresAction));
}


@override
int get hashCode => Object.hash(runtimeType,companyUID,page,limit,sortOrder,const DeepCollectionEquality().hash(_warningType),roadUID,workScopeUID,contractRelationUID,dailyReportUID,isResolved,requiresAction);

@override
String toString() {
  return 'WarningEvent.loadWarnings(companyUID: $companyUID, page: $page, limit: $limit, sortOrder: $sortOrder, warningType: $warningType, roadUID: $roadUID, workScopeUID: $workScopeUID, contractRelationUID: $contractRelationUID, dailyReportUID: $dailyReportUID, isResolved: $isResolved, requiresAction: $requiresAction)';
}


}

/// @nodoc
abstract mixin class $LoadWarningsCopyWith<$Res> implements $WarningEventCopyWith<$Res> {
  factory $LoadWarningsCopyWith(LoadWarnings value, $Res Function(LoadWarnings) _then) = _$LoadWarningsCopyWithImpl;
@useResult
$Res call({
 String companyUID, int page, int limit, String sortOrder, List<String>? warningType, String? roadUID, String? workScopeUID, String? contractRelationUID, String? dailyReportUID, bool? isResolved, bool? requiresAction
});




}
/// @nodoc
class _$LoadWarningsCopyWithImpl<$Res>
    implements $LoadWarningsCopyWith<$Res> {
  _$LoadWarningsCopyWithImpl(this._self, this._then);

  final LoadWarnings _self;
  final $Res Function(LoadWarnings) _then;

/// Create a copy of WarningEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? companyUID = null,Object? page = null,Object? limit = null,Object? sortOrder = null,Object? warningType = freezed,Object? roadUID = freezed,Object? workScopeUID = freezed,Object? contractRelationUID = freezed,Object? dailyReportUID = freezed,Object? isResolved = freezed,Object? requiresAction = freezed,}) {
  return _then(LoadWarnings(
companyUID: null == companyUID ? _self.companyUID : companyUID // ignore: cast_nullable_to_non_nullable
as String,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,sortOrder: null == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as String,warningType: freezed == warningType ? _self._warningType : warningType // ignore: cast_nullable_to_non_nullable
as List<String>?,roadUID: freezed == roadUID ? _self.roadUID : roadUID // ignore: cast_nullable_to_non_nullable
as String?,workScopeUID: freezed == workScopeUID ? _self.workScopeUID : workScopeUID // ignore: cast_nullable_to_non_nullable
as String?,contractRelationUID: freezed == contractRelationUID ? _self.contractRelationUID : contractRelationUID // ignore: cast_nullable_to_non_nullable
as String?,dailyReportUID: freezed == dailyReportUID ? _self.dailyReportUID : dailyReportUID // ignore: cast_nullable_to_non_nullable
as String?,isResolved: freezed == isResolved ? _self.isResolved : isResolved // ignore: cast_nullable_to_non_nullable
as bool?,requiresAction: freezed == requiresAction ? _self.requiresAction : requiresAction // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

/// @nodoc


class LoadMoreWarnings implements WarningEvent {
  const LoadMoreWarnings({required this.companyUID, required this.nextPage, this.limit = 50, this.sortOrder = 'desc', final  List<String>? warningType, this.roadUID, this.workScopeUID, this.contractRelationUID, this.dailyReportUID, this.isResolved, this.requiresAction}): _warningType = warningType;
  

 final  String companyUID;
 final  int nextPage;
@JsonKey() final  int limit;
@JsonKey() final  String sortOrder;
 final  List<String>? _warningType;
 List<String>? get warningType {
  final value = _warningType;
  if (value == null) return null;
  if (_warningType is EqualUnmodifiableListView) return _warningType;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  String? roadUID;
 final  String? workScopeUID;
 final  String? contractRelationUID;
 final  String? dailyReportUID;
 final  bool? isResolved;
 final  bool? requiresAction;

/// Create a copy of WarningEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadMoreWarningsCopyWith<LoadMoreWarnings> get copyWith => _$LoadMoreWarningsCopyWithImpl<LoadMoreWarnings>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadMoreWarnings&&(identical(other.companyUID, companyUID) || other.companyUID == companyUID)&&(identical(other.nextPage, nextPage) || other.nextPage == nextPage)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder)&&const DeepCollectionEquality().equals(other._warningType, _warningType)&&(identical(other.roadUID, roadUID) || other.roadUID == roadUID)&&(identical(other.workScopeUID, workScopeUID) || other.workScopeUID == workScopeUID)&&(identical(other.contractRelationUID, contractRelationUID) || other.contractRelationUID == contractRelationUID)&&(identical(other.dailyReportUID, dailyReportUID) || other.dailyReportUID == dailyReportUID)&&(identical(other.isResolved, isResolved) || other.isResolved == isResolved)&&(identical(other.requiresAction, requiresAction) || other.requiresAction == requiresAction));
}


@override
int get hashCode => Object.hash(runtimeType,companyUID,nextPage,limit,sortOrder,const DeepCollectionEquality().hash(_warningType),roadUID,workScopeUID,contractRelationUID,dailyReportUID,isResolved,requiresAction);

@override
String toString() {
  return 'WarningEvent.loadMoreWarnings(companyUID: $companyUID, nextPage: $nextPage, limit: $limit, sortOrder: $sortOrder, warningType: $warningType, roadUID: $roadUID, workScopeUID: $workScopeUID, contractRelationUID: $contractRelationUID, dailyReportUID: $dailyReportUID, isResolved: $isResolved, requiresAction: $requiresAction)';
}


}

/// @nodoc
abstract mixin class $LoadMoreWarningsCopyWith<$Res> implements $WarningEventCopyWith<$Res> {
  factory $LoadMoreWarningsCopyWith(LoadMoreWarnings value, $Res Function(LoadMoreWarnings) _then) = _$LoadMoreWarningsCopyWithImpl;
@useResult
$Res call({
 String companyUID, int nextPage, int limit, String sortOrder, List<String>? warningType, String? roadUID, String? workScopeUID, String? contractRelationUID, String? dailyReportUID, bool? isResolved, bool? requiresAction
});




}
/// @nodoc
class _$LoadMoreWarningsCopyWithImpl<$Res>
    implements $LoadMoreWarningsCopyWith<$Res> {
  _$LoadMoreWarningsCopyWithImpl(this._self, this._then);

  final LoadMoreWarnings _self;
  final $Res Function(LoadMoreWarnings) _then;

/// Create a copy of WarningEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? companyUID = null,Object? nextPage = null,Object? limit = null,Object? sortOrder = null,Object? warningType = freezed,Object? roadUID = freezed,Object? workScopeUID = freezed,Object? contractRelationUID = freezed,Object? dailyReportUID = freezed,Object? isResolved = freezed,Object? requiresAction = freezed,}) {
  return _then(LoadMoreWarnings(
companyUID: null == companyUID ? _self.companyUID : companyUID // ignore: cast_nullable_to_non_nullable
as String,nextPage: null == nextPage ? _self.nextPage : nextPage // ignore: cast_nullable_to_non_nullable
as int,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,sortOrder: null == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as String,warningType: freezed == warningType ? _self._warningType : warningType // ignore: cast_nullable_to_non_nullable
as List<String>?,roadUID: freezed == roadUID ? _self.roadUID : roadUID // ignore: cast_nullable_to_non_nullable
as String?,workScopeUID: freezed == workScopeUID ? _self.workScopeUID : workScopeUID // ignore: cast_nullable_to_non_nullable
as String?,contractRelationUID: freezed == contractRelationUID ? _self.contractRelationUID : contractRelationUID // ignore: cast_nullable_to_non_nullable
as String?,dailyReportUID: freezed == dailyReportUID ? _self.dailyReportUID : dailyReportUID // ignore: cast_nullable_to_non_nullable
as String?,isResolved: freezed == isResolved ? _self.isResolved : isResolved // ignore: cast_nullable_to_non_nullable
as bool?,requiresAction: freezed == requiresAction ? _self.requiresAction : requiresAction // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

/// @nodoc


class RefreshWarnings implements WarningEvent {
  const RefreshWarnings({required this.companyUID, this.page = 1, this.limit = 50, this.sortOrder = 'desc', final  List<String>? warningType, this.roadUID, this.workScopeUID, this.contractRelationUID, this.dailyReportUID, this.isResolved, this.requiresAction}): _warningType = warningType;
  

 final  String companyUID;
@JsonKey() final  int page;
@JsonKey() final  int limit;
@JsonKey() final  String sortOrder;
 final  List<String>? _warningType;
 List<String>? get warningType {
  final value = _warningType;
  if (value == null) return null;
  if (_warningType is EqualUnmodifiableListView) return _warningType;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  String? roadUID;
 final  String? workScopeUID;
 final  String? contractRelationUID;
 final  String? dailyReportUID;
 final  bool? isResolved;
 final  bool? requiresAction;

/// Create a copy of WarningEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RefreshWarningsCopyWith<RefreshWarnings> get copyWith => _$RefreshWarningsCopyWithImpl<RefreshWarnings>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RefreshWarnings&&(identical(other.companyUID, companyUID) || other.companyUID == companyUID)&&(identical(other.page, page) || other.page == page)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder)&&const DeepCollectionEquality().equals(other._warningType, _warningType)&&(identical(other.roadUID, roadUID) || other.roadUID == roadUID)&&(identical(other.workScopeUID, workScopeUID) || other.workScopeUID == workScopeUID)&&(identical(other.contractRelationUID, contractRelationUID) || other.contractRelationUID == contractRelationUID)&&(identical(other.dailyReportUID, dailyReportUID) || other.dailyReportUID == dailyReportUID)&&(identical(other.isResolved, isResolved) || other.isResolved == isResolved)&&(identical(other.requiresAction, requiresAction) || other.requiresAction == requiresAction));
}


@override
int get hashCode => Object.hash(runtimeType,companyUID,page,limit,sortOrder,const DeepCollectionEquality().hash(_warningType),roadUID,workScopeUID,contractRelationUID,dailyReportUID,isResolved,requiresAction);

@override
String toString() {
  return 'WarningEvent.refreshWarnings(companyUID: $companyUID, page: $page, limit: $limit, sortOrder: $sortOrder, warningType: $warningType, roadUID: $roadUID, workScopeUID: $workScopeUID, contractRelationUID: $contractRelationUID, dailyReportUID: $dailyReportUID, isResolved: $isResolved, requiresAction: $requiresAction)';
}


}

/// @nodoc
abstract mixin class $RefreshWarningsCopyWith<$Res> implements $WarningEventCopyWith<$Res> {
  factory $RefreshWarningsCopyWith(RefreshWarnings value, $Res Function(RefreshWarnings) _then) = _$RefreshWarningsCopyWithImpl;
@useResult
$Res call({
 String companyUID, int page, int limit, String sortOrder, List<String>? warningType, String? roadUID, String? workScopeUID, String? contractRelationUID, String? dailyReportUID, bool? isResolved, bool? requiresAction
});




}
/// @nodoc
class _$RefreshWarningsCopyWithImpl<$Res>
    implements $RefreshWarningsCopyWith<$Res> {
  _$RefreshWarningsCopyWithImpl(this._self, this._then);

  final RefreshWarnings _self;
  final $Res Function(RefreshWarnings) _then;

/// Create a copy of WarningEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? companyUID = null,Object? page = null,Object? limit = null,Object? sortOrder = null,Object? warningType = freezed,Object? roadUID = freezed,Object? workScopeUID = freezed,Object? contractRelationUID = freezed,Object? dailyReportUID = freezed,Object? isResolved = freezed,Object? requiresAction = freezed,}) {
  return _then(RefreshWarnings(
companyUID: null == companyUID ? _self.companyUID : companyUID // ignore: cast_nullable_to_non_nullable
as String,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,sortOrder: null == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as String,warningType: freezed == warningType ? _self._warningType : warningType // ignore: cast_nullable_to_non_nullable
as List<String>?,roadUID: freezed == roadUID ? _self.roadUID : roadUID // ignore: cast_nullable_to_non_nullable
as String?,workScopeUID: freezed == workScopeUID ? _self.workScopeUID : workScopeUID // ignore: cast_nullable_to_non_nullable
as String?,contractRelationUID: freezed == contractRelationUID ? _self.contractRelationUID : contractRelationUID // ignore: cast_nullable_to_non_nullable
as String?,dailyReportUID: freezed == dailyReportUID ? _self.dailyReportUID : dailyReportUID // ignore: cast_nullable_to_non_nullable
as String?,isResolved: freezed == isResolved ? _self.isResolved : isResolved // ignore: cast_nullable_to_non_nullable
as bool?,requiresAction: freezed == requiresAction ? _self.requiresAction : requiresAction // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

/// @nodoc


class ClearWarningCache implements WarningEvent {
  const ClearWarningCache();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClearWarningCache);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WarningEvent.clearWarningCache()';
}


}




// dart format on
