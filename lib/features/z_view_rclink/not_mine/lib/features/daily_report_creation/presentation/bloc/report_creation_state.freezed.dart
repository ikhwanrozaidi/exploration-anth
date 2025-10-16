// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'report_creation_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ReportCreationState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReportCreationState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ReportCreationState()';
}


}

/// @nodoc
class $ReportCreationStateCopyWith<$Res>  {
$ReportCreationStateCopyWith(ReportCreationState _, $Res Function(ReportCreationState) __);
}


/// Adds pattern-matching-related methods to [ReportCreationState].
extension ReportCreationStatePatterns on ReportCreationState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ReportInitial value)?  initial,TResult Function( ReportSelectingBasicInfo value)?  selectingBasicInfo,TResult Function( ReportBasicInfoError value)?  basicInfoError,TResult Function( ReportEditingDetails value)?  editingDetails,TResult Function( ReportDetailsError value)?  detailsError,TResult Function( ReportSubmitting value)?  submitting,TResult Function( ReportSubmitted value)?  submitted,TResult Function( ReportSubmissionError value)?  submissionError,TResult Function( ReportDraftSaved value)?  draftSaved,TResult Function( ReportDraftError value)?  draftError,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ReportInitial() when initial != null:
return initial(_that);case ReportSelectingBasicInfo() when selectingBasicInfo != null:
return selectingBasicInfo(_that);case ReportBasicInfoError() when basicInfoError != null:
return basicInfoError(_that);case ReportEditingDetails() when editingDetails != null:
return editingDetails(_that);case ReportDetailsError() when detailsError != null:
return detailsError(_that);case ReportSubmitting() when submitting != null:
return submitting(_that);case ReportSubmitted() when submitted != null:
return submitted(_that);case ReportSubmissionError() when submissionError != null:
return submissionError(_that);case ReportDraftSaved() when draftSaved != null:
return draftSaved(_that);case ReportDraftError() when draftError != null:
return draftError(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ReportInitial value)  initial,required TResult Function( ReportSelectingBasicInfo value)  selectingBasicInfo,required TResult Function( ReportBasicInfoError value)  basicInfoError,required TResult Function( ReportEditingDetails value)  editingDetails,required TResult Function( ReportDetailsError value)  detailsError,required TResult Function( ReportSubmitting value)  submitting,required TResult Function( ReportSubmitted value)  submitted,required TResult Function( ReportSubmissionError value)  submissionError,required TResult Function( ReportDraftSaved value)  draftSaved,required TResult Function( ReportDraftError value)  draftError,}){
final _that = this;
switch (_that) {
case ReportInitial():
return initial(_that);case ReportSelectingBasicInfo():
return selectingBasicInfo(_that);case ReportBasicInfoError():
return basicInfoError(_that);case ReportEditingDetails():
return editingDetails(_that);case ReportDetailsError():
return detailsError(_that);case ReportSubmitting():
return submitting(_that);case ReportSubmitted():
return submitted(_that);case ReportSubmissionError():
return submissionError(_that);case ReportDraftSaved():
return draftSaved(_that);case ReportDraftError():
return draftError(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ReportInitial value)?  initial,TResult? Function( ReportSelectingBasicInfo value)?  selectingBasicInfo,TResult? Function( ReportBasicInfoError value)?  basicInfoError,TResult? Function( ReportEditingDetails value)?  editingDetails,TResult? Function( ReportDetailsError value)?  detailsError,TResult? Function( ReportSubmitting value)?  submitting,TResult? Function( ReportSubmitted value)?  submitted,TResult? Function( ReportSubmissionError value)?  submissionError,TResult? Function( ReportDraftSaved value)?  draftSaved,TResult? Function( ReportDraftError value)?  draftError,}){
final _that = this;
switch (_that) {
case ReportInitial() when initial != null:
return initial(_that);case ReportSelectingBasicInfo() when selectingBasicInfo != null:
return selectingBasicInfo(_that);case ReportBasicInfoError() when basicInfoError != null:
return basicInfoError(_that);case ReportEditingDetails() when editingDetails != null:
return editingDetails(_that);case ReportDetailsError() when detailsError != null:
return detailsError(_that);case ReportSubmitting() when submitting != null:
return submitting(_that);case ReportSubmitted() when submitted != null:
return submitted(_that);case ReportSubmissionError() when submissionError != null:
return submissionError(_that);case ReportDraftSaved() when draftSaved != null:
return draftSaved(_that);case ReportDraftError() when draftError != null:
return draftError(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function( ReportApiData apiData,  ReportSelections selections)?  selectingBasicInfo,TResult Function( ReportApiData apiData,  ReportSelections selections,  String errorMessage)?  basicInfoError,TResult Function( ReportApiData apiData,  ReportSelections selections,  ReportFormData formData)?  editingDetails,TResult Function( ReportApiData apiData,  ReportSelections selections,  ReportFormData formData,  String errorMessage)?  detailsError,TResult Function( ReportData reportData)?  submitting,TResult Function( ReportData reportData)?  submitted,TResult Function( ReportData reportData,  String errorMessage)?  submissionError,TResult Function( ReportData reportData)?  draftSaved,TResult Function( ReportData reportData,  String errorMessage)?  draftError,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ReportInitial() when initial != null:
return initial();case ReportSelectingBasicInfo() when selectingBasicInfo != null:
return selectingBasicInfo(_that.apiData,_that.selections);case ReportBasicInfoError() when basicInfoError != null:
return basicInfoError(_that.apiData,_that.selections,_that.errorMessage);case ReportEditingDetails() when editingDetails != null:
return editingDetails(_that.apiData,_that.selections,_that.formData);case ReportDetailsError() when detailsError != null:
return detailsError(_that.apiData,_that.selections,_that.formData,_that.errorMessage);case ReportSubmitting() when submitting != null:
return submitting(_that.reportData);case ReportSubmitted() when submitted != null:
return submitted(_that.reportData);case ReportSubmissionError() when submissionError != null:
return submissionError(_that.reportData,_that.errorMessage);case ReportDraftSaved() when draftSaved != null:
return draftSaved(_that.reportData);case ReportDraftError() when draftError != null:
return draftError(_that.reportData,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function( ReportApiData apiData,  ReportSelections selections)  selectingBasicInfo,required TResult Function( ReportApiData apiData,  ReportSelections selections,  String errorMessage)  basicInfoError,required TResult Function( ReportApiData apiData,  ReportSelections selections,  ReportFormData formData)  editingDetails,required TResult Function( ReportApiData apiData,  ReportSelections selections,  ReportFormData formData,  String errorMessage)  detailsError,required TResult Function( ReportData reportData)  submitting,required TResult Function( ReportData reportData)  submitted,required TResult Function( ReportData reportData,  String errorMessage)  submissionError,required TResult Function( ReportData reportData)  draftSaved,required TResult Function( ReportData reportData,  String errorMessage)  draftError,}) {final _that = this;
switch (_that) {
case ReportInitial():
return initial();case ReportSelectingBasicInfo():
return selectingBasicInfo(_that.apiData,_that.selections);case ReportBasicInfoError():
return basicInfoError(_that.apiData,_that.selections,_that.errorMessage);case ReportEditingDetails():
return editingDetails(_that.apiData,_that.selections,_that.formData);case ReportDetailsError():
return detailsError(_that.apiData,_that.selections,_that.formData,_that.errorMessage);case ReportSubmitting():
return submitting(_that.reportData);case ReportSubmitted():
return submitted(_that.reportData);case ReportSubmissionError():
return submissionError(_that.reportData,_that.errorMessage);case ReportDraftSaved():
return draftSaved(_that.reportData);case ReportDraftError():
return draftError(_that.reportData,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function( ReportApiData apiData,  ReportSelections selections)?  selectingBasicInfo,TResult? Function( ReportApiData apiData,  ReportSelections selections,  String errorMessage)?  basicInfoError,TResult? Function( ReportApiData apiData,  ReportSelections selections,  ReportFormData formData)?  editingDetails,TResult? Function( ReportApiData apiData,  ReportSelections selections,  ReportFormData formData,  String errorMessage)?  detailsError,TResult? Function( ReportData reportData)?  submitting,TResult? Function( ReportData reportData)?  submitted,TResult? Function( ReportData reportData,  String errorMessage)?  submissionError,TResult? Function( ReportData reportData)?  draftSaved,TResult? Function( ReportData reportData,  String errorMessage)?  draftError,}) {final _that = this;
switch (_that) {
case ReportInitial() when initial != null:
return initial();case ReportSelectingBasicInfo() when selectingBasicInfo != null:
return selectingBasicInfo(_that.apiData,_that.selections);case ReportBasicInfoError() when basicInfoError != null:
return basicInfoError(_that.apiData,_that.selections,_that.errorMessage);case ReportEditingDetails() when editingDetails != null:
return editingDetails(_that.apiData,_that.selections,_that.formData);case ReportDetailsError() when detailsError != null:
return detailsError(_that.apiData,_that.selections,_that.formData,_that.errorMessage);case ReportSubmitting() when submitting != null:
return submitting(_that.reportData);case ReportSubmitted() when submitted != null:
return submitted(_that.reportData);case ReportSubmissionError() when submissionError != null:
return submissionError(_that.reportData,_that.errorMessage);case ReportDraftSaved() when draftSaved != null:
return draftSaved(_that.reportData);case ReportDraftError() when draftError != null:
return draftError(_that.reportData,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class ReportInitial implements ReportCreationState {
  const ReportInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReportInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ReportCreationState.initial()';
}


}




/// @nodoc


class ReportSelectingBasicInfo implements ReportCreationState {
  const ReportSelectingBasicInfo({required this.apiData, required this.selections});
  

 final  ReportApiData apiData;
 final  ReportSelections selections;

/// Create a copy of ReportCreationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReportSelectingBasicInfoCopyWith<ReportSelectingBasicInfo> get copyWith => _$ReportSelectingBasicInfoCopyWithImpl<ReportSelectingBasicInfo>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReportSelectingBasicInfo&&(identical(other.apiData, apiData) || other.apiData == apiData)&&(identical(other.selections, selections) || other.selections == selections));
}


@override
int get hashCode => Object.hash(runtimeType,apiData,selections);

@override
String toString() {
  return 'ReportCreationState.selectingBasicInfo(apiData: $apiData, selections: $selections)';
}


}

/// @nodoc
abstract mixin class $ReportSelectingBasicInfoCopyWith<$Res> implements $ReportCreationStateCopyWith<$Res> {
  factory $ReportSelectingBasicInfoCopyWith(ReportSelectingBasicInfo value, $Res Function(ReportSelectingBasicInfo) _then) = _$ReportSelectingBasicInfoCopyWithImpl;
@useResult
$Res call({
 ReportApiData apiData, ReportSelections selections
});


$ReportApiDataCopyWith<$Res> get apiData;$ReportSelectionsCopyWith<$Res> get selections;

}
/// @nodoc
class _$ReportSelectingBasicInfoCopyWithImpl<$Res>
    implements $ReportSelectingBasicInfoCopyWith<$Res> {
  _$ReportSelectingBasicInfoCopyWithImpl(this._self, this._then);

  final ReportSelectingBasicInfo _self;
  final $Res Function(ReportSelectingBasicInfo) _then;

/// Create a copy of ReportCreationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? apiData = null,Object? selections = null,}) {
  return _then(ReportSelectingBasicInfo(
apiData: null == apiData ? _self.apiData : apiData // ignore: cast_nullable_to_non_nullable
as ReportApiData,selections: null == selections ? _self.selections : selections // ignore: cast_nullable_to_non_nullable
as ReportSelections,
  ));
}

/// Create a copy of ReportCreationState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReportApiDataCopyWith<$Res> get apiData {
  
  return $ReportApiDataCopyWith<$Res>(_self.apiData, (value) {
    return _then(_self.copyWith(apiData: value));
  });
}/// Create a copy of ReportCreationState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReportSelectionsCopyWith<$Res> get selections {
  
  return $ReportSelectionsCopyWith<$Res>(_self.selections, (value) {
    return _then(_self.copyWith(selections: value));
  });
}
}

/// @nodoc


class ReportBasicInfoError implements ReportCreationState {
  const ReportBasicInfoError({required this.apiData, required this.selections, required this.errorMessage});
  

 final  ReportApiData apiData;
 final  ReportSelections selections;
 final  String errorMessage;

/// Create a copy of ReportCreationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReportBasicInfoErrorCopyWith<ReportBasicInfoError> get copyWith => _$ReportBasicInfoErrorCopyWithImpl<ReportBasicInfoError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReportBasicInfoError&&(identical(other.apiData, apiData) || other.apiData == apiData)&&(identical(other.selections, selections) || other.selections == selections)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,apiData,selections,errorMessage);

@override
String toString() {
  return 'ReportCreationState.basicInfoError(apiData: $apiData, selections: $selections, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $ReportBasicInfoErrorCopyWith<$Res> implements $ReportCreationStateCopyWith<$Res> {
  factory $ReportBasicInfoErrorCopyWith(ReportBasicInfoError value, $Res Function(ReportBasicInfoError) _then) = _$ReportBasicInfoErrorCopyWithImpl;
@useResult
$Res call({
 ReportApiData apiData, ReportSelections selections, String errorMessage
});


$ReportApiDataCopyWith<$Res> get apiData;$ReportSelectionsCopyWith<$Res> get selections;

}
/// @nodoc
class _$ReportBasicInfoErrorCopyWithImpl<$Res>
    implements $ReportBasicInfoErrorCopyWith<$Res> {
  _$ReportBasicInfoErrorCopyWithImpl(this._self, this._then);

  final ReportBasicInfoError _self;
  final $Res Function(ReportBasicInfoError) _then;

/// Create a copy of ReportCreationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? apiData = null,Object? selections = null,Object? errorMessage = null,}) {
  return _then(ReportBasicInfoError(
apiData: null == apiData ? _self.apiData : apiData // ignore: cast_nullable_to_non_nullable
as ReportApiData,selections: null == selections ? _self.selections : selections // ignore: cast_nullable_to_non_nullable
as ReportSelections,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of ReportCreationState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReportApiDataCopyWith<$Res> get apiData {
  
  return $ReportApiDataCopyWith<$Res>(_self.apiData, (value) {
    return _then(_self.copyWith(apiData: value));
  });
}/// Create a copy of ReportCreationState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReportSelectionsCopyWith<$Res> get selections {
  
  return $ReportSelectionsCopyWith<$Res>(_self.selections, (value) {
    return _then(_self.copyWith(selections: value));
  });
}
}

/// @nodoc


class ReportEditingDetails implements ReportCreationState {
  const ReportEditingDetails({required this.apiData, required this.selections, required this.formData});
  

 final  ReportApiData apiData;
 final  ReportSelections selections;
 final  ReportFormData formData;

/// Create a copy of ReportCreationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReportEditingDetailsCopyWith<ReportEditingDetails> get copyWith => _$ReportEditingDetailsCopyWithImpl<ReportEditingDetails>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReportEditingDetails&&(identical(other.apiData, apiData) || other.apiData == apiData)&&(identical(other.selections, selections) || other.selections == selections)&&(identical(other.formData, formData) || other.formData == formData));
}


@override
int get hashCode => Object.hash(runtimeType,apiData,selections,formData);

@override
String toString() {
  return 'ReportCreationState.editingDetails(apiData: $apiData, selections: $selections, formData: $formData)';
}


}

/// @nodoc
abstract mixin class $ReportEditingDetailsCopyWith<$Res> implements $ReportCreationStateCopyWith<$Res> {
  factory $ReportEditingDetailsCopyWith(ReportEditingDetails value, $Res Function(ReportEditingDetails) _then) = _$ReportEditingDetailsCopyWithImpl;
@useResult
$Res call({
 ReportApiData apiData, ReportSelections selections, ReportFormData formData
});


$ReportApiDataCopyWith<$Res> get apiData;$ReportSelectionsCopyWith<$Res> get selections;$ReportFormDataCopyWith<$Res> get formData;

}
/// @nodoc
class _$ReportEditingDetailsCopyWithImpl<$Res>
    implements $ReportEditingDetailsCopyWith<$Res> {
  _$ReportEditingDetailsCopyWithImpl(this._self, this._then);

  final ReportEditingDetails _self;
  final $Res Function(ReportEditingDetails) _then;

/// Create a copy of ReportCreationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? apiData = null,Object? selections = null,Object? formData = null,}) {
  return _then(ReportEditingDetails(
apiData: null == apiData ? _self.apiData : apiData // ignore: cast_nullable_to_non_nullable
as ReportApiData,selections: null == selections ? _self.selections : selections // ignore: cast_nullable_to_non_nullable
as ReportSelections,formData: null == formData ? _self.formData : formData // ignore: cast_nullable_to_non_nullable
as ReportFormData,
  ));
}

/// Create a copy of ReportCreationState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReportApiDataCopyWith<$Res> get apiData {
  
  return $ReportApiDataCopyWith<$Res>(_self.apiData, (value) {
    return _then(_self.copyWith(apiData: value));
  });
}/// Create a copy of ReportCreationState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReportSelectionsCopyWith<$Res> get selections {
  
  return $ReportSelectionsCopyWith<$Res>(_self.selections, (value) {
    return _then(_self.copyWith(selections: value));
  });
}/// Create a copy of ReportCreationState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReportFormDataCopyWith<$Res> get formData {
  
  return $ReportFormDataCopyWith<$Res>(_self.formData, (value) {
    return _then(_self.copyWith(formData: value));
  });
}
}

