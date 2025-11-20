// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'warning_filter_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WarningFilterModel {

/// Filter by warning type
@JsonKey(includeIfNull: false) List<String>? get warningType;/// Filter by road ID
@JsonKey(includeIfNull: false) String? get roadID;/// Filter by Work Scope ID
@JsonKey(includeIfNull: false) String? get workScopeID;/// Filter by Contract Relation ID
@JsonKey(includeIfNull: false) String? get contractRelationID;/// Filter by Daily Report ID
@JsonKey(includeIfNull: false) String? get dailyReportID;/// Filter by Resolved status
@JsonKey(includeIfNull: false) bool? get isResolved;/// Filter by Action status
@JsonKey(includeIfNull: false) bool? get requiresAction;
/// Create a copy of WarningFilterModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WarningFilterModelCopyWith<WarningFilterModel> get copyWith => _$WarningFilterModelCopyWithImpl<WarningFilterModel>(this as WarningFilterModel, _$identity);

  /// Serializes this WarningFilterModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WarningFilterModel&&const DeepCollectionEquality().equals(other.warningType, warningType)&&(identical(other.roadID, roadID) || other.roadID == roadID)&&(identical(other.workScopeID, workScopeID) || other.workScopeID == workScopeID)&&(identical(other.contractRelationID, contractRelationID) || other.contractRelationID == contractRelationID)&&(identical(other.dailyReportID, dailyReportID) || other.dailyReportID == dailyReportID)&&(identical(other.isResolved, isResolved) || other.isResolved == isResolved)&&(identical(other.requiresAction, requiresAction) || other.requiresAction == requiresAction));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(warningType),roadID,workScopeID,contractRelationID,dailyReportID,isResolved,requiresAction);

@override
String toString() {
  return 'WarningFilterModel(warningType: $warningType, roadID: $roadID, workScopeID: $workScopeID, contractRelationID: $contractRelationID, dailyReportID: $dailyReportID, isResolved: $isResolved, requiresAction: $requiresAction)';
}


}

