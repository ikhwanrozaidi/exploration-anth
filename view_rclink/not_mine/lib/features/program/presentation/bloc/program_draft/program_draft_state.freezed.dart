// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'program_draft_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProgramDraftState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProgramDraftState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProgramDraftState()';
}


}

/// @nodoc
class $ProgramDraftStateCopyWith<$Res>  {
$ProgramDraftStateCopyWith(ProgramDraftState _, $Res Function(ProgramDraftState) __);
}


/// Adds pattern-matching-related methods to [ProgramDraftState].
extension ProgramDraftStatePatterns on ProgramDraftState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ProgramDraftInitial value)?  initial,TResult Function( ProgramDraftLoading value)?  loading,TResult Function( ProgramDraftEditing value)?  editing,TResult Function( ProgramDraftAutoSaving value)?  autoSaving,TResult Function( ProgramDraftAutoSaved value)?  autoSaved,TResult Function( ProgramDraftSubmitting value)?  submitting,TResult Function( ProgramDraftSubmitted value)?  submitted,TResult Function( ProgramDraftListLoaded value)?  draftListLoaded,TResult Function( ProgramDraftError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ProgramDraftInitial() when initial != null:
return initial(_that);case ProgramDraftLoading() when loading != null:
return loading(_that);case ProgramDraftEditing() when editing != null:
return editing(_that);case ProgramDraftAutoSaving() when autoSaving != null:
return autoSaving(_that);case ProgramDraftAutoSaved() when autoSaved != null:
return autoSaved(_that);case ProgramDraftSubmitting() when submitting != null:
return submitting(_that);case ProgramDraftSubmitted() when submitted != null:
return submitted(_that);case ProgramDraftListLoaded() when draftListLoaded != null:
return draftListLoaded(_that);case ProgramDraftError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ProgramDraftInitial value)  initial,required TResult Function( ProgramDraftLoading value)  loading,required TResult Function( ProgramDraftEditing value)  editing,required TResult Function( ProgramDraftAutoSaving value)  autoSaving,required TResult Function( ProgramDraftAutoSaved value)  autoSaved,required TResult Function( ProgramDraftSubmitting value)  submitting,required TResult Function( ProgramDraftSubmitted value)  submitted,required TResult Function( ProgramDraftListLoaded value)  draftListLoaded,required TResult Function( ProgramDraftError value)  error,}){
final _that = this;
switch (_that) {
case ProgramDraftInitial():
return initial(_that);case ProgramDraftLoading():
return loading(_that);case ProgramDraftEditing():
return editing(_that);case ProgramDraftAutoSaving():
return autoSaving(_that);case ProgramDraftAutoSaved():
return autoSaved(_that);case ProgramDraftSubmitting():
return submitting(_that);case ProgramDraftSubmitted():
return submitted(_that);case ProgramDraftListLoaded():
return draftListLoaded(_that);case ProgramDraftError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ProgramDraftInitial value)?  initial,TResult? Function( ProgramDraftLoading value)?  loading,TResult? Function( ProgramDraftEditing value)?  editing,TResult? Function( ProgramDraftAutoSaving value)?  autoSaving,TResult? Function( ProgramDraftAutoSaved value)?  autoSaved,TResult? Function( ProgramDraftSubmitting value)?  submitting,TResult? Function( ProgramDraftSubmitted value)?  submitted,TResult? Function( ProgramDraftListLoaded value)?  draftListLoaded,TResult? Function( ProgramDraftError value)?  error,}){
final _that = this;
switch (_that) {
case ProgramDraftInitial() when initial != null:
return initial(_that);case ProgramDraftLoading() when loading != null:
return loading(_that);case ProgramDraftEditing() when editing != null:
return editing(_that);case ProgramDraftAutoSaving() when autoSaving != null:
return autoSaving(_that);case ProgramDraftAutoSaved() when autoSaved != null:
return autoSaved(_that);case ProgramDraftSubmitting() when submitting != null:
return submitting(_that);case ProgramDraftSubmitted() when submitted != null:
return submitted(_that);case ProgramDraftListLoaded() when draftListLoaded != null:
return draftListLoaded(_that);case ProgramDraftError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( ProgramDraftData draftData)?  editing,TResult Function( ProgramDraftData draftData)?  autoSaving,TResult Function( ProgramDraftData draftData)?  autoSaved,TResult Function( ProgramDraftData draftData)?  submitting,TResult Function( ProgramDraftData draftData)?  submitted,TResult Function( List<ProgramRecord> drafts)?  draftListLoaded,TResult Function( Failure failure,  ProgramDraftData? draftData)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ProgramDraftInitial() when initial != null:
return initial();case ProgramDraftLoading() when loading != null:
return loading();case ProgramDraftEditing() when editing != null:
return editing(_that.draftData);case ProgramDraftAutoSaving() when autoSaving != null:
return autoSaving(_that.draftData);case ProgramDraftAutoSaved() when autoSaved != null:
return autoSaved(_that.draftData);case ProgramDraftSubmitting() when submitting != null:
return submitting(_that.draftData);case ProgramDraftSubmitted() when submitted != null:
return submitted(_that.draftData);case ProgramDraftListLoaded() when draftListLoaded != null:
return draftListLoaded(_that.drafts);case ProgramDraftError() when error != null:
return error(_that.failure,_that.draftData);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( ProgramDraftData draftData)  editing,required TResult Function( ProgramDraftData draftData)  autoSaving,required TResult Function( ProgramDraftData draftData)  autoSaved,required TResult Function( ProgramDraftData draftData)  submitting,required TResult Function( ProgramDraftData draftData)  submitted,required TResult Function( List<ProgramRecord> drafts)  draftListLoaded,required TResult Function( Failure failure,  ProgramDraftData? draftData)  error,}) {final _that = this;
switch (_that) {
case ProgramDraftInitial():
return initial();case ProgramDraftLoading():
return loading();case ProgramDraftEditing():
return editing(_that.draftData);case ProgramDraftAutoSaving():
return autoSaving(_that.draftData);case ProgramDraftAutoSaved():
return autoSaved(_that.draftData);case ProgramDraftSubmitting():
return submitting(_that.draftData);case ProgramDraftSubmitted():
return submitted(_that.draftData);case ProgramDraftListLoaded():
return draftListLoaded(_that.drafts);case ProgramDraftError():
return error(_that.failure,_that.draftData);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( ProgramDraftData draftData)?  editing,TResult? Function( ProgramDraftData draftData)?  autoSaving,TResult? Function( ProgramDraftData draftData)?  autoSaved,TResult? Function( ProgramDraftData draftData)?  submitting,TResult? Function( ProgramDraftData draftData)?  submitted,TResult? Function( List<ProgramRecord> drafts)?  draftListLoaded,TResult? Function( Failure failure,  ProgramDraftData? draftData)?  error,}) {final _that = this;
switch (_that) {
case ProgramDraftInitial() when initial != null:
return initial();case ProgramDraftLoading() when loading != null:
return loading();case ProgramDraftEditing() when editing != null:
return editing(_that.draftData);case ProgramDraftAutoSaving() when autoSaving != null:
return autoSaving(_that.draftData);case ProgramDraftAutoSaved() when autoSaved != null:
return autoSaved(_that.draftData);case ProgramDraftSubmitting() when submitting != null:
return submitting(_that.draftData);case ProgramDraftSubmitted() when submitted != null:
return submitted(_that.draftData);case ProgramDraftListLoaded() when draftListLoaded != null:
return draftListLoaded(_that.drafts);case ProgramDraftError() when error != null:
return error(_that.failure,_that.draftData);case _:
  return null;

}
}

}

