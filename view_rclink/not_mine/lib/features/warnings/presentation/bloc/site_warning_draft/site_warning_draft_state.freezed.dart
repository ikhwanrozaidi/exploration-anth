// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'site_warning_draft_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SiteWarningDraftState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SiteWarningDraftState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SiteWarningDraftState()';
}


}

/// @nodoc
class $SiteWarningDraftStateCopyWith<$Res>  {
$SiteWarningDraftStateCopyWith(SiteWarningDraftState _, $Res Function(SiteWarningDraftState) __);
}


/// Adds pattern-matching-related methods to [SiteWarningDraftState].
extension SiteWarningDraftStatePatterns on SiteWarningDraftState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( SiteWarningDraftInitial value)?  initial,TResult Function( SiteWarningDraftLoading value)?  loading,TResult Function( SiteWarningDraftEditing value)?  editing,TResult Function( SiteWarningDraftAutoSaving value)?  autoSaving,TResult Function( SiteWarningDraftAutoSaved value)?  autoSaved,TResult Function( SiteWarningDraftSubmitting value)?  submitting,TResult Function( SiteWarningDraftSubmitted value)?  submitted,TResult Function( SiteWarningDraftError value)?  error,TResult Function( SiteWarningDraftListLoaded value)?  draftListLoaded,required TResult orElse(),}){
final _that = this;
switch (_that) {
case SiteWarningDraftInitial() when initial != null:
return initial(_that);case SiteWarningDraftLoading() when loading != null:
return loading(_that);case SiteWarningDraftEditing() when editing != null:
return editing(_that);case SiteWarningDraftAutoSaving() when autoSaving != null:
return autoSaving(_that);case SiteWarningDraftAutoSaved() when autoSaved != null:
return autoSaved(_that);case SiteWarningDraftSubmitting() when submitting != null:
return submitting(_that);case SiteWarningDraftSubmitted() when submitted != null:
return submitted(_that);case SiteWarningDraftError() when error != null:
return error(_that);case SiteWarningDraftListLoaded() when draftListLoaded != null:
return draftListLoaded(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( SiteWarningDraftInitial value)  initial,required TResult Function( SiteWarningDraftLoading value)  loading,required TResult Function( SiteWarningDraftEditing value)  editing,required TResult Function( SiteWarningDraftAutoSaving value)  autoSaving,required TResult Function( SiteWarningDraftAutoSaved value)  autoSaved,required TResult Function( SiteWarningDraftSubmitting value)  submitting,required TResult Function( SiteWarningDraftSubmitted value)  submitted,required TResult Function( SiteWarningDraftError value)  error,required TResult Function( SiteWarningDraftListLoaded value)  draftListLoaded,}){
final _that = this;
switch (_that) {
case SiteWarningDraftInitial():
return initial(_that);case SiteWarningDraftLoading():
return loading(_that);case SiteWarningDraftEditing():
return editing(_that);case SiteWarningDraftAutoSaving():
return autoSaving(_that);case SiteWarningDraftAutoSaved():
return autoSaved(_that);case SiteWarningDraftSubmitting():
return submitting(_that);case SiteWarningDraftSubmitted():
return submitted(_that);case SiteWarningDraftError():
return error(_that);case SiteWarningDraftListLoaded():
return draftListLoaded(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( SiteWarningDraftInitial value)?  initial,TResult? Function( SiteWarningDraftLoading value)?  loading,TResult? Function( SiteWarningDraftEditing value)?  editing,TResult? Function( SiteWarningDraftAutoSaving value)?  autoSaving,TResult? Function( SiteWarningDraftAutoSaved value)?  autoSaved,TResult? Function( SiteWarningDraftSubmitting value)?  submitting,TResult? Function( SiteWarningDraftSubmitted value)?  submitted,TResult? Function( SiteWarningDraftError value)?  error,TResult? Function( SiteWarningDraftListLoaded value)?  draftListLoaded,}){
final _that = this;
switch (_that) {
case SiteWarningDraftInitial() when initial != null:
return initial(_that);case SiteWarningDraftLoading() when loading != null:
return loading(_that);case SiteWarningDraftEditing() when editing != null:
return editing(_that);case SiteWarningDraftAutoSaving() when autoSaving != null:
return autoSaving(_that);case SiteWarningDraftAutoSaved() when autoSaved != null:
return autoSaved(_that);case SiteWarningDraftSubmitting() when submitting != null:
return submitting(_that);case SiteWarningDraftSubmitted() when submitted != null:
return submitted(_that);case SiteWarningDraftError() when error != null:
return error(_that);case SiteWarningDraftListLoaded() when draftListLoaded != null:
return draftListLoaded(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( SiteWarningDraftData draftData)?  editing,TResult Function( SiteWarningDraftData draftData)?  autoSaving,TResult Function( SiteWarningDraftData draftData)?  autoSaved,TResult Function( SiteWarningDraftData draftData)?  submitting,TResult Function( SiteWarningDraftData draftData)?  submitted,TResult Function( Failure failure,  SiteWarningDraftData? draftData)?  error,TResult Function( List<Warning> drafts)?  draftListLoaded,required TResult orElse(),}) {final _that = this;
switch (_that) {
case SiteWarningDraftInitial() when initial != null:
return initial();case SiteWarningDraftLoading() when loading != null:
return loading();case SiteWarningDraftEditing() when editing != null:
return editing(_that.draftData);case SiteWarningDraftAutoSaving() when autoSaving != null:
return autoSaving(_that.draftData);case SiteWarningDraftAutoSaved() when autoSaved != null:
return autoSaved(_that.draftData);case SiteWarningDraftSubmitting() when submitting != null:
return submitting(_that.draftData);case SiteWarningDraftSubmitted() when submitted != null:
return submitted(_that.draftData);case SiteWarningDraftError() when error != null:
return error(_that.failure,_that.draftData);case SiteWarningDraftListLoaded() when draftListLoaded != null:
return draftListLoaded(_that.drafts);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( SiteWarningDraftData draftData)  editing,required TResult Function( SiteWarningDraftData draftData)  autoSaving,required TResult Function( SiteWarningDraftData draftData)  autoSaved,required TResult Function( SiteWarningDraftData draftData)  submitting,required TResult Function( SiteWarningDraftData draftData)  submitted,required TResult Function( Failure failure,  SiteWarningDraftData? draftData)  error,required TResult Function( List<Warning> drafts)  draftListLoaded,}) {final _that = this;
switch (_that) {
case SiteWarningDraftInitial():
return initial();case SiteWarningDraftLoading():
return loading();case SiteWarningDraftEditing():
return editing(_that.draftData);case SiteWarningDraftAutoSaving():
return autoSaving(_that.draftData);case SiteWarningDraftAutoSaved():
return autoSaved(_that.draftData);case SiteWarningDraftSubmitting():
return submitting(_that.draftData);case SiteWarningDraftSubmitted():
return submitted(_that.draftData);case SiteWarningDraftError():
return error(_that.failure,_that.draftData);case SiteWarningDraftListLoaded():
return draftListLoaded(_that.drafts);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( SiteWarningDraftData draftData)?  editing,TResult? Function( SiteWarningDraftData draftData)?  autoSaving,TResult? Function( SiteWarningDraftData draftData)?  autoSaved,TResult? Function( SiteWarningDraftData draftData)?  submitting,TResult? Function( SiteWarningDraftData draftData)?  submitted,TResult? Function( Failure failure,  SiteWarningDraftData? draftData)?  error,TResult? Function( List<Warning> drafts)?  draftListLoaded,}) {final _that = this;
switch (_that) {
case SiteWarningDraftInitial() when initial != null:
return initial();case SiteWarningDraftLoading() when loading != null:
return loading();case SiteWarningDraftEditing() when editing != null:
return editing(_that.draftData);case SiteWarningDraftAutoSaving() when autoSaving != null:
return autoSaving(_that.draftData);case SiteWarningDraftAutoSaved() when autoSaved != null:
return autoSaved(_that.draftData);case SiteWarningDraftSubmitting() when submitting != null:
return submitting(_that.draftData);case SiteWarningDraftSubmitted() when submitted != null:
return submitted(_that.draftData);case SiteWarningDraftError() when error != null:
return error(_that.failure,_that.draftData);case SiteWarningDraftListLoaded() when draftListLoaded != null:
return draftListLoaded(_that.drafts);case _:
  return null;

}
}

}

/// @nodoc


class SiteWarningDraftInitial implements SiteWarningDraftState {
  const SiteWarningDraftInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SiteWarningDraftInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SiteWarningDraftState.initial()';
}


}




/// @nodoc


class SiteWarningDraftLoading implements SiteWarningDraftState {
  const SiteWarningDraftLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SiteWarningDraftLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SiteWarningDraftState.loading()';
}


}




