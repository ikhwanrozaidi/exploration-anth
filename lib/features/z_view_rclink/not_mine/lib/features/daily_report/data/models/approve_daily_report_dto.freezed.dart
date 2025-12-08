// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'approve_daily_report_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ApproveDailyReportDto {

 String get reviewComment;
/// Create a copy of ApproveDailyReportDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ApproveDailyReportDtoCopyWith<ApproveDailyReportDto> get copyWith => _$ApproveDailyReportDtoCopyWithImpl<ApproveDailyReportDto>(this as ApproveDailyReportDto, _$identity);

  /// Serializes this ApproveDailyReportDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ApproveDailyReportDto&&(identical(other.reviewComment, reviewComment) || other.reviewComment == reviewComment));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,reviewComment);

@override
String toString() {
  return 'ApproveDailyReportDto(reviewComment: $reviewComment)';
}


}

/// @nodoc
abstract mixin class $ApproveDailyReportDtoCopyWith<$Res>  {
  factory $ApproveDailyReportDtoCopyWith(ApproveDailyReportDto value, $Res Function(ApproveDailyReportDto) _then) = _$ApproveDailyReportDtoCopyWithImpl;
@useResult
$Res call({
 String reviewComment
});




}
/// @nodoc
class _$ApproveDailyReportDtoCopyWithImpl<$Res>
    implements $ApproveDailyReportDtoCopyWith<$Res> {
  _$ApproveDailyReportDtoCopyWithImpl(this._self, this._then);

  final ApproveDailyReportDto _self;
  final $Res Function(ApproveDailyReportDto) _then;

/// Create a copy of ApproveDailyReportDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? reviewComment = null,}) {
  return _then(_self.copyWith(
reviewComment: null == reviewComment ? _self.reviewComment : reviewComment // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ApproveDailyReportDto].
extension ApproveDailyReportDtoPatterns on ApproveDailyReportDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ApproveDailyReportDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ApproveDailyReportDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ApproveDailyReportDto value)  $default,){
final _that = this;
switch (_that) {
case _ApproveDailyReportDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ApproveDailyReportDto value)?  $default,){
final _that = this;
switch (_that) {
case _ApproveDailyReportDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String reviewComment)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ApproveDailyReportDto() when $default != null:
return $default(_that.reviewComment);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String reviewComment)  $default,) {final _that = this;
switch (_that) {
case _ApproveDailyReportDto():
return $default(_that.reviewComment);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String reviewComment)?  $default,) {final _that = this;
switch (_that) {
case _ApproveDailyReportDto() when $default != null:
return $default(_that.reviewComment);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ApproveDailyReportDto implements ApproveDailyReportDto {
  const _ApproveDailyReportDto({required this.reviewComment});
  factory _ApproveDailyReportDto.fromJson(Map<String, dynamic> json) => _$ApproveDailyReportDtoFromJson(json);

@override final  String reviewComment;

/// Create a copy of ApproveDailyReportDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ApproveDailyReportDtoCopyWith<_ApproveDailyReportDto> get copyWith => __$ApproveDailyReportDtoCopyWithImpl<_ApproveDailyReportDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ApproveDailyReportDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ApproveDailyReportDto&&(identical(other.reviewComment, reviewComment) || other.reviewComment == reviewComment));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,reviewComment);

@override
String toString() {
  return 'ApproveDailyReportDto(reviewComment: $reviewComment)';
}


}

/// @nodoc
abstract mixin class _$ApproveDailyReportDtoCopyWith<$Res> implements $ApproveDailyReportDtoCopyWith<$Res> {
  factory _$ApproveDailyReportDtoCopyWith(_ApproveDailyReportDto value, $Res Function(_ApproveDailyReportDto) _then) = __$ApproveDailyReportDtoCopyWithImpl;
@override @useResult
$Res call({
 String reviewComment
});




}
/// @nodoc
class __$ApproveDailyReportDtoCopyWithImpl<$Res>
    implements _$ApproveDailyReportDtoCopyWith<$Res> {
  __$ApproveDailyReportDtoCopyWithImpl(this._self, this._then);

  final _ApproveDailyReportDto _self;
  final $Res Function(_ApproveDailyReportDto) _then;

/// Create a copy of ApproveDailyReportDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? reviewComment = null,}) {
  return _then(_ApproveDailyReportDto(
reviewComment: null == reviewComment ? _self.reviewComment : reviewComment // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
