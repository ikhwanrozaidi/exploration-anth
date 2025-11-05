// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'daily_report_edit_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DailyReportEditState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DailyReportEditState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DailyReportEditState()';
}


}

/// @nodoc
class $DailyReportEditStateCopyWith<$Res>  {
$DailyReportEditStateCopyWith(DailyReportEditState _, $Res Function(DailyReportEditState) __);
}


/// Adds pattern-matching-related methods to [DailyReportEditState].
extension DailyReportEditStatePatterns on DailyReportEditState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( EditInitial value)?  initial,TResult Function( EditLoading value)?  loading,TResult Function( EditingReport value)?  editing,TResult Function( LoadingDataEdit value)?  loadingData,TResult Function( LoadErrorEdit value)?  loadError,TResult Function( SubmittingUpdate value)?  submitting,TResult Function( UpdateSuccess value)?  success,TResult Function( UpdateError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case EditInitial() when initial != null:
return initial(_that);case EditLoading() when loading != null:
return loading(_that);case EditingReport() when editing != null:
return editing(_that);case LoadingDataEdit() when loadingData != null:
return loadingData(_that);case LoadErrorEdit() when loadError != null:
return loadError(_that);case SubmittingUpdate() when submitting != null:
return submitting(_that);case UpdateSuccess() when success != null:
return success(_that);case UpdateError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( EditInitial value)  initial,required TResult Function( EditLoading value)  loading,required TResult Function( EditingReport value)  editing,required TResult Function( LoadingDataEdit value)  loadingData,required TResult Function( LoadErrorEdit value)  loadError,required TResult Function( SubmittingUpdate value)  submitting,required TResult Function( UpdateSuccess value)  success,required TResult Function( UpdateError value)  error,}){
final _that = this;
switch (_that) {
case EditInitial():
return initial(_that);case EditLoading():
return loading(_that);case EditingReport():
return editing(_that);case LoadingDataEdit():
return loadingData(_that);case LoadErrorEdit():
return loadError(_that);case SubmittingUpdate():
return submitting(_that);case UpdateSuccess():
return success(_that);case UpdateError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( EditInitial value)?  initial,TResult? Function( EditLoading value)?  loading,TResult? Function( EditingReport value)?  editing,TResult? Function( LoadingDataEdit value)?  loadingData,TResult? Function( LoadErrorEdit value)?  loadError,TResult? Function( SubmittingUpdate value)?  submitting,TResult? Function( UpdateSuccess value)?  success,TResult? Function( UpdateError value)?  error,}){
final _that = this;
switch (_that) {
case EditInitial() when initial != null:
return initial(_that);case EditLoading() when loading != null:
return loading(_that);case EditingReport() when editing != null:
return editing(_that);case LoadingDataEdit() when loadingData != null:
return loadingData(_that);case LoadErrorEdit() when loadError != null:
return loadError(_that);case SubmittingUpdate() when submitting != null:
return submitting(_that);case UpdateSuccess() when success != null:
return success(_that);case UpdateError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( ReportApiData apiData,  ReportSelections selections,  ReportFormData formData,  String reportUID,  String companyUID)?  editing,TResult Function( ReportApiData apiData,  ReportSelections selections,  ReportFormData formData,  String reportUID,  String companyUID)?  loadingData,TResult Function( String message,  String reportUID)?  loadError,TResult Function( ReportApiData apiData,  ReportSelections selections,  ReportFormData formData,  String reportUID,  String companyUID)?  submitting,TResult Function( DailyReport updatedReport)?  success,TResult Function( String message,  ReportApiData apiData,  ReportSelections selections,  ReportFormData formData,  String reportUID,  String companyUID)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case EditInitial() when initial != null:
return initial();case EditLoading() when loading != null:
return loading();case EditingReport() when editing != null:
return editing(_that.apiData,_that.selections,_that.formData,_that.reportUID,_that.companyUID);case LoadingDataEdit() when loadingData != null:
return loadingData(_that.apiData,_that.selections,_that.formData,_that.reportUID,_that.companyUID);case LoadErrorEdit() when loadError != null:
return loadError(_that.message,_that.reportUID);case SubmittingUpdate() when submitting != null:
return submitting(_that.apiData,_that.selections,_that.formData,_that.reportUID,_that.companyUID);case UpdateSuccess() when success != null:
return success(_that.updatedReport);case UpdateError() when error != null:
return error(_that.message,_that.apiData,_that.selections,_that.formData,_that.reportUID,_that.companyUID);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( ReportApiData apiData,  ReportSelections selections,  ReportFormData formData,  String reportUID,  String companyUID)  editing,required TResult Function( ReportApiData apiData,  ReportSelections selections,  ReportFormData formData,  String reportUID,  String companyUID)  loadingData,required TResult Function( String message,  String reportUID)  loadError,required TResult Function( ReportApiData apiData,  ReportSelections selections,  ReportFormData formData,  String reportUID,  String companyUID)  submitting,required TResult Function( DailyReport updatedReport)  success,required TResult Function( String message,  ReportApiData apiData,  ReportSelections selections,  ReportFormData formData,  String reportUID,  String companyUID)  error,}) {final _that = this;
switch (_that) {
case EditInitial():
return initial();case EditLoading():
return loading();case EditingReport():
return editing(_that.apiData,_that.selections,_that.formData,_that.reportUID,_that.companyUID);case LoadingDataEdit():
return loadingData(_that.apiData,_that.selections,_that.formData,_that.reportUID,_that.companyUID);case LoadErrorEdit():
return loadError(_that.message,_that.reportUID);case SubmittingUpdate():
return submitting(_that.apiData,_that.selections,_that.formData,_that.reportUID,_that.companyUID);case UpdateSuccess():
return success(_that.updatedReport);case UpdateError():
return error(_that.message,_that.apiData,_that.selections,_that.formData,_that.reportUID,_that.companyUID);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( ReportApiData apiData,  ReportSelections selections,  ReportFormData formData,  String reportUID,  String companyUID)?  editing,TResult? Function( ReportApiData apiData,  ReportSelections selections,  ReportFormData formData,  String reportUID,  String companyUID)?  loadingData,TResult? Function( String message,  String reportUID)?  loadError,TResult? Function( ReportApiData apiData,  ReportSelections selections,  ReportFormData formData,  String reportUID,  String companyUID)?  submitting,TResult? Function( DailyReport updatedReport)?  success,TResult? Function( String message,  ReportApiData apiData,  ReportSelections selections,  ReportFormData formData,  String reportUID,  String companyUID)?  error,}) {final _that = this;
switch (_that) {
case EditInitial() when initial != null:
return initial();case EditLoading() when loading != null:
return loading();case EditingReport() when editing != null:
return editing(_that.apiData,_that.selections,_that.formData,_that.reportUID,_that.companyUID);case LoadingDataEdit() when loadingData != null:
return loadingData(_that.apiData,_that.selections,_that.formData,_that.reportUID,_that.companyUID);case LoadErrorEdit() when loadError != null:
return loadError(_that.message,_that.reportUID);case SubmittingUpdate() when submitting != null:
return submitting(_that.apiData,_that.selections,_that.formData,_that.reportUID,_that.companyUID);case UpdateSuccess() when success != null:
return success(_that.updatedReport);case UpdateError() when error != null:
return error(_that.message,_that.apiData,_that.selections,_that.formData,_that.reportUID,_that.companyUID);case _:
  return null;

}
}

}

