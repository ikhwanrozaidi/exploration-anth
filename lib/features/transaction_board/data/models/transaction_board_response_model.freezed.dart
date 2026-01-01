// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_board_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TransactionBoardResponseModel {

 int get completeOrder; int get waitReceiveAmount; int get completeReceive; int get waitReleaseAmount; int get completeRelease; List<TransactionModel> get transactions;
/// Create a copy of TransactionBoardResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransactionBoardResponseModelCopyWith<TransactionBoardResponseModel> get copyWith => _$TransactionBoardResponseModelCopyWithImpl<TransactionBoardResponseModel>(this as TransactionBoardResponseModel, _$identity);

  /// Serializes this TransactionBoardResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransactionBoardResponseModel&&(identical(other.completeOrder, completeOrder) || other.completeOrder == completeOrder)&&(identical(other.waitReceiveAmount, waitReceiveAmount) || other.waitReceiveAmount == waitReceiveAmount)&&(identical(other.completeReceive, completeReceive) || other.completeReceive == completeReceive)&&(identical(other.waitReleaseAmount, waitReleaseAmount) || other.waitReleaseAmount == waitReleaseAmount)&&(identical(other.completeRelease, completeRelease) || other.completeRelease == completeRelease)&&const DeepCollectionEquality().equals(other.transactions, transactions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,completeOrder,waitReceiveAmount,completeReceive,waitReleaseAmount,completeRelease,const DeepCollectionEquality().hash(transactions));

@override
String toString() {
  return 'TransactionBoardResponseModel(completeOrder: $completeOrder, waitReceiveAmount: $waitReceiveAmount, completeReceive: $completeReceive, waitReleaseAmount: $waitReleaseAmount, completeRelease: $completeRelease, transactions: $transactions)';
}


}

