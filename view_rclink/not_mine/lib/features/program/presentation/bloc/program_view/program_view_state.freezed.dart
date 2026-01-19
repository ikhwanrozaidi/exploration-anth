// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'program_view_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProgramViewState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProgramViewState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProgramViewState()';
}


}

/// @nodoc
class $ProgramViewStateCopyWith<$Res>  {
$ProgramViewStateCopyWith(ProgramViewState _, $Res Function(ProgramViewState) __);
}


/// Adds pattern-matching-related methods to [ProgramViewState].
extension ProgramViewStatePatterns on ProgramViewState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ProgramViewInitial value)?  initial,TResult Function( ProgramViewLoading value)?  loading,TResult Function( ProgramViewLoaded value)?  loaded,TResult Function( ProgramViewFailure value)?  failure,TResult Function( ProgramViewDetailLoading value)?  detailLoading,TResult Function( ProgramViewDetailLoaded value)?  detailLoaded,TResult Function( ProgramViewDetailFailure value)?  detailFailure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ProgramViewInitial() when initial != null:
return initial(_that);case ProgramViewLoading() when loading != null:
return loading(_that);case ProgramViewLoaded() when loaded != null:
return loaded(_that);case ProgramViewFailure() when failure != null:
return failure(_that);case ProgramViewDetailLoading() when detailLoading != null:
return detailLoading(_that);case ProgramViewDetailLoaded() when detailLoaded != null:
return detailLoaded(_that);case ProgramViewDetailFailure() when detailFailure != null:
return detailFailure(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ProgramViewInitial value)  initial,required TResult Function( ProgramViewLoading value)  loading,required TResult Function( ProgramViewLoaded value)  loaded,required TResult Function( ProgramViewFailure value)  failure,required TResult Function( ProgramViewDetailLoading value)  detailLoading,required TResult Function( ProgramViewDetailLoaded value)  detailLoaded,required TResult Function( ProgramViewDetailFailure value)  detailFailure,}){
final _that = this;
switch (_that) {
case ProgramViewInitial():
return initial(_that);case ProgramViewLoading():
return loading(_that);case ProgramViewLoaded():
return loaded(_that);case ProgramViewFailure():
return failure(_that);case ProgramViewDetailLoading():
return detailLoading(_that);case ProgramViewDetailLoaded():
return detailLoaded(_that);case ProgramViewDetailFailure():
return detailFailure(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ProgramViewInitial value)?  initial,TResult? Function( ProgramViewLoading value)?  loading,TResult? Function( ProgramViewLoaded value)?  loaded,TResult? Function( ProgramViewFailure value)?  failure,TResult? Function( ProgramViewDetailLoading value)?  detailLoading,TResult? Function( ProgramViewDetailLoaded value)?  detailLoaded,TResult? Function( ProgramViewDetailFailure value)?  detailFailure,}){
final _that = this;
switch (_that) {
case ProgramViewInitial() when initial != null:
return initial(_that);case ProgramViewLoading() when loading != null:
return loading(_that);case ProgramViewLoaded() when loaded != null:
return loaded(_that);case ProgramViewFailure() when failure != null:
return failure(_that);case ProgramViewDetailLoading() when detailLoading != null:
return detailLoading(_that);case ProgramViewDetailLoaded() when detailLoaded != null:
return detailLoaded(_that);case ProgramViewDetailFailure() when detailFailure != null:
return detailFailure(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<Program> programs,  int currentPage,  bool hasMore,  bool isLoadingMore)?  loaded,TResult Function( String message)?  failure,TResult Function()?  detailLoading,TResult Function( Program program)?  detailLoaded,TResult Function( String message)?  detailFailure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ProgramViewInitial() when initial != null:
return initial();case ProgramViewLoading() when loading != null:
return loading();case ProgramViewLoaded() when loaded != null:
return loaded(_that.programs,_that.currentPage,_that.hasMore,_that.isLoadingMore);case ProgramViewFailure() when failure != null:
return failure(_that.message);case ProgramViewDetailLoading() when detailLoading != null:
return detailLoading();case ProgramViewDetailLoaded() when detailLoaded != null:
return detailLoaded(_that.program);case ProgramViewDetailFailure() when detailFailure != null:
return detailFailure(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<Program> programs,  int currentPage,  bool hasMore,  bool isLoadingMore)  loaded,required TResult Function( String message)  failure,required TResult Function()  detailLoading,required TResult Function( Program program)  detailLoaded,required TResult Function( String message)  detailFailure,}) {final _that = this;
switch (_that) {
case ProgramViewInitial():
return initial();case ProgramViewLoading():
return loading();case ProgramViewLoaded():
return loaded(_that.programs,_that.currentPage,_that.hasMore,_that.isLoadingMore);case ProgramViewFailure():
return failure(_that.message);case ProgramViewDetailLoading():
return detailLoading();case ProgramViewDetailLoaded():
return detailLoaded(_that.program);case ProgramViewDetailFailure():
return detailFailure(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<Program> programs,  int currentPage,  bool hasMore,  bool isLoadingMore)?  loaded,TResult? Function( String message)?  failure,TResult? Function()?  detailLoading,TResult? Function( Program program)?  detailLoaded,TResult? Function( String message)?  detailFailure,}) {final _that = this;
switch (_that) {
case ProgramViewInitial() when initial != null:
return initial();case ProgramViewLoading() when loading != null:
return loading();case ProgramViewLoaded() when loaded != null:
return loaded(_that.programs,_that.currentPage,_that.hasMore,_that.isLoadingMore);case ProgramViewFailure() when failure != null:
return failure(_that.message);case ProgramViewDetailLoading() when detailLoading != null:
return detailLoading();case ProgramViewDetailLoaded() when detailLoaded != null:
return detailLoaded(_that.program);case ProgramViewDetailFailure() when detailFailure != null:
return detailFailure(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class ProgramViewInitial implements ProgramViewState {
  const ProgramViewInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProgramViewInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProgramViewState.initial()';
}


}




/// @nodoc


class ProgramViewLoading implements ProgramViewState {
  const ProgramViewLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProgramViewLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProgramViewState.loading()';
}


}




/// @nodoc


class ProgramViewLoaded implements ProgramViewState {
  const ProgramViewLoaded({required final  List<Program> programs, this.currentPage = 1, this.hasMore = true, this.isLoadingMore = false}): _programs = programs;
  

 final  List<Program> _programs;
 List<Program> get programs {
  if (_programs is EqualUnmodifiableListView) return _programs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_programs);
}

@JsonKey() final  int currentPage;
@JsonKey() final  bool hasMore;
@JsonKey() final  bool isLoadingMore;

/// Create a copy of ProgramViewState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProgramViewLoadedCopyWith<ProgramViewLoaded> get copyWith => _$ProgramViewLoadedCopyWithImpl<ProgramViewLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProgramViewLoaded&&const DeepCollectionEquality().equals(other._programs, _programs)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_programs),currentPage,hasMore,isLoadingMore);

@override
String toString() {
  return 'ProgramViewState.loaded(programs: $programs, currentPage: $currentPage, hasMore: $hasMore, isLoadingMore: $isLoadingMore)';
}


}

