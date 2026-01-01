// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TransactionModel {

 String get paymentId; String get paymentType; int get sellerId; int get buyerId; int? get merchantId; int get amount; String get providerId; bool get isCompleted; DateTime get createdAt; DateTime get updatedAt; String get userRole; PaymentDetailsModel get paymentDetails; TransactionUserModel? get seller; TransactionUserModel get buyer;
/// Create a copy of TransactionModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransactionModelCopyWith<TransactionModel> get copyWith => _$TransactionModelCopyWithImpl<TransactionModel>(this as TransactionModel, _$identity);

  /// Serializes this TransactionModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransactionModel&&(identical(other.paymentId, paymentId) || other.paymentId == paymentId)&&(identical(other.paymentType, paymentType) || other.paymentType == paymentType)&&(identical(other.sellerId, sellerId) || other.sellerId == sellerId)&&(identical(other.buyerId, buyerId) || other.buyerId == buyerId)&&(identical(other.merchantId, merchantId) || other.merchantId == merchantId)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.providerId, providerId) || other.providerId == providerId)&&(identical(other.isCompleted, isCompleted) || other.isCompleted == isCompleted)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.userRole, userRole) || other.userRole == userRole)&&(identical(other.paymentDetails, paymentDetails) || other.paymentDetails == paymentDetails)&&(identical(other.seller, seller) || other.seller == seller)&&(identical(other.buyer, buyer) || other.buyer == buyer));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,paymentId,paymentType,sellerId,buyerId,merchantId,amount,providerId,isCompleted,createdAt,updatedAt,userRole,paymentDetails,seller,buyer);

@override
String toString() {
  return 'TransactionModel(paymentId: $paymentId, paymentType: $paymentType, sellerId: $sellerId, buyerId: $buyerId, merchantId: $merchantId, amount: $amount, providerId: $providerId, isCompleted: $isCompleted, createdAt: $createdAt, updatedAt: $updatedAt, userRole: $userRole, paymentDetails: $paymentDetails, seller: $seller, buyer: $buyer)';
}


}

/// @nodoc
abstract mixin class $TransactionModelCopyWith<$Res>  {
  factory $TransactionModelCopyWith(TransactionModel value, $Res Function(TransactionModel) _then) = _$TransactionModelCopyWithImpl;
@useResult
$Res call({
 String paymentId, String paymentType, int sellerId, int buyerId, int? merchantId, int amount, String providerId, bool isCompleted, DateTime createdAt, DateTime updatedAt, String userRole, PaymentDetailsModel paymentDetails, TransactionUserModel? seller, TransactionUserModel buyer
});


$PaymentDetailsModelCopyWith<$Res> get paymentDetails;$TransactionUserModelCopyWith<$Res>? get seller;$TransactionUserModelCopyWith<$Res> get buyer;

}
/// @nodoc
class _$TransactionModelCopyWithImpl<$Res>
    implements $TransactionModelCopyWith<$Res> {
  _$TransactionModelCopyWithImpl(this._self, this._then);

  final TransactionModel _self;
  final $Res Function(TransactionModel) _then;

/// Create a copy of TransactionModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? paymentId = null,Object? paymentType = null,Object? sellerId = null,Object? buyerId = null,Object? merchantId = freezed,Object? amount = null,Object? providerId = null,Object? isCompleted = null,Object? createdAt = null,Object? updatedAt = null,Object? userRole = null,Object? paymentDetails = null,Object? seller = freezed,Object? buyer = null,}) {
  return _then(_self.copyWith(
paymentId: null == paymentId ? _self.paymentId : paymentId // ignore: cast_nullable_to_non_nullable
as String,paymentType: null == paymentType ? _self.paymentType : paymentType // ignore: cast_nullable_to_non_nullable
as String,sellerId: null == sellerId ? _self.sellerId : sellerId // ignore: cast_nullable_to_non_nullable
as int,buyerId: null == buyerId ? _self.buyerId : buyerId // ignore: cast_nullable_to_non_nullable
as int,merchantId: freezed == merchantId ? _self.merchantId : merchantId // ignore: cast_nullable_to_non_nullable
as int?,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as int,providerId: null == providerId ? _self.providerId : providerId // ignore: cast_nullable_to_non_nullable
as String,isCompleted: null == isCompleted ? _self.isCompleted : isCompleted // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,userRole: null == userRole ? _self.userRole : userRole // ignore: cast_nullable_to_non_nullable
as String,paymentDetails: null == paymentDetails ? _self.paymentDetails : paymentDetails // ignore: cast_nullable_to_non_nullable
as PaymentDetailsModel,seller: freezed == seller ? _self.seller : seller // ignore: cast_nullable_to_non_nullable
as TransactionUserModel?,buyer: null == buyer ? _self.buyer : buyer // ignore: cast_nullable_to_non_nullable
as TransactionUserModel,
  ));
}
/// Create a copy of TransactionModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaymentDetailsModelCopyWith<$Res> get paymentDetails {
  
  return $PaymentDetailsModelCopyWith<$Res>(_self.paymentDetails, (value) {
    return _then(_self.copyWith(paymentDetails: value));
  });
}/// Create a copy of TransactionModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TransactionUserModelCopyWith<$Res>? get seller {
    if (_self.seller == null) {
    return null;
  }

  return $TransactionUserModelCopyWith<$Res>(_self.seller!, (value) {
    return _then(_self.copyWith(seller: value));
  });
}/// Create a copy of TransactionModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TransactionUserModelCopyWith<$Res> get buyer {
  
  return $TransactionUserModelCopyWith<$Res>(_self.buyer, (value) {
    return _then(_self.copyWith(buyer: value));
  });
}
}


