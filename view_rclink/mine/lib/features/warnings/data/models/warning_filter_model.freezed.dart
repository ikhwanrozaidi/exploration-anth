// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'warning_filter_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WarningFilterModel {

/// Page number for pagination
 int get page;/// Number of items per page
 int get limit;/// Sort field
@JsonKey(includeIfNull: false) String? get sortBy;/// Sort order (asc/desc)
@JsonKey(includeIfNull: false) String? get sortOrder;/// Filter by warning type
@JsonKey(includeIfNull: false) List<String>? get warningType;/// Filter by road ID
@JsonKey(includeIfNull: false) String? get roadID;/// Filter by Work Scope ID
@JsonKey(includeIfNull: false) String? get workScopeID;/// Filter by Contract Relation ID
@JsonKey(includeIfNull: false) String? get contractRelationID;/// Filter by Daily Report ID
@JsonKey(includeIfNull: false) String? get dailyReportID;/// Filter by Resolved status
@JsonKey(includeIfNull: false) bool? get isResolved;/// Filter by Action status
@JsonKey(includeIfNull: false) bool? get requiresAction;/// Expand relations
@JsonKey(includeIfNull: false) List<String>? get expand;
/// Create a copy of WarningFilterModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WarningFilterModelCopyWith<WarningFilterModel> get copyWith => _$WarningFilterModelCopyWithImpl<WarningFilterModel>(this as WarningFilterModel, _$identity);

  /// Serializes this WarningFilterModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WarningFilterModel&&(identical(other.page, page) || other.page == page)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.sortBy, sortBy) || other.sortBy == sortBy)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder)&&const DeepCollectionEquality().equals(other.warningType, warningType)&&(identical(other.roadID, roadID) || other.roadID == roadID)&&(identical(other.workScopeID, workScopeID) || other.workScopeID == workScopeID)&&(identical(other.contractRelationID, contractRelationID) || other.contractRelationID == contractRelationID)&&(identical(other.dailyReportID, dailyReportID) || other.dailyReportID == dailyReportID)&&(identical(other.isResolved, isResolved) || other.isResolved == isResolved)&&(identical(other.requiresAction, requiresAction) || other.requiresAction == requiresAction)&&const DeepCollectionEquality().equals(other.expand, expand));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,page,limit,sortBy,sortOrder,const DeepCollectionEquality().hash(warningType),roadID,workScopeID,contractRelationID,dailyReportID,isResolved,requiresAction,const DeepCollectionEquality().hash(expand));

@override
String toString() {
  return 'WarningFilterModel(page: $page, limit: $limit, sortBy: $sortBy, sortOrder: $sortOrder, warningType: $warningType, roadID: $roadID, workScopeID: $workScopeID, contractRelationID: $contractRelationID, dailyReportID: $dailyReportID, isResolved: $isResolved, requiresAction: $requiresAction, expand: $expand)';
}


}