/// @nodoc


class ReportDetailsError implements ReportCreationState {
  const ReportDetailsError({required this.apiData, required this.selections, required this.formData, required this.errorMessage});
  

 final  ReportApiData apiData;
 final  ReportSelections selections;
 final  ReportFormData formData;
 final  String errorMessage;

/// Create a copy of ReportCreationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReportDetailsErrorCopyWith<ReportDetailsError> get copyWith => _$ReportDetailsErrorCopyWithImpl<ReportDetailsError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReportDetailsError&&(identical(other.apiData, apiData) || other.apiData == apiData)&&(identical(other.selections, selections) || other.selections == selections)&&(identical(other.formData, formData) || other.formData == formData)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,apiData,selections,formData,errorMessage);

@override
String toString() {
  return 'ReportCreationState.detailsError(apiData: $apiData, selections: $selections, formData: $formData, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $ReportDetailsErrorCopyWith<$Res> implements $ReportCreationStateCopyWith<$Res> {
  factory $ReportDetailsErrorCopyWith(ReportDetailsError value, $Res Function(ReportDetailsError) _then) = _$ReportDetailsErrorCopyWithImpl;
@useResult
$Res call({
 ReportApiData apiData, ReportSelections selections, ReportFormData formData, String errorMessage
});


$ReportApiDataCopyWith<$Res> get apiData;$ReportSelectionsCopyWith<$Res> get selections;$ReportFormDataCopyWith<$Res> get formData;

}
/// @nodoc
class _$ReportDetailsErrorCopyWithImpl<$Res>
    implements $ReportDetailsErrorCopyWith<$Res> {
  _$ReportDetailsErrorCopyWithImpl(this._self, this._then);

  final ReportDetailsError _self;
  final $Res Function(ReportDetailsError) _then;

/// Create a copy of ReportCreationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? apiData = null,Object? selections = null,Object? formData = null,Object? errorMessage = null,}) {
  return _then(ReportDetailsError(
apiData: null == apiData ? _self.apiData : apiData // ignore: cast_nullable_to_non_nullable
as ReportApiData,selections: null == selections ? _self.selections : selections // ignore: cast_nullable_to_non_nullable
as ReportSelections,formData: null == formData ? _self.formData : formData // ignore: cast_nullable_to_non_nullable
as ReportFormData,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of ReportCreationState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReportApiDataCopyWith<$Res> get apiData {
  
  return $ReportApiDataCopyWith<$Res>(_self.apiData, (value) {
    return _then(_self.copyWith(apiData: value));
  });
}/// Create a copy of ReportCreationState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReportSelectionsCopyWith<$Res> get selections {
  
  return $ReportSelectionsCopyWith<$Res>(_self.selections, (value) {
    return _then(_self.copyWith(selections: value));
  });
}/// Create a copy of ReportCreationState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReportFormDataCopyWith<$Res> get formData {
  
  return $ReportFormDataCopyWith<$Res>(_self.formData, (value) {
    return _then(_self.copyWith(formData: value));
  });
}
}

/// @nodoc


class ReportSubmitting implements ReportCreationState {
  const ReportSubmitting({required this.reportData});
  

