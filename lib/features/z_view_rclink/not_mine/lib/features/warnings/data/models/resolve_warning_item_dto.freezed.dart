// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'resolve_warning_item_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ResolveWarningItemDto {

 String? get notes;
/// Create a copy of ResolveWarningItemDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResolveWarningItemDtoCopyWith<ResolveWarningItemDto> get copyWith => _$ResolveWarningItemDtoCopyWithImpl<ResolveWarningItemDto>(this as ResolveWarningItemDto, _$identity);

  /// Serializes this ResolveWarningItemDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResolveWarningItemDto&&(identical(other.notes, notes) || other.notes == notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,notes);

@override
String toString() {
  return 'ResolveWarningItemDto(notes: $notes)';
}


}

/// @nodoc
abstract mixin class $ResolveWarningItemDtoCopyWith<$Res>  {
  factory $ResolveWarningItemDtoCopyWith(ResolveWarningItemDto value, $Res Function(ResolveWarningItemDto) _then) = _$ResolveWarningItemDtoCopyWithImpl;
@useResult
$Res call({
 String? notes
});




}
/// @nodoc
class _$ResolveWarningItemDtoCopyWithImpl<$Res>
    implements $ResolveWarningItemDtoCopyWith<$Res> {
  _$ResolveWarningItemDtoCopyWithImpl(this._self, this._then);

  final ResolveWarningItemDto _self;
  final $Res Function(ResolveWarningItemDto) _then;

/// Create a copy of ResolveWarningItemDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? notes = freezed,}) {
  return _then(_self.copyWith(
notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ResolveWarningItemDto].
extension ResolveWarningItemDtoPatterns on ResolveWarningItemDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ResolveWarningItemDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ResolveWarningItemDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ResolveWarningItemDto value)  $default,){
final _that = this;
switch (_that) {
case _ResolveWarningItemDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ResolveWarningItemDto value)?  $default,){
final _that = this;
switch (_that) {
case _ResolveWarningItemDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? notes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ResolveWarningItemDto() when $default != null:
return $default(_that.notes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? notes)  $default,) {final _that = this;
switch (_that) {
case _ResolveWarningItemDto():
return $default(_that.notes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? notes)?  $default,) {final _that = this;
switch (_that) {
case _ResolveWarningItemDto() when $default != null:
return $default(_that.notes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ResolveWarningItemDto implements ResolveWarningItemDto {
  const _ResolveWarningItemDto({this.notes});
  factory _ResolveWarningItemDto.fromJson(Map<String, dynamic> json) => _$ResolveWarningItemDtoFromJson(json);

@override final  String? notes;

/// Create a copy of ResolveWarningItemDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResolveWarningItemDtoCopyWith<_ResolveWarningItemDto> get copyWith => __$ResolveWarningItemDtoCopyWithImpl<_ResolveWarningItemDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ResolveWarningItemDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResolveWarningItemDto&&(identical(other.notes, notes) || other.notes == notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,notes);

@override
String toString() {
  return 'ResolveWarningItemDto(notes: $notes)';
}


}

/// @nodoc
abstract mixin class _$ResolveWarningItemDtoCopyWith<$Res> implements $ResolveWarningItemDtoCopyWith<$Res> {
  factory _$ResolveWarningItemDtoCopyWith(_ResolveWarningItemDto value, $Res Function(_ResolveWarningItemDto) _then) = __$ResolveWarningItemDtoCopyWithImpl;
@override @useResult
$Res call({
 String? notes
});




}
/// @nodoc
class __$ResolveWarningItemDtoCopyWithImpl<$Res>
    implements _$ResolveWarningItemDtoCopyWith<$Res> {
  __$ResolveWarningItemDtoCopyWithImpl(this._self, this._then);

  final _ResolveWarningItemDto _self;
  final $Res Function(_ResolveWarningItemDto) _then;

/// Create a copy of ResolveWarningItemDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? notes = freezed,}) {
  return _then(_ResolveWarningItemDto(
notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
