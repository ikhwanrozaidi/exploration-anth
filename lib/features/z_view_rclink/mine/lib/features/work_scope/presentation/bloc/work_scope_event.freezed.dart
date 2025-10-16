// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'work_scope_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WorkScopeEvent {

 String? get search; String? get code; bool? get allowMultipleQuantities; List<String>? get expand; bool get forceRefresh; Duration? get cacheTimeout;
/// Create a copy of WorkScopeEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WorkScopeEventCopyWith<WorkScopeEvent> get copyWith => _$WorkScopeEventCopyWithImpl<WorkScopeEvent>(this as WorkScopeEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WorkScopeEvent&&(identical(other.search, search) || other.search == search)&&(identical(other.code, code) || other.code == code)&&(identical(other.allowMultipleQuantities, allowMultipleQuantities) || other.allowMultipleQuantities == allowMultipleQuantities)&&const DeepCollectionEquality().equals(other.expand, expand)&&(identical(other.forceRefresh, forceRefresh) || other.forceRefresh == forceRefresh)&&(identical(other.cacheTimeout, cacheTimeout) || other.cacheTimeout == cacheTimeout));
}


@override
int get hashCode => Object.hash(runtimeType,search,code,allowMultipleQuantities,const DeepCollectionEquality().hash(expand),forceRefresh,cacheTimeout);

@override
String toString() {
  return 'WorkScopeEvent(search: $search, code: $code, allowMultipleQuantities: $allowMultipleQuantities, expand: $expand, forceRefresh: $forceRefresh, cacheTimeout: $cacheTimeout)';
}


}

/// @nodoc
abstract mixin class $WorkScopeEventCopyWith<$Res>  {
  factory $WorkScopeEventCopyWith(WorkScopeEvent value, $Res Function(WorkScopeEvent) _then) = _$WorkScopeEventCopyWithImpl;
@useResult
$Res call({
 String? search, String? code, bool? allowMultipleQuantities, List<String>? expand, bool forceRefresh, Duration? cacheTimeout
});




}
/// @nodoc
class _$WorkScopeEventCopyWithImpl<$Res>
    implements $WorkScopeEventCopyWith<$Res> {
  _$WorkScopeEventCopyWithImpl(this._self, this._then);

  final WorkScopeEvent _self;
  final $Res Function(WorkScopeEvent) _then;

/// Create a copy of WorkScopeEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? search = freezed,Object? code = freezed,Object? allowMultipleQuantities = freezed,Object? expand = freezed,Object? forceRefresh = null,Object? cacheTimeout = freezed,}) {
  return _then(_self.copyWith(
search: freezed == search ? _self.search : search // ignore: cast_nullable_to_non_nullable
as String?,code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String?,allowMultipleQuantities: freezed == allowMultipleQuantities ? _self.allowMultipleQuantities : allowMultipleQuantities // ignore: cast_nullable_to_non_nullable
as bool?,expand: freezed == expand ? _self.expand : expand // ignore: cast_nullable_to_non_nullable
as List<String>?,forceRefresh: null == forceRefresh ? _self.forceRefresh : forceRefresh // ignore: cast_nullable_to_non_nullable
as bool,cacheTimeout: freezed == cacheTimeout ? _self.cacheTimeout : cacheTimeout // ignore: cast_nullable_to_non_nullable
as Duration?,
  ));
}

}


/// Adds pattern-matching-related methods to [WorkScopeEvent].
extension WorkScopeEventPatterns on WorkScopeEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoadWorkScopes value)?  loadWorkScopes,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoadWorkScopes() when loadWorkScopes != null:
return loadWorkScopes(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoadWorkScopes value)  loadWorkScopes,}){
final _that = this;
switch (_that) {
case LoadWorkScopes():
return loadWorkScopes(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoadWorkScopes value)?  loadWorkScopes,}){
final _that = this;
switch (_that) {
case LoadWorkScopes() when loadWorkScopes != null:
return loadWorkScopes(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String? search,  String? code,  bool? allowMultipleQuantities,  List<String>? expand,  bool forceRefresh,  Duration? cacheTimeout)?  loadWorkScopes,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LoadWorkScopes() when loadWorkScopes != null:
return loadWorkScopes(_that.search,_that.code,_that.allowMultipleQuantities,_that.expand,_that.forceRefresh,_that.cacheTimeout);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String? search,  String? code,  bool? allowMultipleQuantities,  List<String>? expand,  bool forceRefresh,  Duration? cacheTimeout)  loadWorkScopes,}) {final _that = this;
switch (_that) {
case LoadWorkScopes():
return loadWorkScopes(_that.search,_that.code,_that.allowMultipleQuantities,_that.expand,_that.forceRefresh,_that.cacheTimeout);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String? search,  String? code,  bool? allowMultipleQuantities,  List<String>? expand,  bool forceRefresh,  Duration? cacheTimeout)?  loadWorkScopes,}) {final _that = this;
switch (_that) {
case LoadWorkScopes() when loadWorkScopes != null:
return loadWorkScopes(_that.search,_that.code,_that.allowMultipleQuantities,_that.expand,_that.forceRefresh,_that.cacheTimeout);case _:
  return null;

}
}

}