/// @nodoc


class EditInitial implements DailyReportEditState {
  const EditInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EditInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DailyReportEditState.initial()';
}


}




/// @nodoc


class EditLoading implements DailyReportEditState {
  const EditLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EditLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DailyReportEditState.loading()';
}


}




/// @nodoc


class EditingReport implements DailyReportEditState {
  const EditingReport({required this.apiData, required this.selections, required this.formData, required this.reportUID, required this.companyUID});
  

 final  ReportApiData apiData;
 final  ReportSelections selections;
 final  ReportFormData formData;
 final  String reportUID;
// Track which report we're editing
 final  String companyUID;

/// Create a copy of DailyReportEditState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EditingReportCopyWith<EditingReport> get copyWith => _$EditingReportCopyWithImpl<EditingReport>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EditingReport&&(identical(other.apiData, apiData) || other.apiData == apiData)&&(identical(other.selections, selections) || other.selections == selections)&&(identical(other.formData, formData) || other.formData == formData)&&(identical(other.reportUID, reportUID) || other.reportUID == reportUID)&&(identical(other.companyUID, companyUID) || other.companyUID == companyUID));
}


@override
int get hashCode => Object.hash(runtimeType,apiData,selections,formData,reportUID,companyUID);

@override
String toString() {
  return 'DailyReportEditState.editing(apiData: $apiData, selections: $selections, formData: $formData, reportUID: $reportUID, companyUID: $companyUID)';
}


}

