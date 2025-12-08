// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contractor_relation_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ContractorRelationState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ContractorRelationState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ContractorRelationState()';
}


}

/// @nodoc
class $ContractorRelationStateCopyWith<$Res>  {
$ContractorRelationStateCopyWith(ContractorRelationState _, $Res Function(ContractorRelationState) __);
}


/// Adds pattern-matching-related methods to [ContractorRelationState].
extension ContractorRelationStatePatterns on ContractorRelationState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ContractorRelationInitial value)?  initial,TResult Function( ContractorRelationLoading value)?  loading,TResult Function( ContractorRelationLoaded value)?  loaded,TResult Function( ContractorRelationFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ContractorRelationInitial() when initial != null:
return initial(_that);case ContractorRelationLoading() when loading != null:
return loading(_that);case ContractorRelationLoaded() when loaded != null:
return loaded(_that);case ContractorRelationFailure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ContractorRelationInitial value)  initial,required TResult Function( ContractorRelationLoading value)  loading,required TResult Function( ContractorRelationLoaded value)  loaded,required TResult Function( ContractorRelationFailure value)  failure,}){
final _that = this;
switch (_that) {
case ContractorRelationInitial():
return initial(_that);case ContractorRelationLoading():
return loading(_that);case ContractorRelationLoaded():
return loaded(_that);case ContractorRelationFailure():
return failure(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ContractorRelationInitial value)?  initial,TResult? Function( ContractorRelationLoading value)?  loading,TResult? Function( ContractorRelationLoaded value)?  loaded,TResult? Function( ContractorRelationFailure value)?  failure,}){
final _that = this;
switch (_that) {
case ContractorRelationInitial() when initial != null:
return initial(_that);case ContractorRelationLoading() when loading != null:
return loading(_that);case ContractorRelationLoaded() when loaded != null:
return loaded(_that);case ContractorRelationFailure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<ContractorRelation> contractors,  ContractorRelation? selectedContractor)?  loaded,TResult Function( String message)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ContractorRelationInitial() when initial != null:
return initial();case ContractorRelationLoading() when loading != null:
return loading();case ContractorRelationLoaded() when loaded != null:
return loaded(_that.contractors,_that.selectedContractor);case ContractorRelationFailure() when failure != null:
return failure(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<ContractorRelation> contractors,  ContractorRelation? selectedContractor)  loaded,required TResult Function( String message)  failure,}) {final _that = this;
switch (_that) {
case ContractorRelationInitial():
return initial();case ContractorRelationLoading():
return loading();case ContractorRelationLoaded():
return loaded(_that.contractors,_that.selectedContractor);case ContractorRelationFailure():
return failure(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<ContractorRelation> contractors,  ContractorRelation? selectedContractor)?  loaded,TResult? Function( String message)?  failure,}) {final _that = this;
switch (_that) {
case ContractorRelationInitial() when initial != null:
return initial();case ContractorRelationLoading() when loading != null:
return loading();case ContractorRelationLoaded() when loaded != null:
return loaded(_that.contractors,_that.selectedContractor);case ContractorRelationFailure() when failure != null:
return failure(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class ContractorRelationInitial implements ContractorRelationState {
  const ContractorRelationInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ContractorRelationInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ContractorRelationState.initial()';
}


}




/// @nodoc


class ContractorRelationLoading implements ContractorRelationState {
  const ContractorRelationLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ContractorRelationLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ContractorRelationState.loading()';
}


}




/// @nodoc


class ContractorRelationLoaded implements ContractorRelationState {
  const ContractorRelationLoaded(final  List<ContractorRelation> contractors, {this.selectedContractor}): _contractors = contractors;
  

 final  List<ContractorRelation> _contractors;
 List<ContractorRelation> get contractors {
  if (_contractors is EqualUnmodifiableListView) return _contractors;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_contractors);
}

 final  ContractorRelation? selectedContractor;

/// Create a copy of ContractorRelationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ContractorRelationLoadedCopyWith<ContractorRelationLoaded> get copyWith => _$ContractorRelationLoadedCopyWithImpl<ContractorRelationLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ContractorRelationLoaded&&const DeepCollectionEquality().equals(other._contractors, _contractors)&&(identical(other.selectedContractor, selectedContractor) || other.selectedContractor == selectedContractor));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_contractors),selectedContractor);

@override
String toString() {
  return 'ContractorRelationState.loaded(contractors: $contractors, selectedContractor: $selectedContractor)';
}


}

/// @nodoc
abstract mixin class $ContractorRelationLoadedCopyWith<$Res> implements $ContractorRelationStateCopyWith<$Res> {
  factory $ContractorRelationLoadedCopyWith(ContractorRelationLoaded value, $Res Function(ContractorRelationLoaded) _then) = _$ContractorRelationLoadedCopyWithImpl;
@useResult
$Res call({
 List<ContractorRelation> contractors, ContractorRelation? selectedContractor
});




}
/// @nodoc
class _$ContractorRelationLoadedCopyWithImpl<$Res>
    implements $ContractorRelationLoadedCopyWith<$Res> {
  _$ContractorRelationLoadedCopyWithImpl(this._self, this._then);

  final ContractorRelationLoaded _self;
  final $Res Function(ContractorRelationLoaded) _then;

/// Create a copy of ContractorRelationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? contractors = null,Object? selectedContractor = freezed,}) {
  return _then(ContractorRelationLoaded(
null == contractors ? _self._contractors : contractors // ignore: cast_nullable_to_non_nullable
as List<ContractorRelation>,selectedContractor: freezed == selectedContractor ? _self.selectedContractor : selectedContractor // ignore: cast_nullable_to_non_nullable
as ContractorRelation?,
  ));
}


}

/// @nodoc


class ContractorRelationFailure implements ContractorRelationState {
  const ContractorRelationFailure(this.message);
  

 final  String message;

/// Create a copy of ContractorRelationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ContractorRelationFailureCopyWith<ContractorRelationFailure> get copyWith => _$ContractorRelationFailureCopyWithImpl<ContractorRelationFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ContractorRelationFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ContractorRelationState.failure(message: $message)';
}


}

/// @nodoc
abstract mixin class $ContractorRelationFailureCopyWith<$Res> implements $ContractorRelationStateCopyWith<$Res> {
  factory $ContractorRelationFailureCopyWith(ContractorRelationFailure value, $Res Function(ContractorRelationFailure) _then) = _$ContractorRelationFailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ContractorRelationFailureCopyWithImpl<$Res>
    implements $ContractorRelationFailureCopyWith<$Res> {
  _$ContractorRelationFailureCopyWithImpl(this._self, this._then);

  final ContractorRelationFailure _self;
  final $Res Function(ContractorRelationFailure) _then;

/// Create a copy of ContractorRelationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ContractorRelationFailure(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
