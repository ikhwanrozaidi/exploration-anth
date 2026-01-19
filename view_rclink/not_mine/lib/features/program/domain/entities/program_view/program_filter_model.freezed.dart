// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'program_filter_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProgramFilterModel {

 int get page; int get limit;@JsonKey(includeIfNull: false) String? get search;@JsonKey(includeIfNull: false) String? get status;@JsonKey(includeIfNull: false) String? get workScopeUID;@JsonKey(includeIfNull: false) String? get roadUID;@JsonKey(includeIfNull: false) String? get contractRelationUID;@JsonKey(includeIfNull: false) String? get fromDate;@JsonKey(includeIfNull: false) String? get toDate; List<String> get expand;
/// Create a copy of ProgramFilterModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProgramFilterModelCopyWith<ProgramFilterModel> get copyWith => _$ProgramFilterModelCopyWithImpl<ProgramFilterModel>(this as ProgramFilterModel, _$identity);

  /// Serializes this ProgramFilterModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProgramFilterModel&&(identical(other.page, page) || other.page == page)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.search, search) || other.search == search)&&(identical(other.status, status) || other.status == status)&&(identical(other.workScopeUID, workScopeUID) || other.workScopeUID == workScopeUID)&&(identical(other.roadUID, roadUID) || other.roadUID == roadUID)&&(identical(other.contractRelationUID, contractRelationUID) || other.contractRelationUID == contractRelationUID)&&(identical(other.fromDate, fromDate) || other.fromDate == fromDate)&&(identical(other.toDate, toDate) || other.toDate == toDate)&&const DeepCollectionEquality().equals(other.expand, expand));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,page,limit,search,status,workScopeUID,roadUID,contractRelationUID,fromDate,toDate,const DeepCollectionEquality().hash(expand));

@override
String toString() {
  return 'ProgramFilterModel(page: $page, limit: $limit, search: $search, status: $status, workScopeUID: $workScopeUID, roadUID: $roadUID, contractRelationUID: $contractRelationUID, fromDate: $fromDate, toDate: $toDate, expand: $expand)';
}


}