/// @nodoc


class SiteWarningDraftEditing implements SiteWarningDraftState {
  const SiteWarningDraftEditing({required this.draftData});
  

 final  SiteWarningDraftData draftData;

/// Create a copy of SiteWarningDraftState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SiteWarningDraftEditingCopyWith<SiteWarningDraftEditing> get copyWith => _$SiteWarningDraftEditingCopyWithImpl<SiteWarningDraftEditing>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SiteWarningDraftEditing&&(identical(other.draftData, draftData) || other.draftData == draftData));
}


@override
int get hashCode => Object.hash(runtimeType,draftData);

@override
String toString() {
  return 'SiteWarningDraftState.editing(draftData: $draftData)';
}


}

/// @nodoc
abstract mixin class $SiteWarningDraftEditingCopyWith<$Res> implements $SiteWarningDraftStateCopyWith<$Res> {
  factory $SiteWarningDraftEditingCopyWith(SiteWarningDraftEditing value, $Res Function(SiteWarningDraftEditing) _then) = _$SiteWarningDraftEditingCopyWithImpl;
@useResult
$Res call({
 SiteWarningDraftData draftData
});


$SiteWarningDraftDataCopyWith<$Res> get draftData;

}
/// @nodoc
class _$SiteWarningDraftEditingCopyWithImpl<$Res>
    implements $SiteWarningDraftEditingCopyWith<$Res> {
  _$SiteWarningDraftEditingCopyWithImpl(this._self, this._then);

  final SiteWarningDraftEditing _self;
  final $Res Function(SiteWarningDraftEditing) _then;

/// Create a copy of SiteWarningDraftState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? draftData = null,}) {
  return _then(SiteWarningDraftEditing(
draftData: null == draftData ? _self.draftData : draftData // ignore: cast_nullable_to_non_nullable
as SiteWarningDraftData,
  ));
}

