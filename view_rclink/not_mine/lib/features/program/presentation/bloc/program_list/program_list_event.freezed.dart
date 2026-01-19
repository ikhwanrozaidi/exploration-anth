// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'program_list_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProgramListEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProgramListEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProgramListEvent()';
}


}

/// @nodoc
class $ProgramListEventCopyWith<$Res>  {
$ProgramListEventCopyWith(ProgramListEvent _, $Res Function(ProgramListEvent) __);
}


/// Adds pattern-matching-related methods to [ProgramListEvent].
extension ProgramListEventPatterns on ProgramListEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoadPrograms value)?  loadPrograms,TResult Function( LoadMorePrograms value)?  loadMorePrograms,TResult Function( RefreshPrograms value)?  refreshPrograms,TResult Function( ClearProgramCache value)?  clearCache,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoadPrograms() when loadPrograms != null:
return loadPrograms(_that);case LoadMorePrograms() when loadMorePrograms != null:
return loadMorePrograms(_that);case RefreshPrograms() when refreshPrograms != null:
return refreshPrograms(_that);case ClearProgramCache() when clearCache != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoadPrograms value)  loadPrograms,required TResult Function( LoadMorePrograms value)  loadMorePrograms,required TResult Function( RefreshPrograms value)  refreshPrograms,required TResult Function( ClearProgramCache value)  clearCache,}){
final _that = this;
switch (_that) {
case LoadPrograms():
return loadPrograms(_that);case LoadMorePrograms():
return loadMorePrograms(_that);case RefreshPrograms():
return refreshPrograms(_that);case ClearProgramCache():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoadPrograms value)?  loadPrograms,TResult? Function( LoadMorePrograms value)?  loadMorePrograms,TResult? Function( RefreshPrograms value)?  refreshPrograms,TResult? Function( ClearProgramCache value)?  clearCache,}){
final _that = this;
switch (_that) {
case LoadPrograms() when loadPrograms != null:
return loadPrograms(_that);case LoadMorePrograms() when loadMorePrograms != null:
return loadMorePrograms(_that);case RefreshPrograms() when refreshPrograms != null:
return refreshPrograms(_that);case ClearProgramCache() when clearCache != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String companyUID,  int page,  int limit,  bool forceRefresh)?  loadPrograms,TResult Function( String companyUID)?  loadMorePrograms,TResult Function( String companyUID)?  refreshPrograms,TResult Function()?  clearCache,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LoadPrograms() when loadPrograms != null:
return loadPrograms(_that.companyUID,_that.page,_that.limit,_that.forceRefresh);case LoadMorePrograms() when loadMorePrograms != null:
return loadMorePrograms(_that.companyUID);case RefreshPrograms() when refreshPrograms != null:
return refreshPrograms(_that.companyUID);case ClearProgramCache() when clearCache != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String companyUID,  int page,  int limit,  bool forceRefresh)  loadPrograms,required TResult Function( String companyUID)  loadMorePrograms,required TResult Function( String companyUID)  refreshPrograms,required TResult Function()  clearCache,}) {final _that = this;
switch (_that) {
case LoadPrograms():
return loadPrograms(_that.companyUID,_that.page,_that.limit,_that.forceRefresh);case LoadMorePrograms():
return loadMorePrograms(_that.companyUID);case RefreshPrograms():
return refreshPrograms(_that.companyUID);case ClearProgramCache():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String companyUID,  int page,  int limit,  bool forceRefresh)?  loadPrograms,TResult? Function( String companyUID)?  loadMorePrograms,TResult? Function( String companyUID)?  refreshPrograms,TResult? Function()?  clearCache,}) {final _that = this;
switch (_that) {
case LoadPrograms() when loadPrograms != null:
return loadPrograms(_that.companyUID,_that.page,_that.limit,_that.forceRefresh);case LoadMorePrograms() when loadMorePrograms != null:
return loadMorePrograms(_that.companyUID);case RefreshPrograms() when refreshPrograms != null:
return refreshPrograms(_that.companyUID);case ClearProgramCache() when clearCache != null:
return clearCache();case _:
  return null;

}
}

}

/// @nodoc


class LoadPrograms implements ProgramListEvent {
  const LoadPrograms({required this.companyUID, this.page = 1, this.limit = 10, this.forceRefresh = false});
  

 final  String companyUID;
@JsonKey() final  int page;
@JsonKey() final  int limit;
@JsonKey() final  bool forceRefresh;

/// Create a copy of ProgramListEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadProgramsCopyWith<LoadPrograms> get copyWith => _$LoadProgramsCopyWithImpl<LoadPrograms>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadPrograms&&(identical(other.companyUID, companyUID) || other.companyUID == companyUID)&&(identical(other.page, page) || other.page == page)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.forceRefresh, forceRefresh) || other.forceRefresh == forceRefresh));
}