/// Adds pattern-matching-related methods to [TransactionModel].
extension TransactionModelPatterns on TransactionModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TransactionModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TransactionModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TransactionModel value)  $default,){
final _that = this;
switch (_that) {
case _TransactionModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TransactionModel value)?  $default,){
final _that = this;
switch (_that) {
case _TransactionModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String paymentId,  String paymentType,  int sellerId,  int buyerId,  int? merchantId,  int amount,  String providerId,  bool isCompleted,  DateTime createdAt,  DateTime updatedAt,  String userRole,  PaymentDetailsModel paymentDetails,  TransactionUserModel? seller,  TransactionUserModel buyer)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TransactionModel() when $default != null:
return $default(_that.paymentId,_that.paymentType,_that.sellerId,_that.buyerId,_that.merchantId,_that.amount,_that.providerId,_that.isCompleted,_that.createdAt,_that.updatedAt,_that.userRole,_that.paymentDetails,_that.seller,_that.buyer);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String paymentId,  String paymentType,  int sellerId,  int buyerId,  int? merchantId,  int amount,  String providerId,  bool isCompleted,  DateTime createdAt,  DateTime updatedAt,  String userRole,  PaymentDetailsModel paymentDetails,  TransactionUserModel? seller,  TransactionUserModel buyer)  $default,) {final _that = this;
switch (_that) {
case _TransactionModel():
return $default(_that.paymentId,_that.paymentType,_that.sellerId,_that.buyerId,_that.merchantId,_that.amount,_that.providerId,_that.isCompleted,_that.createdAt,_that.updatedAt,_that.userRole,_that.paymentDetails,_that.seller,_that.buyer);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String paymentId,  String paymentType,  int sellerId,  int buyerId,  int? merchantId,  int amount,  String providerId,  bool isCompleted,  DateTime createdAt,  DateTime updatedAt,  String userRole,  PaymentDetailsModel paymentDetails,  TransactionUserModel? seller,  TransactionUserModel buyer)?  $default,) {final _that = this;
switch (_that) {
case _TransactionModel() when $default != null:
return $default(_that.paymentId,_that.paymentType,_that.sellerId,_that.buyerId,_that.merchantId,_that.amount,_that.providerId,_that.isCompleted,_that.createdAt,_that.updatedAt,_that.userRole,_that.paymentDetails,_that.seller,_that.buyer);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TransactionModel extends TransactionModel {
  const _TransactionModel({required this.paymentId, required this.paymentType, required this.sellerId, required this.buyerId, this.merchantId, required this.amount, required this.providerId, required this.isCompleted, required this.createdAt, required this.updatedAt, required this.userRole, required this.paymentDetails, this.seller, required this.buyer}): super._();
  factory _TransactionModel.fromJson(Map<String, dynamic> json) => _$TransactionModelFromJson(json);

@override final  String paymentId;
@override final  String paymentType;
@override final  int sellerId;
@override final  int buyerId;
@override final  int? merchantId;
@override final  int amount;
@override final  String providerId;
@override final  bool isCompleted;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;
@override final  String userRole;
@override final  PaymentDetailsModel paymentDetails;
@override final  TransactionUserModel? seller;
@override final  TransactionUserModel buyer;

/// Create a copy of TransactionModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TransactionModelCopyWith<_TransactionModel> get copyWith => __$TransactionModelCopyWithImpl<_TransactionModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TransactionModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TransactionModel&&(identical(other.paymentId, paymentId) || other.paymentId == paymentId)&&(identical(other.paymentType, paymentType) || other.paymentType == paymentType)&&(identical(other.sellerId, sellerId) || other.sellerId == sellerId)&&(identical(other.buyerId, buyerId) || other.buyerId == buyerId)&&(identical(other.merchantId, merchantId) || other.merchantId == merchantId)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.providerId, providerId) || other.providerId == providerId)&&(identical(other.isCompleted, isCompleted) || other.isCompleted == isCompleted)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.userRole, userRole) || other.userRole == userRole)&&(identical(other.paymentDetails, paymentDetails) || other.paymentDetails == paymentDetails)&&(identical(other.seller, seller) || other.seller == seller)&&(identical(other.buyer, buyer) || other.buyer == buyer));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,paymentId,paymentType,sellerId,buyerId,merchantId,amount,providerId,isCompleted,createdAt,updatedAt,userRole,paymentDetails,seller,buyer);

@override
String toString() {
  return 'TransactionModel(paymentId: $paymentId, paymentType: $paymentType, sellerId: $sellerId, buyerId: $buyerId, merchantId: $merchantId, amount: $amount, providerId: $providerId, isCompleted: $isCompleted, createdAt: $createdAt, updatedAt: $updatedAt, userRole: $userRole, paymentDetails: $paymentDetails, seller: $seller, buyer: $buyer)';
}


}

/// @nodoc
abstract mixin class _$TransactionModelCopyWith<$Res> implements $TransactionModelCopyWith<$Res> {
  factory _$TransactionModelCopyWith(_TransactionModel value, $Res Function(_TransactionModel) _then) = __$TransactionModelCopyWithImpl;
@override @useResult
$Res call({
 String paymentId, String paymentType, int sellerId, int buyerId, int? merchantId, int amount, String providerId, bool isCompleted, DateTime createdAt, DateTime updatedAt, String userRole, PaymentDetailsModel paymentDetails, TransactionUserModel? seller, TransactionUserModel buyer
});


@override $PaymentDetailsModelCopyWith<$Res> get paymentDetails;@override $TransactionUserModelCopyWith<$Res>? get seller;@override $TransactionUserModelCopyWith<$Res> get buyer;

}
/// @nodoc
class __$TransactionModelCopyWithImpl<$Res>
    implements _$TransactionModelCopyWith<$Res> {
  __$TransactionModelCopyWithImpl(this._self, this._then);

  final _TransactionModel _self;
  final $Res Function(_TransactionModel) _then;

/// Create a copy of TransactionModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? paymentId = null,Object? paymentType = null,Object? sellerId = null,Object? buyerId = null,Object? merchantId = freezed,Object? amount = null,Object? providerId = null,Object? isCompleted = null,Object? createdAt = null,Object? updatedAt = null,Object? userRole = null,Object? paymentDetails = null,Object? seller = freezed,Object? buyer = null,}) {
  return _then(_TransactionModel(
paymentId: null == paymentId ? _self.paymentId : paymentId // ignore: cast_nullable_to_non_nullable
as String,paymentType: null == paymentType ? _self.paymentType : paymentType // ignore: cast_nullable_to_non_nullable
as String,sellerId: null == sellerId ? _self.sellerId : sellerId // ignore: cast_nullable_to_non_nullable
as int,buyerId: null == buyerId ? _self.buyerId : buyerId // ignore: cast_nullable_to_non_nullable
as int,merchantId: freezed == merchantId ? _self.merchantId : merchantId // ignore: cast_nullable_to_non_nullable
as int?,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as int,providerId: null == providerId ? _self.providerId : providerId // ignore: cast_nullable_to_non_nullable
as String,isCompleted: null == isCompleted ? _self.isCompleted : isCompleted // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,userRole: null == userRole ? _self.userRole : userRole // ignore: cast_nullable_to_non_nullable
as String,paymentDetails: null == paymentDetails ? _self.paymentDetails : paymentDetails // ignore: cast_nullable_to_non_nullable
as PaymentDetailsModel,seller: freezed == seller ? _self.seller : seller // ignore: cast_nullable_to_non_nullable
as TransactionUserModel?,buyer: null == buyer ? _self.buyer : buyer // ignore: cast_nullable_to_non_nullable
as TransactionUserModel,
  ));
}

/// Create a copy of TransactionModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaymentDetailsModelCopyWith<$Res> get paymentDetails {
  
  return $PaymentDetailsModelCopyWith<$Res>(_self.paymentDetails, (value) {
    return _then(_self.copyWith(paymentDetails: value));
  });
}/// Create a copy of TransactionModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TransactionUserModelCopyWith<$Res>? get seller {
    if (_self.seller == null) {
    return null;
  }

  return $TransactionUserModelCopyWith<$Res>(_self.seller!, (value) {
    return _then(_self.copyWith(seller: value));
  });
}/// Create a copy of TransactionModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TransactionUserModelCopyWith<$Res> get buyer {
  
  return $TransactionUserModelCopyWith<$Res>(_self.buyer, (value) {
    return _then(_self.copyWith(buyer: value));
  });
}
}

// dart format on
