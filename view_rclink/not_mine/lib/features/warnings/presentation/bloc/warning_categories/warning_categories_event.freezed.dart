// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'warning_categories_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WarningCategoriesEvent {

 bool get forceRefresh; Duration? get cacheTimeout; String? get warningType; String? get workScopeUID;
/// Create a copy of WarningCategoriesEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WarningCategoriesEventCopyWith<WarningCategoriesEvent> get copyWith => _$WarningCategoriesEventCopyWithImpl<WarningCategoriesEvent>(this as WarningCategoriesEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WarningCategoriesEvent&&(identical(other.forceRefresh, forceRefresh) || other.forceRefresh == forceRefresh)&&(identical(other.cacheTimeout, cacheTimeout) || other.cacheTimeout == cacheTimeout)&&(identical(other.warningType, warningType) || other.warningType == warningType)&&(identical(other.workScopeUID, workScopeUID) || other.workScopeUID == workScopeUID));
}


@override
int get hashCode => Object.hash(runtimeType,forceRefresh,cacheTimeout,warningType,workScopeUID);

@override
String toString() {
  return 'WarningCategoriesEvent(forceRefresh: $forceRefresh, cacheTimeout: $cacheTimeout, warningType: $warningType, workScopeUID: $workScopeUID)';
}


}

/// @nodoc
abstract mixin class $WarningCategoriesEventCopyWith<$Res>  {
  factory $WarningCategoriesEventCopyWith(WarningCategoriesEvent value, $Res Function(WarningCategoriesEvent) _then) = _$WarningCategoriesEventCopyWithImpl;
@useResult
$Res call({
 bool forceRefresh, Duration? cacheTimeout, String? warningType, String? workScopeUID
});




}
/// @nodoc
class _$WarningCategoriesEventCopyWithImpl<$Res>
    implements $WarningCategoriesEventCopyWith<$Res> {
  _$WarningCategoriesEventCopyWithImpl(this._self, this._then);

  final WarningCategoriesEvent _self;
  final $Res Function(WarningCategoriesEvent) _then;

/// Create a copy of WarningCategoriesEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? forceRefresh = null,Object? cacheTimeout = freezed,Object? warningType = freezed,Object? workScopeUID = freezed,}) {
  return _then(_self.copyWith(
forceRefresh: null == forceRefresh ? _self.forceRefresh : forceRefresh // ignore: cast_nullable_to_non_nullable
as bool,cacheTimeout: freezed == cacheTimeout ? _self.cacheTimeout : cacheTimeout // ignore: cast_nullable_to_non_nullable
as Duration?,warningType: freezed == warningType ? _self.warningType : warningType // ignore: cast_nullable_to_non_nullable
as String?,workScopeUID: freezed == workScopeUID ? _self.workScopeUID : workScopeUID // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [WarningCategoriesEvent].
extension WarningCategoriesEventPatterns on WarningCategoriesEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoadWarningCategories value)?  loadCategories,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoadWarningCategories() when loadCategories != null:
return loadCategories(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoadWarningCategories value)  loadCategories,}){
final _that = this;
switch (_that) {
case LoadWarningCategories():
return loadCategories(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoadWarningCategories value)?  loadCategories,}){
final _that = this;
switch (_that) {
case LoadWarningCategories() when loadCategories != null:
return loadCategories(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( bool forceRefresh,  Duration? cacheTimeout,  String? warningType,  String? workScopeUID)?  loadCategories,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LoadWarningCategories() when loadCategories != null:
return loadCategories(_that.forceRefresh,_that.cacheTimeout,_that.warningType,_that.workScopeUID);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( bool forceRefresh,  Duration? cacheTimeout,  String? warningType,  String? workScopeUID)  loadCategories,}) {final _that = this;
switch (_that) {
case LoadWarningCategories():
return loadCategories(_that.forceRefresh,_that.cacheTimeout,_that.warningType,_that.workScopeUID);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( bool forceRefresh,  Duration? cacheTimeout,  String? warningType,  String? workScopeUID)?  loadCategories,}) {final _that = this;
switch (_that) {
case LoadWarningCategories() when loadCategories != null:
return loadCategories(_that.forceRefresh,_that.cacheTimeout,_that.warningType,_that.workScopeUID);case _:
  return null;

}
}

}

/// @nodoc


class LoadWarningCategories implements WarningCategoriesEvent {
  const LoadWarningCategories({this.forceRefresh = false, this.cacheTimeout, this.warningType, this.workScopeUID});
  

@override@JsonKey() final  bool forceRefresh;
@override final  Duration? cacheTimeout;
@override final  String? warningType;
@override final  String? workScopeUID;

/// Create a copy of WarningCategoriesEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadWarningCategoriesCopyWith<LoadWarningCategories> get copyWith => _$LoadWarningCategoriesCopyWithImpl<LoadWarningCategories>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadWarningCategories&&(identical(other.forceRefresh, forceRefresh) || other.forceRefresh == forceRefresh)&&(identical(other.cacheTimeout, cacheTimeout) || other.cacheTimeout == cacheTimeout)&&(identical(other.warningType, warningType) || other.warningType == warningType)&&(identical(other.workScopeUID, workScopeUID) || other.workScopeUID == workScopeUID));
}


@override
int get hashCode => Object.hash(runtimeType,forceRefresh,cacheTimeout,warningType,workScopeUID);

@override
String toString() {
  return 'WarningCategoriesEvent.loadCategories(forceRefresh: $forceRefresh, cacheTimeout: $cacheTimeout, warningType: $warningType, workScopeUID: $workScopeUID)';
}


}

/// @nodoc
abstract mixin class $LoadWarningCategoriesCopyWith<$Res> implements $WarningCategoriesEventCopyWith<$Res> {
  factory $LoadWarningCategoriesCopyWith(LoadWarningCategories value, $Res Function(LoadWarningCategories) _then) = _$LoadWarningCategoriesCopyWithImpl;
@override @useResult
$Res call({
 bool forceRefresh, Duration? cacheTimeout, String? warningType, String? workScopeUID
});




}
/// @nodoc
class _$LoadWarningCategoriesCopyWithImpl<$Res>
    implements $LoadWarningCategoriesCopyWith<$Res> {
  _$LoadWarningCategoriesCopyWithImpl(this._self, this._then);

  final LoadWarningCategories _self;
  final $Res Function(LoadWarningCategories) _then;

/// Create a copy of WarningCategoriesEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? forceRefresh = null,Object? cacheTimeout = freezed,Object? warningType = freezed,Object? workScopeUID = freezed,}) {
  return _then(LoadWarningCategories(
forceRefresh: null == forceRefresh ? _self.forceRefresh : forceRefresh // ignore: cast_nullable_to_non_nullable
as bool,cacheTimeout: freezed == cacheTimeout ? _self.cacheTimeout : cacheTimeout // ignore: cast_nullable_to_non_nullable
as Duration?,warningType: freezed == warningType ? _self.warningType : warningType // ignore: cast_nullable_to_non_nullable
as String?,workScopeUID: freezed == workScopeUID ? _self.workScopeUID : workScopeUID // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