/// @nodoc


class ProgramDraftInitial implements ProgramDraftState {
  const ProgramDraftInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProgramDraftInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProgramDraftState.initial()';
}


}




/// @nodoc


class ProgramDraftLoading implements ProgramDraftState {
  const ProgramDraftLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProgramDraftLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProgramDraftState.loading()';
}


}




/// @nodoc


class ProgramDraftEditing implements ProgramDraftState {
  const ProgramDraftEditing({required this.draftData});
  

 final  ProgramDraftData draftData;

/// Create a copy of ProgramDraftState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProgramDraftEditingCopyWith<ProgramDraftEditing> get copyWith => _$ProgramDraftEditingCopyWithImpl<ProgramDraftEditing>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProgramDraftEditing&&(identical(other.draftData, draftData) || other.draftData == draftData));
}


@override
int get hashCode => Object.hash(runtimeType,draftData);

@override
String toString() {
  return 'ProgramDraftState.editing(draftData: $draftData)';
}


}

/// @nodoc
abstract mixin class $ProgramDraftEditingCopyWith<$Res> implements $ProgramDraftStateCopyWith<$Res> {
  factory $ProgramDraftEditingCopyWith(ProgramDraftEditing value, $Res Function(ProgramDraftEditing) _then) = _$ProgramDraftEditingCopyWithImpl;
@useResult
$Res call({
 ProgramDraftData draftData
});




}
/// @nodoc
class _$ProgramDraftEditingCopyWithImpl<$Res>
    implements $ProgramDraftEditingCopyWith<$Res> {
  _$ProgramDraftEditingCopyWithImpl(this._self, this._then);

  final ProgramDraftEditing _self;
  final $Res Function(ProgramDraftEditing) _then;

/// Create a copy of ProgramDraftState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? draftData = null,}) {
  return _then(ProgramDraftEditing(
draftData: null == draftData ? _self.draftData : draftData // ignore: cast_nullable_to_non_nullable
as ProgramDraftData,
  ));
}


}