/// @nodoc
abstract mixin class $ProgramViewLoadedCopyWith<$Res> implements $ProgramViewStateCopyWith<$Res> {
  factory $ProgramViewLoadedCopyWith(ProgramViewLoaded value, $Res Function(ProgramViewLoaded) _then) = _$ProgramViewLoadedCopyWithImpl;
@useResult
$Res call({
 List<Program> programs, int currentPage, bool hasMore, bool isLoadingMore
});




}
/// @nodoc
class _$ProgramViewLoadedCopyWithImpl<$Res>
    implements $ProgramViewLoadedCopyWith<$Res> {
  _$ProgramViewLoadedCopyWithImpl(this._self, this._then);

  final ProgramViewLoaded _self;
  final $Res Function(ProgramViewLoaded) _then;

/// Create a copy of ProgramViewState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? programs = null,Object? currentPage = null,Object? hasMore = null,Object? isLoadingMore = null,}) {
  return _then(ProgramViewLoaded(
programs: null == programs ? _self._programs : programs // ignore: cast_nullable_to_non_nullable
as List<Program>,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class ProgramViewFailure implements ProgramViewState {
  const ProgramViewFailure(this.message);
  

 final  String message;

/// Create a copy of ProgramViewState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProgramViewFailureCopyWith<ProgramViewFailure> get copyWith => _$ProgramViewFailureCopyWithImpl<ProgramViewFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProgramViewFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ProgramViewState.failure(message: $message)';
}


}

/// @nodoc
abstract mixin class $ProgramViewFailureCopyWith<$Res> implements $ProgramViewStateCopyWith<$Res> {
  factory $ProgramViewFailureCopyWith(ProgramViewFailure value, $Res Function(ProgramViewFailure) _then) = _$ProgramViewFailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ProgramViewFailureCopyWithImpl<$Res>
    implements $ProgramViewFailureCopyWith<$Res> {
  _$ProgramViewFailureCopyWithImpl(this._self, this._then);

  final ProgramViewFailure _self;
  final $Res Function(ProgramViewFailure) _then;

/// Create a copy of ProgramViewState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ProgramViewFailure(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ProgramViewDetailLoading implements ProgramViewState {
  const ProgramViewDetailLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProgramViewDetailLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProgramViewState.detailLoading()';
}


}




/// @nodoc


class ProgramViewDetailLoaded implements ProgramViewState {
  const ProgramViewDetailLoaded({required this.program});
  

 final  Program program;

/// Create a copy of ProgramViewState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProgramViewDetailLoadedCopyWith<ProgramViewDetailLoaded> get copyWith => _$ProgramViewDetailLoadedCopyWithImpl<ProgramViewDetailLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProgramViewDetailLoaded&&(identical(other.program, program) || other.program == program));
}


@override
int get hashCode => Object.hash(runtimeType,program);

@override
String toString() {
  return 'ProgramViewState.detailLoaded(program: $program)';
}


}

/// @nodoc
abstract mixin class $ProgramViewDetailLoadedCopyWith<$Res> implements $ProgramViewStateCopyWith<$Res> {
  factory $ProgramViewDetailLoadedCopyWith(ProgramViewDetailLoaded value, $Res Function(ProgramViewDetailLoaded) _then) = _$ProgramViewDetailLoadedCopyWithImpl;
@useResult
$Res call({
 Program program
});




}
/// @nodoc
class _$ProgramViewDetailLoadedCopyWithImpl<$Res>
    implements $ProgramViewDetailLoadedCopyWith<$Res> {
  _$ProgramViewDetailLoadedCopyWithImpl(this._self, this._then);

  final ProgramViewDetailLoaded _self;
  final $Res Function(ProgramViewDetailLoaded) _then;

/// Create a copy of ProgramViewState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? program = null,}) {
  return _then(ProgramViewDetailLoaded(
program: null == program ? _self.program : program // ignore: cast_nullable_to_non_nullable
as Program,
  ));
}


}

/// @nodoc


class ProgramViewDetailFailure implements ProgramViewState {
  const ProgramViewDetailFailure(this.message);
  

 final  String message;

/// Create a copy of ProgramViewState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProgramViewDetailFailureCopyWith<ProgramViewDetailFailure> get copyWith => _$ProgramViewDetailFailureCopyWithImpl<ProgramViewDetailFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProgramViewDetailFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ProgramViewState.detailFailure(message: $message)';
}


}

/// @nodoc
abstract mixin class $ProgramViewDetailFailureCopyWith<$Res> implements $ProgramViewStateCopyWith<$Res> {
  factory $ProgramViewDetailFailureCopyWith(ProgramViewDetailFailure value, $Res Function(ProgramViewDetailFailure) _then) = _$ProgramViewDetailFailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ProgramViewDetailFailureCopyWithImpl<$Res>
    implements $ProgramViewDetailFailureCopyWith<$Res> {
  _$ProgramViewDetailFailureCopyWithImpl(this._self, this._then);

  final ProgramViewDetailFailure _self;
  final $Res Function(ProgramViewDetailFailure) _then;

/// Create a copy of ProgramViewState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ProgramViewDetailFailure(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
