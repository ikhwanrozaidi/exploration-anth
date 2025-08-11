// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_post_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CreatePostRequestModel {

 int get userId; String get title; String get body;
/// Create a copy of CreatePostRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreatePostRequestModelCopyWith<CreatePostRequestModel> get copyWith => _$CreatePostRequestModelCopyWithImpl<CreatePostRequestModel>(this as CreatePostRequestModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreatePostRequestModel&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.title, title) || other.title == title)&&(identical(other.body, body) || other.body == body));
}


@override
int get hashCode => Object.hash(runtimeType,userId,title,body);

@override
String toString() {
  return 'CreatePostRequestModel(userId: $userId, title: $title, body: $body)';
}


}

/// @nodoc
abstract mixin class $CreatePostRequestModelCopyWith<$Res>  {
  factory $CreatePostRequestModelCopyWith(CreatePostRequestModel value, $Res Function(CreatePostRequestModel) _then) = _$CreatePostRequestModelCopyWithImpl;
@useResult
$Res call({
 int userId, String title, String body
});




}
/// @nodoc
class _$CreatePostRequestModelCopyWithImpl<$Res>
    implements $CreatePostRequestModelCopyWith<$Res> {
  _$CreatePostRequestModelCopyWithImpl(this._self, this._then);

  final CreatePostRequestModel _self;
  final $Res Function(CreatePostRequestModel) _then;

/// Create a copy of CreatePostRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = null,Object? title = null,Object? body = null,}) {
  return _then(_self.copyWith(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CreatePostRequestModel].
extension CreatePostRequestModelPatterns on CreatePostRequestModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreatePostRequestModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreatePostRequestModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreatePostRequestModel value)  $default,){
final _that = this;
switch (_that) {
case _CreatePostRequestModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreatePostRequestModel value)?  $default,){
final _that = this;
switch (_that) {
case _CreatePostRequestModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int userId,  String title,  String body)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreatePostRequestModel() when $default != null:
return $default(_that.userId,_that.title,_that.body);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int userId,  String title,  String body)  $default,) {final _that = this;
switch (_that) {
case _CreatePostRequestModel():
return $default(_that.userId,_that.title,_that.body);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int userId,  String title,  String body)?  $default,) {final _that = this;
switch (_that) {
case _CreatePostRequestModel() when $default != null:
return $default(_that.userId,_that.title,_that.body);case _:
  return null;

}
}

}

/// @nodoc


class _CreatePostRequestModel implements CreatePostRequestModel {
  const _CreatePostRequestModel({required this.userId, required this.title, required this.body});
  

@override final  int userId;
@override final  String title;
@override final  String body;

/// Create a copy of CreatePostRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreatePostRequestModelCopyWith<_CreatePostRequestModel> get copyWith => __$CreatePostRequestModelCopyWithImpl<_CreatePostRequestModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreatePostRequestModel&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.title, title) || other.title == title)&&(identical(other.body, body) || other.body == body));
}


@override
int get hashCode => Object.hash(runtimeType,userId,title,body);

@override
String toString() {
  return 'CreatePostRequestModel(userId: $userId, title: $title, body: $body)';
}


}

/// @nodoc
abstract mixin class _$CreatePostRequestModelCopyWith<$Res> implements $CreatePostRequestModelCopyWith<$Res> {
  factory _$CreatePostRequestModelCopyWith(_CreatePostRequestModel value, $Res Function(_CreatePostRequestModel) _then) = __$CreatePostRequestModelCopyWithImpl;
@override @useResult
$Res call({
 int userId, String title, String body
});




}
/// @nodoc
class __$CreatePostRequestModelCopyWithImpl<$Res>
    implements _$CreatePostRequestModelCopyWith<$Res> {
  __$CreatePostRequestModelCopyWithImpl(this._self, this._then);

  final _CreatePostRequestModel _self;
  final $Res Function(_CreatePostRequestModel) _then;

/// Create a copy of CreatePostRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? title = null,Object? body = null,}) {
  return _then(_CreatePostRequestModel(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