/// Create a copy of SiteWarningDraftState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SiteWarningDraftDataCopyWith<$Res> get draftData {
  
  return $SiteWarningDraftDataCopyWith<$Res>(_self.draftData, (value) {
    return _then(_self.copyWith(draftData: value));
  });
}
}

/// @nodoc


class SiteWarningDraftAutoSaving implements SiteWarningDraftState {
  const SiteWarningDraftAutoSaving({required this.draftData});
  

 final  SiteWarningDraftData draftData;

/// Create a copy of SiteWarningDraftState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SiteWarningDraftAutoSavingCopyWith<SiteWarningDraftAutoSaving> get copyWith => _$SiteWarningDraftAutoSavingCopyWithImpl<SiteWarningDraftAutoSaving>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SiteWarningDraftAutoSaving&&(identical(other.draftData, draftData) || other.draftData == draftData));
}


@override
int get hashCode => Object.hash(runtimeType,draftData);

@override
String toString() {
  return 'SiteWarningDraftState.autoSaving(draftData: $draftData)';
}


}

/// @nodoc
abstract mixin class $SiteWarningDraftAutoSavingCopyWith<$Res> implements $SiteWarningDraftStateCopyWith<$Res> {
  factory $SiteWarningDraftAutoSavingCopyWith(SiteWarningDraftAutoSaving value, $Res Function(SiteWarningDraftAutoSaving) _then) = _$SiteWarningDraftAutoSavingCopyWithImpl;
@useResult
$Res call({
 SiteWarningDraftData draftData
});


$SiteWarningDraftDataCopyWith<$Res> get draftData;

}
/// @nodoc
class _$SiteWarningDraftAutoSavingCopyWithImpl<$Res>
    implements $SiteWarningDraftAutoSavingCopyWith<$Res> {
  _$SiteWarningDraftAutoSavingCopyWithImpl(this._self, this._then);

  final SiteWarningDraftAutoSaving _self;
  final $Res Function(SiteWarningDraftAutoSaving) _then;

/// Create a copy of SiteWarningDraftState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? draftData = null,}) {
  return _then(SiteWarningDraftAutoSaving(
draftData: null == draftData ? _self.draftData : draftData // ignore: cast_nullable_to_non_nullable
as SiteWarningDraftData,
  ));
}

/// Create a copy of SiteWarningDraftState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SiteWarningDraftDataCopyWith<$Res> get draftData {
  
  return $SiteWarningDraftDataCopyWith<$Res>(_self.draftData, (value) {
    return _then(_self.copyWith(draftData: value));
  });
}
}

/// @nodoc


class SiteWarningDraftAutoSaved implements SiteWarningDraftState {
  const SiteWarningDraftAutoSaved({required this.draftData});
  

 final  SiteWarningDraftData draftData;

/// Create a copy of SiteWarningDraftState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SiteWarningDraftAutoSavedCopyWith<SiteWarningDraftAutoSaved> get copyWith => _$SiteWarningDraftAutoSavedCopyWithImpl<SiteWarningDraftAutoSaved>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SiteWarningDraftAutoSaved&&(identical(other.draftData, draftData) || other.draftData == draftData));
}


@override
int get hashCode => Object.hash(runtimeType,draftData);

@override
String toString() {
  return 'SiteWarningDraftState.autoSaved(draftData: $draftData)';
}


}

