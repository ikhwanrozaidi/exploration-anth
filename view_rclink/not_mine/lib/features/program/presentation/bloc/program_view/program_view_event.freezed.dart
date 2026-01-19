// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'program_view_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProgramViewEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProgramViewEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProgramViewEvent()';
}


}

/// @nodoc
class $ProgramViewEventCopyWith<$Res>  {
$ProgramViewEventCopyWith(ProgramViewEvent _, $Res Function(ProgramViewEvent) __);
}


/// Adds pattern-matching-related methods to [ProgramViewEvent].
extension ProgramViewEventPatterns on ProgramViewEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoadPrograms value)?  loadPrograms,TResult Function( LoadMorePrograms value)?  loadMorePrograms,TResult Function( RefreshPrograms value)?  refreshPrograms,TResult Function( LoadProgramDetail value)?  loadProgramDetail,TResult Function( RefreshProgramDetail value)?  refreshProgramDetail,TResult Function( ClearProgramCache value)?  clearCache,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoadPrograms() when loadPrograms != null:
return loadPrograms(_that);case LoadMorePrograms() when loadMorePrograms != null:
return loadMorePrograms(_that);case RefreshPrograms() when refreshPrograms != null:
return refreshPrograms(_that);case LoadProgramDetail() when loadProgramDetail != null:
return loadProgramDetail(_that);case RefreshProgramDetail() when refreshProgramDetail != null:
return refreshProgramDetail(_that);case ClearProgramCache() when clearCache != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoadPrograms value)  loadPrograms,required TResult Function( LoadMorePrograms value)  loadMorePrograms,required TResult Function( RefreshPrograms value)  refreshPrograms,required TResult Function( LoadProgramDetail value)  loadProgramDetail,required TResult Function( RefreshProgramDetail value)  refreshProgramDetail,required TResult Function( ClearProgramCache value)  clearCache,}){
final _that = this;
switch (_that) {
case LoadPrograms():
return loadPrograms(_that);case LoadMorePrograms():
return loadMorePrograms(_that);case RefreshPrograms():
return refreshPrograms(_that);case LoadProgramDetail():
return loadProgramDetail(_that);case RefreshProgramDetail():
return refreshProgramDetail(_that);case ClearProgramCache():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoadPrograms value)?  loadPrograms,TResult? Function( LoadMorePrograms value)?  loadMorePrograms,TResult? Function( RefreshPrograms value)?  refreshPrograms,TResult? Function( LoadProgramDetail value)?  loadProgramDetail,TResult? Function( RefreshProgramDetail value)?  refreshProgramDetail,TResult? Function( ClearProgramCache value)?  clearCache,}){
final _that = this;
switch (_that) {
case LoadPrograms() when loadPrograms != null:
return loadPrograms(_that);case LoadMorePrograms() when loadMorePrograms != null:
return loadMorePrograms(_that);case RefreshPrograms() when refreshPrograms != null:
return refreshPrograms(_that);case LoadProgramDetail() when loadProgramDetail != null:
return loadProgramDetail(_that);case RefreshProgramDetail() when refreshProgramDetail != null:
return refreshProgramDetail(_that);case ClearProgramCache() when clearCache != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String companyUID,  int page,  int limit,  bool forceRefresh)?  loadPrograms,TResult Function( String companyUID)?  loadMorePrograms,TResult Function( String companyUID)?  refreshPrograms,TResult Function( String companyUID,  String programUID,  bool forceRefresh)?  loadProgramDetail,TResult Function( String companyUID,  String programUID)?  refreshProgramDetail,TResult Function()?  clearCache,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LoadPrograms() when loadPrograms != null:
return loadPrograms(_that.companyUID,_that.page,_that.limit,_that.forceRefresh);case LoadMorePrograms() when loadMorePrograms != null:
return loadMorePrograms(_that.companyUID);case RefreshPrograms() when refreshPrograms != null:
return refreshPrograms(_that.companyUID);case LoadProgramDetail() when loadProgramDetail != null:
return loadProgramDetail(_that.companyUID,_that.programUID,_that.forceRefresh);case RefreshProgramDetail() when refreshProgramDetail != null:
return refreshProgramDetail(_that.companyUID,_that.programUID);case ClearProgramCache() when clearCache != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String companyUID,  int page,  int limit,  bool forceRefresh)  loadPrograms,required TResult Function( String companyUID)  loadMorePrograms,required TResult Function( String companyUID)  refreshPrograms,required TResult Function( String companyUID,  String programUID,  bool forceRefresh)  loadProgramDetail,required TResult Function( String companyUID,  String programUID)  refreshProgramDetail,required TResult Function()  clearCache,}) {final _that = this;
switch (_that) {
case LoadPrograms():
return loadPrograms(_that.companyUID,_that.page,_that.limit,_that.forceRefresh);case LoadMorePrograms():
return loadMorePrograms(_that.companyUID);case RefreshPrograms():
return refreshPrograms(_that.companyUID);case LoadProgramDetail():
return loadProgramDetail(_that.companyUID,_that.programUID,_that.forceRefresh);case RefreshProgramDetail():
return refreshProgramDetail(_that.companyUID,_that.programUID);case ClearProgramCache():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String companyUID,  int page,  int limit,  bool forceRefresh)?  loadPrograms,TResult? Function( String companyUID)?  loadMorePrograms,TResult? Function( String companyUID)?  refreshPrograms,TResult? Function( String companyUID,  String programUID,  bool forceRefresh)?  loadProgramDetail,TResult? Function( String companyUID,  String programUID)?  refreshProgramDetail,TResult? Function()?  clearCache,}) {final _that = this;
switch (_that) {
case LoadPrograms() when loadPrograms != null:
return loadPrograms(_that.companyUID,_that.page,_that.limit,_that.forceRefresh);case LoadMorePrograms() when loadMorePrograms != null:
return loadMorePrograms(_that.companyUID);case RefreshPrograms() when refreshPrograms != null:
return refreshPrograms(_that.companyUID);case LoadProgramDetail() when loadProgramDetail != null:
return loadProgramDetail(_that.companyUID,_that.programUID,_that.forceRefresh);case RefreshProgramDetail() when refreshProgramDetail != null:
return refreshProgramDetail(_that.companyUID,_that.programUID);case ClearProgramCache() when clearCache != null:
return clearCache();case _:
  return null;

}
}

}