/// @nodoc


class ProgramDraftAutoSaving implements ProgramDraftState {
  const ProgramDraftAutoSaving({required this.draftData});
  

 final  ProgramDraftData draftData;

/// Create a copy of ProgramDraftState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProgramDraftAutoSavingCopyWith<ProgramDraftAutoSaving> get copyWith => _$ProgramDraftAutoSavingCopyWithImpl<ProgramDraftAutoSaving>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProgramDraftAutoSaving&&(identical(other.draftData, draftData) || other.draftData == draftData));
}


@override
int get hashCode => Object.hash(runtimeType,draftData);

@override
String toString() {
  return 'ProgramDraftState.autoSaving(draftData: $draftData)';
}


}

/// @nodoc
abstract mixin class $ProgramDraftAutoSavingCopyWith<$Res> implements $ProgramDraftStateCopyWith<$Res> {
  factory $ProgramDraftAutoSavingCopyWith(ProgramDraftAutoSaving value, $Res Function(ProgramDraftAutoSaving) _then) = _$ProgramDraftAutoSavingCopyWithImpl;
@useResult
$Res call({
 ProgramDraftData draftData
});




}
/// @nodoc
class _$ProgramDraftAutoSavingCopyWithImpl<$Res>
    implements $ProgramDraftAutoSavingCopyWith<$Res> {
  _$ProgramDraftAutoSavingCopyWithImpl(this._self, this._then);

  final ProgramDraftAutoSaving _self;
  final $Res Function(ProgramDraftAutoSaving) _then;

/// Create a copy of ProgramDraftState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? draftData = null,}) {
  return _then(ProgramDraftAutoSaving(
draftData: null == draftData ? _self.draftData : draftData // ignore: cast_nullable_to_non_nullable
as ProgramDraftData,
  ));
}


}

/// @nodoc


class ProgramDraftAutoSaved implements ProgramDraftState {
  const ProgramDraftAutoSaved({required this.draftData});
  

 final  ProgramDraftData draftData;

/// Create a copy of ProgramDraftState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProgramDraftAutoSavedCopyWith<ProgramDraftAutoSaved> get copyWith => _$ProgramDraftAutoSavedCopyWithImpl<ProgramDraftAutoSaved>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProgramDraftAutoSaved&&(identical(other.draftData, draftData) || other.draftData == draftData));
}


@override
int get hashCode => Object.hash(runtimeType,draftData);

@override
String toString() {
  return 'ProgramDraftState.autoSaved(draftData: $draftData)';
}


}