 final  ReportData reportData;

/// Create a copy of ReportCreationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReportSubmittingCopyWith<ReportSubmitting> get copyWith => _$ReportSubmittingCopyWithImpl<ReportSubmitting>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReportSubmitting&&(identical(other.reportData, reportData) || other.reportData == reportData));
}


@override
int get hashCode => Object.hash(runtimeType,reportData);

@override
String toString() {
  return 'ReportCreationState.submitting(reportData: $reportData)';
}


}

/// @nodoc
abstract mixin class $ReportSubmittingCopyWith<$Res> implements $ReportCreationStateCopyWith<$Res> {
  factory $ReportSubmittingCopyWith(ReportSubmitting value, $Res Function(ReportSubmitting) _then) = _$ReportSubmittingCopyWithImpl;
@useResult
$Res call({
 ReportData reportData
});


$ReportDataCopyWith<$Res> get reportData;

}
/// @nodoc
class _$ReportSubmittingCopyWithImpl<$Res>
    implements $ReportSubmittingCopyWith<$Res> {
  _$ReportSubmittingCopyWithImpl(this._self, this._then);

  final ReportSubmitting _self;
  final $Res Function(ReportSubmitting) _then;

/// Create a copy of ReportCreationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? reportData = null,}) {
  return _then(ReportSubmitting(
reportData: null == reportData ? _self.reportData : reportData // ignore: cast_nullable_to_non_nullable
as ReportData,
  ));
}

/// Create a copy of ReportCreationState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReportDataCopyWith<$Res> get reportData {
  
  return $ReportDataCopyWith<$Res>(_self.reportData, (value) {
    return _then(_self.copyWith(reportData: value));
  });
}
}

/// @nodoc


class ReportSubmitted implements ReportCreationState {
  const ReportSubmitted({required this.reportData});
  

 final  ReportData reportData;

/// Create a copy of ReportCreationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReportSubmittedCopyWith<ReportSubmitted> get copyWith => _$ReportSubmittedCopyWithImpl<ReportSubmitted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReportSubmitted&&(identical(other.reportData, reportData) || other.reportData == reportData));
}


@override
int get hashCode => Object.hash(runtimeType,reportData);

@override
String toString() {
  return 'ReportCreationState.submitted(reportData: $reportData)';
}


}

/// @nodoc
abstract mixin class $ReportSubmittedCopyWith<$Res> implements $ReportCreationStateCopyWith<$Res> {
  factory $ReportSubmittedCopyWith(ReportSubmitted value, $Res Function(ReportSubmitted) _then) = _$ReportSubmittedCopyWithImpl;
@useResult
$Res call({
 ReportData reportData
});


$ReportDataCopyWith<$Res> get reportData;

}
/// @nodoc
class _$ReportSubmittedCopyWithImpl<$Res>
    implements $ReportSubmittedCopyWith<$Res> {
  _$ReportSubmittedCopyWithImpl(this._self, this._then);

  final ReportSubmitted _self;
  final $Res Function(ReportSubmitted) _then;

/// Create a copy of ReportCreationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? reportData = null,}) {
  return _then(ReportSubmitted(
reportData: null == reportData ? _self.reportData : reportData // ignore: cast_nullable_to_non_nullable
as ReportData,
  ));
}

/// Create a copy of ReportCreationState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReportDataCopyWith<$Res> get reportData {
  
  return $ReportDataCopyWith<$Res>(_self.reportData, (value) {
    return _then(_self.copyWith(reportData: value));
  });
}
}

/// @nodoc


class ReportSubmissionError implements ReportCreationState {
  const ReportSubmissionError({required this.reportData, required this.errorMessage});
  

