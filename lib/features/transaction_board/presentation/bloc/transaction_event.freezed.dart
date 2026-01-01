// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TransactionboardEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransactionboardEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TransactionboardEvent()';
}


}

/// @nodoc
class $TransactionboardEventCopyWith<$Res>  {
$TransactionboardEventCopyWith(TransactionboardEvent _, $Res Function(TransactionboardEvent) __);
}


/// Adds pattern-matching-related methods to [TransactionboardEvent].
extension TransactionboardEventPatterns on TransactionboardEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoadTransactionboard value)?  loadTransactionboard,TResult Function( RefreshTransactionboard value)?  refreshTransactionboard,TResult Function( ClearTransactionCache value)?  clearCache,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoadTransactionboard() when loadTransactionboard != null:
return loadTransactionboard(_that);case RefreshTransactionboard() when refreshTransactionboard != null:
return refreshTransactionboard(_that);case ClearTransactionCache() when clearCache != null:
return clearCache(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoadTransactionboard value)  loadTransactionboard,required TResult Function( RefreshTransactionboard value)  refreshTransactionboard,required TResult Function( ClearTransactionCache value)  clearCache,}){
final _that = this;
switch (_that) {
case LoadTransactionboard():
return loadTransactionboard(_that);case RefreshTransactionboard():
return refreshTransactionboard(_that);case ClearTransactionCache():
return clearCache(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoadTransactionboard value)?  loadTransactionboard,TResult? Function( RefreshTransactionboard value)?  refreshTransactionboard,TResult? Function( ClearTransactionCache value)?  clearCache,}){
final _that = this;
switch (_that) {
case LoadTransactionboard() when loadTransactionboard != null:
return loadTransactionboard(_that);case RefreshTransactionboard() when refreshTransactionboard != null:
return refreshTransactionboard(_that);case ClearTransactionCache() when clearCache != null:
return clearCache(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loadTransactionboard,TResult Function()?  refreshTransactionboard,TResult Function()?  clearCache,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LoadTransactionboard() when loadTransactionboard != null:
return loadTransactionboard();case RefreshTransactionboard() when refreshTransactionboard != null:
return refreshTransactionboard();case ClearTransactionCache() when clearCache != null:
return clearCache();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loadTransactionboard,required TResult Function()  refreshTransactionboard,required TResult Function()  clearCache,}) {final _that = this;
switch (_that) {
case LoadTransactionboard():
return loadTransactionboard();case RefreshTransactionboard():
return refreshTransactionboard();case ClearTransactionCache():
return clearCache();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loadTransactionboard,TResult? Function()?  refreshTransactionboard,TResult? Function()?  clearCache,}) {final _that = this;
switch (_that) {
case LoadTransactionboard() when loadTransactionboard != null:
return loadTransactionboard();case RefreshTransactionboard() when refreshTransactionboard != null:
return refreshTransactionboard();case ClearTransactionCache() when clearCache != null:
return clearCache();case _:
  return null;

}
}

}

/// @nodoc


class LoadTransactionboard implements TransactionboardEvent {
  const LoadTransactionboard();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadTransactionboard);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TransactionboardEvent.loadTransactionboard()';
}


}




/// @nodoc


class RefreshTransactionboard implements TransactionboardEvent {
  const RefreshTransactionboard();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RefreshTransactionboard);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TransactionboardEvent.refreshTransactionboard()';
}


}




/// @nodoc


class ClearTransactionCache implements TransactionboardEvent {
  const ClearTransactionCache();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClearTransactionCache);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TransactionboardEvent.clearCache()';
}


}




// dart format on