/// @nodoc
abstract mixin class $SiteWarningDraftAutoSavedCopyWith<$Res> implements $SiteWarningDraftStateCopyWith<$Res> {
  factory $SiteWarningDraftAutoSavedCopyWith(SiteWarningDraftAutoSaved value, $Res Function(SiteWarningDraftAutoSaved) _then) = _$SiteWarningDraftAutoSavedCopyWithImpl;
@useResult
$Res call({
 SiteWarningDraftData draftData
});


$SiteWarningDraftDataCopyWith<$Res> get draftData;

}
/// @nodoc
class _$SiteWarningDraftAutoSavedCopyWithImpl<$Res>
    implements $SiteWarningDraftAutoSavedCopyWith<$Res> {
  _$SiteWarningDraftAutoSavedCopyWithImpl(this._self, this._then);

  final SiteWarningDraftAutoSaved _self;
  final $Res Function(SiteWarningDraftAutoSaved) _then;

/// Create a copy of SiteWarningDraftState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? draftData = null,}) {
  return _then(SiteWarningDraftAutoSaved(
draftData: null == draftData ? _self.draftData : draftData // ignore: cast_nullable_to_non_nullable
as SiteWarningDraftData,
  ));
}

/// Create a copy of SiteWarningDraftState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SiteWarningDraftDataCopyWith<$Res> get draftData {
  
  return $SiteWarningDraftDataCopyWith<$Res>(_self.draftData, (value) {
    return _then(_self.copyWith(draftData: value));
  });
}
}

/// @nodoc


class SiteWarningDraftSubmitting implements SiteWarningDraftState {
  const SiteWarningDraftSubmitting({required this.draftData});
  

 final  SiteWarningDraftData draftData;

/// Create a copy of SiteWarningDraftState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SiteWarningDraftSubmittingCopyWith<SiteWarningDraftSubmitting> get copyWith => _$SiteWarningDraftSubmittingCopyWithImpl<SiteWarningDraftSubmitting>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SiteWarningDraftSubmitting&&(identical(other.draftData, draftData) || other.draftData == draftData));
}


@override
int get hashCode => Object.hash(runtimeType,draftData);

@override
String toString() {
  return 'SiteWarningDraftState.submitting(draftData: $draftData)';
}


}

/// @nodoc
abstract mixin class $SiteWarningDraftSubmittingCopyWith<$Res> implements $SiteWarningDraftStateCopyWith<$Res> {
  factory $SiteWarningDraftSubmittingCopyWith(SiteWarningDraftSubmitting value, $Res Function(SiteWarningDraftSubmitting) _then) = _$SiteWarningDraftSubmittingCopyWithImpl;
@useResult
$Res call({
 SiteWarningDraftData draftData
});


$SiteWarningDraftDataCopyWith<$Res> get draftData;

}
/// @nodoc
class _$SiteWarningDraftSubmittingCopyWithImpl<$Res>
    implements $SiteWarningDraftSubmittingCopyWith<$Res> {
  _$SiteWarningDraftSubmittingCopyWithImpl(this._self, this._then);

  final SiteWarningDraftSubmitting _self;
  final $Res Function(SiteWarningDraftSubmitting) _then;

/// Create a copy of SiteWarningDraftState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? draftData = null,}) {
  return _then(SiteWarningDraftSubmitting(
draftData: null == draftData ? _self.draftData : draftData // ignore: cast_nullable_to_non_nullable
as SiteWarningDraftData,
  ));
}

/// Create a copy of SiteWarningDraftState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SiteWarningDraftDataCopyWith<$Res> get draftData {
  
  return $SiteWarningDraftDataCopyWith<$Res>(_self.draftData, (value) {
    return _then(_self.copyWith(draftData: value));
  });
}
}

/// @nodoc


class SiteWarningDraftSubmitted implements SiteWarningDraftState {
  const SiteWarningDraftSubmitted({required this.draftData});
  

 final  SiteWarningDraftData draftData;

/// Create a copy of SiteWarningDraftState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SiteWarningDraftSubmittedCopyWith<SiteWarningDraftSubmitted> get copyWith => _$SiteWarningDraftSubmittedCopyWithImpl<SiteWarningDraftSubmitted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SiteWarningDraftSubmitted&&(identical(other.draftData, draftData) || other.draftData == draftData));
}


@override
int get hashCode => Object.hash(runtimeType,draftData);

@override
String toString() {
  return 'SiteWarningDraftState.submitted(draftData: $draftData)';
}


}

