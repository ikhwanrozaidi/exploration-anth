// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'program_settings_filter_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProgramSettingsFilterModel {

/// Page number for pagination
 int get page;/// Number of items per page
 int get limit;/// Filter by report status
@JsonKey(includeIfNull: false) String? get sortOrder;/// Filter by work scope UID
@JsonKey(includeIfNull: false) String? get sortBy;/// Filter by road UID
@JsonKey(includeIfNull: false) String? get workScopeUID;/// Filter by created by admin ID
@JsonKey(includeIfNull: false) String? get calculationType;/// Filter by date range - start date
@JsonKey(includeIfNull: false) bool? get isActive;/// Expand relations
@JsonKey(includeIfNull: false) List<String>? get expand;
/// Create a copy of ProgramSettingsFilterModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProgramSettingsFilterModelCopyWith<ProgramSettingsFilterModel> get copyWith => _$ProgramSettingsFilterModelCopyWithImpl<ProgramSettingsFilterModel>(this as ProgramSettingsFilterModel, _$identity);

  /// Serializes this ProgramSettingsFilterModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProgramSettingsFilterModel&&(identical(other.page, page) || other.page == page)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder)&&(identical(other.sortBy, sortBy) || other.sortBy == sortBy)&&(identical(other.workScopeUID, workScopeUID) || other.workScopeUID == workScopeUID)&&(identical(other.calculationType, calculationType) || other.calculationType == calculationType)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&const DeepCollectionEquality().equals(other.expand, expand));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,page,limit,sortOrder,sortBy,workScopeUID,calculationType,isActive,const DeepCollectionEquality().hash(expand));

@override
String toString() {
  return 'ProgramSettingsFilterModel(page: $page, limit: $limit, sortOrder: $sortOrder, sortBy: $sortBy, workScopeUID: $workScopeUID, calculationType: $calculationType, isActive: $isActive, expand: $expand)';
}


}

