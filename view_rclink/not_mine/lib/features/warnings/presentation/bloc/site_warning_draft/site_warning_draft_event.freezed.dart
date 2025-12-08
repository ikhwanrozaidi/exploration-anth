// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'site_warning_draft_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SiteWarningDraftEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SiteWarningDraftEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SiteWarningDraftEvent()';
}


}

/// @nodoc
class $SiteWarningDraftEventCopyWith<$Res>  {
$SiteWarningDraftEventCopyWith(SiteWarningDraftEvent _, $Res Function(SiteWarningDraftEvent) __);
}


/// Adds pattern-matching-related methods to [SiteWarningDraftEvent].
extension SiteWarningDraftEventPatterns on SiteWarningDraftEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( InitializeDraft value)?  initializeDraft,TResult Function( UpdateLocation value)?  updateLocation,TResult Function( UpdateContractor value)?  updateContractor,TResult Function( UpdateWarningReasons value)?  updateWarningReasons,TResult Function( UpdateDescription value)?  updateDescription,TResult Function( AutoSaveDraft value)?  autoSaveDraft,TResult Function( LoadExistingDraft value)?  loadExistingDraft,TResult Function( DeleteDraft value)?  deleteDraft,TResult Function( SubmitWarning value)?  submitWarning,TResult Function( LoadDraftList value)?  loadDraftList,required TResult orElse(),}){
final _that = this;
switch (_that) {
case InitializeDraft() when initializeDraft != null:
return initializeDraft(_that);case UpdateLocation() when updateLocation != null:
return updateLocation(_that);case UpdateContractor() when updateContractor != null:
return updateContractor(_that);case UpdateWarningReasons() when updateWarningReasons != null:
return updateWarningReasons(_that);case UpdateDescription() when updateDescription != null:
return updateDescription(_that);case AutoSaveDraft() when autoSaveDraft != null:
return autoSaveDraft(_that);case LoadExistingDraft() when loadExistingDraft != null:
return loadExistingDraft(_that);case DeleteDraft() when deleteDraft != null:
return deleteDraft(_that);case SubmitWarning() when submitWarning != null:
return submitWarning(_that);case LoadDraftList() when loadDraftList != null:
return loadDraftList(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( InitializeDraft value)  initializeDraft,required TResult Function( UpdateLocation value)  updateLocation,required TResult Function( UpdateContractor value)  updateContractor,required TResult Function( UpdateWarningReasons value)  updateWarningReasons,required TResult Function( UpdateDescription value)  updateDescription,required TResult Function( AutoSaveDraft value)  autoSaveDraft,required TResult Function( LoadExistingDraft value)  loadExistingDraft,required TResult Function( DeleteDraft value)  deleteDraft,required TResult Function( SubmitWarning value)  submitWarning,required TResult Function( LoadDraftList value)  loadDraftList,}){
final _that = this;
switch (_that) {
case InitializeDraft():
return initializeDraft(_that);case UpdateLocation():
return updateLocation(_that);case UpdateContractor():
return updateContractor(_that);case UpdateWarningReasons():
return updateWarningReasons(_that);case UpdateDescription():
return updateDescription(_that);case AutoSaveDraft():
return autoSaveDraft(_that);case LoadExistingDraft():
return loadExistingDraft(_that);case DeleteDraft():
return deleteDraft(_that);case SubmitWarning():
return submitWarning(_that);case LoadDraftList():
return loadDraftList(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( InitializeDraft value)?  initializeDraft,TResult? Function( UpdateLocation value)?  updateLocation,TResult? Function( UpdateContractor value)?  updateContractor,TResult? Function( UpdateWarningReasons value)?  updateWarningReasons,TResult? Function( UpdateDescription value)?  updateDescription,TResult? Function( AutoSaveDraft value)?  autoSaveDraft,TResult? Function( LoadExistingDraft value)?  loadExistingDraft,TResult? Function( DeleteDraft value)?  deleteDraft,TResult? Function( SubmitWarning value)?  submitWarning,TResult? Function( LoadDraftList value)?  loadDraftList,}){
final _that = this;
switch (_that) {
case InitializeDraft() when initializeDraft != null:
return initializeDraft(_that);case UpdateLocation() when updateLocation != null:
return updateLocation(_that);case UpdateContractor() when updateContractor != null:
return updateContractor(_that);case UpdateWarningReasons() when updateWarningReasons != null:
return updateWarningReasons(_that);case UpdateDescription() when updateDescription != null:
return updateDescription(_that);case AutoSaveDraft() when autoSaveDraft != null:
return autoSaveDraft(_that);case LoadExistingDraft() when loadExistingDraft != null:
return loadExistingDraft(_that);case DeleteDraft() when deleteDraft != null:
return deleteDraft(_that);case SubmitWarning() when submitWarning != null:
return submitWarning(_that);case LoadDraftList() when loadDraftList != null:
return loadDraftList(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String companyUID,  int scopeID,  String scopeUID,  String scopeName,  Road road,  String startSection,  String? endSection)?  initializeDraft,TResult Function( double latitude,  double longitude)?  updateLocation,TResult Function( ContractorRelation contractor)?  updateContractor,TResult Function( List<String> warningReasonUIDs)?  updateWarningReasons,TResult Function( String description)?  updateDescription,TResult Function()?  autoSaveDraft,TResult Function( String draftUID)?  loadExistingDraft,TResult Function( String draftUID)?  deleteDraft,TResult Function( String companyUID)?  submitWarning,TResult Function( String companyUID)?  loadDraftList,required TResult orElse(),}) {final _that = this;
switch (_that) {
case InitializeDraft() when initializeDraft != null:
return initializeDraft(_that.companyUID,_that.scopeID,_that.scopeUID,_that.scopeName,_that.road,_that.startSection,_that.endSection);case UpdateLocation() when updateLocation != null:
return updateLocation(_that.latitude,_that.longitude);case UpdateContractor() when updateContractor != null:
return updateContractor(_that.contractor);case UpdateWarningReasons() when updateWarningReasons != null:
return updateWarningReasons(_that.warningReasonUIDs);case UpdateDescription() when updateDescription != null:
return updateDescription(_that.description);case AutoSaveDraft() when autoSaveDraft != null:
return autoSaveDraft();case LoadExistingDraft() when loadExistingDraft != null:
return loadExistingDraft(_that.draftUID);case DeleteDraft() when deleteDraft != null:
return deleteDraft(_that.draftUID);case SubmitWarning() when submitWarning != null:
return submitWarning(_that.companyUID);case LoadDraftList() when loadDraftList != null:
return loadDraftList(_that.companyUID);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String companyUID,  int scopeID,  String scopeUID,  String scopeName,  Road road,  String startSection,  String? endSection)  initializeDraft,required TResult Function( double latitude,  double longitude)  updateLocation,required TResult Function( ContractorRelation contractor)  updateContractor,required TResult Function( List<String> warningReasonUIDs)  updateWarningReasons,required TResult Function( String description)  updateDescription,required TResult Function()  autoSaveDraft,required TResult Function( String draftUID)  loadExistingDraft,required TResult Function( String draftUID)  deleteDraft,required TResult Function( String companyUID)  submitWarning,required TResult Function( String companyUID)  loadDraftList,}) {final _that = this;
switch (_that) {
case InitializeDraft():
return initializeDraft(_that.companyUID,_that.scopeID,_that.scopeUID,_that.scopeName,_that.road,_that.startSection,_that.endSection);case UpdateLocation():
return updateLocation(_that.latitude,_that.longitude);case UpdateContractor():
return updateContractor(_that.contractor);case UpdateWarningReasons():
return updateWarningReasons(_that.warningReasonUIDs);case UpdateDescription():
return updateDescription(_that.description);case AutoSaveDraft():
return autoSaveDraft();case LoadExistingDraft():
return loadExistingDraft(_that.draftUID);case DeleteDraft():
return deleteDraft(_that.draftUID);case SubmitWarning():
return submitWarning(_that.companyUID);case LoadDraftList():
return loadDraftList(_that.companyUID);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String companyUID,  int scopeID,  String scopeUID,  String scopeName,  Road road,  String startSection,  String? endSection)?  initializeDraft,TResult? Function( double latitude,  double longitude)?  updateLocation,TResult? Function( ContractorRelation contractor)?  updateContractor,TResult? Function( List<String> warningReasonUIDs)?  updateWarningReasons,TResult? Function( String description)?  updateDescription,TResult? Function()?  autoSaveDraft,TResult? Function( String draftUID)?  loadExistingDraft,TResult? Function( String draftUID)?  deleteDraft,TResult? Function( String companyUID)?  submitWarning,TResult? Function( String companyUID)?  loadDraftList,}) {final _that = this;
switch (_that) {
case InitializeDraft() when initializeDraft != null:
return initializeDraft(_that.companyUID,_that.scopeID,_that.scopeUID,_that.scopeName,_that.road,_that.startSection,_that.endSection);case UpdateLocation() when updateLocation != null:
return updateLocation(_that.latitude,_that.longitude);case UpdateContractor() when updateContractor != null:
return updateContractor(_that.contractor);case UpdateWarningReasons() when updateWarningReasons != null:
return updateWarningReasons(_that.warningReasonUIDs);case UpdateDescription() when updateDescription != null:
return updateDescription(_that.description);case AutoSaveDraft() when autoSaveDraft != null:
return autoSaveDraft();case LoadExistingDraft() when loadExistingDraft != null:
return loadExistingDraft(_that.draftUID);case DeleteDraft() when deleteDraft != null:
return deleteDraft(_that.draftUID);case SubmitWarning() when submitWarning != null:
return submitWarning(_that.companyUID);case LoadDraftList() when loadDraftList != null:
return loadDraftList(_that.companyUID);case _:
  return null;

}
}

}