 final  ReportData reportData;
 final  String errorMessage;

/// Create a copy of ReportCreationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReportSubmissionErrorCopyWith<ReportSubmissionError> get copyWith => _$ReportSubmissionErrorCopyWithImpl<ReportSubmissionError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReportSubmissionError&&(identical(other.reportData, reportData) || other.reportData == reportData)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,reportData,errorMessage);

@override
String toString() {
  return 'ReportCreationState.submissionError(reportData: $reportData, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $ReportSubmissionErrorCopyWith<$Res> implements $ReportCreationStateCopyWith<$Res> {
  factory $ReportSubmissionErrorCopyWith(ReportSubmissionError value, $Res Function(ReportSubmissionError) _then) = _$ReportSubmissionErrorCopyWithImpl;
@useResult
$Res call({
 ReportData reportData, String errorMessage
});


$ReportDataCopyWith<$Res> get reportData;

}
/// @nodoc
class _$ReportSubmissionErrorCopyWithImpl<$Res>
    implements $ReportSubmissionErrorCopyWith<$Res> {
  _$ReportSubmissionErrorCopyWithImpl(this._self, this._then);

  final ReportSubmissionError _self;
  final $Res Function(ReportSubmissionError) _then;

/// Create a copy of ReportCreationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? reportData = null,Object? errorMessage = null,}) {
  return _then(ReportSubmissionError(
reportData: null == reportData ? _self.reportData : reportData // ignore: cast_nullable_to_non_nullable
as ReportData,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of ReportCreationState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReportDataCopyWith<$Res> get reportData {
  
  return $ReportDataCopyWith<$Res>(_self.reportData, (value) {
    return _then(_self.copyWith(reportData: value));
  });
}
}

/// @nodoc


class ReportDraftSaved implements ReportCreationState {
  const ReportDraftSaved({required this.reportData});
  

 final  ReportData reportData;

/// Create a copy of ReportCreationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReportDraftSavedCopyWith<ReportDraftSaved> get copyWith => _$ReportDraftSavedCopyWithImpl<ReportDraftSaved>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReportDraftSaved&&(identical(other.reportData, reportData) || other.reportData == reportData));
}


@override
int get hashCode => Object.hash(runtimeType,reportData);

@override
String toString() {
  return 'ReportCreationState.draftSaved(reportData: $reportData)';
}


}

/// @nodoc
abstract mixin class $ReportDraftSavedCopyWith<$Res> implements $ReportCreationStateCopyWith<$Res> {
  factory $ReportDraftSavedCopyWith(ReportDraftSaved value, $Res Function(ReportDraftSaved) _then) = _$ReportDraftSavedCopyWithImpl;
@useResult
$Res call({
 ReportData reportData
});


$ReportDataCopyWith<$Res> get reportData;

}
/// @nodoc
class _$ReportDraftSavedCopyWithImpl<$Res>
    implements $ReportDraftSavedCopyWith<$Res> {
  _$ReportDraftSavedCopyWithImpl(this._self, this._then);

  final ReportDraftSaved _self;
  final $Res Function(ReportDraftSaved) _then;

/// Create a copy of ReportCreationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? reportData = null,}) {
  return _then(ReportDraftSaved(
reportData: null == reportData ? _self.reportData : reportData // ignore: cast_nullable_to_non_nullable
as ReportData,
  ));
}

/// Create a copy of ReportCreationState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReportDataCopyWith<$Res> get reportData {
  
  return $ReportDataCopyWith<$Res>(_self.reportData, (value) {
    return _then(_self.copyWith(reportData: value));
  });
}
}

/// @nodoc


class ReportDraftError implements ReportCreationState {
  const ReportDraftError({required this.reportData, required this.errorMessage});
  

 final  ReportData reportData;
 final  String errorMessage;

/// Create a copy of ReportCreationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReportDraftErrorCopyWith<ReportDraftError> get copyWith => _$ReportDraftErrorCopyWithImpl<ReportDraftError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReportDraftError&&(identical(other.reportData, reportData) || other.reportData == reportData)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,reportData,errorMessage);

@override
String toString() {
  return 'ReportCreationState.draftError(reportData: $reportData, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $ReportDraftErrorCopyWith<$Res> implements $ReportCreationStateCopyWith<$Res> {
  factory $ReportDraftErrorCopyWith(ReportDraftError value, $Res Function(ReportDraftError) _then) = _$ReportDraftErrorCopyWithImpl;
@useResult
$Res call({
 ReportData reportData, String errorMessage
});


$ReportDataCopyWith<$Res> get reportData;

}
/// @nodoc
class _$ReportDraftErrorCopyWithImpl<$Res>
    implements $ReportDraftErrorCopyWith<$Res> {
  _$ReportDraftErrorCopyWithImpl(this._self, this._then);

  final ReportDraftError _self;
  final $Res Function(ReportDraftError) _then;

/// Create a copy of ReportCreationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? reportData = null,Object? errorMessage = null,}) {
  return _then(ReportDraftError(
reportData: null == reportData ? _self.reportData : reportData // ignore: cast_nullable_to_non_nullable
as ReportData,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of ReportCreationState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReportDataCopyWith<$Res> get reportData {
  
  return $ReportDataCopyWith<$Res>(_self.reportData, (value) {
    return _then(_self.copyWith(reportData: value));
  });
}
}

/// @nodoc
mixin _$ReportData {

 ReportApiData get apiData; ReportSelections get selections; ReportFormData get formData;
/// Create a copy of ReportData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReportDataCopyWith<ReportData> get copyWith => _$ReportDataCopyWithImpl<ReportData>(this as ReportData, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReportData&&(identical(other.apiData, apiData) || other.apiData == apiData)&&(identical(other.selections, selections) || other.selections == selections)&&(identical(other.formData, formData) || other.formData == formData));
}


@override
int get hashCode => Object.hash(runtimeType,apiData,selections,formData);

@override
String toString() {
  return 'ReportData(apiData: $apiData, selections: $selections, formData: $formData)';
}


}

/// @nodoc
abstract mixin class $ReportDataCopyWith<$Res>  {
  factory $ReportDataCopyWith(ReportData value, $Res Function(ReportData) _then) = _$ReportDataCopyWithImpl;
@useResult
$Res call({
 ReportApiData apiData, ReportSelections selections, ReportFormData formData
});


$ReportApiDataCopyWith<$Res> get apiData;$ReportSelectionsCopyWith<$Res> get selections;$ReportFormDataCopyWith<$Res> get formData;

}
/// @nodoc
class _$ReportDataCopyWithImpl<$Res>
    implements $ReportDataCopyWith<$Res> {
  _$ReportDataCopyWithImpl(this._self, this._then);

  final ReportData _self;
  final $Res Function(ReportData) _then;

/// Create a copy of ReportData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? apiData = null,Object? selections = null,Object? formData = null,}) {
  return _then(_self.copyWith(
apiData: null == apiData ? _self.apiData : apiData // ignore: cast_nullable_to_non_nullable
as ReportApiData,selections: null == selections ? _self.selections : selections // ignore: cast_nullable_to_non_nullable
as ReportSelections,formData: null == formData ? _self.formData : formData // ignore: cast_nullable_to_non_nullable
as ReportFormData,
  ));
}
/// Create a copy of ReportData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReportApiDataCopyWith<$Res> get apiData {
  
  return $ReportApiDataCopyWith<$Res>(_self.apiData, (value) {
    return _then(_self.copyWith(apiData: value));
  });
}/// Create a copy of ReportData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReportSelectionsCopyWith<$Res> get selections {
  
  return $ReportSelectionsCopyWith<$Res>(_self.selections, (value) {
    return _then(_self.copyWith(selections: value));
  });
}/// Create a copy of ReportData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReportFormDataCopyWith<$Res> get formData {
  
  return $ReportFormDataCopyWith<$Res>(_self.formData, (value) {
    return _then(_self.copyWith(formData: value));
  });
}
}


/// Adds pattern-matching-related methods to [ReportData].
extension ReportDataPatterns on ReportData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReportData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReportData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReportData value)  $default,){
final _that = this;
switch (_that) {
case _ReportData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReportData value)?  $default,){
final _that = this;
switch (_that) {
case _ReportData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ReportApiData apiData,  ReportSelections selections,  ReportFormData formData)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReportData() when $default != null:
return $default(_that.apiData,_that.selections,_that.formData);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ReportApiData apiData,  ReportSelections selections,  ReportFormData formData)  $default,) {final _that = this;
switch (_that) {
case _ReportData():
return $default(_that.apiData,_that.selections,_that.formData);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ReportApiData apiData,  ReportSelections selections,  ReportFormData formData)?  $default,) {final _that = this;
switch (_that) {
case _ReportData() when $default != null:
return $default(_that.apiData,_that.selections,_that.formData);case _:
  return null;

}
}

}

/// @nodoc


class _ReportData implements ReportData {
  const _ReportData({required this.apiData, required this.selections, required this.formData});
  

@override final  ReportApiData apiData;
@override final  ReportSelections selections;
@override final  ReportFormData formData;

/// Create a copy of ReportData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReportDataCopyWith<_ReportData> get copyWith => __$ReportDataCopyWithImpl<_ReportData>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReportData&&(identical(other.apiData, apiData) || other.apiData == apiData)&&(identical(other.selections, selections) || other.selections == selections)&&(identical(other.formData, formData) || other.formData == formData));
}


@override
int get hashCode => Object.hash(runtimeType,apiData,selections,formData);

@override
String toString() {
  return 'ReportData(apiData: $apiData, selections: $selections, formData: $formData)';
}


}

