// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contractor_relation_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ContractorRelationEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ContractorRelationEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ContractorRelationEvent()';
}


}

/// @nodoc
class $ContractorRelationEventCopyWith<$Res>  {
$ContractorRelationEventCopyWith(ContractorRelationEvent _, $Res Function(ContractorRelationEvent) __);
}


/// Adds pattern-matching-related methods to [ContractorRelationEvent].
extension ContractorRelationEventPatterns on ContractorRelationEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoadContractorRelation value)?  loadContractorRelation,TResult Function( SelectContractorRelation value)?  selectContractorRelation,TResult Function( ClearContractorRelationSelection value)?  clearSelection,TResult Function( ClearContractorRelationCache value)?  clearCache,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoadContractorRelation() when loadContractorRelation != null:
return loadContractorRelation(_that);case SelectContractorRelation() when selectContractorRelation != null:
return selectContractorRelation(_that);case ClearContractorRelationSelection() when clearSelection != null:
return clearSelection(_that);case ClearContractorRelationCache() when clearCache != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoadContractorRelation value)  loadContractorRelation,required TResult Function( SelectContractorRelation value)  selectContractorRelation,required TResult Function( ClearContractorRelationSelection value)  clearSelection,required TResult Function( ClearContractorRelationCache value)  clearCache,}){
final _that = this;
switch (_that) {
case LoadContractorRelation():
return loadContractorRelation(_that);case SelectContractorRelation():
return selectContractorRelation(_that);case ClearContractorRelationSelection():
return clearSelection(_that);case ClearContractorRelationCache():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoadContractorRelation value)?  loadContractorRelation,TResult? Function( SelectContractorRelation value)?  selectContractorRelation,TResult? Function( ClearContractorRelationSelection value)?  clearSelection,TResult? Function( ClearContractorRelationCache value)?  clearCache,}){
final _that = this;
switch (_that) {
case LoadContractorRelation() when loadContractorRelation != null:
return loadContractorRelation(_that);case SelectContractorRelation() when selectContractorRelation != null:
return selectContractorRelation(_that);case ClearContractorRelationSelection() when clearSelection != null:
return clearSelection(_that);case ClearContractorRelationCache() when clearCache != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( bool forceRefresh)?  loadContractorRelation,TResult Function( String contractorUID)?  selectContractorRelation,TResult Function()?  clearSelection,TResult Function()?  clearCache,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LoadContractorRelation() when loadContractorRelation != null:
return loadContractorRelation(_that.forceRefresh);case SelectContractorRelation() when selectContractorRelation != null:
return selectContractorRelation(_that.contractorUID);case ClearContractorRelationSelection() when clearSelection != null:
return clearSelection();case ClearContractorRelationCache() when clearCache != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( bool forceRefresh)  loadContractorRelation,required TResult Function( String contractorUID)  selectContractorRelation,required TResult Function()  clearSelection,required TResult Function()  clearCache,}) {final _that = this;
switch (_that) {
case LoadContractorRelation():
return loadContractorRelation(_that.forceRefresh);case SelectContractorRelation():
return selectContractorRelation(_that.contractorUID);case ClearContractorRelationSelection():
return clearSelection();case ClearContractorRelationCache():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( bool forceRefresh)?  loadContractorRelation,TResult? Function( String contractorUID)?  selectContractorRelation,TResult? Function()?  clearSelection,TResult? Function()?  clearCache,}) {final _that = this;
switch (_that) {
case LoadContractorRelation() when loadContractorRelation != null:
return loadContractorRelation(_that.forceRefresh);case SelectContractorRelation() when selectContractorRelation != null:
return selectContractorRelation(_that.contractorUID);case ClearContractorRelationSelection() when clearSelection != null:
return clearSelection();case ClearContractorRelationCache() when clearCache != null:
return clearCache();case _:
  return null;

}
}

}

/// @nodoc


class LoadContractorRelation implements ContractorRelationEvent {
  const LoadContractorRelation({this.forceRefresh = false});
  

@JsonKey() final  bool forceRefresh;

/// Create a copy of ContractorRelationEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadContractorRelationCopyWith<LoadContractorRelation> get copyWith => _$LoadContractorRelationCopyWithImpl<LoadContractorRelation>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadContractorRelation&&(identical(other.forceRefresh, forceRefresh) || other.forceRefresh == forceRefresh));
}


@override
int get hashCode => Object.hash(runtimeType,forceRefresh);

@override
String toString() {
  return 'ContractorRelationEvent.loadContractorRelation(forceRefresh: $forceRefresh)';
}


}

/// @nodoc
abstract mixin class $LoadContractorRelationCopyWith<$Res> implements $ContractorRelationEventCopyWith<$Res> {
  factory $LoadContractorRelationCopyWith(LoadContractorRelation value, $Res Function(LoadContractorRelation) _then) = _$LoadContractorRelationCopyWithImpl;
@useResult
$Res call({
 bool forceRefresh
});




}
/// @nodoc
class _$LoadContractorRelationCopyWithImpl<$Res>
    implements $LoadContractorRelationCopyWith<$Res> {
  _$LoadContractorRelationCopyWithImpl(this._self, this._then);

  final LoadContractorRelation _self;
  final $Res Function(LoadContractorRelation) _then;

/// Create a copy of ContractorRelationEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? forceRefresh = null,}) {
  return _then(LoadContractorRelation(
forceRefresh: null == forceRefresh ? _self.forceRefresh : forceRefresh // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class SelectContractorRelation implements ContractorRelationEvent {
  const SelectContractorRelation(this.contractorUID);
  

 final  String contractorUID;

/// Create a copy of ContractorRelationEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SelectContractorRelationCopyWith<SelectContractorRelation> get copyWith => _$SelectContractorRelationCopyWithImpl<SelectContractorRelation>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SelectContractorRelation&&(identical(other.contractorUID, contractorUID) || other.contractorUID == contractorUID));
}


@override
int get hashCode => Object.hash(runtimeType,contractorUID);

@override
String toString() {
  return 'ContractorRelationEvent.selectContractorRelation(contractorUID: $contractorUID)';
}


}

/// @nodoc
abstract mixin class $SelectContractorRelationCopyWith<$Res> implements $ContractorRelationEventCopyWith<$Res> {
  factory $SelectContractorRelationCopyWith(SelectContractorRelation value, $Res Function(SelectContractorRelation) _then) = _$SelectContractorRelationCopyWithImpl;
@useResult
$Res call({
 String contractorUID
});




}
/// @nodoc
class _$SelectContractorRelationCopyWithImpl<$Res>
    implements $SelectContractorRelationCopyWith<$Res> {
  _$SelectContractorRelationCopyWithImpl(this._self, this._then);

  final SelectContractorRelation _self;
  final $Res Function(SelectContractorRelation) _then;

/// Create a copy of ContractorRelationEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? contractorUID = null,}) {
  return _then(SelectContractorRelation(
null == contractorUID ? _self.contractorUID : contractorUID // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ClearContractorRelationSelection implements ContractorRelationEvent {
  const ClearContractorRelationSelection();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClearContractorRelationSelection);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ContractorRelationEvent.clearSelection()';
}


}




/// @nodoc


class ClearContractorRelationCache implements ContractorRelationEvent {
  const ClearContractorRelationCache();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClearContractorRelationCache);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ContractorRelationEvent.clearCache()';
}


}




// dart format on
