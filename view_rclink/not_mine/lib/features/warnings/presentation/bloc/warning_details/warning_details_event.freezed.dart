// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'warning_details_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WarningDetailsEvent {

 String get warningUID;
/// Create a copy of WarningDetailsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WarningDetailsEventCopyWith<WarningDetailsEvent> get copyWith => _$WarningDetailsEventCopyWithImpl<WarningDetailsEvent>(this as WarningDetailsEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WarningDetailsEvent&&(identical(other.warningUID, warningUID) || other.warningUID == warningUID));
}


@override
int get hashCode => Object.hash(runtimeType,warningUID);

@override
String toString() {
  return 'WarningDetailsEvent(warningUID: $warningUID)';
}


}

/// @nodoc
abstract mixin class $WarningDetailsEventCopyWith<$Res>  {
  factory $WarningDetailsEventCopyWith(WarningDetailsEvent value, $Res Function(WarningDetailsEvent) _then) = _$WarningDetailsEventCopyWithImpl;
@useResult
$Res call({
 String warningUID
});




}
/// @nodoc
class _$WarningDetailsEventCopyWithImpl<$Res>
    implements $WarningDetailsEventCopyWith<$Res> {
  _$WarningDetailsEventCopyWithImpl(this._self, this._then);

  final WarningDetailsEvent _self;
  final $Res Function(WarningDetailsEvent) _then;

/// Create a copy of WarningDetailsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? warningUID = null,}) {
  return _then(_self.copyWith(
warningUID: null == warningUID ? _self.warningUID : warningUID // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [WarningDetailsEvent].
extension WarningDetailsEventPatterns on WarningDetailsEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoadWarningDetails value)?  loadWarningDetails,TResult Function( RefreshWarningDetails value)?  refreshWarningDetails,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoadWarningDetails() when loadWarningDetails != null:
return loadWarningDetails(_that);case RefreshWarningDetails() when refreshWarningDetails != null:
return refreshWarningDetails(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoadWarningDetails value)  loadWarningDetails,required TResult Function( RefreshWarningDetails value)  refreshWarningDetails,}){
final _that = this;
switch (_that) {
case LoadWarningDetails():
return loadWarningDetails(_that);case RefreshWarningDetails():
return refreshWarningDetails(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoadWarningDetails value)?  loadWarningDetails,TResult? Function( RefreshWarningDetails value)?  refreshWarningDetails,}){
final _that = this;
switch (_that) {
case LoadWarningDetails() when loadWarningDetails != null:
return loadWarningDetails(_that);case RefreshWarningDetails() when refreshWarningDetails != null:
return refreshWarningDetails(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String warningUID,  bool forceRefresh)?  loadWarningDetails,TResult Function( String warningUID)?  refreshWarningDetails,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LoadWarningDetails() when loadWarningDetails != null:
return loadWarningDetails(_that.warningUID,_that.forceRefresh);case RefreshWarningDetails() when refreshWarningDetails != null:
return refreshWarningDetails(_that.warningUID);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String warningUID,  bool forceRefresh)  loadWarningDetails,required TResult Function( String warningUID)  refreshWarningDetails,}) {final _that = this;
switch (_that) {
case LoadWarningDetails():
return loadWarningDetails(_that.warningUID,_that.forceRefresh);case RefreshWarningDetails():
return refreshWarningDetails(_that.warningUID);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String warningUID,  bool forceRefresh)?  loadWarningDetails,TResult? Function( String warningUID)?  refreshWarningDetails,}) {final _that = this;
switch (_that) {
case LoadWarningDetails() when loadWarningDetails != null:
return loadWarningDetails(_that.warningUID,_that.forceRefresh);case RefreshWarningDetails() when refreshWarningDetails != null:
return refreshWarningDetails(_that.warningUID);case _:
  return null;

}
}

}

/// @nodoc


class LoadWarningDetails implements WarningDetailsEvent {
  const LoadWarningDetails({required this.warningUID, this.forceRefresh = false});
  

@override final  String warningUID;
@JsonKey() final  bool forceRefresh;

/// Create a copy of WarningDetailsEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadWarningDetailsCopyWith<LoadWarningDetails> get copyWith => _$LoadWarningDetailsCopyWithImpl<LoadWarningDetails>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadWarningDetails&&(identical(other.warningUID, warningUID) || other.warningUID == warningUID)&&(identical(other.forceRefresh, forceRefresh) || other.forceRefresh == forceRefresh));
}


@override
int get hashCode => Object.hash(runtimeType,warningUID,forceRefresh);

@override
String toString() {
  return 'WarningDetailsEvent.loadWarningDetails(warningUID: $warningUID, forceRefresh: $forceRefresh)';
}


}

/// @nodoc
abstract mixin class $LoadWarningDetailsCopyWith<$Res> implements $WarningDetailsEventCopyWith<$Res> {
  factory $LoadWarningDetailsCopyWith(LoadWarningDetails value, $Res Function(LoadWarningDetails) _then) = _$LoadWarningDetailsCopyWithImpl;
@override @useResult
$Res call({
 String warningUID, bool forceRefresh
});




}
/// @nodoc
class _$LoadWarningDetailsCopyWithImpl<$Res>
    implements $LoadWarningDetailsCopyWith<$Res> {
  _$LoadWarningDetailsCopyWithImpl(this._self, this._then);

  final LoadWarningDetails _self;
  final $Res Function(LoadWarningDetails) _then;

/// Create a copy of WarningDetailsEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? warningUID = null,Object? forceRefresh = null,}) {
  return _then(LoadWarningDetails(
warningUID: null == warningUID ? _self.warningUID : warningUID // ignore: cast_nullable_to_non_nullable
as String,forceRefresh: null == forceRefresh ? _self.forceRefresh : forceRefresh // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class RefreshWarningDetails implements WarningDetailsEvent {
  const RefreshWarningDetails({required this.warningUID});
  

@override final  String warningUID;

/// Create a copy of WarningDetailsEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RefreshWarningDetailsCopyWith<RefreshWarningDetails> get copyWith => _$RefreshWarningDetailsCopyWithImpl<RefreshWarningDetails>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RefreshWarningDetails&&(identical(other.warningUID, warningUID) || other.warningUID == warningUID));
}


@override
int get hashCode => Object.hash(runtimeType,warningUID);

@override
String toString() {
  return 'WarningDetailsEvent.refreshWarningDetails(warningUID: $warningUID)';
}


}

/// @nodoc
abstract mixin class $RefreshWarningDetailsCopyWith<$Res> implements $WarningDetailsEventCopyWith<$Res> {
  factory $RefreshWarningDetailsCopyWith(RefreshWarningDetails value, $Res Function(RefreshWarningDetails) _then) = _$RefreshWarningDetailsCopyWithImpl;
@override @useResult
$Res call({
 String warningUID
});




}
/// @nodoc
class _$RefreshWarningDetailsCopyWithImpl<$Res>
    implements $RefreshWarningDetailsCopyWith<$Res> {
  _$RefreshWarningDetailsCopyWithImpl(this._self, this._then);

  final RefreshWarningDetails _self;
  final $Res Function(RefreshWarningDetails) _then;

/// Create a copy of WarningDetailsEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? warningUID = null,}) {
  return _then(RefreshWarningDetails(
warningUID: null == warningUID ? _self.warningUID : warningUID // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