/// @nodoc
abstract mixin class _$ReportDataCopyWith<$Res> implements $ReportDataCopyWith<$Res> {
  factory _$ReportDataCopyWith(_ReportData value, $Res Function(_ReportData) _then) = __$ReportDataCopyWithImpl;
@override @useResult
$Res call({
 ReportApiData apiData, ReportSelections selections, ReportFormData formData
});


@override $ReportApiDataCopyWith<$Res> get apiData;@override $ReportSelectionsCopyWith<$Res> get selections;@override $ReportFormDataCopyWith<$Res> get formData;

}
/// @nodoc
class __$ReportDataCopyWithImpl<$Res>
    implements _$ReportDataCopyWith<$Res> {
  __$ReportDataCopyWithImpl(this._self, this._then);

  final _ReportData _self;
  final $Res Function(_ReportData) _then;

/// Create a copy of ReportData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? apiData = null,Object? selections = null,Object? formData = null,}) {
  return _then(_ReportData(
apiData: null == apiData ? _self.apiData : apiData // ignore: cast_nullable_to_non_nullable
as ReportApiData,selections: null == selections ? _self.selections : selections // ignore: cast_nullable_to_non_nullable
as ReportSelections,formData: null == formData ? _self.formData : formData // ignore: cast_nullable_to_non_nullable
as ReportFormData,
  ));
}

/// Create a copy of ReportData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReportApiDataCopyWith<$Res> get apiData {
  
  return $ReportApiDataCopyWith<$Res>(_self.apiData, (value) {
    return _then(_self.copyWith(apiData: value));
  });
}/// Create a copy of ReportData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReportSelectionsCopyWith<$Res> get selections {
  
  return $ReportSelectionsCopyWith<$Res>(_self.selections, (value) {
    return _then(_self.copyWith(selections: value));
  });
}/// Create a copy of ReportData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReportFormDataCopyWith<$Res> get formData {
  
  return $ReportFormDataCopyWith<$Res>(_self.formData, (value) {
    return _then(_self.copyWith(formData: value));
  });
}
}

/// @nodoc
mixin _$ReportApiData {

 List<ScopeOfWork> get workScopes; List<Province> get states; List<District> get districts; List<Road> get roads; List<WorkQuantityType> get quantities; List<WorkEquipment> get equipment;
/// Create a copy of ReportApiData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReportApiDataCopyWith<ReportApiData> get copyWith => _$ReportApiDataCopyWithImpl<ReportApiData>(this as ReportApiData, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReportApiData&&const DeepCollectionEquality().equals(other.workScopes, workScopes)&&const DeepCollectionEquality().equals(other.states, states)&&const DeepCollectionEquality().equals(other.districts, districts)&&const DeepCollectionEquality().equals(other.roads, roads)&&const DeepCollectionEquality().equals(other.quantities, quantities)&&const DeepCollectionEquality().equals(other.equipment, equipment));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(workScopes),const DeepCollectionEquality().hash(states),const DeepCollectionEquality().hash(districts),const DeepCollectionEquality().hash(roads),const DeepCollectionEquality().hash(quantities),const DeepCollectionEquality().hash(equipment));

@override
String toString() {
  return 'ReportApiData(workScopes: $workScopes, states: $states, districts: $districts, roads: $roads, quantities: $quantities, equipment: $equipment)';
}


}

/// @nodoc
abstract mixin class $ReportApiDataCopyWith<$Res>  {
  factory $ReportApiDataCopyWith(ReportApiData value, $Res Function(ReportApiData) _then) = _$ReportApiDataCopyWithImpl;
@useResult
$Res call({
 List<ScopeOfWork> workScopes, List<Province> states, List<District> districts, List<Road> roads, List<WorkQuantityType> quantities, List<WorkEquipment> equipment
});




}
/// @nodoc
class _$ReportApiDataCopyWithImpl<$Res>
    implements $ReportApiDataCopyWith<$Res> {
  _$ReportApiDataCopyWithImpl(this._self, this._then);

  final ReportApiData _self;
  final $Res Function(ReportApiData) _then;

/// Create a copy of ReportApiData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? workScopes = null,Object? states = null,Object? districts = null,Object? roads = null,Object? quantities = null,Object? equipment = null,}) {
  return _then(_self.copyWith(
workScopes: null == workScopes ? _self.workScopes : workScopes // ignore: cast_nullable_to_non_nullable
as List<ScopeOfWork>,states: null == states ? _self.states : states // ignore: cast_nullable_to_non_nullable
as List<Province>,districts: null == districts ? _self.districts : districts // ignore: cast_nullable_to_non_nullable
as List<District>,roads: null == roads ? _self.roads : roads // ignore: cast_nullable_to_non_nullable
as List<Road>,quantities: null == quantities ? _self.quantities : quantities // ignore: cast_nullable_to_non_nullable
as List<WorkQuantityType>,equipment: null == equipment ? _self.equipment : equipment // ignore: cast_nullable_to_non_nullable
as List<WorkEquipment>,
  ));
}

}


/// Adds pattern-matching-related methods to [ReportApiData].
extension ReportApiDataPatterns on ReportApiData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReportApiData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReportApiData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReportApiData value)  $default,){
final _that = this;
switch (_that) {
case _ReportApiData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReportApiData value)?  $default,){
final _that = this;
switch (_that) {
case _ReportApiData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ScopeOfWork> workScopes,  List<Province> states,  List<District> districts,  List<Road> roads,  List<WorkQuantityType> quantities,  List<WorkEquipment> equipment)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReportApiData() when $default != null:
return $default(_that.workScopes,_that.states,_that.districts,_that.roads,_that.quantities,_that.equipment);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ScopeOfWork> workScopes,  List<Province> states,  List<District> districts,  List<Road> roads,  List<WorkQuantityType> quantities,  List<WorkEquipment> equipment)  $default,) {final _that = this;
switch (_that) {
case _ReportApiData():
return $default(_that.workScopes,_that.states,_that.districts,_that.roads,_that.quantities,_that.equipment);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ScopeOfWork> workScopes,  List<Province> states,  List<District> districts,  List<Road> roads,  List<WorkQuantityType> quantities,  List<WorkEquipment> equipment)?  $default,) {final _that = this;
switch (_that) {
case _ReportApiData() when $default != null:
return $default(_that.workScopes,_that.states,_that.districts,_that.roads,_that.quantities,_that.equipment);case _:
  return null;

}
}

}

/// @nodoc


class _ReportApiData implements ReportApiData {
  const _ReportApiData({final  List<ScopeOfWork> workScopes = const [], final  List<Province> states = const [], final  List<District> districts = const [], final  List<Road> roads = const [], final  List<WorkQuantityType> quantities = const [], final  List<WorkEquipment> equipment = const []}): _workScopes = workScopes,_states = states,_districts = districts,_roads = roads,_quantities = quantities,_equipment = equipment;
  

 final  List<ScopeOfWork> _workScopes;
@override@JsonKey() List<ScopeOfWork> get workScopes {
  if (_workScopes is EqualUnmodifiableListView) return _workScopes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_workScopes);
}

 final  List<Province> _states;
@override@JsonKey() List<Province> get states {
  if (_states is EqualUnmodifiableListView) return _states;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_states);
}

 final  List<District> _districts;
@override@JsonKey() List<District> get districts {
  if (_districts is EqualUnmodifiableListView) return _districts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_districts);
}

 final  List<Road> _roads;
@override@JsonKey() List<Road> get roads {
  if (_roads is EqualUnmodifiableListView) return _roads;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_roads);
}

 final  List<WorkQuantityType> _quantities;
@override@JsonKey() List<WorkQuantityType> get quantities {
  if (_quantities is EqualUnmodifiableListView) return _quantities;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_quantities);
}

 final  List<WorkEquipment> _equipment;
@override@JsonKey() List<WorkEquipment> get equipment {
  if (_equipment is EqualUnmodifiableListView) return _equipment;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_equipment);
}


/// Create a copy of ReportApiData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReportApiDataCopyWith<_ReportApiData> get copyWith => __$ReportApiDataCopyWithImpl<_ReportApiData>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReportApiData&&const DeepCollectionEquality().equals(other._workScopes, _workScopes)&&const DeepCollectionEquality().equals(other._states, _states)&&const DeepCollectionEquality().equals(other._districts, _districts)&&const DeepCollectionEquality().equals(other._roads, _roads)&&const DeepCollectionEquality().equals(other._quantities, _quantities)&&const DeepCollectionEquality().equals(other._equipment, _equipment));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_workScopes),const DeepCollectionEquality().hash(_states),const DeepCollectionEquality().hash(_districts),const DeepCollectionEquality().hash(_roads),const DeepCollectionEquality().hash(_quantities),const DeepCollectionEquality().hash(_equipment));