/// @nodoc
abstract mixin class $EditingReportCopyWith<$Res> implements $DailyReportEditStateCopyWith<$Res> {
  factory $EditingReportCopyWith(EditingReport value, $Res Function(EditingReport) _then) = _$EditingReportCopyWithImpl;
@useResult
$Res call({
 ReportApiData apiData, ReportSelections selections, ReportFormData formData, String reportUID, String companyUID
});


$ReportApiDataCopyWith<$Res> get apiData;$ReportSelectionsCopyWith<$Res> get selections;$ReportFormDataCopyWith<$Res> get formData;

}
/// @nodoc
class _$EditingReportCopyWithImpl<$Res>
    implements $EditingReportCopyWith<$Res> {
  _$EditingReportCopyWithImpl(this._self, this._then);

  final EditingReport _self;
  final $Res Function(EditingReport) _then;

/// Create a copy of DailyReportEditState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? apiData = null,Object? selections = null,Object? formData = null,Object? reportUID = null,Object? companyUID = null,}) {
  return _then(EditingReport(
apiData: null == apiData ? _self.apiData : apiData // ignore: cast_nullable_to_non_nullable
as ReportApiData,selections: null == selections ? _self.selections : selections // ignore: cast_nullable_to_non_nullable
as ReportSelections,formData: null == formData ? _self.formData : formData // ignore: cast_nullable_to_non_nullable
as ReportFormData,reportUID: null == reportUID ? _self.reportUID : reportUID // ignore: cast_nullable_to_non_nullable
as String,companyUID: null == companyUID ? _self.companyUID : companyUID // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of DailyReportEditState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReportApiDataCopyWith<$Res> get apiData {
  
  return $ReportApiDataCopyWith<$Res>(_self.apiData, (value) {
    return _then(_self.copyWith(apiData: value));
  });
}/// Create a copy of DailyReportEditState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReportSelectionsCopyWith<$Res> get selections {
  
  return $ReportSelectionsCopyWith<$Res>(_self.selections, (value) {
    return _then(_self.copyWith(selections: value));
  });
}/// Create a copy of DailyReportEditState
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


class LoadingDataEdit implements DailyReportEditState {
  const LoadingDataEdit({required this.apiData, required this.selections, required this.formData, required this.reportUID, required this.companyUID});
  

 final  ReportApiData apiData;
 final  ReportSelections selections;
 final  ReportFormData formData;
 final  String reportUID;
 final  String companyUID;

/// Create a copy of DailyReportEditState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadingDataEditCopyWith<LoadingDataEdit> get copyWith => _$LoadingDataEditCopyWithImpl<LoadingDataEdit>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadingDataEdit&&(identical(other.apiData, apiData) || other.apiData == apiData)&&(identical(other.selections, selections) || other.selections == selections)&&(identical(other.formData, formData) || other.formData == formData)&&(identical(other.reportUID, reportUID) || other.reportUID == reportUID)&&(identical(other.companyUID, companyUID) || other.companyUID == companyUID));
}


@override
int get hashCode => Object.hash(runtimeType,apiData,selections,formData,reportUID,companyUID);

@override
String toString() {
  return 'DailyReportEditState.loadingData(apiData: $apiData, selections: $selections, formData: $formData, reportUID: $reportUID, companyUID: $companyUID)';
}


}

