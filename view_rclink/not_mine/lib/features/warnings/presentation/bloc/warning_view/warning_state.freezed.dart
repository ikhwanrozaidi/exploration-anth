// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'warning_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WarningState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WarningState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WarningState()';
}


}

/// @nodoc
class $WarningStateCopyWith<$Res>  {
$WarningStateCopyWith(WarningState _, $Res Function(WarningState) __);
}


/// Adds pattern-matching-related methods to [WarningState].
extension WarningStatePatterns on WarningState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( WarningInitial value)?  initial,TResult Function( WarningLoading value)?  loading,TResult Function( WarningLoaded value)?  loaded,TResult Function( WarningLoadingMore value)?  loadingMore,TResult Function( WarningResolvingItem value)?  resolvingItem,TResult Function( WarningItemResolved value)?  itemResolved,TResult Function( WarningError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case WarningInitial() when initial != null:
return initial(_that);case WarningLoading() when loading != null:
return loading(_that);case WarningLoaded() when loaded != null:
return loaded(_that);case WarningLoadingMore() when loadingMore != null:
return loadingMore(_that);case WarningResolvingItem() when resolvingItem != null:
return resolvingItem(_that);case WarningItemResolved() when itemResolved != null:
return itemResolved(_that);case WarningError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( WarningInitial value)  initial,required TResult Function( WarningLoading value)  loading,required TResult Function( WarningLoaded value)  loaded,required TResult Function( WarningLoadingMore value)  loadingMore,required TResult Function( WarningResolvingItem value)  resolvingItem,required TResult Function( WarningItemResolved value)  itemResolved,required TResult Function( WarningError value)  error,}){
final _that = this;
switch (_that) {
case WarningInitial():
return initial(_that);case WarningLoading():
return loading(_that);case WarningLoaded():
return loaded(_that);case WarningLoadingMore():
return loadingMore(_that);case WarningResolvingItem():
return resolvingItem(_that);case WarningItemResolved():
return itemResolved(_that);case WarningError():
return error(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( WarningInitial value)?  initial,TResult? Function( WarningLoading value)?  loading,TResult? Function( WarningLoaded value)?  loaded,TResult? Function( WarningLoadingMore value)?  loadingMore,TResult? Function( WarningResolvingItem value)?  resolvingItem,TResult? Function( WarningItemResolved value)?  itemResolved,TResult? Function( WarningError value)?  error,}){
final _that = this;
switch (_that) {
case WarningInitial() when initial != null:
return initial(_that);case WarningLoading() when loading != null:
return loading(_that);case WarningLoaded() when loaded != null:
return loaded(_that);case WarningLoadingMore() when loadingMore != null:
return loadingMore(_that);case WarningResolvingItem() when resolvingItem != null:
return resolvingItem(_that);case WarningItemResolved() when itemResolved != null:
return itemResolved(_that);case WarningError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<Warning> warnings,  int currentPage,  bool hasMore,  bool isLoadingMore)?  loaded,TResult Function( List<Warning> warnings,  int currentPage)?  loadingMore,TResult Function( List<Warning> warnings,  int currentPage,  bool hasMore,  String resolvingItemUID)?  resolvingItem,TResult Function( List<Warning> warnings,  int currentPage,  bool hasMore,  String resolvedItemUID)?  itemResolved,TResult Function( Failure failure,  List<Warning>? cachedWarnings)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case WarningInitial() when initial != null:
return initial();case WarningLoading() when loading != null:
return loading();case WarningLoaded() when loaded != null:
return loaded(_that.warnings,_that.currentPage,_that.hasMore,_that.isLoadingMore);case WarningLoadingMore() when loadingMore != null:
return loadingMore(_that.warnings,_that.currentPage);case WarningResolvingItem() when resolvingItem != null:
return resolvingItem(_that.warnings,_that.currentPage,_that.hasMore,_that.resolvingItemUID);case WarningItemResolved() when itemResolved != null:
return itemResolved(_that.warnings,_that.currentPage,_that.hasMore,_that.resolvedItemUID);case WarningError() when error != null:
return error(_that.failure,_that.cachedWarnings);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<Warning> warnings,  int currentPage,  bool hasMore,  bool isLoadingMore)  loaded,required TResult Function( List<Warning> warnings,  int currentPage)  loadingMore,required TResult Function( List<Warning> warnings,  int currentPage,  bool hasMore,  String resolvingItemUID)  resolvingItem,required TResult Function( List<Warning> warnings,  int currentPage,  bool hasMore,  String resolvedItemUID)  itemResolved,required TResult Function( Failure failure,  List<Warning>? cachedWarnings)  error,}) {final _that = this;
switch (_that) {
case WarningInitial():
return initial();case WarningLoading():
return loading();case WarningLoaded():
return loaded(_that.warnings,_that.currentPage,_that.hasMore,_that.isLoadingMore);case WarningLoadingMore():
return loadingMore(_that.warnings,_that.currentPage);case WarningResolvingItem():
return resolvingItem(_that.warnings,_that.currentPage,_that.hasMore,_that.resolvingItemUID);case WarningItemResolved():
return itemResolved(_that.warnings,_that.currentPage,_that.hasMore,_that.resolvedItemUID);case WarningError():
return error(_that.failure,_that.cachedWarnings);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<Warning> warnings,  int currentPage,  bool hasMore,  bool isLoadingMore)?  loaded,TResult? Function( List<Warning> warnings,  int currentPage)?  loadingMore,TResult? Function( List<Warning> warnings,  int currentPage,  bool hasMore,  String resolvingItemUID)?  resolvingItem,TResult? Function( List<Warning> warnings,  int currentPage,  bool hasMore,  String resolvedItemUID)?  itemResolved,TResult? Function( Failure failure,  List<Warning>? cachedWarnings)?  error,}) {final _that = this;
switch (_that) {
case WarningInitial() when initial != null:
return initial();case WarningLoading() when loading != null:
return loading();case WarningLoaded() when loaded != null:
return loaded(_that.warnings,_that.currentPage,_that.hasMore,_that.isLoadingMore);case WarningLoadingMore() when loadingMore != null:
return loadingMore(_that.warnings,_that.currentPage);case WarningResolvingItem() when resolvingItem != null:
return resolvingItem(_that.warnings,_that.currentPage,_that.hasMore,_that.resolvingItemUID);case WarningItemResolved() when itemResolved != null:
return itemResolved(_that.warnings,_that.currentPage,_that.hasMore,_that.resolvedItemUID);case WarningError() when error != null:
return error(_that.failure,_that.cachedWarnings);case _:
  return null;

}
}

}

