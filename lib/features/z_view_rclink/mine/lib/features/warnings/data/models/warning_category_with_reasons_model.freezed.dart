// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'warning_category_with_reasons_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WarningCategoryWithReasonsModel {

 int get id; String get uid; String get name; String get warningType; DateTime? get createdAt; DateTime? get updatedAt;// Nested reasons array
 List<WarningReasonWithWorkScopeModel> get reasons;
/// Create a copy of WarningCategoryWithReasonsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WarningCategoryWithReasonsModelCopyWith<WarningCategoryWithReasonsModel> get copyWith => _$WarningCategoryWithReasonsModelCopyWithImpl<WarningCategoryWithReasonsModel>(this as WarningCategoryWithReasonsModel, _$identity);

  /// Serializes this WarningCategoryWithReasonsModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WarningCategoryWithReasonsModel&&(identical(other.id, id) || other.id == id)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.name, name) || other.name == name)&&(identical(other.warningType, warningType) || other.warningType == warningType)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other.reasons, reasons));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,uid,name,warningType,createdAt,updatedAt,const DeepCollectionEquality().hash(reasons));

@override
String toString() {
  return 'WarningCategoryWithReasonsModel(id: $id, uid: $uid, name: $name, warningType: $warningType, createdAt: $createdAt, updatedAt: $updatedAt, reasons: $reasons)';
}


}

/// @nodoc
abstract mixin class $WarningCategoryWithReasonsModelCopyWith<$Res>  {
  factory $WarningCategoryWithReasonsModelCopyWith(WarningCategoryWithReasonsModel value, $Res Function(WarningCategoryWithReasonsModel) _then) = _$WarningCategoryWithReasonsModelCopyWithImpl;
@useResult
$Res call({
 int id, String uid, String name, String warningType, DateTime? createdAt, DateTime? updatedAt, List<WarningReasonWithWorkScopeModel> reasons
});




}
/// @nodoc
class _$WarningCategoryWithReasonsModelCopyWithImpl<$Res>
    implements $WarningCategoryWithReasonsModelCopyWith<$Res> {
  _$WarningCategoryWithReasonsModelCopyWithImpl(this._self, this._then);

  final WarningCategoryWithReasonsModel _self;
  final $Res Function(WarningCategoryWithReasonsModel) _then;

/// Create a copy of WarningCategoryWithReasonsModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? uid = null,Object? name = null,Object? warningType = null,Object? createdAt = freezed,Object? updatedAt = freezed,Object? reasons = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,warningType: null == warningType ? _self.warningType : warningType // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,reasons: null == reasons ? _self.reasons : reasons // ignore: cast_nullable_to_non_nullable
as List<WarningReasonWithWorkScopeModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [WarningCategoryWithReasonsModel].
extension WarningCategoryWithReasonsModelPatterns on WarningCategoryWithReasonsModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WarningCategoryWithReasonsModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WarningCategoryWithReasonsModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WarningCategoryWithReasonsModel value)  $default,){
final _that = this;
switch (_that) {
case _WarningCategoryWithReasonsModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WarningCategoryWithReasonsModel value)?  $default,){
final _that = this;
switch (_that) {
case _WarningCategoryWithReasonsModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String uid,  String name,  String warningType,  DateTime? createdAt,  DateTime? updatedAt,  List<WarningReasonWithWorkScopeModel> reasons)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WarningCategoryWithReasonsModel() when $default != null:
return $default(_that.id,_that.uid,_that.name,_that.warningType,_that.createdAt,_that.updatedAt,_that.reasons);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String uid,  String name,  String warningType,  DateTime? createdAt,  DateTime? updatedAt,  List<WarningReasonWithWorkScopeModel> reasons)  $default,) {final _that = this;
switch (_that) {
case _WarningCategoryWithReasonsModel():
return $default(_that.id,_that.uid,_that.name,_that.warningType,_that.createdAt,_that.updatedAt,_that.reasons);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String uid,  String name,  String warningType,  DateTime? createdAt,  DateTime? updatedAt,  List<WarningReasonWithWorkScopeModel> reasons)?  $default,) {final _that = this;
switch (_that) {
case _WarningCategoryWithReasonsModel() when $default != null:
return $default(_that.id,_that.uid,_that.name,_that.warningType,_that.createdAt,_that.updatedAt,_that.reasons);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WarningCategoryWithReasonsModel extends WarningCategoryWithReasonsModel {
  const _WarningCategoryWithReasonsModel({required this.id, required this.uid, required this.name, required this.warningType, this.createdAt, this.updatedAt, final  List<WarningReasonWithWorkScopeModel> reasons = const []}): _reasons = reasons,super._();
  factory _WarningCategoryWithReasonsModel.fromJson(Map<String, dynamic> json) => _$WarningCategoryWithReasonsModelFromJson(json);

@override final  int id;
@override final  String uid;
@override final  String name;
@override final  String warningType;
@override final  DateTime? createdAt;
@override final  DateTime? updatedAt;
// Nested reasons array
 final  List<WarningReasonWithWorkScopeModel> _reasons;
// Nested reasons array
@override@JsonKey() List<WarningReasonWithWorkScopeModel> get reasons {
  if (_reasons is EqualUnmodifiableListView) return _reasons;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_reasons);
}


/// Create a copy of WarningCategoryWithReasonsModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WarningCategoryWithReasonsModelCopyWith<_WarningCategoryWithReasonsModel> get copyWith => __$WarningCategoryWithReasonsModelCopyWithImpl<_WarningCategoryWithReasonsModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WarningCategoryWithReasonsModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WarningCategoryWithReasonsModel&&(identical(other.id, id) || other.id == id)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.name, name) || other.name == name)&&(identical(other.warningType, warningType) || other.warningType == warningType)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other._reasons, _reasons));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,uid,name,warningType,createdAt,updatedAt,const DeepCollectionEquality().hash(_reasons));

@override
String toString() {
  return 'WarningCategoryWithReasonsModel(id: $id, uid: $uid, name: $name, warningType: $warningType, createdAt: $createdAt, updatedAt: $updatedAt, reasons: $reasons)';
}


}

/// @nodoc
abstract mixin class _$WarningCategoryWithReasonsModelCopyWith<$Res> implements $WarningCategoryWithReasonsModelCopyWith<$Res> {
  factory _$WarningCategoryWithReasonsModelCopyWith(_WarningCategoryWithReasonsModel value, $Res Function(_WarningCategoryWithReasonsModel) _then) = __$WarningCategoryWithReasonsModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String uid, String name, String warningType, DateTime? createdAt, DateTime? updatedAt, List<WarningReasonWithWorkScopeModel> reasons
});




}
/// @nodoc
class __$WarningCategoryWithReasonsModelCopyWithImpl<$Res>
    implements _$WarningCategoryWithReasonsModelCopyWith<$Res> {
  __$WarningCategoryWithReasonsModelCopyWithImpl(this._self, this._then);

  final _WarningCategoryWithReasonsModel _self;
  final $Res Function(_WarningCategoryWithReasonsModel) _then;

/// Create a copy of WarningCategoryWithReasonsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? uid = null,Object? name = null,Object? warningType = null,Object? createdAt = freezed,Object? updatedAt = freezed,Object? reasons = null,}) {
  return _then(_WarningCategoryWithReasonsModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,warningType: null == warningType ? _self.warningType : warningType // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,reasons: null == reasons ? _self._reasons : reasons // ignore: cast_nullable_to_non_nullable
as List<WarningReasonWithWorkScopeModel>,
  ));
}


}

// dart format on