/// @nodoc


class LoadWorkScopes implements WorkScopeEvent {
  const LoadWorkScopes({this.search, this.code, this.allowMultipleQuantities, final  List<String>? expand, this.forceRefresh = false, this.cacheTimeout}): _expand = expand;
  

@override final  String? search;
@override final  String? code;
@override final  bool? allowMultipleQuantities;
 final  List<String>? _expand;
@override List<String>? get expand {
  final value = _expand;
  if (value == null) return null;
  if (_expand is EqualUnmodifiableListView) return _expand;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey() final  bool forceRefresh;
@override final  Duration? cacheTimeout;

/// Create a copy of WorkScopeEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadWorkScopesCopyWith<LoadWorkScopes> get copyWith => _$LoadWorkScopesCopyWithImpl<LoadWorkScopes>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadWorkScopes&&(identical(other.search, search) || other.search == search)&&(identical(other.code, code) || other.code == code)&&(identical(other.allowMultipleQuantities, allowMultipleQuantities) || other.allowMultipleQuantities == allowMultipleQuantities)&&const DeepCollectionEquality().equals(other._expand, _expand)&&(identical(other.forceRefresh, forceRefresh) || other.forceRefresh == forceRefresh)&&(identical(other.cacheTimeout, cacheTimeout) || other.cacheTimeout == cacheTimeout));
}


@override
int get hashCode => Object.hash(runtimeType,search,code,allowMultipleQuantities,const DeepCollectionEquality().hash(_expand),forceRefresh,cacheTimeout);

@override
String toString() {
  return 'WorkScopeEvent.loadWorkScopes(search: $search, code: $code, allowMultipleQuantities: $allowMultipleQuantities, expand: $expand, forceRefresh: $forceRefresh, cacheTimeout: $cacheTimeout)';
}


}

/// @nodoc
abstract mixin class $LoadWorkScopesCopyWith<$Res> implements $WorkScopeEventCopyWith<$Res> {
  factory $LoadWorkScopesCopyWith(LoadWorkScopes value, $Res Function(LoadWorkScopes) _then) = _$LoadWorkScopesCopyWithImpl;
@override @useResult
$Res call({
 String? search, String? code, bool? allowMultipleQuantities, List<String>? expand, bool forceRefresh, Duration? cacheTimeout
});




}
/// @nodoc
class _$LoadWorkScopesCopyWithImpl<$Res>
    implements $LoadWorkScopesCopyWith<$Res> {
  _$LoadWorkScopesCopyWithImpl(this._self, this._then);

  final LoadWorkScopes _self;
  final $Res Function(LoadWorkScopes) _then;

/// Create a copy of WorkScopeEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? search = freezed,Object? code = freezed,Object? allowMultipleQuantities = freezed,Object? expand = freezed,Object? forceRefresh = null,Object? cacheTimeout = freezed,}) {
  return _then(LoadWorkScopes(
search: freezed == search ? _self.search : search // ignore: cast_nullable_to_non_nullable
as String?,code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String?,allowMultipleQuantities: freezed == allowMultipleQuantities ? _self.allowMultipleQuantities : allowMultipleQuantities // ignore: cast_nullable_to_non_nullable
as bool?,expand: freezed == expand ? _self._expand : expand // ignore: cast_nullable_to_non_nullable
as List<String>?,forceRefresh: null == forceRefresh ? _self.forceRefresh : forceRefresh // ignore: cast_nullable_to_non_nullable
as bool,cacheTimeout: freezed == cacheTimeout ? _self.cacheTimeout : cacheTimeout // ignore: cast_nullable_to_non_nullable
as Duration?,
  ));
}


}

// dart format on