/// @nodoc


class WarningInitial implements WarningState {
  const WarningInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WarningInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WarningState.initial()';
}


}




/// @nodoc


class WarningLoading implements WarningState {
  const WarningLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WarningLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WarningState.loading()';
}


}




/// @nodoc


class WarningLoaded implements WarningState {
  const WarningLoaded({required final  List<Warning> warnings, required this.currentPage, required this.hasMore, this.isLoadingMore = false}): _warnings = warnings;
  

 final  List<Warning> _warnings;
 List<Warning> get warnings {
  if (_warnings is EqualUnmodifiableListView) return _warnings;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_warnings);
}

 final  int currentPage;
 final  bool hasMore;
@JsonKey() final  bool isLoadingMore;

/// Create a copy of WarningState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WarningLoadedCopyWith<WarningLoaded> get copyWith => _$WarningLoadedCopyWithImpl<WarningLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WarningLoaded&&const DeepCollectionEquality().equals(other._warnings, _warnings)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_warnings),currentPage,hasMore,isLoadingMore);

@override
String toString() {
  return 'WarningState.loaded(warnings: $warnings, currentPage: $currentPage, hasMore: $hasMore, isLoadingMore: $isLoadingMore)';
}


}

/// @nodoc
abstract mixin class $WarningLoadedCopyWith<$Res> implements $WarningStateCopyWith<$Res> {
  factory $WarningLoadedCopyWith(WarningLoaded value, $Res Function(WarningLoaded) _then) = _$WarningLoadedCopyWithImpl;
@useResult
$Res call({
 List<Warning> warnings, int currentPage, bool hasMore, bool isLoadingMore
});




}
/// @nodoc
class _$WarningLoadedCopyWithImpl<$Res>
    implements $WarningLoadedCopyWith<$Res> {
  _$WarningLoadedCopyWithImpl(this._self, this._then);

  final WarningLoaded _self;
  final $Res Function(WarningLoaded) _then;

/// Create a copy of WarningState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? warnings = null,Object? currentPage = null,Object? hasMore = null,Object? isLoadingMore = null,}) {
  return _then(WarningLoaded(
warnings: null == warnings ? _self._warnings : warnings // ignore: cast_nullable_to_non_nullable
as List<Warning>,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class WarningLoadingMore implements WarningState {
  const WarningLoadingMore({required final  List<Warning> warnings, required this.currentPage}): _warnings = warnings;
  

 final  List<Warning> _warnings;
 List<Warning> get warnings {
  if (_warnings is EqualUnmodifiableListView) return _warnings;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_warnings);
}

 final  int currentPage;

/// Create a copy of WarningState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WarningLoadingMoreCopyWith<WarningLoadingMore> get copyWith => _$WarningLoadingMoreCopyWithImpl<WarningLoadingMore>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WarningLoadingMore&&const DeepCollectionEquality().equals(other._warnings, _warnings)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_warnings),currentPage);

@override
String toString() {
  return 'WarningState.loadingMore(warnings: $warnings, currentPage: $currentPage)';
}


}

/// @nodoc
abstract mixin class $WarningLoadingMoreCopyWith<$Res> implements $WarningStateCopyWith<$Res> {
  factory $WarningLoadingMoreCopyWith(WarningLoadingMore value, $Res Function(WarningLoadingMore) _then) = _$WarningLoadingMoreCopyWithImpl;
@useResult
$Res call({
 List<Warning> warnings, int currentPage
});




}
/// @nodoc
class _$WarningLoadingMoreCopyWithImpl<$Res>
    implements $WarningLoadingMoreCopyWith<$Res> {
  _$WarningLoadingMoreCopyWithImpl(this._self, this._then);

  final WarningLoadingMore _self;
  final $Res Function(WarningLoadingMore) _then;

/// Create a copy of WarningState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? warnings = null,Object? currentPage = null,}) {
  return _then(WarningLoadingMore(
warnings: null == warnings ? _self._warnings : warnings // ignore: cast_nullable_to_non_nullable
as List<Warning>,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class WarningResolvingItem implements WarningState {
  const WarningResolvingItem({required final  List<Warning> warnings, required this.currentPage, required this.hasMore, required this.resolvingItemUID}): _warnings = warnings;
  

 final  List<Warning> _warnings;
 List<Warning> get warnings {
  if (_warnings is EqualUnmodifiableListView) return _warnings;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_warnings);
}

 final  int currentPage;
 final  bool hasMore;
 final  String resolvingItemUID;

/// Create a copy of WarningState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WarningResolvingItemCopyWith<WarningResolvingItem> get copyWith => _$WarningResolvingItemCopyWithImpl<WarningResolvingItem>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WarningResolvingItem&&const DeepCollectionEquality().equals(other._warnings, _warnings)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.resolvingItemUID, resolvingItemUID) || other.resolvingItemUID == resolvingItemUID));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_warnings),currentPage,hasMore,resolvingItemUID);

@override
String toString() {
  return 'WarningState.resolvingItem(warnings: $warnings, currentPage: $currentPage, hasMore: $hasMore, resolvingItemUID: $resolvingItemUID)';
}


}

/// @nodoc
abstract mixin class $WarningResolvingItemCopyWith<$Res> implements $WarningStateCopyWith<$Res> {
  factory $WarningResolvingItemCopyWith(WarningResolvingItem value, $Res Function(WarningResolvingItem) _then) = _$WarningResolvingItemCopyWithImpl;
@useResult
$Res call({
 List<Warning> warnings, int currentPage, bool hasMore, String resolvingItemUID
});




}
/// @nodoc
class _$WarningResolvingItemCopyWithImpl<$Res>
    implements $WarningResolvingItemCopyWith<$Res> {
  _$WarningResolvingItemCopyWithImpl(this._self, this._then);

  final WarningResolvingItem _self;
  final $Res Function(WarningResolvingItem) _then;

/// Create a copy of WarningState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? warnings = null,Object? currentPage = null,Object? hasMore = null,Object? resolvingItemUID = null,}) {
  return _then(WarningResolvingItem(
warnings: null == warnings ? _self._warnings : warnings // ignore: cast_nullable_to_non_nullable
as List<Warning>,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,resolvingItemUID: null == resolvingItemUID ? _self.resolvingItemUID : resolvingItemUID // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class WarningItemResolved implements WarningState {
  const WarningItemResolved({required final  List<Warning> warnings, required this.currentPage, required this.hasMore, required this.resolvedItemUID}): _warnings = warnings;
  

 final  List<Warning> _warnings;
 List<Warning> get warnings {
  if (_warnings is EqualUnmodifiableListView) return _warnings;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_warnings);
}

 final  int currentPage;
 final  bool hasMore;
 final  String resolvedItemUID;

/// Create a copy of WarningState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WarningItemResolvedCopyWith<WarningItemResolved> get copyWith => _$WarningItemResolvedCopyWithImpl<WarningItemResolved>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WarningItemResolved&&const DeepCollectionEquality().equals(other._warnings, _warnings)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.resolvedItemUID, resolvedItemUID) || other.resolvedItemUID == resolvedItemUID));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_warnings),currentPage,hasMore,resolvedItemUID);

@override
String toString() {
  return 'WarningState.itemResolved(warnings: $warnings, currentPage: $currentPage, hasMore: $hasMore, resolvedItemUID: $resolvedItemUID)';
}


}

/// @nodoc
abstract mixin class $WarningItemResolvedCopyWith<$Res> implements $WarningStateCopyWith<$Res> {
  factory $WarningItemResolvedCopyWith(WarningItemResolved value, $Res Function(WarningItemResolved) _then) = _$WarningItemResolvedCopyWithImpl;
@useResult
$Res call({
 List<Warning> warnings, int currentPage, bool hasMore, String resolvedItemUID
});




}
/// @nodoc
class _$WarningItemResolvedCopyWithImpl<$Res>
    implements $WarningItemResolvedCopyWith<$Res> {
  _$WarningItemResolvedCopyWithImpl(this._self, this._then);

  final WarningItemResolved _self;
  final $Res Function(WarningItemResolved) _then;

/// Create a copy of WarningState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? warnings = null,Object? currentPage = null,Object? hasMore = null,Object? resolvedItemUID = null,}) {
  return _then(WarningItemResolved(
warnings: null == warnings ? _self._warnings : warnings // ignore: cast_nullable_to_non_nullable
as List<Warning>,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,resolvedItemUID: null == resolvedItemUID ? _self.resolvedItemUID : resolvedItemUID // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class WarningError implements WarningState {
  const WarningError({required this.failure, final  List<Warning>? cachedWarnings}): _cachedWarnings = cachedWarnings;
  

 final  Failure failure;
 final  List<Warning>? _cachedWarnings;
 List<Warning>? get cachedWarnings {
  final value = _cachedWarnings;
  if (value == null) return null;
  if (_cachedWarnings is EqualUnmodifiableListView) return _cachedWarnings;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of WarningState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WarningErrorCopyWith<WarningError> get copyWith => _$WarningErrorCopyWithImpl<WarningError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WarningError&&(identical(other.failure, failure) || other.failure == failure)&&const DeepCollectionEquality().equals(other._cachedWarnings, _cachedWarnings));
}


@override
int get hashCode => Object.hash(runtimeType,failure,const DeepCollectionEquality().hash(_cachedWarnings));

@override
String toString() {
  return 'WarningState.error(failure: $failure, cachedWarnings: $cachedWarnings)';
}


}

/// @nodoc
abstract mixin class $WarningErrorCopyWith<$Res> implements $WarningStateCopyWith<$Res> {
  factory $WarningErrorCopyWith(WarningError value, $Res Function(WarningError) _then) = _$WarningErrorCopyWithImpl;
@useResult
$Res call({
 Failure failure, List<Warning>? cachedWarnings
});




}
/// @nodoc
class _$WarningErrorCopyWithImpl<$Res>
    implements $WarningErrorCopyWith<$Res> {
  _$WarningErrorCopyWithImpl(this._self, this._then);

  final WarningError _self;
  final $Res Function(WarningError) _then;

/// Create a copy of WarningState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failure = null,Object? cachedWarnings = freezed,}) {
  return _then(WarningError(
failure: null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure,cachedWarnings: freezed == cachedWarnings ? _self._cachedWarnings : cachedWarnings // ignore: cast_nullable_to_non_nullable
as List<Warning>?,
  ));
}


}

// dart format on
