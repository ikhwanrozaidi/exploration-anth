// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_warning_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CreateWarningModel {

 String get roadUID; String get workScopeUID; double? get fromSection; double? get toSection;@JsonKey(includeIfNull: false) String? get contractRelationUID; List<String> get warningReasonUIDs; String? get description; double? get longitude; double? get latitude; bool? get requiresAction;
/// Create a copy of CreateWarningModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateWarningModelCopyWith<CreateWarningModel> get copyWith => _$CreateWarningModelCopyWithImpl<CreateWarningModel>(this as CreateWarningModel, _$identity);

  /// Serializes this CreateWarningModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateWarningModel&&(identical(other.roadUID, roadUID) || other.roadUID == roadUID)&&(identical(other.workScopeUID, workScopeUID) || other.workScopeUID == workScopeUID)&&(identical(other.fromSection, fromSection) || other.fromSection == fromSection)&&(identical(other.toSection, toSection) || other.toSection == toSection)&&(identical(other.contractRelationUID, contractRelationUID) || other.contractRelationUID == contractRelationUID)&&const DeepCollectionEquality().equals(other.warningReasonUIDs, warningReasonUIDs)&&(identical(other.description, description) || other.description == description)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.requiresAction, requiresAction) || other.requiresAction == requiresAction));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,roadUID,workScopeUID,fromSection,toSection,contractRelationUID,const DeepCollectionEquality().hash(warningReasonUIDs),description,longitude,latitude,requiresAction);

@override
String toString() {
  return 'CreateWarningModel(roadUID: $roadUID, workScopeUID: $workScopeUID, fromSection: $fromSection, toSection: $toSection, contractRelationUID: $contractRelationUID, warningReasonUIDs: $warningReasonUIDs, description: $description, longitude: $longitude, latitude: $latitude, requiresAction: $requiresAction)';
}


}

