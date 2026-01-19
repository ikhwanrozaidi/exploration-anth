// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'program_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProgramListState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProgramListState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProgramListState()';
}


}

/// @nodoc
class $ProgramListStateCopyWith<$Res>  {
$ProgramListStateCopyWith(ProgramListState _, $Res Function(ProgramListState) __);
}


/// Adds pattern-matching-related methods to [ProgramListState].
extension ProgramListStatePatterns on ProgramListState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ProgramListInitial value)?  initial,TResult Function( ProgramListLoading value)?  loading,TResult Function( ProgramListLoaded value)?  loaded,TResult Function( ProgramListFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ProgramListInitial() when initial != null:
return initial(_that);case ProgramListLoading() when loading != null:
return loading(_that);case ProgramListLoaded() when loaded != null:
return loaded(_that);case ProgramListFailure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ProgramListInitial value)  initial,required TResult Function( ProgramListLoading value)  loading,required TResult Function( ProgramListLoaded value)  loaded,required TResult Function( ProgramListFailure value)  failure,}){
final _that = this;
switch (_that) {
case ProgramListInitial():
return initial(_that);case ProgramListLoading():
return loading(_that);case ProgramListLoaded():
return loaded(_that);case ProgramListFailure():
return failure(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ProgramListInitial value)?  initial,TResult? Function( ProgramListLoading value)?  loading,TResult? Function( ProgramListLoaded value)?  loaded,TResult? Function( ProgramListFailure value)?  failure,}){
final _that = this;
switch (_that) {
case ProgramListInitial() when initial != null:
return initial(_that);case ProgramListLoading() when loading != null:
return loading(_that);case ProgramListLoaded() when loaded != null:
return loaded(_that);case ProgramListFailure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<Program> programs,  int currentPage,  bool hasMore,  bool isLoadingMore)?  loaded,TResult Function( String message)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ProgramListInitial() when initial != null:
return initial();case ProgramListLoading() when loading != null:
return loading();case ProgramListLoaded() when loaded != null:
return loaded(_that.programs,_that.currentPage,_that.hasMore,_that.isLoadingMore);case ProgramListFailure() when failure != null:
return failure(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<Program> programs,  int currentPage,  bool hasMore,  bool isLoadingMore)  loaded,required TResult Function( String message)  failure,}) {final _that = this;
switch (_that) {
case ProgramListInitial():
return initial();case ProgramListLoading():
return loading();case ProgramListLoaded():
return loaded(_that.programs,_that.currentPage,_that.hasMore,_that.isLoadingMore);case ProgramListFailure():
return failure(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<Program> programs,  int currentPage,  bool hasMore,  bool isLoadingMore)?  loaded,TResult? Function( String message)?  failure,}) {final _that = this;
switch (_that) {
case ProgramListInitial() when initial != null:
return initial();case ProgramListLoading() when loading != null:
return loading();case ProgramListLoaded() when loaded != null:
return loaded(_that.programs,_that.currentPage,_that.hasMore,_that.isLoadingMore);case ProgramListFailure() when failure != null:
return failure(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class ProgramListInitial implements ProgramListState {
  const ProgramListInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProgramListInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProgramListState.initial()';
}


}




/// @nodoc


class ProgramListLoading implements ProgramListState {
  const ProgramListLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProgramListLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProgramListState.loading()';
}


}




/// @nodoc


class ProgramListLoaded implements ProgramListState {
  const ProgramListLoaded({required final  List<Program> programs, this.currentPage = 1, this.hasMore = true, this.isLoadingMore = false}): _programs = programs;
  

 final  List<Program> _programs;
 List<Program> get programs {
  if (_programs is EqualUnmodifiableListView) return _programs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_programs);
}

@JsonKey() final  int currentPage;
@JsonKey() final  bool hasMore;
@JsonKey() final  bool isLoadingMore;

/// Create a copy of ProgramListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProgramListLoadedCopyWith<ProgramListLoaded> get copyWith => _$ProgramListLoadedCopyWithImpl<ProgramListLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProgramListLoaded&&const DeepCollectionEquality().equals(other._programs, _programs)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_programs),currentPage,hasMore,isLoadingMore);

@override
String toString() {
  return 'ProgramListState.loaded(programs: $programs, currentPage: $currentPage, hasMore: $hasMore, isLoadingMore: $isLoadingMore)';
}


}

/// @nodoc
abstract mixin class $ProgramListLoadedCopyWith<$Res> implements $ProgramListStateCopyWith<$Res> {
  factory $ProgramListLoadedCopyWith(ProgramListLoaded value, $Res Function(ProgramListLoaded) _then) = _$ProgramListLoadedCopyWithImpl;
@useResult
$Res call({
 List<Program> programs, int currentPage, bool hasMore, bool isLoadingMore
});




}
/// @nodoc
class _$ProgramListLoadedCopyWithImpl<$Res>
    implements $ProgramListLoadedCopyWith<$Res> {
  _$ProgramListLoadedCopyWithImpl(this._self, this._then);

  final ProgramListLoaded _self;
  final $Res Function(ProgramListLoaded) _then;

/// Create a copy of ProgramListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? programs = null,Object? currentPage = null,Object? hasMore = null,Object? isLoadingMore = null,}) {
  return _then(ProgramListLoaded(
programs: null == programs ? _self._programs : programs // ignore: cast_nullable_to_non_nullable
as List<Program>,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class ProgramListFailure implements ProgramListState {
  const ProgramListFailure(this.message);
  

 final  String message;

/// Create a copy of ProgramListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProgramListFailureCopyWith<ProgramListFailure> get copyWith => _$ProgramListFailureCopyWithImpl<ProgramListFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProgramListFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ProgramListState.failure(message: $message)';
}


}

/// @nodoc
abstract mixin class $ProgramListFailureCopyWith<$Res> implements $ProgramListStateCopyWith<$Res> {
  factory $ProgramListFailureCopyWith(ProgramListFailure value, $Res Function(ProgramListFailure) _then) = _$ProgramListFailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ProgramListFailureCopyWithImpl<$Res>
    implements $ProgramListFailureCopyWith<$Res> {
  _$ProgramListFailureCopyWithImpl(this._self, this._then);

  final ProgramListFailure _self;
  final $Res Function(ProgramListFailure) _then;

/// Create a copy of ProgramListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ProgramListFailure(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