/// @nodoc
abstract mixin class $ProgramDraftAutoSavedCopyWith<$Res> implements $ProgramDraftStateCopyWith<$Res> {
  factory $ProgramDraftAutoSavedCopyWith(ProgramDraftAutoSaved value, $Res Function(ProgramDraftAutoSaved) _then) = _$ProgramDraftAutoSavedCopyWithImpl;
@useResult
$Res call({
 ProgramDraftData draftData
});




}
/// @nodoc
class _$ProgramDraftAutoSavedCopyWithImpl<$Res>
    implements $ProgramDraftAutoSavedCopyWith<$Res> {
  _$ProgramDraftAutoSavedCopyWithImpl(this._self, this._then);

  final ProgramDraftAutoSaved _self;
  final $Res Function(ProgramDraftAutoSaved) _then;

/// Create a copy of ProgramDraftState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? draftData = null,}) {
  return _then(ProgramDraftAutoSaved(
draftData: null == draftData ? _self.draftData : draftData // ignore: cast_nullable_to_non_nullable
as ProgramDraftData,
  ));
}


}

/// @nodoc


class ProgramDraftSubmitting implements ProgramDraftState {
  const ProgramDraftSubmitting({required this.draftData});
  

 final  ProgramDraftData draftData;

/// Create a copy of ProgramDraftState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProgramDraftSubmittingCopyWith<ProgramDraftSubmitting> get copyWith => _$ProgramDraftSubmittingCopyWithImpl<ProgramDraftSubmitting>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProgramDraftSubmitting&&(identical(other.draftData, draftData) || other.draftData == draftData));
}


@override
int get hashCode => Object.hash(runtimeType,draftData);

@override
String toString() {
  return 'ProgramDraftState.submitting(draftData: $draftData)';
}


}

/// @nodoc
abstract mixin class $ProgramDraftSubmittingCopyWith<$Res> implements $ProgramDraftStateCopyWith<$Res> {
  factory $ProgramDraftSubmittingCopyWith(ProgramDraftSubmitting value, $Res Function(ProgramDraftSubmitting) _then) = _$ProgramDraftSubmittingCopyWithImpl;
@useResult
$Res call({
 ProgramDraftData draftData
});




}
/// @nodoc
class _$ProgramDraftSubmittingCopyWithImpl<$Res>
    implements $ProgramDraftSubmittingCopyWith<$Res> {
  _$ProgramDraftSubmittingCopyWithImpl(this._self, this._then);

  final ProgramDraftSubmitting _self;
  final $Res Function(ProgramDraftSubmitting) _then;

/// Create a copy of ProgramDraftState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? draftData = null,}) {
  return _then(ProgramDraftSubmitting(
draftData: null == draftData ? _self.draftData : draftData // ignore: cast_nullable_to_non_nullable
as ProgramDraftData,
  ));
}


}

/// @nodoc


class ProgramDraftSubmitted implements ProgramDraftState {
  const ProgramDraftSubmitted({required this.draftData});
  

 final  ProgramDraftData draftData;

/// Create a copy of ProgramDraftState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProgramDraftSubmittedCopyWith<ProgramDraftSubmitted> get copyWith => _$ProgramDraftSubmittedCopyWithImpl<ProgramDraftSubmitted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProgramDraftSubmitted&&(identical(other.draftData, draftData) || other.draftData == draftData));
}


@override
int get hashCode => Object.hash(runtimeType,draftData);

@override
String toString() {
  return 'ProgramDraftState.submitted(draftData: $draftData)';
}


}

/// @nodoc
abstract mixin class $ProgramDraftSubmittedCopyWith<$Res> implements $ProgramDraftStateCopyWith<$Res> {
  factory $ProgramDraftSubmittedCopyWith(ProgramDraftSubmitted value, $Res Function(ProgramDraftSubmitted) _then) = _$ProgramDraftSubmittedCopyWithImpl;
@useResult
$Res call({
 ProgramDraftData draftData
});




}
/// @nodoc
class _$ProgramDraftSubmittedCopyWithImpl<$Res>
    implements $ProgramDraftSubmittedCopyWith<$Res> {
  _$ProgramDraftSubmittedCopyWithImpl(this._self, this._then);

  final ProgramDraftSubmitted _self;
  final $Res Function(ProgramDraftSubmitted) _then;

/// Create a copy of ProgramDraftState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? draftData = null,}) {
  return _then(ProgramDraftSubmitted(
draftData: null == draftData ? _self.draftData : draftData // ignore: cast_nullable_to_non_nullable
as ProgramDraftData,
  ));
}


}