/// @nodoc
abstract mixin class $CreateWarningModelCopyWith<$Res>  {
  factory $CreateWarningModelCopyWith(CreateWarningModel value, $Res Function(CreateWarningModel) _then) = _$CreateWarningModelCopyWithImpl;
@useResult
$Res call({
 String roadUID, String workScopeUID, double? fromSection, double? toSection,@JsonKey(includeIfNull: false) String? contractRelationUID, List<String> warningReasonUIDs, String? description, double? longitude, double? latitude, bool? requiresAction
});




}
/// @nodoc
class _$CreateWarningModelCopyWithImpl<$Res>
    implements $CreateWarningModelCopyWith<$Res> {
  _$CreateWarningModelCopyWithImpl(this._self, this._then);

  final CreateWarningModel _self;
  final $Res Function(CreateWarningModel) _then;

/// Create a copy of CreateWarningModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? roadUID = null,Object? workScopeUID = null,Object? fromSection = freezed,Object? toSection = freezed,Object? contractRelationUID = freezed,Object? warningReasonUIDs = null,Object? description = freezed,Object? longitude = freezed,Object? latitude = freezed,Object? requiresAction = freezed,}) {
  return _then(_self.copyWith(
roadUID: null == roadUID ? _self.roadUID : roadUID // ignore: cast_nullable_to_non_nullable
as String,workScopeUID: null == workScopeUID ? _self.workScopeUID : workScopeUID // ignore: cast_nullable_to_non_nullable
as String,fromSection: freezed == fromSection ? _self.fromSection : fromSection // ignore: cast_nullable_to_non_nullable
as double?,toSection: freezed == toSection ? _self.toSection : toSection // ignore: cast_nullable_to_non_nullable
as double?,contractRelationUID: freezed == contractRelationUID ? _self.contractRelationUID : contractRelationUID // ignore: cast_nullable_to_non_nullable
as String?,warningReasonUIDs: null == warningReasonUIDs ? _self.warningReasonUIDs : warningReasonUIDs // ignore: cast_nullable_to_non_nullable
as List<String>,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,requiresAction: freezed == requiresAction ? _self.requiresAction : requiresAction // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateWarningModel].
extension CreateWarningModelPatterns on CreateWarningModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateWarningModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateWarningModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateWarningModel value)  $default,){
final _that = this;
switch (_that) {
case _CreateWarningModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateWarningModel value)?  $default,){
final _that = this;
switch (_that) {
case _CreateWarningModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String roadUID,  String workScopeUID,  double? fromSection,  double? toSection, @JsonKey(includeIfNull: false)  String? contractRelationUID,  List<String> warningReasonUIDs,  String? description,  double? longitude,  double? latitude,  bool? requiresAction)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateWarningModel() when $default != null:
return $default(_that.roadUID,_that.workScopeUID,_that.fromSection,_that.toSection,_that.contractRelationUID,_that.warningReasonUIDs,_that.description,_that.longitude,_that.latitude,_that.requiresAction);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String roadUID,  String workScopeUID,  double? fromSection,  double? toSection, @JsonKey(includeIfNull: false)  String? contractRelationUID,  List<String> warningReasonUIDs,  String? description,  double? longitude,  double? latitude,  bool? requiresAction)  $default,) {final _that = this;
switch (_that) {
case _CreateWarningModel():
return $default(_that.roadUID,_that.workScopeUID,_that.fromSection,_that.toSection,_that.contractRelationUID,_that.warningReasonUIDs,_that.description,_that.longitude,_that.latitude,_that.requiresAction);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String roadUID,  String workScopeUID,  double? fromSection,  double? toSection, @JsonKey(includeIfNull: false)  String? contractRelationUID,  List<String> warningReasonUIDs,  String? description,  double? longitude,  double? latitude,  bool? requiresAction)?  $default,) {final _that = this;
switch (_that) {
case _CreateWarningModel() when $default != null:
return $default(_that.roadUID,_that.workScopeUID,_that.fromSection,_that.toSection,_that.contractRelationUID,_that.warningReasonUIDs,_that.description,_that.longitude,_that.latitude,_that.requiresAction);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreateWarningModel implements CreateWarningModel {
  const _CreateWarningModel({required this.roadUID, required this.workScopeUID, this.fromSection, this.toSection, @JsonKey(includeIfNull: false) this.contractRelationUID, required final  List<String> warningReasonUIDs, this.description, this.longitude, this.latitude, this.requiresAction}): _warningReasonUIDs = warningReasonUIDs;
  factory _CreateWarningModel.fromJson(Map<String, dynamic> json) => _$CreateWarningModelFromJson(json);

@override final  String roadUID;
@override final  String workScopeUID;
@override final  double? fromSection;
@override final  double? toSection;
@override@JsonKey(includeIfNull: false) final  String? contractRelationUID;
 final  List<String> _warningReasonUIDs;
@override List<String> get warningReasonUIDs {
  if (_warningReasonUIDs is EqualUnmodifiableListView) return _warningReasonUIDs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_warningReasonUIDs);
}

@override final  String? description;
@override final  double? longitude;
@override final  double? latitude;
@override final  bool? requiresAction;

/// Create a copy of CreateWarningModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateWarningModelCopyWith<_CreateWarningModel> get copyWith => __$CreateWarningModelCopyWithImpl<_CreateWarningModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateWarningModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateWarningModel&&(identical(other.roadUID, roadUID) || other.roadUID == roadUID)&&(identical(other.workScopeUID, workScopeUID) || other.workScopeUID == workScopeUID)&&(identical(other.fromSection, fromSection) || other.fromSection == fromSection)&&(identical(other.toSection, toSection) || other.toSection == toSection)&&(identical(other.contractRelationUID, contractRelationUID) || other.contractRelationUID == contractRelationUID)&&const DeepCollectionEquality().equals(other._warningReasonUIDs, _warningReasonUIDs)&&(identical(other.description, description) || other.description == description)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.requiresAction, requiresAction) || other.requiresAction == requiresAction));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,roadUID,workScopeUID,fromSection,toSection,contractRelationUID,const DeepCollectionEquality().hash(_warningReasonUIDs),description,longitude,latitude,requiresAction);

@override
String toString() {
  return 'CreateWarningModel(roadUID: $roadUID, workScopeUID: $workScopeUID, fromSection: $fromSection, toSection: $toSection, contractRelationUID: $contractRelationUID, warningReasonUIDs: $warningReasonUIDs, description: $description, longitude: $longitude, latitude: $latitude, requiresAction: $requiresAction)';
}


}

/// @nodoc
abstract mixin class _$CreateWarningModelCopyWith<$Res> implements $CreateWarningModelCopyWith<$Res> {
  factory _$CreateWarningModelCopyWith(_CreateWarningModel value, $Res Function(_CreateWarningModel) _then) = __$CreateWarningModelCopyWithImpl;
@override @useResult
$Res call({
 String roadUID, String workScopeUID, double? fromSection, double? toSection,@JsonKey(includeIfNull: false) String? contractRelationUID, List<String> warningReasonUIDs, String? description, double? longitude, double? latitude, bool? requiresAction
});




}
/// @nodoc
class __$CreateWarningModelCopyWithImpl<$Res>
    implements _$CreateWarningModelCopyWith<$Res> {
  __$CreateWarningModelCopyWithImpl(this._self, this._then);

  final _CreateWarningModel _self;
  final $Res Function(_CreateWarningModel) _then;

/// Create a copy of CreateWarningModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? roadUID = null,Object? workScopeUID = null,Object? fromSection = freezed,Object? toSection = freezed,Object? contractRelationUID = freezed,Object? warningReasonUIDs = null,Object? description = freezed,Object? longitude = freezed,Object? latitude = freezed,Object? requiresAction = freezed,}) {
  return _then(_CreateWarningModel(
roadUID: null == roadUID ? _self.roadUID : roadUID // ignore: cast_nullable_to_non_nullable
as String,workScopeUID: null == workScopeUID ? _self.workScopeUID : workScopeUID // ignore: cast_nullable_to_non_nullable
as String,fromSection: freezed == fromSection ? _self.fromSection : fromSection // ignore: cast_nullable_to_non_nullable
as double?,toSection: freezed == toSection ? _self.toSection : toSection // ignore: cast_nullable_to_non_nullable
as double?,contractRelationUID: freezed == contractRelationUID ? _self.contractRelationUID : contractRelationUID // ignore: cast_nullable_to_non_nullable
as String?,warningReasonUIDs: null == warningReasonUIDs ? _self._warningReasonUIDs : warningReasonUIDs // ignore: cast_nullable_to_non_nullable
as List<String>,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,requiresAction: freezed == requiresAction ? _self.requiresAction : requiresAction // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

// dart format on