@override
String toString() {
  return 'ReportApiData(workScopes: $workScopes, states: $states, districts: $districts, roads: $roads, quantities: $quantities, equipment: $equipment)';
}


}

/// @nodoc
abstract mixin class _$ReportApiDataCopyWith<$Res> implements $ReportApiDataCopyWith<$Res> {
  factory _$ReportApiDataCopyWith(_ReportApiData value, $Res Function(_ReportApiData) _then) = __$ReportApiDataCopyWithImpl;
@override @useResult
$Res call({
 List<ScopeOfWork> workScopes, List<Province> states, List<District> districts, List<Road> roads, List<WorkQuantityType> quantities, List<WorkEquipment> equipment
});




}
/// @nodoc
class __$ReportApiDataCopyWithImpl<$Res>
    implements _$ReportApiDataCopyWith<$Res> {
  __$ReportApiDataCopyWithImpl(this._self, this._then);

  final _ReportApiData _self;
  final $Res Function(_ReportApiData) _then;

/// Create a copy of ReportApiData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? workScopes = null,Object? states = null,Object? districts = null,Object? roads = null,Object? quantities = null,Object? equipment = null,}) {
  return _then(_ReportApiData(
workScopes: null == workScopes ? _self._workScopes : workScopes // ignore: cast_nullable_to_non_nullable
as List<ScopeOfWork>,states: null == states ? _self._states : states // ignore: cast_nullable_to_non_nullable
as List<Province>,districts: null == districts ? _self._districts : districts // ignore: cast_nullable_to_non_nullable
as List<District>,roads: null == roads ? _self._roads : roads // ignore: cast_nullable_to_non_nullable
as List<Road>,quantities: null == quantities ? _self._quantities : quantities // ignore: cast_nullable_to_non_nullable
as List<WorkQuantityType>,equipment: null == equipment ? _self._equipment : equipment // ignore: cast_nullable_to_non_nullable
as List<WorkEquipment>,
  ));
}


}

/// @nodoc
mixin _$ReportSelections {

// Scope selection
 ScopeOfWork? get selectedScope;// Weather selection
 String? get selectedWeather;// Location selections (UID is inside entity, no need to store separately)
 Province? get selectedState; District? get selectedDistrict; Road? get selectedRoad;// Section input
 String? get section; String? get sectionError;// Quantity and equipment selections
 List<WorkQuantityType> get selectedQuantityTypes; List<WorkEquipment> get selectedEquipment;// Additional data
 Map<String, List<Map<String, dynamic>>> get conditionSnapshots; List<Map<String, dynamic>> get workerImages;
/// Create a copy of ReportSelections
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReportSelectionsCopyWith<ReportSelections> get copyWith => _$ReportSelectionsCopyWithImpl<ReportSelections>(this as ReportSelections, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReportSelections&&(identical(other.selectedScope, selectedScope) || other.selectedScope == selectedScope)&&(identical(other.selectedWeather, selectedWeather) || other.selectedWeather == selectedWeather)&&(identical(other.selectedState, selectedState) || other.selectedState == selectedState)&&(identical(other.selectedDistrict, selectedDistrict) || other.selectedDistrict == selectedDistrict)&&(identical(other.selectedRoad, selectedRoad) || other.selectedRoad == selectedRoad)&&(identical(other.section, section) || other.section == section)&&(identical(other.sectionError, sectionError) || other.sectionError == sectionError)&&const DeepCollectionEquality().equals(other.selectedQuantityTypes, selectedQuantityTypes)&&const DeepCollectionEquality().equals(other.selectedEquipment, selectedEquipment)&&const DeepCollectionEquality().equals(other.conditionSnapshots, conditionSnapshots)&&const DeepCollectionEquality().equals(other.workerImages, workerImages));
}


@override
int get hashCode => Object.hash(runtimeType,selectedScope,selectedWeather,selectedState,selectedDistrict,selectedRoad,section,sectionError,const DeepCollectionEquality().hash(selectedQuantityTypes),const DeepCollectionEquality().hash(selectedEquipment),const DeepCollectionEquality().hash(conditionSnapshots),const DeepCollectionEquality().hash(workerImages));

@override
String toString() {
  return 'ReportSelections(selectedScope: $selectedScope, selectedWeather: $selectedWeather, selectedState: $selectedState, selectedDistrict: $selectedDistrict, selectedRoad: $selectedRoad, section: $section, sectionError: $sectionError, selectedQuantityTypes: $selectedQuantityTypes, selectedEquipment: $selectedEquipment, conditionSnapshots: $conditionSnapshots, workerImages: $workerImages)';
}


}

/// @nodoc
abstract mixin class $ReportSelectionsCopyWith<$Res>  {
  factory $ReportSelectionsCopyWith(ReportSelections value, $Res Function(ReportSelections) _then) = _$ReportSelectionsCopyWithImpl;
@useResult
$Res call({
 ScopeOfWork? selectedScope, String? selectedWeather, Province? selectedState, District? selectedDistrict, Road? selectedRoad, String? section, String? sectionError, List<WorkQuantityType> selectedQuantityTypes, List<WorkEquipment> selectedEquipment, Map<String, List<Map<String, dynamic>>> conditionSnapshots, List<Map<String, dynamic>> workerImages
});




}
/// @nodoc
class _$ReportSelectionsCopyWithImpl<$Res>
    implements $ReportSelectionsCopyWith<$Res> {
  _$ReportSelectionsCopyWithImpl(this._self, this._then);

  final ReportSelections _self;
  final $Res Function(ReportSelections) _then;

/// Create a copy of ReportSelections
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? selectedScope = freezed,Object? selectedWeather = freezed,Object? selectedState = freezed,Object? selectedDistrict = freezed,Object? selectedRoad = freezed,Object? section = freezed,Object? sectionError = freezed,Object? selectedQuantityTypes = null,Object? selectedEquipment = null,Object? conditionSnapshots = null,Object? workerImages = null,}) {
  return _then(_self.copyWith(
selectedScope: freezed == selectedScope ? _self.selectedScope : selectedScope // ignore: cast_nullable_to_non_nullable
as ScopeOfWork?,selectedWeather: freezed == selectedWeather ? _self.selectedWeather : selectedWeather // ignore: cast_nullable_to_non_nullable
as String?,selectedState: freezed == selectedState ? _self.selectedState : selectedState // ignore: cast_nullable_to_non_nullable
as Province?,selectedDistrict: freezed == selectedDistrict ? _self.selectedDistrict : selectedDistrict // ignore: cast_nullable_to_non_nullable
as District?,selectedRoad: freezed == selectedRoad ? _self.selectedRoad : selectedRoad // ignore: cast_nullable_to_non_nullable
as Road?,section: freezed == section ? _self.section : section // ignore: cast_nullable_to_non_nullable
as String?,sectionError: freezed == sectionError ? _self.sectionError : sectionError // ignore: cast_nullable_to_non_nullable
as String?,selectedQuantityTypes: null == selectedQuantityTypes ? _self.selectedQuantityTypes : selectedQuantityTypes // ignore: cast_nullable_to_non_nullable
as List<WorkQuantityType>,selectedEquipment: null == selectedEquipment ? _self.selectedEquipment : selectedEquipment // ignore: cast_nullable_to_non_nullable
as List<WorkEquipment>,conditionSnapshots: null == conditionSnapshots ? _self.conditionSnapshots : conditionSnapshots // ignore: cast_nullable_to_non_nullable
as Map<String, List<Map<String, dynamic>>>,workerImages: null == workerImages ? _self.workerImages : workerImages // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>,
  ));
}

}