/// @nodoc
abstract mixin class $ProgramFilterModelCopyWith<$Res>  {
  factory $ProgramFilterModelCopyWith(ProgramFilterModel value, $Res Function(ProgramFilterModel) _then) = _$ProgramFilterModelCopyWithImpl;
@useResult
$Res call({
 int page, int limit,@JsonKey(includeIfNull: false) String? search,@JsonKey(includeIfNull: false) String? status,@JsonKey(includeIfNull: false) String? workScopeUID,@JsonKey(includeIfNull: false) String? roadUID,@JsonKey(includeIfNull: false) String? contractRelationUID,@JsonKey(includeIfNull: false) String? fromDate,@JsonKey(includeIfNull: false) String? toDate, List<String> expand
});




}
/// @nodoc
class _$ProgramFilterModelCopyWithImpl<$Res>
    implements $ProgramFilterModelCopyWith<$Res> {
  _$ProgramFilterModelCopyWithImpl(this._self, this._then);

  final ProgramFilterModel _self;
  final $Res Function(ProgramFilterModel) _then;

/// Create a copy of ProgramFilterModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? page = null,Object? limit = null,Object? search = freezed,Object? status = freezed,Object? workScopeUID = freezed,Object? roadUID = freezed,Object? contractRelationUID = freezed,Object? fromDate = freezed,Object? toDate = freezed,Object? expand = null,}) {
  return _then(_self.copyWith(
page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,search: freezed == search ? _self.search : search // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,workScopeUID: freezed == workScopeUID ? _self.workScopeUID : workScopeUID // ignore: cast_nullable_to_non_nullable
as String?,roadUID: freezed == roadUID ? _self.roadUID : roadUID // ignore: cast_nullable_to_non_nullable
as String?,contractRelationUID: freezed == contractRelationUID ? _self.contractRelationUID : contractRelationUID // ignore: cast_nullable_to_non_nullable
as String?,fromDate: freezed == fromDate ? _self.fromDate : fromDate // ignore: cast_nullable_to_non_nullable
as String?,toDate: freezed == toDate ? _self.toDate : toDate // ignore: cast_nullable_to_non_nullable
as String?,expand: null == expand ? _self.expand : expand // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [ProgramFilterModel].
extension ProgramFilterModelPatterns on ProgramFilterModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProgramFilterModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProgramFilterModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProgramFilterModel value)  $default,){
final _that = this;
switch (_that) {
case _ProgramFilterModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProgramFilterModel value)?  $default,){
final _that = this;
switch (_that) {
case _ProgramFilterModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int page,  int limit, @JsonKey(includeIfNull: false)  String? search, @JsonKey(includeIfNull: false)  String? status, @JsonKey(includeIfNull: false)  String? workScopeUID, @JsonKey(includeIfNull: false)  String? roadUID, @JsonKey(includeIfNull: false)  String? contractRelationUID, @JsonKey(includeIfNull: false)  String? fromDate, @JsonKey(includeIfNull: false)  String? toDate,  List<String> expand)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProgramFilterModel() when $default != null:
return $default(_that.page,_that.limit,_that.search,_that.status,_that.workScopeUID,_that.roadUID,_that.contractRelationUID,_that.fromDate,_that.toDate,_that.expand);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int page,  int limit, @JsonKey(includeIfNull: false)  String? search, @JsonKey(includeIfNull: false)  String? status, @JsonKey(includeIfNull: false)  String? workScopeUID, @JsonKey(includeIfNull: false)  String? roadUID, @JsonKey(includeIfNull: false)  String? contractRelationUID, @JsonKey(includeIfNull: false)  String? fromDate, @JsonKey(includeIfNull: false)  String? toDate,  List<String> expand)  $default,) {final _that = this;
switch (_that) {
case _ProgramFilterModel():
return $default(_that.page,_that.limit,_that.search,_that.status,_that.workScopeUID,_that.roadUID,_that.contractRelationUID,_that.fromDate,_that.toDate,_that.expand);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int page,  int limit, @JsonKey(includeIfNull: false)  String? search, @JsonKey(includeIfNull: false)  String? status, @JsonKey(includeIfNull: false)  String? workScopeUID, @JsonKey(includeIfNull: false)  String? roadUID, @JsonKey(includeIfNull: false)  String? contractRelationUID, @JsonKey(includeIfNull: false)  String? fromDate, @JsonKey(includeIfNull: false)  String? toDate,  List<String> expand)?  $default,) {final _that = this;
switch (_that) {
case _ProgramFilterModel() when $default != null:
return $default(_that.page,_that.limit,_that.search,_that.status,_that.workScopeUID,_that.roadUID,_that.contractRelationUID,_that.fromDate,_that.toDate,_that.expand);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProgramFilterModel implements ProgramFilterModel {
  const _ProgramFilterModel({this.page = 1, this.limit = 10, @JsonKey(includeIfNull: false) this.search, @JsonKey(includeIfNull: false) this.status, @JsonKey(includeIfNull: false) this.workScopeUID, @JsonKey(includeIfNull: false) this.roadUID, @JsonKey(includeIfNull: false) this.contractRelationUID, @JsonKey(includeIfNull: false) this.fromDate, @JsonKey(includeIfNull: false) this.toDate, final  List<String> expand = const []}): _expand = expand;
  factory _ProgramFilterModel.fromJson(Map<String, dynamic> json) => _$ProgramFilterModelFromJson(json);

@override@JsonKey() final  int page;
@override@JsonKey() final  int limit;
@override@JsonKey(includeIfNull: false) final  String? search;
@override@JsonKey(includeIfNull: false) final  String? status;
@override@JsonKey(includeIfNull: false) final  String? workScopeUID;
@override@JsonKey(includeIfNull: false) final  String? roadUID;
@override@JsonKey(includeIfNull: false) final  String? contractRelationUID;
@override@JsonKey(includeIfNull: false) final  String? fromDate;
@override@JsonKey(includeIfNull: false) final  String? toDate;
 final  List<String> _expand;
@override@JsonKey() List<String> get expand {
  if (_expand is EqualUnmodifiableListView) return _expand;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_expand);
}


/// Create a copy of ProgramFilterModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProgramFilterModelCopyWith<_ProgramFilterModel> get copyWith => __$ProgramFilterModelCopyWithImpl<_ProgramFilterModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProgramFilterModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProgramFilterModel&&(identical(other.page, page) || other.page == page)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.search, search) || other.search == search)&&(identical(other.status, status) || other.status == status)&&(identical(other.workScopeUID, workScopeUID) || other.workScopeUID == workScopeUID)&&(identical(other.roadUID, roadUID) || other.roadUID == roadUID)&&(identical(other.contractRelationUID, contractRelationUID) || other.contractRelationUID == contractRelationUID)&&(identical(other.fromDate, fromDate) || other.fromDate == fromDate)&&(identical(other.toDate, toDate) || other.toDate == toDate)&&const DeepCollectionEquality().equals(other._expand, _expand));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,page,limit,search,status,workScopeUID,roadUID,contractRelationUID,fromDate,toDate,const DeepCollectionEquality().hash(_expand));

@override
String toString() {
  return 'ProgramFilterModel(page: $page, limit: $limit, search: $search, status: $status, workScopeUID: $workScopeUID, roadUID: $roadUID, contractRelationUID: $contractRelationUID, fromDate: $fromDate, toDate: $toDate, expand: $expand)';
}


}

/// @nodoc
abstract mixin class _$ProgramFilterModelCopyWith<$Res> implements $ProgramFilterModelCopyWith<$Res> {
  factory _$ProgramFilterModelCopyWith(_ProgramFilterModel value, $Res Function(_ProgramFilterModel) _then) = __$ProgramFilterModelCopyWithImpl;
@override @useResult
$Res call({
 int page, int limit,@JsonKey(includeIfNull: false) String? search,@JsonKey(includeIfNull: false) String? status,@JsonKey(includeIfNull: false) String? workScopeUID,@JsonKey(includeIfNull: false) String? roadUID,@JsonKey(includeIfNull: false) String? contractRelationUID,@JsonKey(includeIfNull: false) String? fromDate,@JsonKey(includeIfNull: false) String? toDate, List<String> expand
});




}
/// @nodoc
class __$ProgramFilterModelCopyWithImpl<$Res>
    implements _$ProgramFilterModelCopyWith<$Res> {
  __$ProgramFilterModelCopyWithImpl(this._self, this._then);

  final _ProgramFilterModel _self;
  final $Res Function(_ProgramFilterModel) _then;

/// Create a copy of ProgramFilterModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? page = null,Object? limit = null,Object? search = freezed,Object? status = freezed,Object? workScopeUID = freezed,Object? roadUID = freezed,Object? contractRelationUID = freezed,Object? fromDate = freezed,Object? toDate = freezed,Object? expand = null,}) {
  return _then(_ProgramFilterModel(
page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,search: freezed == search ? _self.search : search // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,workScopeUID: freezed == workScopeUID ? _self.workScopeUID : workScopeUID // ignore: cast_nullable_to_non_nullable
as String?,roadUID: freezed == roadUID ? _self.roadUID : roadUID // ignore: cast_nullable_to_non_nullable
as String?,contractRelationUID: freezed == contractRelationUID ? _self.contractRelationUID : contractRelationUID // ignore: cast_nullable_to_non_nullable
as String?,fromDate: freezed == fromDate ? _self.fromDate : fromDate // ignore: cast_nullable_to_non_nullable
as String?,toDate: freezed == toDate ? _self.toDate : toDate // ignore: cast_nullable_to_non_nullable
as String?,expand: null == expand ? _self._expand : expand // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
