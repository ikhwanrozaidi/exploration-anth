// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_report_warning_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CreateReportWarningModel {

/// Daily report UID this warning is created from
 String get dailyReportUID;/// Array of warning reason UIDs
 List<String> get warningReasonUIDs;/// Additional description or notes (optional)
 String? get description;
/// Create a copy of CreateReportWarningModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateReportWarningModelCopyWith<CreateReportWarningModel> get copyWith => _$CreateReportWarningModelCopyWithImpl<CreateReportWarningModel>(this as CreateReportWarningModel, _$identity);

  /// Serializes this CreateReportWarningModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateReportWarningModel&&(identical(other.dailyReportUID, dailyReportUID) || other.dailyReportUID == dailyReportUID)&&const DeepCollectionEquality().equals(other.warningReasonUIDs, warningReasonUIDs)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,dailyReportUID,const DeepCollectionEquality().hash(warningReasonUIDs),description);

@override
String toString() {
  return 'CreateReportWarningModel(dailyReportUID: $dailyReportUID, warningReasonUIDs: $warningReasonUIDs, description: $description)';
}


}

/// @nodoc
abstract mixin class $CreateReportWarningModelCopyWith<$Res>  {
  factory $CreateReportWarningModelCopyWith(CreateReportWarningModel value, $Res Function(CreateReportWarningModel) _then) = _$CreateReportWarningModelCopyWithImpl;
@useResult
$Res call({
 String dailyReportUID, List<String> warningReasonUIDs, String? description
});




}
/// @nodoc
class _$CreateReportWarningModelCopyWithImpl<$Res>
    implements $CreateReportWarningModelCopyWith<$Res> {
  _$CreateReportWarningModelCopyWithImpl(this._self, this._then);

  final CreateReportWarningModel _self;
  final $Res Function(CreateReportWarningModel) _then;

/// Create a copy of CreateReportWarningModel
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


/// Adds pattern-matching-related methods to [CreateReportWarningModel].
extension CreateReportWarningModelPatterns on CreateReportWarningModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateReportWarningModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateReportWarningModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateReportWarningModel value)  $default,){
final _that = this;
switch (_that) {
case _CreateReportWarningModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateReportWarningModel value)?  $default,){
final _that = this;
switch (_that) {
case _CreateReportWarningModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String dailyReportUID,  List<String> warningReasonUIDs,  String? description)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateReportWarningModel() when $default != null:
return $default(_that.dailyReportUID,_that.warningReasonUIDs,_that.description);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String dailyReportUID,  List<String> warningReasonUIDs,  String? description)  $default,) {final _that = this;
switch (_that) {
case _CreateReportWarningModel():
return $default(_that.dailyReportUID,_that.warningReasonUIDs,_that.description);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String dailyReportUID,  List<String> warningReasonUIDs,  String? description)?  $default,) {final _that = this;
switch (_that) {
case _CreateReportWarningModel() when $default != null:
return $default(_that.dailyReportUID,_that.warningReasonUIDs,_that.description);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreateReportWarningModel implements CreateReportWarningModel {
  const _CreateReportWarningModel({required this.dailyReportUID, required final  List<String> warningReasonUIDs, this.description}): _warningReasonUIDs = warningReasonUIDs;
  factory _CreateReportWarningModel.fromJson(Map<String, dynamic> json) => _$CreateReportWarningModelFromJson(json);

/// Daily report UID this warning is created from
@override final  String dailyReportUID;
/// Array of warning reason UIDs
 final  List<String> _warningReasonUIDs;
/// Array of warning reason UIDs
@override List<String> get warningReasonUIDs {
  if (_warningReasonUIDs is EqualUnmodifiableListView) return _warningReasonUIDs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_warningReasonUIDs);
}

/// Additional description or notes (optional)
@override final  String? description;

/// Create a copy of CreateReportWarningModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateReportWarningModelCopyWith<_CreateReportWarningModel> get copyWith => __$CreateReportWarningModelCopyWithImpl<_CreateReportWarningModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateReportWarningModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateReportWarningModel&&(identical(other.dailyReportUID, dailyReportUID) || other.dailyReportUID == dailyReportUID)&&const DeepCollectionEquality().equals(other._warningReasonUIDs, _warningReasonUIDs)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,dailyReportUID,const DeepCollectionEquality().hash(_warningReasonUIDs),description);

@override
String toString() {
  return 'CreateReportWarningModel(dailyReportUID: $dailyReportUID, warningReasonUIDs: $warningReasonUIDs, description: $description)';
}


}

/// @nodoc
abstract mixin class _$CreateReportWarningModelCopyWith<$Res> implements $CreateReportWarningModelCopyWith<$Res> {
  factory _$CreateReportWarningModelCopyWith(_CreateReportWarningModel value, $Res Function(_CreateReportWarningModel) _then) = __$CreateReportWarningModelCopyWithImpl;
@override @useResult
$Res call({
 String dailyReportUID, List<String> warningReasonUIDs, String? description
});




}
/// @nodoc
class __$CreateReportWarningModelCopyWithImpl<$Res>
    implements _$CreateReportWarningModelCopyWith<$Res> {
  __$CreateReportWarningModelCopyWithImpl(this._self, this._then);

  final _CreateReportWarningModel _self;
  final $Res Function(_CreateReportWarningModel) _then;

/// Create a copy of CreateReportWarningModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? dailyReportUID = null,Object? warningReasonUIDs = null,Object? description = freezed,}) {
  return _then(_CreateReportWarningModel(
dailyReportUID: null == dailyReportUID ? _self.dailyReportUID : dailyReportUID // ignore: cast_nullable_to_non_nullable
as String,warningReasonUIDs: null == warningReasonUIDs ? _self._warningReasonUIDs : warningReasonUIDs // ignore: cast_nullable_to_non_nullable
as List<String>,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