/// Adds pattern-matching-related methods to [ReportSelections].
extension ReportSelectionsPatterns on ReportSelections {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReportSelections value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReportSelections() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReportSelections value)  $default,){
final _that = this;
switch (_that) {
case _ReportSelections():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReportSelections value)?  $default,){
final _that = this;
switch (_that) {
case _ReportSelections() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ScopeOfWork? selectedScope,  String? selectedWeather,  Province? selectedState,  District? selectedDistrict,  Road? selectedRoad,  String? section,  String? sectionError,  List<WorkQuantityType> selectedQuantityTypes,  List<WorkEquipment> selectedEquipment,  Map<String, List<Map<String, dynamic>>> conditionSnapshots,  List<Map<String, dynamic>> workerImages)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReportSelections() when $default != null:
return $default(_that.selectedScope,_that.selectedWeather,_that.selectedState,_that.selectedDistrict,_that.selectedRoad,_that.section,_that.sectionError,_that.selectedQuantityTypes,_that.selectedEquipment,_that.conditionSnapshots,_that.workerImages);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ScopeOfWork? selectedScope,  String? selectedWeather,  Province? selectedState,  District? selectedDistrict,  Road? selectedRoad,  String? section,  String? sectionError,  List<WorkQuantityType> selectedQuantityTypes,  List<WorkEquipment> selectedEquipment,  Map<String, List<Map<String, dynamic>>> conditionSnapshots,  List<Map<String, dynamic>> workerImages)  $default,) {final _that = this;
switch (_that) {
case _ReportSelections():
return $default(_that.selectedScope,_that.selectedWeather,_that.selectedState,_that.selectedDistrict,_that.selectedRoad,_that.section,_that.sectionError,_that.selectedQuantityTypes,_that.selectedEquipment,_that.conditionSnapshots,_that.workerImages);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ScopeOfWork? selectedScope,  String? selectedWeather,  Province? selectedState,  District? selectedDistrict,  Road? selectedRoad,  String? section,  String? sectionError,  List<WorkQuantityType> selectedQuantityTypes,  List<WorkEquipment> selectedEquipment,  Map<String, List<Map<String, dynamic>>> conditionSnapshots,  List<Map<String, dynamic>> workerImages)?  $default,) {final _that = this;
switch (_that) {
case _ReportSelections() when $default != null:
return $default(_that.selectedScope,_that.selectedWeather,_that.selectedState,_that.selectedDistrict,_that.selectedRoad,_that.section,_that.sectionError,_that.selectedQuantityTypes,_that.selectedEquipment,_that.conditionSnapshots,_that.workerImages);case _:
  return null;

}
}

}

/// @nodoc


class _ReportSelections implements ReportSelections {
  const _ReportSelections({this.selectedScope, this.selectedWeather, this.selectedState, this.selectedDistrict, this.selectedRoad, this.section, this.sectionError, final  List<WorkQuantityType> selectedQuantityTypes = const [], final  List<WorkEquipment> selectedEquipment = const [], final  Map<String, List<Map<String, dynamic>>> conditionSnapshots = const {}, final  List<Map<String, dynamic>> workerImages = const []}): _selectedQuantityTypes = selectedQuantityTypes,_selectedEquipment = selectedEquipment,_conditionSnapshots = conditionSnapshots,_workerImages = workerImages;
  

// Scope selection
@override final  ScopeOfWork? selectedScope;
// Weather selection
@override final  String? selectedWeather;
// Location selections (UID is inside entity, no need to store separately)
@override final  Province? selectedState;
@override final  District? selectedDistrict;
@override final  Road? selectedRoad;
// Section input
@override final  String? section;
@override final  String? sectionError;
// Quantity and equipment selections
 final  List<WorkQuantityType> _selectedQuantityTypes;
// Quantity and equipment selections
@override@JsonKey() List<WorkQuantityType> get selectedQuantityTypes {
  if (_selectedQuantityTypes is EqualUnmodifiableListView) return _selectedQuantityTypes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_selectedQuantityTypes);
}

 final  List<WorkEquipment> _selectedEquipment;
@override@JsonKey() List<WorkEquipment> get selectedEquipment {
  if (_selectedEquipment is EqualUnmodifiableListView) return _selectedEquipment;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_selectedEquipment);
}

// Additional data
 final  Map<String, List<Map<String, dynamic>>> _conditionSnapshots;
// Additional data
@override@JsonKey() Map<String, List<Map<String, dynamic>>> get conditionSnapshots {
  if (_conditionSnapshots is EqualUnmodifiableMapView) return _conditionSnapshots;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_conditionSnapshots);
}

 final  List<Map<String, dynamic>> _workerImages;
@override@JsonKey() List<Map<String, dynamic>> get workerImages {
  if (_workerImages is EqualUnmodifiableListView) return _workerImages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_workerImages);
}


/// Create a copy of ReportSelections
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReportSelectionsCopyWith<_ReportSelections> get copyWith => __$ReportSelectionsCopyWithImpl<_ReportSelections>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReportSelections&&(identical(other.selectedScope, selectedScope) || other.selectedScope == selectedScope)&&(identical(other.selectedWeather, selectedWeather) || other.selectedWeather == selectedWeather)&&(identical(other.selectedState, selectedState) || other.selectedState == selectedState)&&(identical(other.selectedDistrict, selectedDistrict) || other.selectedDistrict == selectedDistrict)&&(identical(other.selectedRoad, selectedRoad) || other.selectedRoad == selectedRoad)&&(identical(other.section, section) || other.section == section)&&(identical(other.sectionError, sectionError) || other.sectionError == sectionError)&&const DeepCollectionEquality().equals(other._selectedQuantityTypes, _selectedQuantityTypes)&&const DeepCollectionEquality().equals(other._selectedEquipment, _selectedEquipment)&&const DeepCollectionEquality().equals(other._conditionSnapshots, _conditionSnapshots)&&const DeepCollectionEquality().equals(other._workerImages, _workerImages));
}


@override
int get hashCode => Object.hash(runtimeType,selectedScope,selectedWeather,selectedState,selectedDistrict,selectedRoad,section,sectionError,const DeepCollectionEquality().hash(_selectedQuantityTypes),const DeepCollectionEquality().hash(_selectedEquipment),const DeepCollectionEquality().hash(_conditionSnapshots),const DeepCollectionEquality().hash(_workerImages));

@override
String toString() {
  return 'ReportSelections(selectedScope: $selectedScope, selectedWeather: $selectedWeather, selectedState: $selectedState, selectedDistrict: $selectedDistrict, selectedRoad: $selectedRoad, section: $section, sectionError: $sectionError, selectedQuantityTypes: $selectedQuantityTypes, selectedEquipment: $selectedEquipment, conditionSnapshots: $conditionSnapshots, workerImages: $workerImages)';
}


}

/// @nodoc
abstract mixin class _$ReportSelectionsCopyWith<$Res> implements $ReportSelectionsCopyWith<$Res> {
  factory _$ReportSelectionsCopyWith(_ReportSelections value, $Res Function(_ReportSelections) _then) = __$ReportSelectionsCopyWithImpl;
@override @useResult
$Res call({
 ScopeOfWork? selectedScope, String? selectedWeather, Province? selectedState, District? selectedDistrict, Road? selectedRoad, String? section, String? sectionError, List<WorkQuantityType> selectedQuantityTypes, List<WorkEquipment> selectedEquipment, Map<String, List<Map<String, dynamic>>> conditionSnapshots, List<Map<String, dynamic>> workerImages
});




}
/// @nodoc
class __$ReportSelectionsCopyWithImpl<$Res>
    implements _$ReportSelectionsCopyWith<$Res> {
  __$ReportSelectionsCopyWithImpl(this._self, this._then);

  final _ReportSelections _self;
  final $Res Function(_ReportSelections) _then;

/// Create a copy of ReportSelections
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? selectedScope = freezed,Object? selectedWeather = freezed,Object? selectedState = freezed,Object? selectedDistrict = freezed,Object? selectedRoad = freezed,Object? section = freezed,Object? sectionError = freezed,Object? selectedQuantityTypes = null,Object? selectedEquipment = null,Object? conditionSnapshots = null,Object? workerImages = null,}) {
  return _then(_ReportSelections(
selectedScope: freezed == selectedScope ? _self.selectedScope : selectedScope // ignore: cast_nullable_to_non_nullable
as ScopeOfWork?,selectedWeather: freezed == selectedWeather ? _self.selectedWeather : selectedWeather // ignore: cast_nullable_to_non_nullable
as String?,selectedState: freezed == selectedState ? _self.selectedState : selectedState // ignore: cast_nullable_to_non_nullable
as Province?,selectedDistrict: freezed == selectedDistrict ? _self.selectedDistrict : selectedDistrict // ignore: cast_nullable_to_non_nullable
as District?,selectedRoad: freezed == selectedRoad ? _self.selectedRoad : selectedRoad // ignore: cast_nullable_to_non_nullable
as Road?,section: freezed == section ? _self.section : section // ignore: cast_nullable_to_non_nullable
as String?,sectionError: freezed == sectionError ? _self.sectionError : sectionError // ignore: cast_nullable_to_non_nullable
as String?,selectedQuantityTypes: null == selectedQuantityTypes ? _self._selectedQuantityTypes : selectedQuantityTypes // ignore: cast_nullable_to_non_nullable
as List<WorkQuantityType>,selectedEquipment: null == selectedEquipment ? _self._selectedEquipment : selectedEquipment // ignore: cast_nullable_to_non_nullable
as List<WorkEquipment>,conditionSnapshots: null == conditionSnapshots ? _self._conditionSnapshots : conditionSnapshots // ignore: cast_nullable_to_non_nullable
as Map<String, List<Map<String, dynamic>>>,workerImages: null == workerImages ? _self._workerImages : workerImages // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>,
  ));
}


}

