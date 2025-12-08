// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_warning_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CreateWarningEvent {

 String get dailyReportUID; List<String> get warningReasonUIDs; String? get description;
/// Create a copy of CreateWarningEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateWarningEventCopyWith<CreateWarningEvent> get copyWith => _$CreateWarningEventCopyWithImpl<CreateWarningEvent>(this as CreateWarningEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateWarningEvent&&(identical(other.dailyReportUID, dailyReportUID) || other.dailyReportUID == dailyReportUID)&&const DeepCollectionEquality().equals(other.warningReasonUIDs, warningReasonUIDs)&&(identical(other.description, description) || other.description == description));
}


@override
int get hashCode => Object.hash(runtimeType,dailyReportUID,const DeepCollectionEquality().hash(warningReasonUIDs),description);

@override
String toString() {
  return 'CreateWarningEvent(dailyReportUID: $dailyReportUID, warningReasonUIDs: $warningReasonUIDs, description: $description)';
}


}

/// @nodoc
abstract mixin class $CreateWarningEventCopyWith<$Res>  {
  factory $CreateWarningEventCopyWith(CreateWarningEvent value, $Res Function(CreateWarningEvent) _then) = _$CreateWarningEventCopyWithImpl;
@useResult
$Res call({
 String dailyReportUID, List<String> warningReasonUIDs, String? description
});




}
/// @nodoc
class _$CreateWarningEventCopyWithImpl<$Res>
    implements $CreateWarningEventCopyWith<$Res> {
  _$CreateWarningEventCopyWithImpl(this._self, this._then);

  final CreateWarningEvent _self;
  final $Res Function(CreateWarningEvent) _then;

/// Create a copy of CreateWarningEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? dailyReportUID = null,Object? warningReasonUIDs = null,Object? description = freezed,}) {
  return _then(_self.copyWith(
dailyReportUID: null == dailyReportUID ? _self.dailyReportUID : dailyReportUID // ignore: cast_nullable_to_non_nullable
as String,warningReasonUIDs: null == warningReasonUIDs ? _self.warningReasonUIDs : warningReasonUIDs // ignore: cast_nullable_to_non_nullable
as List<String>,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateWarningEvent].
extension CreateWarningEventPatterns on CreateWarningEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( CreateWarning value)?  createWarning,required TResult orElse(),}){
final _that = this;
switch (_that) {
case CreateWarning() when createWarning != null:
return createWarning(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( CreateWarning value)  createWarning,}){
final _that = this;
switch (_that) {
case CreateWarning():
return createWarning(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( CreateWarning value)?  createWarning,}){
final _that = this;
switch (_that) {
case CreateWarning() when createWarning != null:
return createWarning(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String dailyReportUID,  List<String> warningReasonUIDs,  String? description)?  createWarning,required TResult orElse(),}) {final _that = this;
switch (_that) {
case CreateWarning() when createWarning != null:
return createWarning(_that.dailyReportUID,_that.warningReasonUIDs,_that.description);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String dailyReportUID,  List<String> warningReasonUIDs,  String? description)  createWarning,}) {final _that = this;
switch (_that) {
case CreateWarning():
return createWarning(_that.dailyReportUID,_that.warningReasonUIDs,_that.description);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String dailyReportUID,  List<String> warningReasonUIDs,  String? description)?  createWarning,}) {final _that = this;
switch (_that) {
case CreateWarning() when createWarning != null:
return createWarning(_that.dailyReportUID,_that.warningReasonUIDs,_that.description);case _:
  return null;

}
}

}

/// @nodoc


class CreateWarning implements CreateWarningEvent {
  const CreateWarning({required this.dailyReportUID, required final  List<String> warningReasonUIDs, this.description}): _warningReasonUIDs = warningReasonUIDs;
  

@override final  String dailyReportUID;
 final  List<String> _warningReasonUIDs;
@override List<String> get warningReasonUIDs {
  if (_warningReasonUIDs is EqualUnmodifiableListView) return _warningReasonUIDs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_warningReasonUIDs);
}

@override final  String? description;

/// Create a copy of CreateWarningEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateWarningCopyWith<CreateWarning> get copyWith => _$CreateWarningCopyWithImpl<CreateWarning>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateWarning&&(identical(other.dailyReportUID, dailyReportUID) || other.dailyReportUID == dailyReportUID)&&const DeepCollectionEquality().equals(other._warningReasonUIDs, _warningReasonUIDs)&&(identical(other.description, description) || other.description == description));
}


@override
int get hashCode => Object.hash(runtimeType,dailyReportUID,const DeepCollectionEquality().hash(_warningReasonUIDs),description);

@override
String toString() {
  return 'CreateWarningEvent.createWarning(dailyReportUID: $dailyReportUID, warningReasonUIDs: $warningReasonUIDs, description: $description)';
}


}

/// @nodoc
abstract mixin class $CreateWarningCopyWith<$Res> implements $CreateWarningEventCopyWith<$Res> {
  factory $CreateWarningCopyWith(CreateWarning value, $Res Function(CreateWarning) _then) = _$CreateWarningCopyWithImpl;
@override @useResult
$Res call({
 String dailyReportUID, List<String> warningReasonUIDs, String? description
});




}
/// @nodoc
class _$CreateWarningCopyWithImpl<$Res>
    implements $CreateWarningCopyWith<$Res> {
  _$CreateWarningCopyWithImpl(this._self, this._then);

  final CreateWarning _self;
  final $Res Function(CreateWarning) _then;

/// Create a copy of CreateWarningEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? dailyReportUID = null,Object? warningReasonUIDs = null,Object? description = freezed,}) {
  return _then(CreateWarning(
dailyReportUID: null == dailyReportUID ? _self.dailyReportUID : dailyReportUID // ignore: cast_nullable_to_non_nullable
as String,warningReasonUIDs: null == warningReasonUIDs ? _self._warningReasonUIDs : warningReasonUIDs // ignore: cast_nullable_to_non_nullable
as List<String>,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