/// @nodoc
abstract mixin class $TransactionBoardResponseModelCopyWith<$Res>  {
  factory $TransactionBoardResponseModelCopyWith(TransactionBoardResponseModel value, $Res Function(TransactionBoardResponseModel) _then) = _$TransactionBoardResponseModelCopyWithImpl;
@useResult
$Res call({
 int completeOrder, int waitReceiveAmount, int completeReceive, int waitReleaseAmount, int completeRelease, List<TransactionModel> transactions
});




}
/// @nodoc
class _$TransactionBoardResponseModelCopyWithImpl<$Res>
    implements $TransactionBoardResponseModelCopyWith<$Res> {
  _$TransactionBoardResponseModelCopyWithImpl(this._self, this._then);

  final TransactionBoardResponseModel _self;
  final $Res Function(TransactionBoardResponseModel) _then;

/// Create a copy of TransactionBoardResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? completeOrder = null,Object? waitReceiveAmount = null,Object? completeReceive = null,Object? waitReleaseAmount = null,Object? completeRelease = null,Object? transactions = null,}) {
  return _then(_self.copyWith(
completeOrder: null == completeOrder ? _self.completeOrder : completeOrder // ignore: cast_nullable_to_non_nullable
as int,waitReceiveAmount: null == waitReceiveAmount ? _self.waitReceiveAmount : waitReceiveAmount // ignore: cast_nullable_to_non_nullable
as int,completeReceive: null == completeReceive ? _self.completeReceive : completeReceive // ignore: cast_nullable_to_non_nullable
as int,waitReleaseAmount: null == waitReleaseAmount ? _self.waitReleaseAmount : waitReleaseAmount // ignore: cast_nullable_to_non_nullable
as int,completeRelease: null == completeRelease ? _self.completeRelease : completeRelease // ignore: cast_nullable_to_non_nullable
as int,transactions: null == transactions ? _self.transactions : transactions // ignore: cast_nullable_to_non_nullable
as List<TransactionModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [TransactionBoardResponseModel].
extension TransactionBoardResponseModelPatterns on TransactionBoardResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TransactionBoardResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TransactionBoardResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TransactionBoardResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _TransactionBoardResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TransactionBoardResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _TransactionBoardResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int completeOrder,  int waitReceiveAmount,  int completeReceive,  int waitReleaseAmount,  int completeRelease,  List<TransactionModel> transactions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TransactionBoardResponseModel() when $default != null:
return $default(_that.completeOrder,_that.waitReceiveAmount,_that.completeReceive,_that.waitReleaseAmount,_that.completeRelease,_that.transactions);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int completeOrder,  int waitReceiveAmount,  int completeReceive,  int waitReleaseAmount,  int completeRelease,  List<TransactionModel> transactions)  $default,) {final _that = this;
switch (_that) {
case _TransactionBoardResponseModel():
return $default(_that.completeOrder,_that.waitReceiveAmount,_that.completeReceive,_that.waitReleaseAmount,_that.completeRelease,_that.transactions);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int completeOrder,  int waitReceiveAmount,  int completeReceive,  int waitReleaseAmount,  int completeRelease,  List<TransactionModel> transactions)?  $default,) {final _that = this;
switch (_that) {
case _TransactionBoardResponseModel() when $default != null:
return $default(_that.completeOrder,_that.waitReceiveAmount,_that.completeReceive,_that.waitReleaseAmount,_that.completeRelease,_that.transactions);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TransactionBoardResponseModel extends TransactionBoardResponseModel {
  const _TransactionBoardResponseModel({required this.completeOrder, required this.waitReceiveAmount, required this.completeReceive, required this.waitReleaseAmount, required this.completeRelease, required final  List<TransactionModel> transactions}): _transactions = transactions,super._();
  factory _TransactionBoardResponseModel.fromJson(Map<String, dynamic> json) => _$TransactionBoardResponseModelFromJson(json);

@override final  int completeOrder;
@override final  int waitReceiveAmount;
@override final  int completeReceive;
@override final  int waitReleaseAmount;
@override final  int completeRelease;
 final  List<TransactionModel> _transactions;
@override List<TransactionModel> get transactions {
  if (_transactions is EqualUnmodifiableListView) return _transactions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_transactions);
}


/// Create a copy of TransactionBoardResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TransactionBoardResponseModelCopyWith<_TransactionBoardResponseModel> get copyWith => __$TransactionBoardResponseModelCopyWithImpl<_TransactionBoardResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TransactionBoardResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TransactionBoardResponseModel&&(identical(other.completeOrder, completeOrder) || other.completeOrder == completeOrder)&&(identical(other.waitReceiveAmount, waitReceiveAmount) || other.waitReceiveAmount == waitReceiveAmount)&&(identical(other.completeReceive, completeReceive) || other.completeReceive == completeReceive)&&(identical(other.waitReleaseAmount, waitReleaseAmount) || other.waitReleaseAmount == waitReleaseAmount)&&(identical(other.completeRelease, completeRelease) || other.completeRelease == completeRelease)&&const DeepCollectionEquality().equals(other._transactions, _transactions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,completeOrder,waitReceiveAmount,completeReceive,waitReleaseAmount,completeRelease,const DeepCollectionEquality().hash(_transactions));

@override
String toString() {
  return 'TransactionBoardResponseModel(completeOrder: $completeOrder, waitReceiveAmount: $waitReceiveAmount, completeReceive: $completeReceive, waitReleaseAmount: $waitReleaseAmount, completeRelease: $completeRelease, transactions: $transactions)';
}


}

/// @nodoc
abstract mixin class _$TransactionBoardResponseModelCopyWith<$Res> implements $TransactionBoardResponseModelCopyWith<$Res> {
  factory _$TransactionBoardResponseModelCopyWith(_TransactionBoardResponseModel value, $Res Function(_TransactionBoardResponseModel) _then) = __$TransactionBoardResponseModelCopyWithImpl;
@override @useResult
$Res call({
 int completeOrder, int waitReceiveAmount, int completeReceive, int waitReleaseAmount, int completeRelease, List<TransactionModel> transactions
});




}
/// @nodoc
class __$TransactionBoardResponseModelCopyWithImpl<$Res>
    implements _$TransactionBoardResponseModelCopyWith<$Res> {
  __$TransactionBoardResponseModelCopyWithImpl(this._self, this._then);

  final _TransactionBoardResponseModel _self;
  final $Res Function(_TransactionBoardResponseModel) _then;

/// Create a copy of TransactionBoardResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? completeOrder = null,Object? waitReceiveAmount = null,Object? completeReceive = null,Object? waitReleaseAmount = null,Object? completeRelease = null,Object? transactions = null,}) {
  return _then(_TransactionBoardResponseModel(
completeOrder: null == completeOrder ? _self.completeOrder : completeOrder // ignore: cast_nullable_to_non_nullable
as int,waitReceiveAmount: null == waitReceiveAmount ? _self.waitReceiveAmount : waitReceiveAmount // ignore: cast_nullable_to_non_nullable
as int,completeReceive: null == completeReceive ? _self.completeReceive : completeReceive // ignore: cast_nullable_to_non_nullable
as int,waitReleaseAmount: null == waitReleaseAmount ? _self.waitReleaseAmount : waitReleaseAmount // ignore: cast_nullable_to_non_nullable
as int,completeRelease: null == completeRelease ? _self.completeRelease : completeRelease // ignore: cast_nullable_to_non_nullable
as int,transactions: null == transactions ? _self._transactions : transactions // ignore: cast_nullable_to_non_nullable
as List<TransactionModel>,
  ));
}


}

// dart format on