/// @nodoc
abstract mixin class $SiteWarningDraftSubmittedCopyWith<$Res> implements $SiteWarningDraftStateCopyWith<$Res> {
  factory $SiteWarningDraftSubmittedCopyWith(SiteWarningDraftSubmitted value, $Res Function(SiteWarningDraftSubmitted) _then) = _$SiteWarningDraftSubmittedCopyWithImpl;
@useResult
$Res call({
 SiteWarningDraftData draftData
});


$SiteWarningDraftDataCopyWith<$Res> get draftData;

}
/// @nodoc
class _$SiteWarningDraftSubmittedCopyWithImpl<$Res>
    implements $SiteWarningDraftSubmittedCopyWith<$Res> {
  _$SiteWarningDraftSubmittedCopyWithImpl(this._self, this._then);

  final SiteWarningDraftSubmitted _self;
  final $Res Function(SiteWarningDraftSubmitted) _then;

/// Create a copy of SiteWarningDraftState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? draftData = null,}) {
  return _then(SiteWarningDraftSubmitted(
draftData: null == draftData ? _self.draftData : draftData // ignore: cast_nullable_to_non_nullable
as SiteWarningDraftData,
  ));
}

/// Create a copy of SiteWarningDraftState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SiteWarningDraftDataCopyWith<$Res> get draftData {
  
  return $SiteWarningDraftDataCopyWith<$Res>(_self.draftData, (value) {
    return _then(_self.copyWith(draftData: value));
  });
}
}

/// @nodoc


class SiteWarningDraftError implements SiteWarningDraftState {
  const SiteWarningDraftError({required this.failure, this.draftData});
  

 final  Failure failure;
 final  SiteWarningDraftData? draftData;

/// Create a copy of SiteWarningDraftState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SiteWarningDraftErrorCopyWith<SiteWarningDraftError> get copyWith => _$SiteWarningDraftErrorCopyWithImpl<SiteWarningDraftError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SiteWarningDraftError&&(identical(other.failure, failure) || other.failure == failure)&&(identical(other.draftData, draftData) || other.draftData == draftData));
}


@override
int get hashCode => Object.hash(runtimeType,failure,draftData);

@override
String toString() {
  return 'SiteWarningDraftState.error(failure: $failure, draftData: $draftData)';
}


}

/// @nodoc
abstract mixin class $SiteWarningDraftErrorCopyWith<$Res> implements $SiteWarningDraftStateCopyWith<$Res> {
  factory $SiteWarningDraftErrorCopyWith(SiteWarningDraftError value, $Res Function(SiteWarningDraftError) _then) = _$SiteWarningDraftErrorCopyWithImpl;
@useResult
$Res call({
 Failure failure, SiteWarningDraftData? draftData
});


$SiteWarningDraftDataCopyWith<$Res>? get draftData;

}
/// @nodoc
class _$SiteWarningDraftErrorCopyWithImpl<$Res>
    implements $SiteWarningDraftErrorCopyWith<$Res> {
  _$SiteWarningDraftErrorCopyWithImpl(this._self, this._then);

  final SiteWarningDraftError _self;
  final $Res Function(SiteWarningDraftError) _then;

/// Create a copy of SiteWarningDraftState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failure = null,Object? draftData = freezed,}) {
  return _then(SiteWarningDraftError(
failure: null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure,draftData: freezed == draftData ? _self.draftData : draftData // ignore: cast_nullable_to_non_nullable
as SiteWarningDraftData?,
  ));
}

/// Create a copy of SiteWarningDraftState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SiteWarningDraftDataCopyWith<$Res>? get draftData {
    if (_self.draftData == null) {
    return null;
  }

  return $SiteWarningDraftDataCopyWith<$Res>(_self.draftData!, (value) {
    return _then(_self.copyWith(draftData: value));
  });
}
}

/// @nodoc


class SiteWarningDraftListLoaded implements SiteWarningDraftState {
  const SiteWarningDraftListLoaded({required final  List<Warning> drafts}): _drafts = drafts;
  

 final  List<Warning> _drafts;
 List<Warning> get drafts {
  if (_drafts is EqualUnmodifiableListView) return _drafts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_drafts);
}


/// Create a copy of SiteWarningDraftState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SiteWarningDraftListLoadedCopyWith<SiteWarningDraftListLoaded> get copyWith => _$SiteWarningDraftListLoadedCopyWithImpl<SiteWarningDraftListLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SiteWarningDraftListLoaded&&const DeepCollectionEquality().equals(other._drafts, _drafts));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_drafts));

@override
String toString() {
  return 'SiteWarningDraftState.draftListLoaded(drafts: $drafts)';
}


}

/// @nodoc
abstract mixin class $SiteWarningDraftListLoadedCopyWith<$Res> implements $SiteWarningDraftStateCopyWith<$Res> {
  factory $SiteWarningDraftListLoadedCopyWith(SiteWarningDraftListLoaded value, $Res Function(SiteWarningDraftListLoaded) _then) = _$SiteWarningDraftListLoadedCopyWithImpl;
@useResult
$Res call({
 List<Warning> drafts
});




}
/// @nodoc
class _$SiteWarningDraftListLoadedCopyWithImpl<$Res>
    implements $SiteWarningDraftListLoadedCopyWith<$Res> {
  _$SiteWarningDraftListLoadedCopyWithImpl(this._self, this._then);

  final SiteWarningDraftListLoaded _self;
  final $Res Function(SiteWarningDraftListLoaded) _then;

/// Create a copy of SiteWarningDraftState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? drafts = null,}) {
  return _then(SiteWarningDraftListLoaded(
drafts: null == drafts ? _self._drafts : drafts // ignore: cast_nullable_to_non_nullable
as List<Warning>,
  ));
}


}

