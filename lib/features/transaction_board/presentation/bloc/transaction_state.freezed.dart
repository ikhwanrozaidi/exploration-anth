// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TransactionboardState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransactionboardState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TransactionboardState()';
}


}

/// @nodoc
class $TransactionboardStateCopyWith<$Res>  {
$TransactionboardStateCopyWith(TransactionboardState _, $Res Function(TransactionboardState) __);
}


/// Adds pattern-matching-related methods to [TransactionboardState].
extension TransactionboardStatePatterns on TransactionboardState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( TransactionboardInitial value)?  initial,TResult Function( TransactionboardLoading value)?  loading,TResult Function( TransactionboardLoaded value)?  loaded,TResult Function( TransactionboardError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case TransactionboardInitial() when initial != null:
return initial(_that);case TransactionboardLoading() when loading != null:
return loading(_that);case TransactionboardLoaded() when loaded != null:
return loaded(_that);case TransactionboardError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( TransactionboardInitial value)  initial,required TResult Function( TransactionboardLoading value)  loading,required TResult Function( TransactionboardLoaded value)  loaded,required TResult Function( TransactionboardError value)  error,}){
final _that = this;
switch (_that) {
case TransactionboardInitial():
return initial(_that);case TransactionboardLoading():
return loading(_that);case TransactionboardLoaded():
return loaded(_that);case TransactionboardError():
return error(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( TransactionboardInitial value)?  initial,TResult? Function( TransactionboardLoading value)?  loading,TResult? Function( TransactionboardLoaded value)?  loaded,TResult? Function( TransactionboardError value)?  error,}){
final _that = this;
switch (_that) {
case TransactionboardInitial() when initial != null:
return initial(_that);case TransactionboardLoading() when loading != null:
return loading(_that);case TransactionboardLoaded() when loaded != null:
return loaded(_that);case TransactionboardError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( TransactionBoardData data)?  loaded,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case TransactionboardInitial() when initial != null:
return initial();case TransactionboardLoading() when loading != null:
return loading();case TransactionboardLoaded() when loaded != null:
return loaded(_that.data);case TransactionboardError() when error != null:
return error(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( TransactionBoardData data)  loaded,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case TransactionboardInitial():
return initial();case TransactionboardLoading():
return loading();case TransactionboardLoaded():
return loaded(_that.data);case TransactionboardError():
return error(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( TransactionBoardData data)?  loaded,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case TransactionboardInitial() when initial != null:
return initial();case TransactionboardLoading() when loading != null:
return loading();case TransactionboardLoaded() when loaded != null:
return loaded(_that.data);case TransactionboardError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class TransactionboardInitial implements TransactionboardState {
  const TransactionboardInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransactionboardInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TransactionboardState.initial()';
}


}




/// @nodoc


class TransactionboardLoading implements TransactionboardState {
  const TransactionboardLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransactionboardLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TransactionboardState.loading()';
}


}




/// @nodoc


class TransactionboardLoaded implements TransactionboardState {
  const TransactionboardLoaded({required this.data});
  

 final  TransactionBoardData data;

/// Create a copy of TransactionboardState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransactionboardLoadedCopyWith<TransactionboardLoaded> get copyWith => _$TransactionboardLoadedCopyWithImpl<TransactionboardLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransactionboardLoaded&&(identical(other.data, data) || other.data == data));
}


@override
int get hashCode => Object.hash(runtimeType,data);

@override
String toString() {
  return 'TransactionboardState.loaded(data: $data)';
}


}

/// @nodoc
abstract mixin class $TransactionboardLoadedCopyWith<$Res> implements $TransactionboardStateCopyWith<$Res> {
  factory $TransactionboardLoadedCopyWith(TransactionboardLoaded value, $Res Function(TransactionboardLoaded) _then) = _$TransactionboardLoadedCopyWithImpl;
@useResult
$Res call({
 TransactionBoardData data
});




}
/// @nodoc
class _$TransactionboardLoadedCopyWithImpl<$Res>
    implements $TransactionboardLoadedCopyWith<$Res> {
  _$TransactionboardLoadedCopyWithImpl(this._self, this._then);

  final TransactionboardLoaded _self;
  final $Res Function(TransactionboardLoaded) _then;

/// Create a copy of TransactionboardState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(TransactionboardLoaded(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as TransactionBoardData,
  ));
}


}

/// @nodoc


class TransactionboardError implements TransactionboardState {
  const TransactionboardError(this.message);
  

 final  String message;

/// Create a copy of TransactionboardState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransactionboardErrorCopyWith<TransactionboardError> get copyWith => _$TransactionboardErrorCopyWithImpl<TransactionboardError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransactionboardError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'TransactionboardState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $TransactionboardErrorCopyWith<$Res> implements $TransactionboardStateCopyWith<$Res> {
  factory $TransactionboardErrorCopyWith(TransactionboardError value, $Res Function(TransactionboardError) _then) = _$TransactionboardErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$TransactionboardErrorCopyWithImpl<$Res>
    implements $TransactionboardErrorCopyWith<$Res> {
  _$TransactionboardErrorCopyWithImpl(this._self, this._then);

  final TransactionboardError _self;
  final $Res Function(TransactionboardError) _then;

/// Create a copy of TransactionboardState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(TransactionboardError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