/// @nodoc
abstract mixin class $LoadingDataEditCopyWith<$Res> implements $DailyReportEditStateCopyWith<$Res> {
  factory $LoadingDataEditCopyWith(LoadingDataEdit value, $Res Function(LoadingDataEdit) _then) = _$LoadingDataEditCopyWithImpl;
@useResult
$Res call({
 ReportApiData apiData, ReportSelections selections, ReportFormData formData, String reportUID, String companyUID
});


$ReportApiDataCopyWith<$Res> get apiData;$ReportSelectionsCopyWith<$Res> get selections;$ReportFormDataCopyWith<$Res> get formData;

}
/// @nodoc
class _$LoadingDataEditCopyWithImpl<$Res>
    implements $LoadingDataEditCopyWith<$Res> {
  _$LoadingDataEditCopyWithImpl(this._self, this._then);

  final LoadingDataEdit _self;
  final $Res Function(LoadingDataEdit) _then;

/// Create a copy of DailyReportEditState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? apiData = null,Object? selections = null,Object? formData = null,Object? reportUID = null,Object? companyUID = null,}) {
  return _then(LoadingDataEdit(
apiData: null == apiData ? _self.apiData : apiData // ignore: cast_nullable_to_non_nullable
as ReportApiData,selections: null == selections ? _self.selections : selections // ignore: cast_nullable_to_non_nullable
as ReportSelections,formData: null == formData ? _self.formData : formData // ignore: cast_nullable_to_non_nullable
as ReportFormData,reportUID: null == reportUID ? _self.reportUID : reportUID // ignore: cast_nullable_to_non_nullable
as String,companyUID: null == companyUID ? _self.companyUID : companyUID // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of DailyReportEditState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReportApiDataCopyWith<$Res> get apiData {
  
  return $ReportApiDataCopyWith<$Res>(_self.apiData, (value) {
    return _then(_self.copyWith(apiData: value));
  });
}/// Create a copy of DailyReportEditState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReportSelectionsCopyWith<$Res> get selections {
  
  return $ReportSelectionsCopyWith<$Res>(_self.selections, (value) {
    return _then(_self.copyWith(selections: value));
  });
}/// Create a copy of DailyReportEditState
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


class LoadErrorEdit implements DailyReportEditState {
  const LoadErrorEdit({required this.message, required this.reportUID});
  

 final  String message;
 final  String reportUID;

/// Create a copy of DailyReportEditState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadErrorEditCopyWith<LoadErrorEdit> get copyWith => _$LoadErrorEditCopyWithImpl<LoadErrorEdit>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadErrorEdit&&(identical(other.message, message) || other.message == message)&&(identical(other.reportUID, reportUID) || other.reportUID == reportUID));
}


@override
int get hashCode => Object.hash(runtimeType,message,reportUID);

@override
String toString() {
  return 'DailyReportEditState.loadError(message: $message, reportUID: $reportUID)';
}


}

