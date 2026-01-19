// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'program_detail_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProgramDetailEvent {

 String get companyUID; String get programUID;
/// Create a copy of ProgramDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProgramDetailEventCopyWith<ProgramDetailEvent> get copyWith => _$ProgramDetailEventCopyWithImpl<ProgramDetailEvent>(this as ProgramDetailEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProgramDetailEvent&&(identical(other.companyUID, companyUID) || other.companyUID == companyUID)&&(identical(other.programUID, programUID) || other.programUID == programUID));
}


@override
int get hashCode => Object.hash(runtimeType,companyUID,programUID);

@override
String toString() {
  return 'ProgramDetailEvent(companyUID: $companyUID, programUID: $programUID)';
}


}

/// @nodoc
abstract mixin class $ProgramDetailEventCopyWith<$Res>  {
  factory $ProgramDetailEventCopyWith(ProgramDetailEvent value, $Res Function(ProgramDetailEvent) _then) = _$ProgramDetailEventCopyWithImpl;
@useResult
$Res call({
 String companyUID, String programUID
});




}
/// @nodoc
class _$ProgramDetailEventCopyWithImpl<$Res>
    implements $ProgramDetailEventCopyWith<$Res> {
  _$ProgramDetailEventCopyWithImpl(this._self, this._then);

  final ProgramDetailEvent _self;
  final $Res Function(ProgramDetailEvent) _then;

/// Create a copy of ProgramDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? companyUID = null,Object? programUID = null,}) {
  return _then(_self.copyWith(
companyUID: null == companyUID ? _self.companyUID : companyUID // ignore: cast_nullable_to_non_nullable
as String,programUID: null == programUID ? _self.programUID : programUID // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ProgramDetailEvent].
extension ProgramDetailEventPatterns on ProgramDetailEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoadProgramDetail value)?  loadProgramDetail,TResult Function( RefreshProgramDetail value)?  refreshProgramDetail,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoadProgramDetail() when loadProgramDetail != null:
return loadProgramDetail(_that);case RefreshProgramDetail() when refreshProgramDetail != null:
return refreshProgramDetail(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoadProgramDetail value)  loadProgramDetail,required TResult Function( RefreshProgramDetail value)  refreshProgramDetail,}){
final _that = this;
switch (_that) {
case LoadProgramDetail():
return loadProgramDetail(_that);case RefreshProgramDetail():
return refreshProgramDetail(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoadProgramDetail value)?  loadProgramDetail,TResult? Function( RefreshProgramDetail value)?  refreshProgramDetail,}){
final _that = this;
switch (_that) {
case LoadProgramDetail() when loadProgramDetail != null:
return loadProgramDetail(_that);case RefreshProgramDetail() when refreshProgramDetail != null:
return refreshProgramDetail(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String companyUID,  String programUID,  bool forceRefresh)?  loadProgramDetail,TResult Function( String companyUID,  String programUID)?  refreshProgramDetail,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LoadProgramDetail() when loadProgramDetail != null:
return loadProgramDetail(_that.companyUID,_that.programUID,_that.forceRefresh);case RefreshProgramDetail() when refreshProgramDetail != null:
return refreshProgramDetail(_that.companyUID,_that.programUID);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String companyUID,  String programUID,  bool forceRefresh)  loadProgramDetail,required TResult Function( String companyUID,  String programUID)  refreshProgramDetail,}) {final _that = this;
switch (_that) {
case LoadProgramDetail():
return loadProgramDetail(_that.companyUID,_that.programUID,_that.forceRefresh);case RefreshProgramDetail():
return refreshProgramDetail(_that.companyUID,_that.programUID);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String companyUID,  String programUID,  bool forceRefresh)?  loadProgramDetail,TResult? Function( String companyUID,  String programUID)?  refreshProgramDetail,}) {final _that = this;
switch (_that) {
case LoadProgramDetail() when loadProgramDetail != null:
return loadProgramDetail(_that.companyUID,_that.programUID,_that.forceRefresh);case RefreshProgramDetail() when refreshProgramDetail != null:
return refreshProgramDetail(_that.companyUID,_that.programUID);case _:
  return null;

}
}

}

/// @nodoc


class LoadProgramDetail implements ProgramDetailEvent {
  const LoadProgramDetail({required this.companyUID, required this.programUID, this.forceRefresh = false});
  

@override final  String companyUID;
@override final  String programUID;
@JsonKey() final  bool forceRefresh;

/// Create a copy of ProgramDetailEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
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
  return 'ProgramDetailEvent.loadProgramDetail(companyUID: $companyUID, programUID: $programUID, forceRefresh: $forceRefresh)';
}


}

/// @nodoc
abstract mixin class $LoadProgramDetailCopyWith<$Res> implements $ProgramDetailEventCopyWith<$Res> {
  factory $LoadProgramDetailCopyWith(LoadProgramDetail value, $Res Function(LoadProgramDetail) _then) = _$LoadProgramDetailCopyWithImpl;
@override @useResult
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

/// Create a copy of ProgramDetailEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? companyUID = null,Object? programUID = null,Object? forceRefresh = null,}) {
  return _then(LoadProgramDetail(
companyUID: null == companyUID ? _self.companyUID : companyUID // ignore: cast_nullable_to_non_nullable
as String,programUID: null == programUID ? _self.programUID : programUID // ignore: cast_nullable_to_non_nullable
as String,forceRefresh: null == forceRefresh ? _self.forceRefresh : forceRefresh // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class RefreshProgramDetail implements ProgramDetailEvent {
  const RefreshProgramDetail({required this.companyUID, required this.programUID});
  

@override final  String companyUID;
@override final  String programUID;

/// Create a copy of ProgramDetailEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
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
  return 'ProgramDetailEvent.refreshProgramDetail(companyUID: $companyUID, programUID: $programUID)';
}


}

/// @nodoc
abstract mixin class $RefreshProgramDetailCopyWith<$Res> implements $ProgramDetailEventCopyWith<$Res> {
  factory $RefreshProgramDetailCopyWith(RefreshProgramDetail value, $Res Function(RefreshProgramDetail) _then) = _$RefreshProgramDetailCopyWithImpl;
@override @useResult
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

/// Create a copy of ProgramDetailEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? companyUID = null,Object? programUID = null,}) {
  return _then(RefreshProgramDetail(
companyUID: null == companyUID ? _self.companyUID : companyUID // ignore: cast_nullable_to_non_nullable
as String,programUID: null == programUID ? _self.programUID : programUID // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
