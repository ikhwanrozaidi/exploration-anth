// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'warning_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WarningResponseModel {

 int get id; String get uid; List<WarningItemModel> get warningItems; CreatedByResponseModel get createdBy; String? get description; String? get longitude; String? get latitude; String? get fromSection; String? get toSection; DateTime get createdAt; DateTime get updatedAt;
/// Create a copy of WarningResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WarningResponseModelCopyWith<WarningResponseModel> get copyWith => _$WarningResponseModelCopyWithImpl<WarningResponseModel>(this as WarningResponseModel, _$identity);

  /// Serializes this WarningResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WarningResponseModel&&(identical(other.id, id) || other.id == id)&&(identical(other.uid, uid) || other.uid == uid)&&const DeepCollectionEquality().equals(other.warningItems, warningItems)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.description, description) || other.description == description)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.fromSection, fromSection) || other.fromSection == fromSection)&&(identical(other.toSection, toSection) || other.toSection == toSection)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,uid,const DeepCollectionEquality().hash(warningItems),createdBy,description,longitude,latitude,fromSection,toSection,createdAt,updatedAt);

@override
String toString() {
  return 'WarningResponseModel(id: $id, uid: $uid, warningItems: $warningItems, createdBy: $createdBy, description: $description, longitude: $longitude, latitude: $latitude, fromSection: $fromSection, toSection: $toSection, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $WarningResponseModelCopyWith<$Res>  {
  factory $WarningResponseModelCopyWith(WarningResponseModel value, $Res Function(WarningResponseModel) _then) = _$WarningResponseModelCopyWithImpl;
@useResult
$Res call({
 int id, String uid, List<WarningItemModel> warningItems, CreatedByResponseModel createdBy, String? description, String? longitude, String? latitude, String? fromSection, String? toSection, DateTime createdAt, DateTime updatedAt
});


$CreatedByResponseModelCopyWith<$Res> get createdBy;

}
/// @nodoc
class _$WarningResponseModelCopyWithImpl<$Res>
    implements $WarningResponseModelCopyWith<$Res> {
  _$WarningResponseModelCopyWithImpl(this._self, this._then);

  final WarningResponseModel _self;
  final $Res Function(WarningResponseModel) _then;

/// Create a copy of WarningResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? uid = null,Object? warningItems = null,Object? createdBy = null,Object? description = freezed,Object? longitude = freezed,Object? latitude = freezed,Object? fromSection = freezed,Object? toSection = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,warningItems: null == warningItems ? _self.warningItems : warningItems // ignore: cast_nullable_to_non_nullable
as List<WarningItemModel>,createdBy: null == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as CreatedByResponseModel,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as String?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as String?,fromSection: freezed == fromSection ? _self.fromSection : fromSection // ignore: cast_nullable_to_non_nullable
as String?,toSection: freezed == toSection ? _self.toSection : toSection // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}
/// Create a copy of WarningResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CreatedByResponseModelCopyWith<$Res> get createdBy {
  
  return $CreatedByResponseModelCopyWith<$Res>(_self.createdBy, (value) {
    return _then(_self.copyWith(createdBy: value));
  });
}
}