/// @nodoc
abstract mixin class $LoadErrorEditCopyWith<$Res> implements $DailyReportEditStateCopyWith<$Res> {
  factory $LoadErrorEditCopyWith(LoadErrorEdit value, $Res Function(LoadErrorEdit) _then) = _$LoadErrorEditCopyWithImpl;
@useResult
$Res call({
 String message, String reportUID
});




}
/// @nodoc
class _$LoadErrorEditCopyWithImpl<$Res>
    implements $LoadErrorEditCopyWith<$Res> {
  _$LoadErrorEditCopyWithImpl(this._self, this._then);

  final LoadErrorEdit _self;
  final $Res Function(LoadErrorEdit) _then;

/// Create a copy of DailyReportEditState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,Object? reportUID = null,}) {
  return _then(LoadErrorEdit(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,reportUID: null == reportUID ? _self.reportUID : reportUID // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class SubmittingUpdate implements DailyReportEditState {
  const SubmittingUpdate({required this.apiData, required this.selections, required this.formData, required this.reportUID, required this.companyUID});
  

 final  ReportApiData apiData;
 final  ReportSelections selections;
 final  ReportFormData formData;
 final  String reportUID;
 final  String companyUID;

/// Create a copy of DailyReportEditState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SubmittingUpdateCopyWith<SubmittingUpdate> get copyWith => _$SubmittingUpdateCopyWithImpl<SubmittingUpdate>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubmittingUpdate&&(identical(other.apiData, apiData) || other.apiData == apiData)&&(identical(other.selections, selections) || other.selections == selections)&&(identical(other.formData, formData) || other.formData == formData)&&(identical(other.reportUID, reportUID) || other.reportUID == reportUID)&&(identical(other.companyUID, companyUID) || other.companyUID == companyUID));
}


@override
int get hashCode => Object.hash(runtimeType,apiData,selections,formData,reportUID,companyUID);

@override
String toString() {
  return 'DailyReportEditState.submitting(apiData: $apiData, selections: $selections, formData: $formData, reportUID: $reportUID, companyUID: $companyUID)';
}


}

/// @nodoc
abstract mixin class $SubmittingUpdateCopyWith<$Res> implements $DailyReportEditStateCopyWith<$Res> {
  factory $SubmittingUpdateCopyWith(SubmittingUpdate value, $Res Function(SubmittingUpdate) _then) = _$SubmittingUpdateCopyWithImpl;
@useResult
$Res call({
 ReportApiData apiData, ReportSelections selections, ReportFormData formData, String reportUID, String companyUID
});


$ReportApiDataCopyWith<$Res> get apiData;$ReportSelectionsCopyWith<$Res> get selections;$ReportFormDataCopyWith<$Res> get formData;

}
/// @nodoc
class _$SubmittingUpdateCopyWithImpl<$Res>
    implements $SubmittingUpdateCopyWith<$Res> {
  _$SubmittingUpdateCopyWithImpl(this._self, this._then);

  final SubmittingUpdate _self;
  final $Res Function(SubmittingUpdate) _then;

/// Create a copy of DailyReportEditState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? apiData = null,Object? selections = null,Object? formData = null,Object? reportUID = null,Object? companyUID = null,}) {
  return _then(SubmittingUpdate(
apiData: null == apiData ? _self.apiData : apiData // ignore: cast_nullable_to_non_nullable
as ReportApiData,selections: null == selections ? _self.selections : selections // ignore: cast_nullable_to_non_nullable
as ReportSelections,formData: null == formData ? _self.formData : formData // ignore: cast_nullable_to_non_nullable
as ReportFormData,reportUID: null == reportUID ? _self.reportUID : reportUID // ignore: cast_nullable_to_non_nullable
as String,companyUID: null == companyUID ? _self.companyUID : companyUID // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of DailyReportEditState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReportApiDataCopyWith<$Res> get apiData {
  
  return $ReportApiDataCopyWith<$Res>(_self.apiData, (value) {
    return _then(_self.copyWith(apiData: value));
  });
}/// Create a copy of DailyReportEditState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReportSelectionsCopyWith<$Res> get selections {
  
  return $ReportSelectionsCopyWith<$Res>(_self.selections, (value) {
    return _then(_self.copyWith(selections: value));
  });
}/// Create a copy of DailyReportEditState
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


class UpdateSuccess implements DailyReportEditState {
  const UpdateSuccess({required this.updatedReport});
  

 final  DailyReport updatedReport;

/// Create a copy of DailyReportEditState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateSuccessCopyWith<UpdateSuccess> get copyWith => _$UpdateSuccessCopyWithImpl<UpdateSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateSuccess&&(identical(other.updatedReport, updatedReport) || other.updatedReport == updatedReport));
}


@override
int get hashCode => Object.hash(runtimeType,updatedReport);

@override
String toString() {
  return 'DailyReportEditState.success(updatedReport: $updatedReport)';
}


}

/// @nodoc
abstract mixin class $UpdateSuccessCopyWith<$Res> implements $DailyReportEditStateCopyWith<$Res> {
  factory $UpdateSuccessCopyWith(UpdateSuccess value, $Res Function(UpdateSuccess) _then) = _$UpdateSuccessCopyWithImpl;
@useResult
$Res call({
 DailyReport updatedReport
});




}
/// @nodoc
class _$UpdateSuccessCopyWithImpl<$Res>
    implements $UpdateSuccessCopyWith<$Res> {
  _$UpdateSuccessCopyWithImpl(this._self, this._then);

  final UpdateSuccess _self;
  final $Res Function(UpdateSuccess) _then;

/// Create a copy of DailyReportEditState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? updatedReport = null,}) {
  return _then(UpdateSuccess(
updatedReport: null == updatedReport ? _self.updatedReport : updatedReport // ignore: cast_nullable_to_non_nullable
as DailyReport,
  ));
}


}