/// @nodoc


class InitializeDraft implements SiteWarningDraftEvent {
  const InitializeDraft({required this.companyUID, required this.scopeID, required this.scopeUID, required this.scopeName, required this.road, required this.startSection, this.endSection});
  

 final  String companyUID;
 final  int scopeID;
 final  String scopeUID;
 final  String scopeName;
 final  Road road;
 final  String startSection;
 final  String? endSection;

/// Create a copy of SiteWarningDraftEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InitializeDraftCopyWith<InitializeDraft> get copyWith => _$InitializeDraftCopyWithImpl<InitializeDraft>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InitializeDraft&&(identical(other.companyUID, companyUID) || other.companyUID == companyUID)&&(identical(other.scopeID, scopeID) || other.scopeID == scopeID)&&(identical(other.scopeUID, scopeUID) || other.scopeUID == scopeUID)&&(identical(other.scopeName, scopeName) || other.scopeName == scopeName)&&(identical(other.road, road) || other.road == road)&&(identical(other.startSection, startSection) || other.startSection == startSection)&&(identical(other.endSection, endSection) || other.endSection == endSection));
}


@override
int get hashCode => Object.hash(runtimeType,companyUID,scopeID,scopeUID,scopeName,road,startSection,endSection);

@override
String toString() {
  return 'SiteWarningDraftEvent.initializeDraft(companyUID: $companyUID, scopeID: $scopeID, scopeUID: $scopeUID, scopeName: $scopeName, road: $road, startSection: $startSection, endSection: $endSection)';
}


}