/// Adds pattern-matching-related methods to [WarningResponseModel].
extension WarningResponseModelPatterns on WarningResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WarningResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WarningResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WarningResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _WarningResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WarningResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _WarningResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String uid,  List<WarningItemModel> warningItems,  CreatedByResponseModel createdBy,  String? description,  String? longitude,  String? latitude,  String? fromSection,  String? toSection,  DateTime createdAt,  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WarningResponseModel() when $default != null:
return $default(_that.id,_that.uid,_that.warningItems,_that.createdBy,_that.description,_that.longitude,_that.latitude,_that.fromSection,_that.toSection,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String uid,  List<WarningItemModel> warningItems,  CreatedByResponseModel createdBy,  String? description,  String? longitude,  String? latitude,  String? fromSection,  String? toSection,  DateTime createdAt,  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _WarningResponseModel():
return $default(_that.id,_that.uid,_that.warningItems,_that.createdBy,_that.description,_that.longitude,_that.latitude,_that.fromSection,_that.toSection,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String uid,  List<WarningItemModel> warningItems,  CreatedByResponseModel createdBy,  String? description,  String? longitude,  String? latitude,  String? fromSection,  String? toSection,  DateTime createdAt,  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _WarningResponseModel() when $default != null:
return $default(_that.id,_that.uid,_that.warningItems,_that.createdBy,_that.description,_that.longitude,_that.latitude,_that.fromSection,_that.toSection,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WarningResponseModel extends WarningResponseModel {
  const _WarningResponseModel({required this.id, required this.uid, final  List<WarningItemModel> warningItems = const [], required this.createdBy, this.description, this.longitude, this.latitude, this.fromSection, this.toSection, required this.createdAt, required this.updatedAt}): _warningItems = warningItems,super._();
  factory _WarningResponseModel.fromJson(Map<String, dynamic> json) => _$WarningResponseModelFromJson(json);

@override final  int id;
@override final  String uid;
 final  List<WarningItemModel> _warningItems;
@override@JsonKey() List<WarningItemModel> get warningItems {
  if (_warningItems is EqualUnmodifiableListView) return _warningItems;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_warningItems);
}

@override final  CreatedByResponseModel createdBy;
@override final  String? description;
@override final  String? longitude;
@override final  String? latitude;
@override final  String? fromSection;
@override final  String? toSection;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;

/// Create a copy of WarningResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WarningResponseModelCopyWith<_WarningResponseModel> get copyWith => __$WarningResponseModelCopyWithImpl<_WarningResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WarningResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WarningResponseModel&&(identical(other.id, id) || other.id == id)&&(identical(other.uid, uid) || other.uid == uid)&&const DeepCollectionEquality().equals(other._warningItems, _warningItems)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.description, description) || other.description == description)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.fromSection, fromSection) || other.fromSection == fromSection)&&(identical(other.toSection, toSection) || other.toSection == toSection)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,uid,const DeepCollectionEquality().hash(_warningItems),createdBy,description,longitude,latitude,fromSection,toSection,createdAt,updatedAt);

@override
String toString() {
  return 'WarningResponseModel(id: $id, uid: $uid, warningItems: $warningItems, createdBy: $createdBy, description: $description, longitude: $longitude, latitude: $latitude, fromSection: $fromSection, toSection: $toSection, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$WarningResponseModelCopyWith<$Res> implements $WarningResponseModelCopyWith<$Res> {
  factory _$WarningResponseModelCopyWith(_WarningResponseModel value, $Res Function(_WarningResponseModel) _then) = __$WarningResponseModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String uid, List<WarningItemModel> warningItems, CreatedByResponseModel createdBy, String? description, String? longitude, String? latitude, String? fromSection, String? toSection, DateTime createdAt, DateTime updatedAt
});


@override $CreatedByResponseModelCopyWith<$Res> get createdBy;

}
/// @nodoc
class __$WarningResponseModelCopyWithImpl<$Res>
    implements _$WarningResponseModelCopyWith<$Res> {
  __$WarningResponseModelCopyWithImpl(this._self, this._then);

  final _WarningResponseModel _self;
  final $Res Function(_WarningResponseModel) _then;

/// Create a copy of WarningResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? uid = null,Object? warningItems = null,Object? createdBy = null,Object? description = freezed,Object? longitude = freezed,Object? latitude = freezed,Object? fromSection = freezed,Object? toSection = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_WarningResponseModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,warningItems: null == warningItems ? _self._warningItems : warningItems // ignore: cast_nullable_to_non_nullable
as List<WarningItemModel>,createdBy: null == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as CreatedByResponseModel,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as String?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as String?,fromSection: freezed == fromSection ? _self.fromSection : fromSection // ignore: cast_nullable_to_non_nullable
as String?,toSection: freezed == toSection ? _self.toSection : toSection // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

/// Create a copy of WarningResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CreatedByResponseModelCopyWith<$Res> get createdBy {
  
  return $CreatedByResponseModelCopyWith<$Res>(_self.createdBy, (value) {
    return _then(_self.copyWith(createdBy: value));
  });
}
}

// dart format on