/// @nodoc


class UpdateError implements DailyReportEditState {
  const UpdateError({required this.message, required this.apiData, required this.selections, required this.formData, required this.reportUID, required this.companyUID});
  

 final  String message;
 final  ReportApiData apiData;
 final  ReportSelections selections;
 final  ReportFormData formData;
 final  String reportUID;
 final  String companyUID;

/// Create a copy of DailyReportEditState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateErrorCopyWith<UpdateError> get copyWith => _$UpdateErrorCopyWithImpl<UpdateError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateError&&(identical(other.message, message) || other.message == message)&&(identical(other.apiData, apiData) || other.apiData == apiData)&&(identical(other.selections, selections) || other.selections == selections)&&(identical(other.formData, formData) || other.formData == formData)&&(identical(other.reportUID, reportUID) || other.reportUID == reportUID)&&(identical(other.companyUID, companyUID) || other.companyUID == companyUID));
}


@override
int get hashCode => Object.hash(runtimeType,message,apiData,selections,formData,reportUID,companyUID);

@override
String toString() {
  return 'DailyReportEditState.error(message: $message, apiData: $apiData, selections: $selections, formData: $formData, reportUID: $reportUID, companyUID: $companyUID)';
}


}

/// @nodoc
abstract mixin class $UpdateErrorCopyWith<$Res> implements $DailyReportEditStateCopyWith<$Res> {
  factory $UpdateErrorCopyWith(UpdateError value, $Res Function(UpdateError) _then) = _$UpdateErrorCopyWithImpl;
@useResult
$Res call({
 String message, ReportApiData apiData, ReportSelections selections, ReportFormData formData, String reportUID, String companyUID
});


$ReportApiDataCopyWith<$Res> get apiData;$ReportSelectionsCopyWith<$Res> get selections;$ReportFormDataCopyWith<$Res> get formData;

}
/// @nodoc
class _$UpdateErrorCopyWithImpl<$Res>
    implements $UpdateErrorCopyWith<$Res> {
  _$UpdateErrorCopyWithImpl(this._self, this._then);

  final UpdateError _self;
  final $Res Function(UpdateError) _then;

/// Create a copy of DailyReportEditState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,Object? apiData = null,Object? selections = null,Object? formData = null,Object? reportUID = null,Object? companyUID = null,}) {
  return _then(UpdateError(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,apiData: null == apiData ? _self.apiData : apiData // ignore: cast_nullable_to_non_nullable
as ReportApiData,selections: null == selections ? _self.selections : selections // ignore: cast_nullable_to_non_nullable
as ReportSelections,formData: null == formData ? _self.formData : formData // ignore: cast_nullable_to_non_nullable
as ReportFormData,reportUID: null == reportUID ? _self.reportUID : reportUID // ignore: cast_nullable_to_non_nullable
as String,companyUID: null == companyUID ? _self.companyUID : companyUID // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of DailyReportEditState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReportApiDataCopyWith<$Res> get apiData {
  
  return $ReportApiDataCopyWith<$Res>(_self.apiData, (value) {
    return _then(_self.copyWith(apiData: value));
  });
}/// Create a copy of DailyReportEditState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReportSelectionsCopyWith<$Res> get selections {
  
  return $ReportSelectionsCopyWith<$Res>(_self.selections, (value) {
    return _then(_self.copyWith(selections: value));
  });
}/// Create a copy of DailyReportEditState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReportFormDataCopyWith<$Res> get formData {
  
  return $ReportFormDataCopyWith<$Res>(_self.formData, (value) {
    return _then(_self.copyWith(formData: value));
  });
}
}

// dart format on