/// @nodoc
mixin _$SiteWarningDraftData {

 String? get draftUID; bool get isDraftMode; String get companyUID; int get scopeID; String get scopeUID; String get scopeName; Road get road; String get startSection; String? get endSection; double? get latitude; double? get longitude; ContractorRelation? get contractor; List<String> get warningReasonUIDs; String get description; List<String> get warningImages;
/// Create a copy of SiteWarningDraftData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SiteWarningDraftDataCopyWith<SiteWarningDraftData> get copyWith => _$SiteWarningDraftDataCopyWithImpl<SiteWarningDraftData>(this as SiteWarningDraftData, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SiteWarningDraftData&&(identical(other.draftUID, draftUID) || other.draftUID == draftUID)&&(identical(other.isDraftMode, isDraftMode) || other.isDraftMode == isDraftMode)&&(identical(other.companyUID, companyUID) || other.companyUID == companyUID)&&(identical(other.scopeID, scopeID) || other.scopeID == scopeID)&&(identical(other.scopeUID, scopeUID) || other.scopeUID == scopeUID)&&(identical(other.scopeName, scopeName) || other.scopeName == scopeName)&&(identical(other.road, road) || other.road == road)&&(identical(other.startSection, startSection) || other.startSection == startSection)&&(identical(other.endSection, endSection) || other.endSection == endSection)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.contractor, contractor) || other.contractor == contractor)&&const DeepCollectionEquality().equals(other.warningReasonUIDs, warningReasonUIDs)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.warningImages, warningImages));
}


@override
int get hashCode => Object.hash(runtimeType,draftUID,isDraftMode,companyUID,scopeID,scopeUID,scopeName,road,startSection,endSection,latitude,longitude,contractor,const DeepCollectionEquality().hash(warningReasonUIDs),description,const DeepCollectionEquality().hash(warningImages));

@override
String toString() {
  return 'SiteWarningDraftData(draftUID: $draftUID, isDraftMode: $isDraftMode, companyUID: $companyUID, scopeID: $scopeID, scopeUID: $scopeUID, scopeName: $scopeName, road: $road, startSection: $startSection, endSection: $endSection, latitude: $latitude, longitude: $longitude, contractor: $contractor, warningReasonUIDs: $warningReasonUIDs, description: $description, warningImages: $warningImages)';
}


}