/// @nodoc


class LoadPrograms implements ProgramViewEvent {
  const LoadPrograms({required this.companyUID, this.page = 1, this.limit = 10, this.forceRefresh = false});
  

 final  String companyUID;
@JsonKey() final  int page;
@JsonKey() final  int limit;
@JsonKey() final  bool forceRefresh;

/// Create a copy of ProgramViewEvent
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
  return 'ProgramViewEvent.loadPrograms(companyUID: $companyUID, page: $page, limit: $limit, forceRefresh: $forceRefresh)';
}


}

/// @nodoc
abstract mixin class $LoadProgramsCopyWith<$Res> implements $ProgramViewEventCopyWith<$Res> {
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

/// Create a copy of ProgramViewEvent
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


class LoadMorePrograms implements ProgramViewEvent {
  const LoadMorePrograms({required this.companyUID});
  

 final  String companyUID;

/// Create a copy of ProgramViewEvent
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
  return 'ProgramViewEvent.loadMorePrograms(companyUID: $companyUID)';
}


}

/// @nodoc
abstract mixin class $LoadMoreProgramsCopyWith<$Res> implements $ProgramViewEventCopyWith<$Res> {
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

/// Create a copy of ProgramViewEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? companyUID = null,}) {
  return _then(LoadMorePrograms(
companyUID: null == companyUID ? _self.companyUID : companyUID // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class RefreshPrograms implements ProgramViewEvent {
  const RefreshPrograms({required this.companyUID});
  

 final  String companyUID;

/// Create a copy of ProgramViewEvent
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
  return 'ProgramViewEvent.refreshPrograms(companyUID: $companyUID)';
}


}

/// @nodoc
abstract mixin class $RefreshProgramsCopyWith<$Res> implements $ProgramViewEventCopyWith<$Res> {
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

/// Create a copy of ProgramViewEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? companyUID = null,}) {
  return _then(RefreshPrograms(
companyUID: null == companyUID ? _self.companyUID : companyUID // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class LoadProgramDetail implements ProgramViewEvent {
  const LoadProgramDetail({required this.companyUID, required this.programUID, this.forceRefresh = false});
  

 final  String companyUID;
 final  String programUID;
@JsonKey() final  bool forceRefresh;

/// Create a copy of ProgramViewEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadProgramDetailCopyWith<LoadProgramDetail> get copyWith => _$LoadProgramDetailCopyWithImpl<LoadProgramDetail>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadProgramDetail&&(identical(other.companyUID, companyUID) || other.companyUID == companyUID)&&(identical(other.programUID, programUID) || other.programUID == programUID)&&(identical(other.forceRefresh, forceRefresh) || other.forceRefresh == forceRefresh));
}


@override
int get hashCode => Object.hash(runtimeType,companyUID,programUID,forceRefresh);

@override
String toString() {
  return 'ProgramViewEvent.loadProgramDetail(companyUID: $companyUID, programUID: $programUID, forceRefresh: $forceRefresh)';
}


}

/// @nodoc
abstract mixin class $LoadProgramDetailCopyWith<$Res> implements $ProgramViewEventCopyWith<$Res> {
  factory $LoadProgramDetailCopyWith(LoadProgramDetail value, $Res Function(LoadProgramDetail) _then) = _$LoadProgramDetailCopyWithImpl;
@useResult
$Res call({
 String companyUID, String programUID, bool forceRefresh
});




}
/// @nodoc
class _$LoadProgramDetailCopyWithImpl<$Res>
    implements $LoadProgramDetailCopyWith<$Res> {
  _$LoadProgramDetailCopyWithImpl(this._self, this._then);

  final LoadProgramDetail _self;
  final $Res Function(LoadProgramDetail) _then;

/// Create a copy of ProgramViewEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? companyUID = null,Object? programUID = null,Object? forceRefresh = null,}) {
  return _then(LoadProgramDetail(
companyUID: null == companyUID ? _self.companyUID : companyUID // ignore: cast_nullable_to_non_nullable
as String,programUID: null == programUID ? _self.programUID : programUID // ignore: cast_nullable_to_non_nullable
as String,forceRefresh: null == forceRefresh ? _self.forceRefresh : forceRefresh // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class RefreshProgramDetail implements ProgramViewEvent {
  const RefreshProgramDetail({required this.companyUID, required this.programUID});
  

 final  String companyUID;
 final  String programUID;

/// Create a copy of ProgramViewEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RefreshProgramDetailCopyWith<RefreshProgramDetail> get copyWith => _$RefreshProgramDetailCopyWithImpl<RefreshProgramDetail>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RefreshProgramDetail&&(identical(other.companyUID, companyUID) || other.companyUID == companyUID)&&(identical(other.programUID, programUID) || other.programUID == programUID));
}


@override
int get hashCode => Object.hash(runtimeType,companyUID,programUID);

@override
String toString() {
  return 'ProgramViewEvent.refreshProgramDetail(companyUID: $companyUID, programUID: $programUID)';
}


}

/// @nodoc
abstract mixin class $RefreshProgramDetailCopyWith<$Res> implements $ProgramViewEventCopyWith<$Res> {
  factory $RefreshProgramDetailCopyWith(RefreshProgramDetail value, $Res Function(RefreshProgramDetail) _then) = _$RefreshProgramDetailCopyWithImpl;
@useResult
$Res call({
 String companyUID, String programUID
});




}
/// @nodoc
class _$RefreshProgramDetailCopyWithImpl<$Res>
    implements $RefreshProgramDetailCopyWith<$Res> {
  _$RefreshProgramDetailCopyWithImpl(this._self, this._then);

  final RefreshProgramDetail _self;
  final $Res Function(RefreshProgramDetail) _then;

/// Create a copy of ProgramViewEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? companyUID = null,Object? programUID = null,}) {
  return _then(RefreshProgramDetail(
companyUID: null == companyUID ? _self.companyUID : companyUID // ignore: cast_nullable_to_non_nullable
as String,programUID: null == programUID ? _self.programUID : programUID // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ClearProgramCache implements ProgramViewEvent {
  const ClearProgramCache();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClearProgramCache);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProgramViewEvent.clearCache()';
}


}




// dart format on