/// @nodoc
abstract mixin class $InitializeDraftCopyWith<$Res> implements $SiteWarningDraftEventCopyWith<$Res> {
  factory $InitializeDraftCopyWith(InitializeDraft value, $Res Function(InitializeDraft) _then) = _$InitializeDraftCopyWithImpl;
@useResult
$Res call({
 String companyUID, int scopeID, String scopeUID, String scopeName, Road road, String startSection, String? endSection
});




}
/// @nodoc
class _$InitializeDraftCopyWithImpl<$Res>
    implements $InitializeDraftCopyWith<$Res> {
  _$InitializeDraftCopyWithImpl(this._self, this._then);

  final InitializeDraft _self;
  final $Res Function(InitializeDraft) _then;

/// Create a copy of SiteWarningDraftEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? companyUID = null,Object? scopeID = null,Object? scopeUID = null,Object? scopeName = null,Object? road = null,Object? startSection = null,Object? endSection = freezed,}) {
  return _then(InitializeDraft(
companyUID: null == companyUID ? _self.companyUID : companyUID // ignore: cast_nullable_to_non_nullable
as String,scopeID: null == scopeID ? _self.scopeID : scopeID // ignore: cast_nullable_to_non_nullable
as int,scopeUID: null == scopeUID ? _self.scopeUID : scopeUID // ignore: cast_nullable_to_non_nullable
as String,scopeName: null == scopeName ? _self.scopeName : scopeName // ignore: cast_nullable_to_non_nullable
as String,road: null == road ? _self.road : road // ignore: cast_nullable_to_non_nullable
as Road,startSection: null == startSection ? _self.startSection : startSection // ignore: cast_nullable_to_non_nullable
as String,endSection: freezed == endSection ? _self.endSection : endSection // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class UpdateLocation implements SiteWarningDraftEvent {
  const UpdateLocation({required this.latitude, required this.longitude});
  

 final  double latitude;
 final  double longitude;

/// Create a copy of SiteWarningDraftEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateLocationCopyWith<UpdateLocation> get copyWith => _$UpdateLocationCopyWithImpl<UpdateLocation>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateLocation&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude));
}


@override
int get hashCode => Object.hash(runtimeType,latitude,longitude);

@override
String toString() {
  return 'SiteWarningDraftEvent.updateLocation(latitude: $latitude, longitude: $longitude)';
}


}

/// @nodoc
abstract mixin class $UpdateLocationCopyWith<$Res> implements $SiteWarningDraftEventCopyWith<$Res> {
  factory $UpdateLocationCopyWith(UpdateLocation value, $Res Function(UpdateLocation) _then) = _$UpdateLocationCopyWithImpl;
@useResult
$Res call({
 double latitude, double longitude
});




}
/// @nodoc
class _$UpdateLocationCopyWithImpl<$Res>
    implements $UpdateLocationCopyWith<$Res> {
  _$UpdateLocationCopyWithImpl(this._self, this._then);

  final UpdateLocation _self;
  final $Res Function(UpdateLocation) _then;

/// Create a copy of SiteWarningDraftEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? latitude = null,Object? longitude = null,}) {
  return _then(UpdateLocation(
latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

/// @nodoc


class UpdateContractor implements SiteWarningDraftEvent {
  const UpdateContractor({required this.contractor});
  

 final  ContractorRelation contractor;

/// Create a copy of SiteWarningDraftEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateContractorCopyWith<UpdateContractor> get copyWith => _$UpdateContractorCopyWithImpl<UpdateContractor>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateContractor&&(identical(other.contractor, contractor) || other.contractor == contractor));
}


@override
int get hashCode => Object.hash(runtimeType,contractor);

@override
String toString() {
  return 'SiteWarningDraftEvent.updateContractor(contractor: $contractor)';
}


}

/// @nodoc
abstract mixin class $UpdateContractorCopyWith<$Res> implements $SiteWarningDraftEventCopyWith<$Res> {
  factory $UpdateContractorCopyWith(UpdateContractor value, $Res Function(UpdateContractor) _then) = _$UpdateContractorCopyWithImpl;
@useResult
$Res call({
 ContractorRelation contractor
});




}
/// @nodoc
class _$UpdateContractorCopyWithImpl<$Res>
    implements $UpdateContractorCopyWith<$Res> {
  _$UpdateContractorCopyWithImpl(this._self, this._then);

  final UpdateContractor _self;
  final $Res Function(UpdateContractor) _then;

/// Create a copy of SiteWarningDraftEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? contractor = null,}) {
  return _then(UpdateContractor(
contractor: null == contractor ? _self.contractor : contractor // ignore: cast_nullable_to_non_nullable
as ContractorRelation,
  ));
}


}

/// @nodoc


class UpdateWarningReasons implements SiteWarningDraftEvent {
  const UpdateWarningReasons({required final  List<String> warningReasonUIDs}): _warningReasonUIDs = warningReasonUIDs;
  

 final  List<String> _warningReasonUIDs;
 List<String> get warningReasonUIDs {
  if (_warningReasonUIDs is EqualUnmodifiableListView) return _warningReasonUIDs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_warningReasonUIDs);
}


/// Create a copy of SiteWarningDraftEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateWarningReasonsCopyWith<UpdateWarningReasons> get copyWith => _$UpdateWarningReasonsCopyWithImpl<UpdateWarningReasons>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateWarningReasons&&const DeepCollectionEquality().equals(other._warningReasonUIDs, _warningReasonUIDs));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_warningReasonUIDs));

@override
String toString() {
  return 'SiteWarningDraftEvent.updateWarningReasons(warningReasonUIDs: $warningReasonUIDs)';
}


}

/// @nodoc
abstract mixin class $UpdateWarningReasonsCopyWith<$Res> implements $SiteWarningDraftEventCopyWith<$Res> {
  factory $UpdateWarningReasonsCopyWith(UpdateWarningReasons value, $Res Function(UpdateWarningReasons) _then) = _$UpdateWarningReasonsCopyWithImpl;
@useResult
$Res call({
 List<String> warningReasonUIDs
});




}
/// @nodoc
class _$UpdateWarningReasonsCopyWithImpl<$Res>
    implements $UpdateWarningReasonsCopyWith<$Res> {
  _$UpdateWarningReasonsCopyWithImpl(this._self, this._then);

  final UpdateWarningReasons _self;
  final $Res Function(UpdateWarningReasons) _then;

/// Create a copy of SiteWarningDraftEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? warningReasonUIDs = null,}) {
  return _then(UpdateWarningReasons(
warningReasonUIDs: null == warningReasonUIDs ? _self._warningReasonUIDs : warningReasonUIDs // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

/// @nodoc


class UpdateDescription implements SiteWarningDraftEvent {
  const UpdateDescription({required this.description});
  

 final  String description;

/// Create a copy of SiteWarningDraftEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateDescriptionCopyWith<UpdateDescription> get copyWith => _$UpdateDescriptionCopyWithImpl<UpdateDescription>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateDescription&&(identical(other.description, description) || other.description == description));
}


@override
int get hashCode => Object.hash(runtimeType,description);

@override
String toString() {
  return 'SiteWarningDraftEvent.updateDescription(description: $description)';
}


}

/// @nodoc
abstract mixin class $UpdateDescriptionCopyWith<$Res> implements $SiteWarningDraftEventCopyWith<$Res> {
  factory $UpdateDescriptionCopyWith(UpdateDescription value, $Res Function(UpdateDescription) _then) = _$UpdateDescriptionCopyWithImpl;
@useResult
$Res call({
 String description
});




}
/// @nodoc
class _$UpdateDescriptionCopyWithImpl<$Res>
    implements $UpdateDescriptionCopyWith<$Res> {
  _$UpdateDescriptionCopyWithImpl(this._self, this._then);

  final UpdateDescription _self;
  final $Res Function(UpdateDescription) _then;

/// Create a copy of SiteWarningDraftEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? description = null,}) {
  return _then(UpdateDescription(
description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class AutoSaveDraft implements SiteWarningDraftEvent {
  const AutoSaveDraft();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AutoSaveDraft);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SiteWarningDraftEvent.autoSaveDraft()';
}


}




/// @nodoc


class LoadExistingDraft implements SiteWarningDraftEvent {
  const LoadExistingDraft({required this.draftUID});
  

 final  String draftUID;

/// Create a copy of SiteWarningDraftEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadExistingDraftCopyWith<LoadExistingDraft> get copyWith => _$LoadExistingDraftCopyWithImpl<LoadExistingDraft>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadExistingDraft&&(identical(other.draftUID, draftUID) || other.draftUID == draftUID));
}


@override
int get hashCode => Object.hash(runtimeType,draftUID);

@override
String toString() {
  return 'SiteWarningDraftEvent.loadExistingDraft(draftUID: $draftUID)';
}


}

/// @nodoc
abstract mixin class $LoadExistingDraftCopyWith<$Res> implements $SiteWarningDraftEventCopyWith<$Res> {
  factory $LoadExistingDraftCopyWith(LoadExistingDraft value, $Res Function(LoadExistingDraft) _then) = _$LoadExistingDraftCopyWithImpl;
@useResult
$Res call({
 String draftUID
});




}
/// @nodoc
class _$LoadExistingDraftCopyWithImpl<$Res>
    implements $LoadExistingDraftCopyWith<$Res> {
  _$LoadExistingDraftCopyWithImpl(this._self, this._then);

  final LoadExistingDraft _self;
  final $Res Function(LoadExistingDraft) _then;

/// Create a copy of SiteWarningDraftEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? draftUID = null,}) {
  return _then(LoadExistingDraft(
draftUID: null == draftUID ? _self.draftUID : draftUID // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class DeleteDraft implements SiteWarningDraftEvent {
  const DeleteDraft({required this.draftUID});
  

 final  String draftUID;

/// Create a copy of SiteWarningDraftEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeleteDraftCopyWith<DeleteDraft> get copyWith => _$DeleteDraftCopyWithImpl<DeleteDraft>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeleteDraft&&(identical(other.draftUID, draftUID) || other.draftUID == draftUID));
}


@override
int get hashCode => Object.hash(runtimeType,draftUID);

@override
String toString() {
  return 'SiteWarningDraftEvent.deleteDraft(draftUID: $draftUID)';
}


}

/// @nodoc
abstract mixin class $DeleteDraftCopyWith<$Res> implements $SiteWarningDraftEventCopyWith<$Res> {
  factory $DeleteDraftCopyWith(DeleteDraft value, $Res Function(DeleteDraft) _then) = _$DeleteDraftCopyWithImpl;
@useResult
$Res call({
 String draftUID
});




}
/// @nodoc
class _$DeleteDraftCopyWithImpl<$Res>
    implements $DeleteDraftCopyWith<$Res> {
  _$DeleteDraftCopyWithImpl(this._self, this._then);

  final DeleteDraft _self;
  final $Res Function(DeleteDraft) _then;

/// Create a copy of SiteWarningDraftEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? draftUID = null,}) {
  return _then(DeleteDraft(
draftUID: null == draftUID ? _self.draftUID : draftUID // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class SubmitWarning implements SiteWarningDraftEvent {
  const SubmitWarning({required this.companyUID});
  

 final  String companyUID;

/// Create a copy of SiteWarningDraftEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SubmitWarningCopyWith<SubmitWarning> get copyWith => _$SubmitWarningCopyWithImpl<SubmitWarning>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubmitWarning&&(identical(other.companyUID, companyUID) || other.companyUID == companyUID));
}


@override
int get hashCode => Object.hash(runtimeType,companyUID);

@override
String toString() {
  return 'SiteWarningDraftEvent.submitWarning(companyUID: $companyUID)';
}


}

/// @nodoc
abstract mixin class $SubmitWarningCopyWith<$Res> implements $SiteWarningDraftEventCopyWith<$Res> {
  factory $SubmitWarningCopyWith(SubmitWarning value, $Res Function(SubmitWarning) _then) = _$SubmitWarningCopyWithImpl;
@useResult
$Res call({
 String companyUID
});




}
/// @nodoc
class _$SubmitWarningCopyWithImpl<$Res>
    implements $SubmitWarningCopyWith<$Res> {
  _$SubmitWarningCopyWithImpl(this._self, this._then);

  final SubmitWarning _self;
  final $Res Function(SubmitWarning) _then;

/// Create a copy of SiteWarningDraftEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? companyUID = null,}) {
  return _then(SubmitWarning(
companyUID: null == companyUID ? _self.companyUID : companyUID // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class LoadDraftList implements SiteWarningDraftEvent {
  const LoadDraftList({required this.companyUID});
  

 final  String companyUID;

/// Create a copy of SiteWarningDraftEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadDraftListCopyWith<LoadDraftList> get copyWith => _$LoadDraftListCopyWithImpl<LoadDraftList>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadDraftList&&(identical(other.companyUID, companyUID) || other.companyUID == companyUID));
}


@override
int get hashCode => Object.hash(runtimeType,companyUID);

@override
String toString() {
  return 'SiteWarningDraftEvent.loadDraftList(companyUID: $companyUID)';
}


}

/// @nodoc
abstract mixin class $LoadDraftListCopyWith<$Res> implements $SiteWarningDraftEventCopyWith<$Res> {
  factory $LoadDraftListCopyWith(LoadDraftList value, $Res Function(LoadDraftList) _then) = _$LoadDraftListCopyWithImpl;
@useResult
$Res call({
 String companyUID
});




}
/// @nodoc
class _$LoadDraftListCopyWithImpl<$Res>
    implements $LoadDraftListCopyWith<$Res> {
  _$LoadDraftListCopyWithImpl(this._self, this._then);

  final LoadDraftList _self;
  final $Res Function(LoadDraftList) _then;

/// Create a copy of SiteWarningDraftEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? companyUID = null,}) {
  return _then(LoadDraftList(
companyUID: null == companyUID ? _self.companyUID : companyUID // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