/// @nodoc
abstract mixin class $ProgramSettingsFilterModelCopyWith<$Res>  {
  factory $ProgramSettingsFilterModelCopyWith(ProgramSettingsFilterModel value, $Res Function(ProgramSettingsFilterModel) _then) = _$ProgramSettingsFilterModelCopyWithImpl;
@useResult
$Res call({
 int page, int limit,@JsonKey(includeIfNull: false) String? sortOrder,@JsonKey(includeIfNull: false) String? sortBy,@JsonKey(includeIfNull: false) String? workScopeUID,@JsonKey(includeIfNull: false) String? calculationType,@JsonKey(includeIfNull: false) bool? isActive,@JsonKey(includeIfNull: false) List<String>? expand
});




}
/// @nodoc
class _$ProgramSettingsFilterModelCopyWithImpl<$Res>
    implements $ProgramSettingsFilterModelCopyWith<$Res> {
  _$ProgramSettingsFilterModelCopyWithImpl(this._self, this._then);

  final ProgramSettingsFilterModel _self;
  final $Res Function(ProgramSettingsFilterModel) _then;

/// Create a copy of ProgramSettingsFilterModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? page = null,Object? limit = null,Object? sortOrder = freezed,Object? sortBy = freezed,Object? workScopeUID = freezed,Object? calculationType = freezed,Object? isActive = freezed,Object? expand = freezed,}) {
  return _then(_self.copyWith(
page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,sortOrder: freezed == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as String?,sortBy: freezed == sortBy ? _self.sortBy : sortBy // ignore: cast_nullable_to_non_nullable
as String?,workScopeUID: freezed == workScopeUID ? _self.workScopeUID : workScopeUID // ignore: cast_nullable_to_non_nullable
as String?,calculationType: freezed == calculationType ? _self.calculationType : calculationType // ignore: cast_nullable_to_non_nullable
as String?,isActive: freezed == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool?,expand: freezed == expand ? _self.expand : expand // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}

}


/// Adds pattern-matching-related methods to [ProgramSettingsFilterModel].
extension ProgramSettingsFilterModelPatterns on ProgramSettingsFilterModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProgramSettingsFilterModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProgramSettingsFilterModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProgramSettingsFilterModel value)  $default,){
final _that = this;
switch (_that) {
case _ProgramSettingsFilterModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProgramSettingsFilterModel value)?  $default,){
final _that = this;
switch (_that) {
case _ProgramSettingsFilterModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int page,  int limit, @JsonKey(includeIfNull: false)  String? sortOrder, @JsonKey(includeIfNull: false)  String? sortBy, @JsonKey(includeIfNull: false)  String? workScopeUID, @JsonKey(includeIfNull: false)  String? calculationType, @JsonKey(includeIfNull: false)  bool? isActive, @JsonKey(includeIfNull: false)  List<String>? expand)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProgramSettingsFilterModel() when $default != null:
return $default(_that.page,_that.limit,_that.sortOrder,_that.sortBy,_that.workScopeUID,_that.calculationType,_that.isActive,_that.expand);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int page,  int limit, @JsonKey(includeIfNull: false)  String? sortOrder, @JsonKey(includeIfNull: false)  String? sortBy, @JsonKey(includeIfNull: false)  String? workScopeUID, @JsonKey(includeIfNull: false)  String? calculationType, @JsonKey(includeIfNull: false)  bool? isActive, @JsonKey(includeIfNull: false)  List<String>? expand)  $default,) {final _that = this;
switch (_that) {
case _ProgramSettingsFilterModel():
return $default(_that.page,_that.limit,_that.sortOrder,_that.sortBy,_that.workScopeUID,_that.calculationType,_that.isActive,_that.expand);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int page,  int limit, @JsonKey(includeIfNull: false)  String? sortOrder, @JsonKey(includeIfNull: false)  String? sortBy, @JsonKey(includeIfNull: false)  String? workScopeUID, @JsonKey(includeIfNull: false)  String? calculationType, @JsonKey(includeIfNull: false)  bool? isActive, @JsonKey(includeIfNull: false)  List<String>? expand)?  $default,) {final _that = this;
switch (_that) {
case _ProgramSettingsFilterModel() when $default != null:
return $default(_that.page,_that.limit,_that.sortOrder,_that.sortBy,_that.workScopeUID,_that.calculationType,_that.isActive,_that.expand);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProgramSettingsFilterModel implements ProgramSettingsFilterModel {
  const _ProgramSettingsFilterModel({this.page = 1, this.limit = 10, @JsonKey(includeIfNull: false) this.sortOrder, @JsonKey(includeIfNull: false) this.sortBy, @JsonKey(includeIfNull: false) this.workScopeUID, @JsonKey(includeIfNull: false) this.calculationType, @JsonKey(includeIfNull: false) this.isActive, @JsonKey(includeIfNull: false) final  List<String>? expand}): _expand = expand;
  factory _ProgramSettingsFilterModel.fromJson(Map<String, dynamic> json) => _$ProgramSettingsFilterModelFromJson(json);

/// Page number for pagination
@override@JsonKey() final  int page;
/// Number of items per page
@override@JsonKey() final  int limit;
/// Filter by report status
@override@JsonKey(includeIfNull: false) final  String? sortOrder;
/// Filter by work scope UID
@override@JsonKey(includeIfNull: false) final  String? sortBy;
/// Filter by road UID
@override@JsonKey(includeIfNull: false) final  String? workScopeUID;
/// Filter by created by admin ID
@override@JsonKey(includeIfNull: false) final  String? calculationType;
/// Filter by date range - start date
@override@JsonKey(includeIfNull: false) final  bool? isActive;
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


/// Create a copy of ProgramSettingsFilterModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProgramSettingsFilterModelCopyWith<_ProgramSettingsFilterModel> get copyWith => __$ProgramSettingsFilterModelCopyWithImpl<_ProgramSettingsFilterModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProgramSettingsFilterModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProgramSettingsFilterModel&&(identical(other.page, page) || other.page == page)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder)&&(identical(other.sortBy, sortBy) || other.sortBy == sortBy)&&(identical(other.workScopeUID, workScopeUID) || other.workScopeUID == workScopeUID)&&(identical(other.calculationType, calculationType) || other.calculationType == calculationType)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&const DeepCollectionEquality().equals(other._expand, _expand));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,page,limit,sortOrder,sortBy,workScopeUID,calculationType,isActive,const DeepCollectionEquality().hash(_expand));

@override
String toString() {
  return 'ProgramSettingsFilterModel(page: $page, limit: $limit, sortOrder: $sortOrder, sortBy: $sortBy, workScopeUID: $workScopeUID, calculationType: $calculationType, isActive: $isActive, expand: $expand)';
}


}

/// @nodoc
abstract mixin class _$ProgramSettingsFilterModelCopyWith<$Res> implements $ProgramSettingsFilterModelCopyWith<$Res> {
  factory _$ProgramSettingsFilterModelCopyWith(_ProgramSettingsFilterModel value, $Res Function(_ProgramSettingsFilterModel) _then) = __$ProgramSettingsFilterModelCopyWithImpl;
@override @useResult
$Res call({
 int page, int limit,@JsonKey(includeIfNull: false) String? sortOrder,@JsonKey(includeIfNull: false) String? sortBy,@JsonKey(includeIfNull: false) String? workScopeUID,@JsonKey(includeIfNull: false) String? calculationType,@JsonKey(includeIfNull: false) bool? isActive,@JsonKey(includeIfNull: false) List<String>? expand
});




}
/// @nodoc
class __$ProgramSettingsFilterModelCopyWithImpl<$Res>
    implements _$ProgramSettingsFilterModelCopyWith<$Res> {
  __$ProgramSettingsFilterModelCopyWithImpl(this._self, this._then);

  final _ProgramSettingsFilterModel _self;
  final $Res Function(_ProgramSettingsFilterModel) _then;

/// Create a copy of ProgramSettingsFilterModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? page = null,Object? limit = null,Object? sortOrder = freezed,Object? sortBy = freezed,Object? workScopeUID = freezed,Object? calculationType = freezed,Object? isActive = freezed,Object? expand = freezed,}) {
  return _then(_ProgramSettingsFilterModel(
page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,sortOrder: freezed == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as String?,sortBy: freezed == sortBy ? _self.sortBy : sortBy // ignore: cast_nullable_to_non_nullable
as String?,workScopeUID: freezed == workScopeUID ? _self.workScopeUID : workScopeUID // ignore: cast_nullable_to_non_nullable
as String?,calculationType: freezed == calculationType ? _self.calculationType : calculationType // ignore: cast_nullable_to_non_nullable
as String?,isActive: freezed == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool?,expand: freezed == expand ? _self._expand : expand // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}


}

// dart format on