/// @nodoc
abstract mixin class $SiteWarningDraftDataCopyWith<$Res>  {
  factory $SiteWarningDraftDataCopyWith(SiteWarningDraftData value, $Res Function(SiteWarningDraftData) _then) = _$SiteWarningDraftDataCopyWithImpl;
@useResult
$Res call({
 String? draftUID, bool isDraftMode, String companyUID, int scopeID, String scopeUID, String scopeName, Road road, String startSection, String? endSection, double? latitude, double? longitude, ContractorRelation? contractor, List<String> warningReasonUIDs, String description, List<String> warningImages
});




}
/// @nodoc
class _$SiteWarningDraftDataCopyWithImpl<$Res>
    implements $SiteWarningDraftDataCopyWith<$Res> {
  _$SiteWarningDraftDataCopyWithImpl(this._self, this._then);

  final SiteWarningDraftData _self;
  final $Res Function(SiteWarningDraftData) _then;

/// Create a copy of SiteWarningDraftData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? draftUID = freezed,Object? isDraftMode = null,Object? companyUID = null,Object? scopeID = null,Object? scopeUID = null,Object? scopeName = null,Object? road = null,Object? startSection = null,Object? endSection = freezed,Object? latitude = freezed,Object? longitude = freezed,Object? contractor = freezed,Object? warningReasonUIDs = null,Object? description = null,Object? warningImages = null,}) {
  return _then(_self.copyWith(
draftUID: freezed == draftUID ? _self.draftUID : draftUID // ignore: cast_nullable_to_non_nullable
as String?,isDraftMode: null == isDraftMode ? _self.isDraftMode : isDraftMode // ignore: cast_nullable_to_non_nullable
as bool,companyUID: null == companyUID ? _self.companyUID : companyUID // ignore: cast_nullable_to_non_nullable
as String,scopeID: null == scopeID ? _self.scopeID : scopeID // ignore: cast_nullable_to_non_nullable
as int,scopeUID: null == scopeUID ? _self.scopeUID : scopeUID // ignore: cast_nullable_to_non_nullable
as String,scopeName: null == scopeName ? _self.scopeName : scopeName // ignore: cast_nullable_to_non_nullable
as String,road: null == road ? _self.road : road // ignore: cast_nullable_to_non_nullable
as Road,startSection: null == startSection ? _self.startSection : startSection // ignore: cast_nullable_to_non_nullable
as String,endSection: freezed == endSection ? _self.endSection : endSection // ignore: cast_nullable_to_non_nullable
as String?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,contractor: freezed == contractor ? _self.contractor : contractor // ignore: cast_nullable_to_non_nullable
as ContractorRelation?,warningReasonUIDs: null == warningReasonUIDs ? _self.warningReasonUIDs : warningReasonUIDs // ignore: cast_nullable_to_non_nullable
as List<String>,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,warningImages: null == warningImages ? _self.warningImages : warningImages // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [SiteWarningDraftData].
extension SiteWarningDraftDataPatterns on SiteWarningDraftData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SiteWarningDraftData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SiteWarningDraftData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SiteWarningDraftData value)  $default,){
final _that = this;
switch (_that) {
case _SiteWarningDraftData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SiteWarningDraftData value)?  $default,){
final _that = this;
switch (_that) {
case _SiteWarningDraftData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? draftUID,  bool isDraftMode,  String companyUID,  int scopeID,  String scopeUID,  String scopeName,  Road road,  String startSection,  String? endSection,  double? latitude,  double? longitude,  ContractorRelation? contractor,  List<String> warningReasonUIDs,  String description,  List<String> warningImages)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SiteWarningDraftData() when $default != null:
return $default(_that.draftUID,_that.isDraftMode,_that.companyUID,_that.scopeID,_that.scopeUID,_that.scopeName,_that.road,_that.startSection,_that.endSection,_that.latitude,_that.longitude,_that.contractor,_that.warningReasonUIDs,_that.description,_that.warningImages);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? draftUID,  bool isDraftMode,  String companyUID,  int scopeID,  String scopeUID,  String scopeName,  Road road,  String startSection,  String? endSection,  double? latitude,  double? longitude,  ContractorRelation? contractor,  List<String> warningReasonUIDs,  String description,  List<String> warningImages)  $default,) {final _that = this;
switch (_that) {
case _SiteWarningDraftData():
return $default(_that.draftUID,_that.isDraftMode,_that.companyUID,_that.scopeID,_that.scopeUID,_that.scopeName,_that.road,_that.startSection,_that.endSection,_that.latitude,_that.longitude,_that.contractor,_that.warningReasonUIDs,_that.description,_that.warningImages);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? draftUID,  bool isDraftMode,  String companyUID,  int scopeID,  String scopeUID,  String scopeName,  Road road,  String startSection,  String? endSection,  double? latitude,  double? longitude,  ContractorRelation? contractor,  List<String> warningReasonUIDs,  String description,  List<String> warningImages)?  $default,) {final _that = this;
switch (_that) {
case _SiteWarningDraftData() when $default != null:
return $default(_that.draftUID,_that.isDraftMode,_that.companyUID,_that.scopeID,_that.scopeUID,_that.scopeName,_that.road,_that.startSection,_that.endSection,_that.latitude,_that.longitude,_that.contractor,_that.warningReasonUIDs,_that.description,_that.warningImages);case _:
  return null;

}
}

}

/// @nodoc


class _SiteWarningDraftData implements SiteWarningDraftData {
  const _SiteWarningDraftData({this.draftUID, this.isDraftMode = false, required this.companyUID, required this.scopeID, required this.scopeUID, required this.scopeName, required this.road, required this.startSection, this.endSection, this.latitude, this.longitude, this.contractor, final  List<String> warningReasonUIDs = const [], this.description = '', final  List<String> warningImages = const []}): _warningReasonUIDs = warningReasonUIDs,_warningImages = warningImages;
  

@override final  String? draftUID;
@override@JsonKey() final  bool isDraftMode;
@override final  String companyUID;
@override final  int scopeID;
@override final  String scopeUID;
@override final  String scopeName;
@override final  Road road;
@override final  String startSection;
@override final  String? endSection;
@override final  double? latitude;
@override final  double? longitude;
@override final  ContractorRelation? contractor;
 final  List<String> _warningReasonUIDs;
@override@JsonKey() List<String> get warningReasonUIDs {
  if (_warningReasonUIDs is EqualUnmodifiableListView) return _warningReasonUIDs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_warningReasonUIDs);
}

@override@JsonKey() final  String description;
 final  List<String> _warningImages;
@override@JsonKey() List<String> get warningImages {
  if (_warningImages is EqualUnmodifiableListView) return _warningImages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_warningImages);
}