/// @nodoc
abstract mixin class $WarningFilterModelCopyWith<$Res>  {
  factory $WarningFilterModelCopyWith(WarningFilterModel value, $Res Function(WarningFilterModel) _then) = _$WarningFilterModelCopyWithImpl;
@useResult
$Res call({
 int page, int limit,@JsonKey(includeIfNull: false) String? sortBy,@JsonKey(includeIfNull: false) String? sortOrder,@JsonKey(includeIfNull: false) List<String>? warningType,@JsonKey(includeIfNull: false) String? roadID,@JsonKey(includeIfNull: false) String? workScopeID,@JsonKey(includeIfNull: false) String? contractRelationID,@JsonKey(includeIfNull: false) String? dailyReportID,@JsonKey(includeIfNull: false) bool? isResolved,@JsonKey(includeIfNull: false) bool? requiresAction,@JsonKey(includeIfNull: false) List<String>? expand
});




}
/// @nodoc
class _$WarningFilterModelCopyWithImpl<$Res>
    implements $WarningFilterModelCopyWith<$Res> {
  _$WarningFilterModelCopyWithImpl(this._self, this._then);

  final WarningFilterModel _self;
  final $Res Function(WarningFilterModel) _then;

/// Create a copy of WarningFilterModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? page = null,Object? limit = null,Object? sortBy = freezed,Object? sortOrder = freezed,Object? warningType = freezed,Object? roadID = freezed,Object? workScopeID = freezed,Object? contractRelationID = freezed,Object? dailyReportID = freezed,Object? isResolved = freezed,Object? requiresAction = freezed,Object? expand = freezed,}) {
  return _then(_self.copyWith(
page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,sortBy: freezed == sortBy ? _self.sortBy : sortBy // ignore: cast_nullable_to_non_nullable
as String?,sortOrder: freezed == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as String?,warningType: freezed == warningType ? _self.warningType : warningType // ignore: cast_nullable_to_non_nullable
as List<String>?,roadID: freezed == roadID ? _self.roadID : roadID // ignore: cast_nullable_to_non_nullable
as String?,workScopeID: freezed == workScopeID ? _self.workScopeID : workScopeID // ignore: cast_nullable_to_non_nullable
as String?,contractRelationID: freezed == contractRelationID ? _self.contractRelationID : contractRelationID // ignore: cast_nullable_to_non_nullable
as String?,dailyReportID: freezed == dailyReportID ? _self.dailyReportID : dailyReportID // ignore: cast_nullable_to_non_nullable
as String?,isResolved: freezed == isResolved ? _self.isResolved : isResolved // ignore: cast_nullable_to_non_nullable
as bool?,requiresAction: freezed == requiresAction ? _self.requiresAction : requiresAction // ignore: cast_nullable_to_non_nullable
as bool?,expand: freezed == expand ? _self.expand : expand // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}

}


/// Adds pattern-matching-related methods to [WarningFilterModel].
extension WarningFilterModelPatterns on WarningFilterModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WarningFilterModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WarningFilterModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WarningFilterModel value)  $default,){
final _that = this;
switch (_that) {
case _WarningFilterModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WarningFilterModel value)?  $default,){
final _that = this;
switch (_that) {
case _WarningFilterModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int page,  int limit, @JsonKey(includeIfNull: false)  String? sortBy, @JsonKey(includeIfNull: false)  String? sortOrder, @JsonKey(includeIfNull: false)  List<String>? warningType, @JsonKey(includeIfNull: false)  String? roadID, @JsonKey(includeIfNull: false)  String? workScopeID, @JsonKey(includeIfNull: false)  String? contractRelationID, @JsonKey(includeIfNull: false)  String? dailyReportID, @JsonKey(includeIfNull: false)  bool? isResolved, @JsonKey(includeIfNull: false)  bool? requiresAction, @JsonKey(includeIfNull: false)  List<String>? expand)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WarningFilterModel() when $default != null:
return $default(_that.page,_that.limit,_that.sortBy,_that.sortOrder,_that.warningType,_that.roadID,_that.workScopeID,_that.contractRelationID,_that.dailyReportID,_that.isResolved,_that.requiresAction,_that.expand);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int page,  int limit, @JsonKey(includeIfNull: false)  String? sortBy, @JsonKey(includeIfNull: false)  String? sortOrder, @JsonKey(includeIfNull: false)  List<String>? warningType, @JsonKey(includeIfNull: false)  String? roadID, @JsonKey(includeIfNull: false)  String? workScopeID, @JsonKey(includeIfNull: false)  String? contractRelationID, @JsonKey(includeIfNull: false)  String? dailyReportID, @JsonKey(includeIfNull: false)  bool? isResolved, @JsonKey(includeIfNull: false)  bool? requiresAction, @JsonKey(includeIfNull: false)  List<String>? expand)  $default,) {final _that = this;
switch (_that) {
case _WarningFilterModel():
return $default(_that.page,_that.limit,_that.sortBy,_that.sortOrder,_that.warningType,_that.roadID,_that.workScopeID,_that.contractRelationID,_that.dailyReportID,_that.isResolved,_that.requiresAction,_that.expand);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int page,  int limit, @JsonKey(includeIfNull: false)  String? sortBy, @JsonKey(includeIfNull: false)  String? sortOrder, @JsonKey(includeIfNull: false)  List<String>? warningType, @JsonKey(includeIfNull: false)  String? roadID, @JsonKey(includeIfNull: false)  String? workScopeID, @JsonKey(includeIfNull: false)  String? contractRelationID, @JsonKey(includeIfNull: false)  String? dailyReportID, @JsonKey(includeIfNull: false)  bool? isResolved, @JsonKey(includeIfNull: false)  bool? requiresAction, @JsonKey(includeIfNull: false)  List<String>? expand)?  $default,) {final _that = this;
switch (_that) {
case _WarningFilterModel() when $default != null:
return $default(_that.page,_that.limit,_that.sortBy,_that.sortOrder,_that.warningType,_that.roadID,_that.workScopeID,_that.contractRelationID,_that.dailyReportID,_that.isResolved,_that.requiresAction,_that.expand);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WarningFilterModel implements WarningFilterModel {
  const _WarningFilterModel({this.page = 1, this.limit = 10, @JsonKey(includeIfNull: false) this.sortBy, @JsonKey(includeIfNull: false) this.sortOrder, @JsonKey(includeIfNull: false) final  List<String>? warningType, @JsonKey(includeIfNull: false) this.roadID, @JsonKey(includeIfNull: false) this.workScopeID, @JsonKey(includeIfNull: false) this.contractRelationID, @JsonKey(includeIfNull: false) this.dailyReportID, @JsonKey(includeIfNull: false) this.isResolved, @JsonKey(includeIfNull: false) this.requiresAction, @JsonKey(includeIfNull: false) final  List<String>? expand}): _warningType = warningType,_expand = expand;
  factory _WarningFilterModel.fromJson(Map<String, dynamic> json) => _$WarningFilterModelFromJson(json);

/// Page number for pagination
@override@JsonKey() final  int page;
/// Number of items per page
@override@JsonKey() final  int limit;
/// Sort field
@override@JsonKey(includeIfNull: false) final  String? sortBy;
/// Sort order (asc/desc)
@override@JsonKey(includeIfNull: false) final  String? sortOrder;
/// Filter by warning type
 final  List<String>? _warningType;
/// Filter by warning type
@override@JsonKey(includeIfNull: false) List<String>? get warningType {
  final value = _warningType;
  if (value == null) return null;
  if (_warningType is EqualUnmodifiableListView) return _warningType;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

/// Filter by road ID
@override@JsonKey(includeIfNull: false) final  String? roadID;
/// Filter by Work Scope ID
@override@JsonKey(includeIfNull: false) final  String? workScopeID;
/// Filter by Contract Relation ID
@override@JsonKey(includeIfNull: false) final  String? contractRelationID;
/// Filter by Daily Report ID
@override@JsonKey(includeIfNull: false) final  String? dailyReportID;
/// Filter by Resolved status
@override@JsonKey(includeIfNull: false) final  bool? isResolved;
/// Filter by Action status
@override@JsonKey(includeIfNull: false) final  bool? requiresAction;
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


/// Create a copy of WarningFilterModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WarningFilterModelCopyWith<_WarningFilterModel> get copyWith => __$WarningFilterModelCopyWithImpl<_WarningFilterModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WarningFilterModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WarningFilterModel&&(identical(other.page, page) || other.page == page)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.sortBy, sortBy) || other.sortBy == sortBy)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder)&&const DeepCollectionEquality().equals(other._warningType, _warningType)&&(identical(other.roadID, roadID) || other.roadID == roadID)&&(identical(other.workScopeID, workScopeID) || other.workScopeID == workScopeID)&&(identical(other.contractRelationID, contractRelationID) || other.contractRelationID == contractRelationID)&&(identical(other.dailyReportID, dailyReportID) || other.dailyReportID == dailyReportID)&&(identical(other.isResolved, isResolved) || other.isResolved == isResolved)&&(identical(other.requiresAction, requiresAction) || other.requiresAction == requiresAction)&&const DeepCollectionEquality().equals(other._expand, _expand));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,page,limit,sortBy,sortOrder,const DeepCollectionEquality().hash(_warningType),roadID,workScopeID,contractRelationID,dailyReportID,isResolved,requiresAction,const DeepCollectionEquality().hash(_expand));

@override
String toString() {
  return 'WarningFilterModel(page: $page, limit: $limit, sortBy: $sortBy, sortOrder: $sortOrder, warningType: $warningType, roadID: $roadID, workScopeID: $workScopeID, contractRelationID: $contractRelationID, dailyReportID: $dailyReportID, isResolved: $isResolved, requiresAction: $requiresAction, expand: $expand)';
}


}

/// @nodoc
abstract mixin class _$WarningFilterModelCopyWith<$Res> implements $WarningFilterModelCopyWith<$Res> {
  factory _$WarningFilterModelCopyWith(_WarningFilterModel value, $Res Function(_WarningFilterModel) _then) = __$WarningFilterModelCopyWithImpl;
@override @useResult
$Res call({
 int page, int limit,@JsonKey(includeIfNull: false) String? sortBy,@JsonKey(includeIfNull: false) String? sortOrder,@JsonKey(includeIfNull: false) List<String>? warningType,@JsonKey(includeIfNull: false) String? roadID,@JsonKey(includeIfNull: false) String? workScopeID,@JsonKey(includeIfNull: false) String? contractRelationID,@JsonKey(includeIfNull: false) String? dailyReportID,@JsonKey(includeIfNull: false) bool? isResolved,@JsonKey(includeIfNull: false) bool? requiresAction,@JsonKey(includeIfNull: false) List<String>? expand
});




}
/// @nodoc
class __$WarningFilterModelCopyWithImpl<$Res>
    implements _$WarningFilterModelCopyWith<$Res> {
  __$WarningFilterModelCopyWithImpl(this._self, this._then);

  final _WarningFilterModel _self;
  final $Res Function(_WarningFilterModel) _then;

/// Create a copy of WarningFilterModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? page = null,Object? limit = null,Object? sortBy = freezed,Object? sortOrder = freezed,Object? warningType = freezed,Object? roadID = freezed,Object? workScopeID = freezed,Object? contractRelationID = freezed,Object? dailyReportID = freezed,Object? isResolved = freezed,Object? requiresAction = freezed,Object? expand = freezed,}) {
  return _then(_WarningFilterModel(
page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,sortBy: freezed == sortBy ? _self.sortBy : sortBy // ignore: cast_nullable_to_non_nullable
as String?,sortOrder: freezed == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as String?,warningType: freezed == warningType ? _self._warningType : warningType // ignore: cast_nullable_to_non_nullable
as List<String>?,roadID: freezed == roadID ? _self.roadID : roadID // ignore: cast_nullable_to_non_nullable
as String?,workScopeID: freezed == workScopeID ? _self.workScopeID : workScopeID // ignore: cast_nullable_to_non_nullable
as String?,contractRelationID: freezed == contractRelationID ? _self.contractRelationID : contractRelationID // ignore: cast_nullable_to_non_nullable
as String?,dailyReportID: freezed == dailyReportID ? _self.dailyReportID : dailyReportID // ignore: cast_nullable_to_non_nullable
as String?,isResolved: freezed == isResolved ? _self.isResolved : isResolved // ignore: cast_nullable_to_non_nullable
as bool?,requiresAction: freezed == requiresAction ? _self.requiresAction : requiresAction // ignore: cast_nullable_to_non_nullable
as bool?,expand: freezed == expand ? _self._expand : expand // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}


}

// dart format on
