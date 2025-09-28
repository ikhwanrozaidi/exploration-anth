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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ReportInitial value)?  initial,TResult Function( ReportPage1Ready value)?  page1Ready,TResult Function( ReportPage1Error value)?  page1Error,TResult Function( ReportPage2Ready value)?  page2Ready,TResult Function( ReportPage2Error value)?  page2Error,TResult Function( ReportSubmitting value)?  submitting,TResult Function( ReportSubmitted value)?  submitted,TResult Function( ReportSubmissionError value)?  submissionError,TResult Function( ReportDraftSaved value)?  draftSaved,TResult Function( ReportDraftError value)?  draftError,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ReportInitial() when initial != null:
return initial(_that);case ReportPage1Ready() when page1Ready != null:
return page1Ready(_that);case ReportPage1Error() when page1Error != null:
return page1Error(_that);case ReportPage2Ready() when page2Ready != null:
return page2Ready(_that);case ReportPage2Error() when page2Error != null:
return page2Error(_that);case ReportSubmitting() when submitting != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ReportInitial value)  initial,required TResult Function( ReportPage1Ready value)  page1Ready,required TResult Function( ReportPage1Error value)  page1Error,required TResult Function( ReportPage2Ready value)  page2Ready,required TResult Function( ReportPage2Error value)  page2Error,required TResult Function( ReportSubmitting value)  submitting,required TResult Function( ReportSubmitted value)  submitted,required TResult Function( ReportSubmissionError value)  submissionError,required TResult Function( ReportDraftSaved value)  draftSaved,required TResult Function( ReportDraftError value)  draftError,}){
final _that = this;
switch (_that) {
case ReportInitial():
return initial(_that);case ReportPage1Ready():
return page1Ready(_that);case ReportPage1Error():
return page1Error(_that);case ReportPage2Ready():
return page2Ready(_that);case ReportPage2Error():
return page2Error(_that);case ReportSubmitting():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ReportInitial value)?  initial,TResult? Function( ReportPage1Ready value)?  page1Ready,TResult? Function( ReportPage1Error value)?  page1Error,TResult? Function( ReportPage2Ready value)?  page2Ready,TResult? Function( ReportPage2Error value)?  page2Error,TResult? Function( ReportSubmitting value)?  submitting,TResult? Function( ReportSubmitted value)?  submitted,TResult? Function( ReportSubmissionError value)?  submissionError,TResult? Function( ReportDraftSaved value)?  draftSaved,TResult? Function( ReportDraftError value)?  draftError,}){
final _that = this;
switch (_that) {
case ReportInitial() when initial != null:
return initial(_that);case ReportPage1Ready() when page1Ready != null:
return page1Ready(_that);case ReportPage1Error() when page1Error != null:
return page1Error(_that);case ReportPage2Ready() when page2Ready != null:
return page2Ready(_that);case ReportPage2Error() when page2Error != null:
return page2Error(_that);case ReportSubmitting() when submitting != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function( ReportApiData apiData,  ReportSelections selections)?  page1Ready,TResult Function( ReportApiData apiData,  ReportSelections selections,  String errorMessage)?  page1Error,TResult Function( ReportApiData apiData,  ReportSelections selections,  ReportFormData formData)?  page2Ready,TResult Function( ReportApiData apiData,  ReportSelections selections,  ReportFormData formData,  String errorMessage)?  page2Error,TResult Function( ReportData reportData)?  submitting,TResult Function( ReportData reportData)?  submitted,TResult Function( ReportData reportData,  String errorMessage)?  submissionError,TResult Function( ReportData reportData)?  draftSaved,TResult Function( ReportData reportData,  String errorMessage)?  draftError,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ReportInitial() when initial != null:
return initial();case ReportPage1Ready() when page1Ready != null:
return page1Ready(_that.apiData,_that.selections);case ReportPage1Error() when page1Error != null:
return page1Error(_that.apiData,_that.selections,_that.errorMessage);case ReportPage2Ready() when page2Ready != null:
return page2Ready(_that.apiData,_that.selections,_that.formData);case ReportPage2Error() when page2Error != null:
return page2Error(_that.apiData,_that.selections,_that.formData,_that.errorMessage);case ReportSubmitting() when submitting != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function( ReportApiData apiData,  ReportSelections selections)  page1Ready,required TResult Function( ReportApiData apiData,  ReportSelections selections,  String errorMessage)  page1Error,required TResult Function( ReportApiData apiData,  ReportSelections selections,  ReportFormData formData)  page2Ready,required TResult Function( ReportApiData apiData,  ReportSelections selections,  ReportFormData formData,  String errorMessage)  page2Error,required TResult Function( ReportData reportData)  submitting,required TResult Function( ReportData reportData)  submitted,required TResult Function( ReportData reportData,  String errorMessage)  submissionError,required TResult Function( ReportData reportData)  draftSaved,required TResult Function( ReportData reportData,  String errorMessage)  draftError,}) {final _that = this;
switch (_that) {
case ReportInitial():
return initial();case ReportPage1Ready():
return page1Ready(_that.apiData,_that.selections);case ReportPage1Error():
return page1Error(_that.apiData,_that.selections,_that.errorMessage);case ReportPage2Ready():
return page2Ready(_that.apiData,_that.selections,_that.formData);case ReportPage2Error():
return page2Error(_that.apiData,_that.selections,_that.formData,_that.errorMessage);case ReportSubmitting():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function( ReportApiData apiData,  ReportSelections selections)?  page1Ready,TResult? Function( ReportApiData apiData,  ReportSelections selections,  String errorMessage)?  page1Error,TResult? Function( ReportApiData apiData,  ReportSelections selections,  ReportFormData formData)?  page2Ready,TResult? Function( ReportApiData apiData,  ReportSelections selections,  ReportFormData formData,  String errorMessage)?  page2Error,TResult? Function( ReportData reportData)?  submitting,TResult? Function( ReportData reportData)?  submitted,TResult? Function( ReportData reportData,  String errorMessage)?  submissionError,TResult? Function( ReportData reportData)?  draftSaved,TResult? Function( ReportData reportData,  String errorMessage)?  draftError,}) {final _that = this;
switch (_that) {
case ReportInitial() when initial != null:
return initial();case ReportPage1Ready() when page1Ready != null:
return page1Ready(_that.apiData,_that.selections);case ReportPage1Error() when page1Error != null:
return page1Error(_that.apiData,_that.selections,_that.errorMessage);case ReportPage2Ready() when page2Ready != null:
return page2Ready(_that.apiData,_that.selections,_that.formData);case ReportPage2Error() when page2Error != null:
return page2Error(_that.apiData,_that.selections,_that.formData,_that.errorMessage);case ReportSubmitting() when submitting != null:
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


class ReportPage1Ready implements ReportCreationState {
  const ReportPage1Ready({required this.apiData, required this.selections});
  

 final  ReportApiData apiData;
 final  ReportSelections selections;

/// Create a copy of ReportCreationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReportPage1ReadyCopyWith<ReportPage1Ready> get copyWith => _$ReportPage1ReadyCopyWithImpl<ReportPage1Ready>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReportPage1Ready&&(identical(other.apiData, apiData) || other.apiData == apiData)&&(identical(other.selections, selections) || other.selections == selections));
}


@override
int get hashCode => Object.hash(runtimeType,apiData,selections);

@override
String toString() {
  return 'ReportCreationState.page1Ready(apiData: $apiData, selections: $selections)';
}


}

/// @nodoc
abstract mixin class $ReportPage1ReadyCopyWith<$Res> implements $ReportCreationStateCopyWith<$Res> {
  factory $ReportPage1ReadyCopyWith(ReportPage1Ready value, $Res Function(ReportPage1Ready) _then) = _$ReportPage1ReadyCopyWithImpl;
@useResult
$Res call({
 ReportApiData apiData, ReportSelections selections
});


$ReportApiDataCopyWith<$Res> get apiData;$ReportSelectionsCopyWith<$Res> get selections;

}
/// @nodoc
class _$ReportPage1ReadyCopyWithImpl<$Res>
    implements $ReportPage1ReadyCopyWith<$Res> {
  _$ReportPage1ReadyCopyWithImpl(this._self, this._then);

  final ReportPage1Ready _self;
  final $Res Function(ReportPage1Ready) _then;

/// Create a copy of ReportCreationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? apiData = null,Object? selections = null,}) {
  return _then(ReportPage1Ready(
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


class ReportPage1Error implements ReportCreationState {
  const ReportPage1Error({required this.apiData, required this.selections, required this.errorMessage});
  

 final  ReportApiData apiData;
 final  ReportSelections selections;
 final  String errorMessage;

/// Create a copy of ReportCreationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReportPage1ErrorCopyWith<ReportPage1Error> get copyWith => _$ReportPage1ErrorCopyWithImpl<ReportPage1Error>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReportPage1Error&&(identical(other.apiData, apiData) || other.apiData == apiData)&&(identical(other.selections, selections) || other.selections == selections)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,apiData,selections,errorMessage);

@override
String toString() {
  return 'ReportCreationState.page1Error(apiData: $apiData, selections: $selections, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $ReportPage1ErrorCopyWith<$Res> implements $ReportCreationStateCopyWith<$Res> {
  factory $ReportPage1ErrorCopyWith(ReportPage1Error value, $Res Function(ReportPage1Error) _then) = _$ReportPage1ErrorCopyWithImpl;
@useResult
$Res call({
 ReportApiData apiData, ReportSelections selections, String errorMessage
});


$ReportApiDataCopyWith<$Res> get apiData;$ReportSelectionsCopyWith<$Res> get selections;

}
/// @nodoc
class _$ReportPage1ErrorCopyWithImpl<$Res>
    implements $ReportPage1ErrorCopyWith<$Res> {
  _$ReportPage1ErrorCopyWithImpl(this._self, this._then);

  final ReportPage1Error _self;
  final $Res Function(ReportPage1Error) _then;

/// Create a copy of ReportCreationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? apiData = null,Object? selections = null,Object? errorMessage = null,}) {
  return _then(ReportPage1Error(
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


class ReportPage2Ready implements ReportCreationState {
  const ReportPage2Ready({required this.apiData, required this.selections, required this.formData});
  

 final  ReportApiData apiData;
 final  ReportSelections selections;
 final  ReportFormData formData;

/// Create a copy of ReportCreationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReportPage2ReadyCopyWith<ReportPage2Ready> get copyWith => _$ReportPage2ReadyCopyWithImpl<ReportPage2Ready>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReportPage2Ready&&(identical(other.apiData, apiData) || other.apiData == apiData)&&(identical(other.selections, selections) || other.selections == selections)&&(identical(other.formData, formData) || other.formData == formData));
}


@override
int get hashCode => Object.hash(runtimeType,apiData,selections,formData);

@override
String toString() {
  return 'ReportCreationState.page2Ready(apiData: $apiData, selections: $selections, formData: $formData)';
}


}

/// @nodoc
abstract mixin class $ReportPage2ReadyCopyWith<$Res> implements $ReportCreationStateCopyWith<$Res> {
  factory $ReportPage2ReadyCopyWith(ReportPage2Ready value, $Res Function(ReportPage2Ready) _then) = _$ReportPage2ReadyCopyWithImpl;
@useResult
$Res call({
 ReportApiData apiData, ReportSelections selections, ReportFormData formData
});


$ReportApiDataCopyWith<$Res> get apiData;$ReportSelectionsCopyWith<$Res> get selections;$ReportFormDataCopyWith<$Res> get formData;

}
/// @nodoc
class _$ReportPage2ReadyCopyWithImpl<$Res>
    implements $ReportPage2ReadyCopyWith<$Res> {
  _$ReportPage2ReadyCopyWithImpl(this._self, this._then);

  final ReportPage2Ready _self;
  final $Res Function(ReportPage2Ready) _then;

/// Create a copy of ReportCreationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? apiData = null,Object? selections = null,Object? formData = null,}) {
  return _then(ReportPage2Ready(
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


class ReportPage2Error implements ReportCreationState {
  const ReportPage2Error({required this.apiData, required this.selections, required this.formData, required this.errorMessage});
  

 final  ReportApiData apiData;
 final  ReportSelections selections;
 final  ReportFormData formData;
 final  String errorMessage;

/// Create a copy of ReportCreationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReportPage2ErrorCopyWith<ReportPage2Error> get copyWith => _$ReportPage2ErrorCopyWithImpl<ReportPage2Error>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReportPage2Error&&(identical(other.apiData, apiData) || other.apiData == apiData)&&(identical(other.selections, selections) || other.selections == selections)&&(identical(other.formData, formData) || other.formData == formData)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,apiData,selections,formData,errorMessage);

@override
String toString() {
  return 'ReportCreationState.page2Error(apiData: $apiData, selections: $selections, formData: $formData, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $ReportPage2ErrorCopyWith<$Res> implements $ReportCreationStateCopyWith<$Res> {
  factory $ReportPage2ErrorCopyWith(ReportPage2Error value, $Res Function(ReportPage2Error) _then) = _$ReportPage2ErrorCopyWithImpl;
@useResult
$Res call({
 ReportApiData apiData, ReportSelections selections, ReportFormData formData, String errorMessage
});


$ReportApiDataCopyWith<$Res> get apiData;$ReportSelectionsCopyWith<$Res> get selections;$ReportFormDataCopyWith<$Res> get formData;

}
/// @nodoc
class _$ReportPage2ErrorCopyWithImpl<$Res>
    implements $ReportPage2ErrorCopyWith<$Res> {
  _$ReportPage2ErrorCopyWithImpl(this._self, this._then);

  final ReportPage2Error _self;
  final $Res Function(ReportPage2Error) _then;

/// Create a copy of ReportCreationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? apiData = null,Object? selections = null,Object? formData = null,Object? errorMessage = null,}) {
  return _then(ReportPage2Error(
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

// dart format on
