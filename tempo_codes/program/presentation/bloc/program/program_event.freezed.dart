// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'program_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProgramEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProgramEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProgramEvent()';
}


}

/// @nodoc
class $ProgramEventCopyWith<$Res>  {
$ProgramEventCopyWith(ProgramEvent _, $Res Function(ProgramEvent) __);
}


/// Adds pattern-matching-related methods to [ProgramEvent].
extension ProgramEventPatterns on ProgramEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoadProgramSettings value)?  loadProgramSettings,TResult Function( LoadContractorRoads value)?  loadContractorRoads,TResult Function( ClearProgramCache value)?  clearCache,TResult Function( ClearContractorRoads value)?  clearContractorRoads,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoadProgramSettings() when loadProgramSettings != null:
return loadProgramSettings(_that);case LoadContractorRoads() when loadContractorRoads != null:
return loadContractorRoads(_that);case ClearProgramCache() when clearCache != null:
return clearCache(_that);case ClearContractorRoads() when clearContractorRoads != null:
return clearContractorRoads(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoadProgramSettings value)  loadProgramSettings,required TResult Function( LoadContractorRoads value)  loadContractorRoads,required TResult Function( ClearProgramCache value)  clearCache,required TResult Function( ClearContractorRoads value)  clearContractorRoads,}){
final _that = this;
switch (_that) {
case LoadProgramSettings():
return loadProgramSettings(_that);case LoadContractorRoads():
return loadContractorRoads(_that);case ClearProgramCache():
return clearCache(_that);case ClearContractorRoads():
return clearContractorRoads(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoadProgramSettings value)?  loadProgramSettings,TResult? Function( LoadContractorRoads value)?  loadContractorRoads,TResult? Function( ClearProgramCache value)?  clearCache,TResult? Function( ClearContractorRoads value)?  clearContractorRoads,}){
final _that = this;
switch (_that) {
case LoadProgramSettings() when loadProgramSettings != null:
return loadProgramSettings(_that);case LoadContractorRoads() when loadContractorRoads != null:
return loadContractorRoads(_that);case ClearProgramCache() when clearCache != null:
return clearCache(_that);case ClearContractorRoads() when clearContractorRoads != null:
return clearContractorRoads(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( bool forceRefresh)?  loadProgramSettings,TResult Function( String contractorRelationUID)?  loadContractorRoads,TResult Function()?  clearCache,TResult Function()?  clearContractorRoads,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LoadProgramSettings() when loadProgramSettings != null:
return loadProgramSettings(_that.forceRefresh);case LoadContractorRoads() when loadContractorRoads != null:
return loadContractorRoads(_that.contractorRelationUID);case ClearProgramCache() when clearCache != null:
return clearCache();case ClearContractorRoads() when clearContractorRoads != null:
return clearContractorRoads();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( bool forceRefresh)  loadProgramSettings,required TResult Function( String contractorRelationUID)  loadContractorRoads,required TResult Function()  clearCache,required TResult Function()  clearContractorRoads,}) {final _that = this;
switch (_that) {
case LoadProgramSettings():
return loadProgramSettings(_that.forceRefresh);case LoadContractorRoads():
return loadContractorRoads(_that.contractorRelationUID);case ClearProgramCache():
return clearCache();case ClearContractorRoads():
return clearContractorRoads();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( bool forceRefresh)?  loadProgramSettings,TResult? Function( String contractorRelationUID)?  loadContractorRoads,TResult? Function()?  clearCache,TResult? Function()?  clearContractorRoads,}) {final _that = this;
switch (_that) {
case LoadProgramSettings() when loadProgramSettings != null:
return loadProgramSettings(_that.forceRefresh);case LoadContractorRoads() when loadContractorRoads != null:
return loadContractorRoads(_that.contractorRelationUID);case ClearProgramCache() when clearCache != null:
return clearCache();case ClearContractorRoads() when clearContractorRoads != null:
return clearContractorRoads();case _:
  return null;

}
}

}

/// @nodoc


class LoadProgramSettings implements ProgramEvent {
  const LoadProgramSettings({this.forceRefresh = false});
  

@JsonKey() final  bool forceRefresh;

/// Create a copy of ProgramEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadProgramSettingsCopyWith<LoadProgramSettings> get copyWith => _$LoadProgramSettingsCopyWithImpl<LoadProgramSettings>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadProgramSettings&&(identical(other.forceRefresh, forceRefresh) || other.forceRefresh == forceRefresh));
}


@override
int get hashCode => Object.hash(runtimeType,forceRefresh);

@override
String toString() {
  return 'ProgramEvent.loadProgramSettings(forceRefresh: $forceRefresh)';
}


}

/// @nodoc
abstract mixin class $LoadProgramSettingsCopyWith<$Res> implements $ProgramEventCopyWith<$Res> {
  factory $LoadProgramSettingsCopyWith(LoadProgramSettings value, $Res Function(LoadProgramSettings) _then) = _$LoadProgramSettingsCopyWithImpl;
@useResult
$Res call({
 bool forceRefresh
});




}
/// @nodoc
class _$LoadProgramSettingsCopyWithImpl<$Res>
    implements $LoadProgramSettingsCopyWith<$Res> {
  _$LoadProgramSettingsCopyWithImpl(this._self, this._then);

  final LoadProgramSettings _self;
  final $Res Function(LoadProgramSettings) _then;

/// Create a copy of ProgramEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? forceRefresh = null,}) {
  return _then(LoadProgramSettings(
forceRefresh: null == forceRefresh ? _self.forceRefresh : forceRefresh // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class LoadContractorRoads implements ProgramEvent {
  const LoadContractorRoads({required this.contractorRelationUID});
  

 final  String contractorRelationUID;

/// Create a copy of ProgramEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadContractorRoadsCopyWith<LoadContractorRoads> get copyWith => _$LoadContractorRoadsCopyWithImpl<LoadContractorRoads>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadContractorRoads&&(identical(other.contractorRelationUID, contractorRelationUID) || other.contractorRelationUID == contractorRelationUID));
}


@override
int get hashCode => Object.hash(runtimeType,contractorRelationUID);

@override
String toString() {
  return 'ProgramEvent.loadContractorRoads(contractorRelationUID: $contractorRelationUID)';
}


}

/// @nodoc
abstract mixin class $LoadContractorRoadsCopyWith<$Res> implements $ProgramEventCopyWith<$Res> {
  factory $LoadContractorRoadsCopyWith(LoadContractorRoads value, $Res Function(LoadContractorRoads) _then) = _$LoadContractorRoadsCopyWithImpl;
@useResult
$Res call({
 String contractorRelationUID
});




}
/// @nodoc
class _$LoadContractorRoadsCopyWithImpl<$Res>
    implements $LoadContractorRoadsCopyWith<$Res> {
  _$LoadContractorRoadsCopyWithImpl(this._self, this._then);

  final LoadContractorRoads _self;
  final $Res Function(LoadContractorRoads) _then;

/// Create a copy of ProgramEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? contractorRelationUID = null,}) {
  return _then(LoadContractorRoads(
contractorRelationUID: null == contractorRelationUID ? _self.contractorRelationUID : contractorRelationUID // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ClearProgramCache implements ProgramEvent {
  const ClearProgramCache();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClearProgramCache);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProgramEvent.clearCache()';
}


}




/// @nodoc


class ClearContractorRoads implements ProgramEvent {
  const ClearContractorRoads();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClearContractorRoads);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProgramEvent.clearContractorRoads()';
}


}




// dart format on