/// @nodoc
abstract mixin class $WarningFilterModelCopyWith<$Res>  {
  factory $WarningFilterModelCopyWith(WarningFilterModel value, $Res Function(WarningFilterModel) _then) = _$WarningFilterModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(includeIfNull: false) List<String>? warningType,@JsonKey(includeIfNull: false) String? roadID,@JsonKey(includeIfNull: false) String? workScopeID,@JsonKey(includeIfNull: false) String? contractRelationID,@JsonKey(includeIfNull: false) String? dailyReportID,@JsonKey(includeIfNull: false) bool? isResolved,@JsonKey(includeIfNull: false) bool? requiresAction
});




}
/// @nodoc
class _$WarningFilterModelCopyWithImpl<$Res>
    implements $WarningFilterModelCopyWith<$Res> {
  _$WarningFilterModelCopyWithImpl(this._self, this._then);

  final WarningFilterModel _self;
  final $Res Function(WarningFilterModel) _then;

/// Create a copy of WarningFilterModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? warningType = freezed,Object? roadID = freezed,Object? workScopeID = freezed,Object? contractRelationID = freezed,Object? dailyReportID = freezed,Object? isResolved = freezed,Object? requiresAction = freezed,}) {
  return _then(_self.copyWith(
warningType: freezed == warningType ? _self.warningType : warningType // ignore: cast_nullable_to_non_nullable
as List<String>?,roadID: freezed == roadID ? _self.roadID : roadID // ignore: cast_nullable_to_non_nullable
as String?,workScopeID: freezed == workScopeID ? _self.workScopeID : workScopeID // ignore: cast_nullable_to_non_nullable
as String?,contractRelationID: freezed == contractRelationID ? _self.contractRelationID : contractRelationID // ignore: cast_nullable_to_non_nullable
as String?,dailyReportID: freezed == dailyReportID ? _self.dailyReportID : dailyReportID // ignore: cast_nullable_to_non_nullable
as String?,isResolved: freezed == isResolved ? _self.isResolved : isResolved // ignore: cast_nullable_to_non_nullable
as bool?,requiresAction: freezed == requiresAction ? _self.requiresAction : requiresAction // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [WarningFilterModel].
extension WarningFilterModelPatterns on WarningFilterModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WarningFilterModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WarningFilterModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WarningFilterModel value)  $default,){
final _that = this;
switch (_that) {
case _WarningFilterModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WarningFilterModel value)?  $default,){
final _that = this;
switch (_that) {
case _WarningFilterModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(includeIfNull: false)  List<String>? warningType, @JsonKey(includeIfNull: false)  String? roadID, @JsonKey(includeIfNull: false)  String? workScopeID, @JsonKey(includeIfNull: false)  String? contractRelationID, @JsonKey(includeIfNull: false)  String? dailyReportID, @JsonKey(includeIfNull: false)  bool? isResolved, @JsonKey(includeIfNull: false)  bool? requiresAction)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WarningFilterModel() when $default != null:
return $default(_that.warningType,_that.roadID,_that.workScopeID,_that.contractRelationID,_that.dailyReportID,_that.isResolved,_that.requiresAction);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(includeIfNull: false)  List<String>? warningType, @JsonKey(includeIfNull: false)  String? roadID, @JsonKey(includeIfNull: false)  String? workScopeID, @JsonKey(includeIfNull: false)  String? contractRelationID, @JsonKey(includeIfNull: false)  String? dailyReportID, @JsonKey(includeIfNull: false)  bool? isResolved, @JsonKey(includeIfNull: false)  bool? requiresAction)  $default,) {final _that = this;
switch (_that) {
case _WarningFilterModel():
return $default(_that.warningType,_that.roadID,_that.workScopeID,_that.contractRelationID,_that.dailyReportID,_that.isResolved,_that.requiresAction);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(includeIfNull: false)  List<String>? warningType, @JsonKey(includeIfNull: false)  String? roadID, @JsonKey(includeIfNull: false)  String? workScopeID, @JsonKey(includeIfNull: false)  String? contractRelationID, @JsonKey(includeIfNull: false)  String? dailyReportID, @JsonKey(includeIfNull: false)  bool? isResolved, @JsonKey(includeIfNull: false)  bool? requiresAction)?  $default,) {final _that = this;
switch (_that) {
case _WarningFilterModel() when $default != null:
return $default(_that.warningType,_that.roadID,_that.workScopeID,_that.contractRelationID,_that.dailyReportID,_that.isResolved,_that.requiresAction);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WarningFilterModel implements WarningFilterModel {
  const _WarningFilterModel({@JsonKey(includeIfNull: false) final  List<String>? warningType, @JsonKey(includeIfNull: false) this.roadID, @JsonKey(includeIfNull: false) this.workScopeID, @JsonKey(includeIfNull: false) this.contractRelationID, @JsonKey(includeIfNull: false) this.dailyReportID, @JsonKey(includeIfNull: false) this.isResolved, @JsonKey(includeIfNull: false) this.requiresAction}): _warningType = warningType;
  factory _WarningFilterModel.fromJson(Map<String, dynamic> json) => _$WarningFilterModelFromJson(json);

/// Filter by warning type
 final  List<String>? _warningType;
/// Filter by warning type
@override@JsonKey(includeIfNull: false) List<String>? get warningType {
  final value = _warningType;
  if (value == null) return null;
  if (_warningType is EqualUnmodifiableListView) return _warningType;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

/// Filter by road ID
@override@JsonKey(includeIfNull: false) final  String? roadID;
/// Filter by Work Scope ID
@override@JsonKey(includeIfNull: false) final  String? workScopeID;
/// Filter by Contract Relation ID
@override@JsonKey(includeIfNull: false) final  String? contractRelationID;
/// Filter by Daily Report ID
@override@JsonKey(includeIfNull: false) final  String? dailyReportID;
/// Filter by Resolved status
@override@JsonKey(includeIfNull: false) final  bool? isResolved;
/// Filter by Action status
@override@JsonKey(includeIfNull: false) final  bool? requiresAction;

/// Create a copy of WarningFilterModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WarningFilterModelCopyWith<_WarningFilterModel> get copyWith => __$WarningFilterModelCopyWithImpl<_WarningFilterModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WarningFilterModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WarningFilterModel&&const DeepCollectionEquality().equals(other._warningType, _warningType)&&(identical(other.roadID, roadID) || other.roadID == roadID)&&(identical(other.workScopeID, workScopeID) || other.workScopeID == workScopeID)&&(identical(other.contractRelationID, contractRelationID) || other.contractRelationID == contractRelationID)&&(identical(other.dailyReportID, dailyReportID) || other.dailyReportID == dailyReportID)&&(identical(other.isResolved, isResolved) || other.isResolved == isResolved)&&(identical(other.requiresAction, requiresAction) || other.requiresAction == requiresAction));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_warningType),roadID,workScopeID,contractRelationID,dailyReportID,isResolved,requiresAction);

@override
String toString() {
  return 'WarningFilterModel(warningType: $warningType, roadID: $roadID, workScopeID: $workScopeID, contractRelationID: $contractRelationID, dailyReportID: $dailyReportID, isResolved: $isResolved, requiresAction: $requiresAction)';
}


}

/// @nodoc
abstract mixin class _$WarningFilterModelCopyWith<$Res> implements $WarningFilterModelCopyWith<$Res> {
  factory _$WarningFilterModelCopyWith(_WarningFilterModel value, $Res Function(_WarningFilterModel) _then) = __$WarningFilterModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(includeIfNull: false) List<String>? warningType,@JsonKey(includeIfNull: false) String? roadID,@JsonKey(includeIfNull: false) String? workScopeID,@JsonKey(includeIfNull: false) String? contractRelationID,@JsonKey(includeIfNull: false) String? dailyReportID,@JsonKey(includeIfNull: false) bool? isResolved,@JsonKey(includeIfNull: false) bool? requiresAction
});




}
/// @nodoc
class __$WarningFilterModelCopyWithImpl<$Res>
    implements _$WarningFilterModelCopyWith<$Res> {
  __$WarningFilterModelCopyWithImpl(this._self, this._then);

  final _WarningFilterModel _self;
  final $Res Function(_WarningFilterModel) _then;

/// Create a copy of WarningFilterModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? warningType = freezed,Object? roadID = freezed,Object? workScopeID = freezed,Object? contractRelationID = freezed,Object? dailyReportID = freezed,Object? isResolved = freezed,Object? requiresAction = freezed,}) {
  return _then(_WarningFilterModel(
warningType: freezed == warningType ? _self._warningType : warningType // ignore: cast_nullable_to_non_nullable
as List<String>?,roadID: freezed == roadID ? _self.roadID : roadID // ignore: cast_nullable_to_non_nullable
as String?,workScopeID: freezed == workScopeID ? _self.workScopeID : workScopeID // ignore: cast_nullable_to_non_nullable
as String?,contractRelationID: freezed == contractRelationID ? _self.contractRelationID : contractRelationID // ignore: cast_nullable_to_non_nullable
as String?,dailyReportID: freezed == dailyReportID ? _self.dailyReportID : dailyReportID // ignore: cast_nullable_to_non_nullable
as String?,isResolved: freezed == isResolved ? _self.isResolved : isResolved // ignore: cast_nullable_to_non_nullable
as bool?,requiresAction: freezed == requiresAction ? _self.requiresAction : requiresAction // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

// dart format on