/// Create a copy of SiteWarningDraftData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SiteWarningDraftDataCopyWith<_SiteWarningDraftData> get copyWith => __$SiteWarningDraftDataCopyWithImpl<_SiteWarningDraftData>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SiteWarningDraftData&&(identical(other.draftUID, draftUID) || other.draftUID == draftUID)&&(identical(other.isDraftMode, isDraftMode) || other.isDraftMode == isDraftMode)&&(identical(other.companyUID, companyUID) || other.companyUID == companyUID)&&(identical(other.scopeID, scopeID) || other.scopeID == scopeID)&&(identical(other.scopeUID, scopeUID) || other.scopeUID == scopeUID)&&(identical(other.scopeName, scopeName) || other.scopeName == scopeName)&&(identical(other.road, road) || other.road == road)&&(identical(other.startSection, startSection) || other.startSection == startSection)&&(identical(other.endSection, endSection) || other.endSection == endSection)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.contractor, contractor) || other.contractor == contractor)&&const DeepCollectionEquality().equals(other._warningReasonUIDs, _warningReasonUIDs)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other._warningImages, _warningImages));
}


@override
int get hashCode => Object.hash(runtimeType,draftUID,isDraftMode,companyUID,scopeID,scopeUID,scopeName,road,startSection,endSection,latitude,longitude,contractor,const DeepCollectionEquality().hash(_warningReasonUIDs),description,const DeepCollectionEquality().hash(_warningImages));

@override
String toString() {
  return 'SiteWarningDraftData(draftUID: $draftUID, isDraftMode: $isDraftMode, companyUID: $companyUID, scopeID: $scopeID, scopeUID: $scopeUID, scopeName: $scopeName, road: $road, startSection: $startSection, endSection: $endSection, latitude: $latitude, longitude: $longitude, contractor: $contractor, warningReasonUIDs: $warningReasonUIDs, description: $description, warningImages: $warningImages)';
}


}

/// @nodoc
abstract mixin class _$SiteWarningDraftDataCopyWith<$Res> implements $SiteWarningDraftDataCopyWith<$Res> {
  factory _$SiteWarningDraftDataCopyWith(_SiteWarningDraftData value, $Res Function(_SiteWarningDraftData) _then) = __$SiteWarningDraftDataCopyWithImpl;
@override @useResult
$Res call({
 String? draftUID, bool isDraftMode, String companyUID, int scopeID, String scopeUID, String scopeName, Road road, String startSection, String? endSection, double? latitude, double? longitude, ContractorRelation? contractor, List<String> warningReasonUIDs, String description, List<String> warningImages
});




}
/// @nodoc
class __$SiteWarningDraftDataCopyWithImpl<$Res>
    implements _$SiteWarningDraftDataCopyWith<$Res> {
  __$SiteWarningDraftDataCopyWithImpl(this._self, this._then);

  final _SiteWarningDraftData _self;
  final $Res Function(_SiteWarningDraftData) _then;

/// Create a copy of SiteWarningDraftData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? draftUID = freezed,Object? isDraftMode = null,Object? companyUID = null,Object? scopeID = null,Object? scopeUID = null,Object? scopeName = null,Object? road = null,Object? startSection = null,Object? endSection = freezed,Object? latitude = freezed,Object? longitude = freezed,Object? contractor = freezed,Object? warningReasonUIDs = null,Object? description = null,Object? warningImages = null,}) {
  return _then(_SiteWarningDraftData(
draftUID: freezed == draftUID ? _self.draftUID : draftUID // ignore: cast_nullable_to_non_nullable
as String?,isDraftMode: null == isDraftMode ? _self.isDraftMode : isDraftMode // ignore: cast_nullable_to_non_nullable
as bool,companyUID: null == companyUID ? _self.companyUID : companyUID // ignore: cast_nullable_to_non_nullable
as String,scopeID: null == scopeID ? _self.scopeID : scopeID // ignore: cast_nullable_to_non_nullable
as int,scopeUID: null == scopeUID ? _self.scopeUID : scopeUID // ignore: cast_nullable_to_non_nullable
as String,scopeName: null == scopeName ? _self.scopeName : scopeName // ignore: cast_nullable_to_non_nullable
as String,road: null == road ? _self.road : road // ignore: cast_nullable_to_non_nullable
as Road,startSection: null == startSection ? _self.startSection : startSection // ignore: cast_nullable_to_non_nullable
as String,endSection: freezed == endSection ? _self.endSection : endSection // ignore: cast_nullable_to_non_nullable
as String?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,contractor: freezed == contractor ? _self.contractor : contractor // ignore: cast_nullable_to_non_nullable
as ContractorRelation?,warningReasonUIDs: null == warningReasonUIDs ? _self._warningReasonUIDs : warningReasonUIDs // ignore: cast_nullable_to_non_nullable
as List<String>,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,warningImages: null == warningImages ? _self._warningImages : warningImages // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