/// @nodoc


class ProgramDraftListLoaded implements ProgramDraftState {
  const ProgramDraftListLoaded({required final  List<ProgramRecord> drafts}): _drafts = drafts;
  

 final  List<ProgramRecord> _drafts;
 List<ProgramRecord> get drafts {
  if (_drafts is EqualUnmodifiableListView) return _drafts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_drafts);
}


/// Create a copy of ProgramDraftState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProgramDraftListLoadedCopyWith<ProgramDraftListLoaded> get copyWith => _$ProgramDraftListLoadedCopyWithImpl<ProgramDraftListLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProgramDraftListLoaded&&const DeepCollectionEquality().equals(other._drafts, _drafts));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_drafts));

@override
String toString() {
  return 'ProgramDraftState.draftListLoaded(drafts: $drafts)';
}


}

/// @nodoc
abstract mixin class $ProgramDraftListLoadedCopyWith<$Res> implements $ProgramDraftStateCopyWith<$Res> {
  factory $ProgramDraftListLoadedCopyWith(ProgramDraftListLoaded value, $Res Function(ProgramDraftListLoaded) _then) = _$ProgramDraftListLoadedCopyWithImpl;
@useResult
$Res call({
 List<ProgramRecord> drafts
});




}
/// @nodoc
class _$ProgramDraftListLoadedCopyWithImpl<$Res>
    implements $ProgramDraftListLoadedCopyWith<$Res> {
  _$ProgramDraftListLoadedCopyWithImpl(this._self, this._then);

  final ProgramDraftListLoaded _self;
  final $Res Function(ProgramDraftListLoaded) _then;

/// Create a copy of ProgramDraftState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? drafts = null,}) {
  return _then(ProgramDraftListLoaded(
drafts: null == drafts ? _self._drafts : drafts // ignore: cast_nullable_to_non_nullable
as List<ProgramRecord>,
  ));
}


}

/// @nodoc


class ProgramDraftError implements ProgramDraftState {
  const ProgramDraftError({required this.failure, this.draftData});
  

 final  Failure failure;
 final  ProgramDraftData? draftData;

/// Create a copy of ProgramDraftState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProgramDraftErrorCopyWith<ProgramDraftError> get copyWith => _$ProgramDraftErrorCopyWithImpl<ProgramDraftError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProgramDraftError&&(identical(other.failure, failure) || other.failure == failure)&&(identical(other.draftData, draftData) || other.draftData == draftData));
}


@override
int get hashCode => Object.hash(runtimeType,failure,draftData);

@override
String toString() {
  return 'ProgramDraftState.error(failure: $failure, draftData: $draftData)';
}


}

/// @nodoc
abstract mixin class $ProgramDraftErrorCopyWith<$Res> implements $ProgramDraftStateCopyWith<$Res> {
  factory $ProgramDraftErrorCopyWith(ProgramDraftError value, $Res Function(ProgramDraftError) _then) = _$ProgramDraftErrorCopyWithImpl;
@useResult
$Res call({
 Failure failure, ProgramDraftData? draftData
});




}
/// @nodoc
class _$ProgramDraftErrorCopyWithImpl<$Res>
    implements $ProgramDraftErrorCopyWith<$Res> {
  _$ProgramDraftErrorCopyWithImpl(this._self, this._then);

  final ProgramDraftError _self;
  final $Res Function(ProgramDraftError) _then;

/// Create a copy of ProgramDraftState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failure = null,Object? draftData = freezed,}) {
  return _then(ProgramDraftError(
failure: null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure,draftData: freezed == draftData ? _self.draftData : draftData // ignore: cast_nullable_to_non_nullable
as ProgramDraftData?,
  ));
}


}

// dart format on