/// @nodoc
mixin _$ReportFormData {

 Map<String, dynamic> get fieldValues; Map<String, List<String>> get imageFields; Map<String, String?> get fieldErrors; List<String> get validationErrors; bool get isFormValid;
/// Create a copy of ReportFormData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReportFormDataCopyWith<ReportFormData> get copyWith => _$ReportFormDataCopyWithImpl<ReportFormData>(this as ReportFormData, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReportFormData&&const DeepCollectionEquality().equals(other.fieldValues, fieldValues)&&const DeepCollectionEquality().equals(other.imageFields, imageFields)&&const DeepCollectionEquality().equals(other.fieldErrors, fieldErrors)&&const DeepCollectionEquality().equals(other.validationErrors, validationErrors)&&(identical(other.isFormValid, isFormValid) || other.isFormValid == isFormValid));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(fieldValues),const DeepCollectionEquality().hash(imageFields),const DeepCollectionEquality().hash(fieldErrors),const DeepCollectionEquality().hash(validationErrors),isFormValid);

@override
String toString() {
  return 'ReportFormData(fieldValues: $fieldValues, imageFields: $imageFields, fieldErrors: $fieldErrors, validationErrors: $validationErrors, isFormValid: $isFormValid)';
}


}

/// @nodoc
abstract mixin class $ReportFormDataCopyWith<$Res>  {
  factory $ReportFormDataCopyWith(ReportFormData value, $Res Function(ReportFormData) _then) = _$ReportFormDataCopyWithImpl;
@useResult
$Res call({
 Map<String, dynamic> fieldValues, Map<String, List<String>> imageFields, Map<String, String?> fieldErrors, List<String> validationErrors, bool isFormValid
});




}
/// @nodoc
class _$ReportFormDataCopyWithImpl<$Res>
    implements $ReportFormDataCopyWith<$Res> {
  _$ReportFormDataCopyWithImpl(this._self, this._then);

  final ReportFormData _self;
  final $Res Function(ReportFormData) _then;

/// Create a copy of ReportFormData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fieldValues = null,Object? imageFields = null,Object? fieldErrors = null,Object? validationErrors = null,Object? isFormValid = null,}) {
  return _then(_self.copyWith(
fieldValues: null == fieldValues ? _self.fieldValues : fieldValues // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,imageFields: null == imageFields ? _self.imageFields : imageFields // ignore: cast_nullable_to_non_nullable
as Map<String, List<String>>,fieldErrors: null == fieldErrors ? _self.fieldErrors : fieldErrors // ignore: cast_nullable_to_non_nullable
as Map<String, String?>,validationErrors: null == validationErrors ? _self.validationErrors : validationErrors // ignore: cast_nullable_to_non_nullable
as List<String>,isFormValid: null == isFormValid ? _self.isFormValid : isFormValid // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [ReportFormData].
extension ReportFormDataPatterns on ReportFormData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReportFormData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReportFormData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReportFormData value)  $default,){
final _that = this;
switch (_that) {
case _ReportFormData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReportFormData value)?  $default,){
final _that = this;
switch (_that) {
case _ReportFormData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Map<String, dynamic> fieldValues,  Map<String, List<String>> imageFields,  Map<String, String?> fieldErrors,  List<String> validationErrors,  bool isFormValid)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReportFormData() when $default != null:
return $default(_that.fieldValues,_that.imageFields,_that.fieldErrors,_that.validationErrors,_that.isFormValid);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Map<String, dynamic> fieldValues,  Map<String, List<String>> imageFields,  Map<String, String?> fieldErrors,  List<String> validationErrors,  bool isFormValid)  $default,) {final _that = this;
switch (_that) {
case _ReportFormData():
return $default(_that.fieldValues,_that.imageFields,_that.fieldErrors,_that.validationErrors,_that.isFormValid);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Map<String, dynamic> fieldValues,  Map<String, List<String>> imageFields,  Map<String, String?> fieldErrors,  List<String> validationErrors,  bool isFormValid)?  $default,) {final _that = this;
switch (_that) {
case _ReportFormData() when $default != null:
return $default(_that.fieldValues,_that.imageFields,_that.fieldErrors,_that.validationErrors,_that.isFormValid);case _:
  return null;

}
}

}

/// @nodoc


class _ReportFormData implements ReportFormData {
  const _ReportFormData({final  Map<String, dynamic> fieldValues = const {}, final  Map<String, List<String>> imageFields = const {}, final  Map<String, String?> fieldErrors = const {}, final  List<String> validationErrors = const [], this.isFormValid = false}): _fieldValues = fieldValues,_imageFields = imageFields,_fieldErrors = fieldErrors,_validationErrors = validationErrors;
  

 final  Map<String, dynamic> _fieldValues;
@override@JsonKey() Map<String, dynamic> get fieldValues {
  if (_fieldValues is EqualUnmodifiableMapView) return _fieldValues;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_fieldValues);
}

 final  Map<String, List<String>> _imageFields;
@override@JsonKey() Map<String, List<String>> get imageFields {
  if (_imageFields is EqualUnmodifiableMapView) return _imageFields;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_imageFields);
}

 final  Map<String, String?> _fieldErrors;
@override@JsonKey() Map<String, String?> get fieldErrors {
  if (_fieldErrors is EqualUnmodifiableMapView) return _fieldErrors;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_fieldErrors);
}

 final  List<String> _validationErrors;
@override@JsonKey() List<String> get validationErrors {
  if (_validationErrors is EqualUnmodifiableListView) return _validationErrors;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_validationErrors);
}

@override@JsonKey() final  bool isFormValid;

/// Create a copy of ReportFormData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReportFormDataCopyWith<_ReportFormData> get copyWith => __$ReportFormDataCopyWithImpl<_ReportFormData>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReportFormData&&const DeepCollectionEquality().equals(other._fieldValues, _fieldValues)&&const DeepCollectionEquality().equals(other._imageFields, _imageFields)&&const DeepCollectionEquality().equals(other._fieldErrors, _fieldErrors)&&const DeepCollectionEquality().equals(other._validationErrors, _validationErrors)&&(identical(other.isFormValid, isFormValid) || other.isFormValid == isFormValid));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_fieldValues),const DeepCollectionEquality().hash(_imageFields),const DeepCollectionEquality().hash(_fieldErrors),const DeepCollectionEquality().hash(_validationErrors),isFormValid);

@override
String toString() {
  return 'ReportFormData(fieldValues: $fieldValues, imageFields: $imageFields, fieldErrors: $fieldErrors, validationErrors: $validationErrors, isFormValid: $isFormValid)';
}


}

/// @nodoc
abstract mixin class _$ReportFormDataCopyWith<$Res> implements $ReportFormDataCopyWith<$Res> {
  factory _$ReportFormDataCopyWith(_ReportFormData value, $Res Function(_ReportFormData) _then) = __$ReportFormDataCopyWithImpl;
@override @useResult
$Res call({
 Map<String, dynamic> fieldValues, Map<String, List<String>> imageFields, Map<String, String?> fieldErrors, List<String> validationErrors, bool isFormValid
});




}
/// @nodoc
class __$ReportFormDataCopyWithImpl<$Res>
    implements _$ReportFormDataCopyWith<$Res> {
  __$ReportFormDataCopyWithImpl(this._self, this._then);

  final _ReportFormData _self;
  final $Res Function(_ReportFormData) _then;

/// Create a copy of ReportFormData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fieldValues = null,Object? imageFields = null,Object? fieldErrors = null,Object? validationErrors = null,Object? isFormValid = null,}) {
  return _then(_ReportFormData(
fieldValues: null == fieldValues ? _self._fieldValues : fieldValues // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,imageFields: null == imageFields ? _self._imageFields : imageFields // ignore: cast_nullable_to_non_nullable
as Map<String, List<String>>,fieldErrors: null == fieldErrors ? _self._fieldErrors : fieldErrors // ignore: cast_nullable_to_non_nullable
as Map<String, String?>,validationErrors: null == validationErrors ? _self._validationErrors : validationErrors // ignore: cast_nullable_to_non_nullable
as List<String>,isFormValid: null == isFormValid ? _self.isFormValid : isFormValid // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