@override
int get hashCode => Object.hash(runtimeType,companyUID,page,limit,forceRefresh);

@override
String toString() {
  return 'ProgramListEvent.loadPrograms(companyUID: $companyUID, page: $page, limit: $limit, forceRefresh: $forceRefresh)';
}


}

/// @nodoc
abstract mixin class $LoadProgramsCopyWith<$Res> implements $ProgramListEventCopyWith<$Res> {
  factory $LoadProgramsCopyWith(LoadPrograms value, $Res Function(LoadPrograms) _then) = _$LoadProgramsCopyWithImpl;
@useResult
$Res call({
 String companyUID, int page, int limit, bool forceRefresh
});




}
/// @nodoc
class _$LoadProgramsCopyWithImpl<$Res>
    implements $LoadProgramsCopyWith<$Res> {
  _$LoadProgramsCopyWithImpl(this._self, this._then);

  final LoadPrograms _self;
  final $Res Function(LoadPrograms) _then;

/// Create a copy of ProgramListEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? companyUID = null,Object? page = null,Object? limit = null,Object? forceRefresh = null,}) {
  return _then(LoadPrograms(
companyUID: null == companyUID ? _self.companyUID : companyUID // ignore: cast_nullable_to_non_nullable
as String,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,forceRefresh: null == forceRefresh ? _self.forceRefresh : forceRefresh // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class LoadMorePrograms implements ProgramListEvent {
  const LoadMorePrograms({required this.companyUID});
  

 final  String companyUID;

/// Create a copy of ProgramListEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadMoreProgramsCopyWith<LoadMorePrograms> get copyWith => _$LoadMoreProgramsCopyWithImpl<LoadMorePrograms>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadMorePrograms&&(identical(other.companyUID, companyUID) || other.companyUID == companyUID));
}


@override
int get hashCode => Object.hash(runtimeType,companyUID);

@override
String toString() {
  return 'ProgramListEvent.loadMorePrograms(companyUID: $companyUID)';
}


}

/// @nodoc
abstract mixin class $LoadMoreProgramsCopyWith<$Res> implements $ProgramListEventCopyWith<$Res> {
  factory $LoadMoreProgramsCopyWith(LoadMorePrograms value, $Res Function(LoadMorePrograms) _then) = _$LoadMoreProgramsCopyWithImpl;
@useResult
$Res call({
 String companyUID
});




}
/// @nodoc
class _$LoadMoreProgramsCopyWithImpl<$Res>
    implements $LoadMoreProgramsCopyWith<$Res> {
  _$LoadMoreProgramsCopyWithImpl(this._self, this._then);

  final LoadMorePrograms _self;
  final $Res Function(LoadMorePrograms) _then;

/// Create a copy of ProgramListEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? companyUID = null,}) {
  return _then(LoadMorePrograms(
companyUID: null == companyUID ? _self.companyUID : companyUID // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class RefreshPrograms implements ProgramListEvent {
  const RefreshPrograms({required this.companyUID});
  

 final  String companyUID;

/// Create a copy of ProgramListEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RefreshProgramsCopyWith<RefreshPrograms> get copyWith => _$RefreshProgramsCopyWithImpl<RefreshPrograms>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RefreshPrograms&&(identical(other.companyUID, companyUID) || other.companyUID == companyUID));
}


@override
int get hashCode => Object.hash(runtimeType,companyUID);

@override
String toString() {
  return 'ProgramListEvent.refreshPrograms(companyUID: $companyUID)';
}


}

/// @nodoc
abstract mixin class $RefreshProgramsCopyWith<$Res> implements $ProgramListEventCopyWith<$Res> {
  factory $RefreshProgramsCopyWith(RefreshPrograms value, $Res Function(RefreshPrograms) _then) = _$RefreshProgramsCopyWithImpl;
@useResult
$Res call({
 String companyUID
});




}
/// @nodoc
class _$RefreshProgramsCopyWithImpl<$Res>
    implements $RefreshProgramsCopyWith<$Res> {
  _$RefreshProgramsCopyWithImpl(this._self, this._then);

  final RefreshPrograms _self;
  final $Res Function(RefreshPrograms) _then;

/// Create a copy of ProgramListEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? companyUID = null,}) {
  return _then(RefreshPrograms(
companyUID: null == companyUID ? _self.companyUID : companyUID // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ClearProgramCache implements ProgramListEvent {
  const ClearProgramCache();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClearProgramCache);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProgramListEvent.clearCache()';
}


}




// dart format on
