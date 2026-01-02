// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_order_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PaymentOrderModel {

 String get paymentId; String get paymentType; int get sellerId; int get buyerId; double get amount; bool get isRequest; String get status; bool get isCompleted; PaymentDetailsModel get paymentDetails; UserInfoModel get buyer; UserInfoModel get seller;
/// Create a copy of PaymentOrderModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaymentOrderModelCopyWith<PaymentOrderModel> get copyWith => _$PaymentOrderModelCopyWithImpl<PaymentOrderModel>(this as PaymentOrderModel, _$identity);

  /// Serializes this PaymentOrderModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaymentOrderModel&&(identical(other.paymentId, paymentId) || other.paymentId == paymentId)&&(identical(other.paymentType, paymentType) || other.paymentType == paymentType)&&(identical(other.sellerId, sellerId) || other.sellerId == sellerId)&&(identical(other.buyerId, buyerId) || other.buyerId == buyerId)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.isRequest, isRequest) || other.isRequest == isRequest)&&(identical(other.status, status) || other.status == status)&&(identical(other.isCompleted, isCompleted) || other.isCompleted == isCompleted)&&(identical(other.paymentDetails, paymentDetails) || other.paymentDetails == paymentDetails)&&(identical(other.buyer, buyer) || other.buyer == buyer)&&(identical(other.seller, seller) || other.seller == seller));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,paymentId,paymentType,sellerId,buyerId,amount,isRequest,status,isCompleted,paymentDetails,buyer,seller);

@override
String toString() {
  return 'PaymentOrderModel(paymentId: $paymentId, paymentType: $paymentType, sellerId: $sellerId, buyerId: $buyerId, amount: $amount, isRequest: $isRequest, status: $status, isCompleted: $isCompleted, paymentDetails: $paymentDetails, buyer: $buyer, seller: $seller)';
}


}

/// @nodoc
abstract mixin class $PaymentOrderModelCopyWith<$Res>  {
  factory $PaymentOrderModelCopyWith(PaymentOrderModel value, $Res Function(PaymentOrderModel) _then) = _$PaymentOrderModelCopyWithImpl;
@useResult
$Res call({
 String paymentId, String paymentType, int sellerId, int buyerId, double amount, bool isRequest, String status, bool isCompleted, PaymentDetailsModel paymentDetails, UserInfoModel buyer, UserInfoModel seller
});


$PaymentDetailsModelCopyWith<$Res> get paymentDetails;$UserInfoModelCopyWith<$Res> get buyer;$UserInfoModelCopyWith<$Res> get seller;

}
/// @nodoc
class _$PaymentOrderModelCopyWithImpl<$Res>
    implements $PaymentOrderModelCopyWith<$Res> {
  _$PaymentOrderModelCopyWithImpl(this._self, this._then);

  final PaymentOrderModel _self;
  final $Res Function(PaymentOrderModel) _then;

/// Create a copy of PaymentOrderModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? paymentId = null,Object? paymentType = null,Object? sellerId = null,Object? buyerId = null,Object? amount = null,Object? isRequest = null,Object? status = null,Object? isCompleted = null,Object? paymentDetails = null,Object? buyer = null,Object? seller = null,}) {
  return _then(_self.copyWith(
paymentId: null == paymentId ? _self.paymentId : paymentId // ignore: cast_nullable_to_non_nullable
as String,paymentType: null == paymentType ? _self.paymentType : paymentType // ignore: cast_nullable_to_non_nullable
as String,sellerId: null == sellerId ? _self.sellerId : sellerId // ignore: cast_nullable_to_non_nullable
as int,buyerId: null == buyerId ? _self.buyerId : buyerId // ignore: cast_nullable_to_non_nullable
as int,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,isRequest: null == isRequest ? _self.isRequest : isRequest // ignore: cast_nullable_to_non_nullable
as bool,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,isCompleted: null == isCompleted ? _self.isCompleted : isCompleted // ignore: cast_nullable_to_non_nullable
as bool,paymentDetails: null == paymentDetails ? _self.paymentDetails : paymentDetails // ignore: cast_nullable_to_non_nullable
as PaymentDetailsModel,buyer: null == buyer ? _self.buyer : buyer // ignore: cast_nullable_to_non_nullable
as UserInfoModel,seller: null == seller ? _self.seller : seller // ignore: cast_nullable_to_non_nullable
as UserInfoModel,
  ));
}
/// Create a copy of PaymentOrderModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaymentDetailsModelCopyWith<$Res> get paymentDetails {
  
  return $PaymentDetailsModelCopyWith<$Res>(_self.paymentDetails, (value) {
    return _then(_self.copyWith(paymentDetails: value));
  });
}/// Create a copy of PaymentOrderModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserInfoModelCopyWith<$Res> get buyer {
  
  return $UserInfoModelCopyWith<$Res>(_self.buyer, (value) {
    return _then(_self.copyWith(buyer: value));
  });
}/// Create a copy of PaymentOrderModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserInfoModelCopyWith<$Res> get seller {
  
  return $UserInfoModelCopyWith<$Res>(_self.seller, (value) {
    return _then(_self.copyWith(seller: value));
  });
}
}


/// Adds pattern-matching-related methods to [PaymentOrderModel].
extension PaymentOrderModelPatterns on PaymentOrderModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaymentOrderModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaymentOrderModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaymentOrderModel value)  $default,){
final _that = this;
switch (_that) {
case _PaymentOrderModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaymentOrderModel value)?  $default,){
final _that = this;
switch (_that) {
case _PaymentOrderModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String paymentId,  String paymentType,  int sellerId,  int buyerId,  double amount,  bool isRequest,  String status,  bool isCompleted,  PaymentDetailsModel paymentDetails,  UserInfoModel buyer,  UserInfoModel seller)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaymentOrderModel() when $default != null:
return $default(_that.paymentId,_that.paymentType,_that.sellerId,_that.buyerId,_that.amount,_that.isRequest,_that.status,_that.isCompleted,_that.paymentDetails,_that.buyer,_that.seller);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String paymentId,  String paymentType,  int sellerId,  int buyerId,  double amount,  bool isRequest,  String status,  bool isCompleted,  PaymentDetailsModel paymentDetails,  UserInfoModel buyer,  UserInfoModel seller)  $default,) {final _that = this;
switch (_that) {
case _PaymentOrderModel():
return $default(_that.paymentId,_that.paymentType,_that.sellerId,_that.buyerId,_that.amount,_that.isRequest,_that.status,_that.isCompleted,_that.paymentDetails,_that.buyer,_that.seller);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String paymentId,  String paymentType,  int sellerId,  int buyerId,  double amount,  bool isRequest,  String status,  bool isCompleted,  PaymentDetailsModel paymentDetails,  UserInfoModel buyer,  UserInfoModel seller)?  $default,) {final _that = this;
switch (_that) {
case _PaymentOrderModel() when $default != null:
return $default(_that.paymentId,_that.paymentType,_that.sellerId,_that.buyerId,_that.amount,_that.isRequest,_that.status,_that.isCompleted,_that.paymentDetails,_that.buyer,_that.seller);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PaymentOrderModel extends PaymentOrderModel {
  const _PaymentOrderModel({required this.paymentId, required this.paymentType, required this.sellerId, required this.buyerId, required this.amount, required this.isRequest, required this.status, required this.isCompleted, required this.paymentDetails, required this.buyer, required this.seller}): super._();
  factory _PaymentOrderModel.fromJson(Map<String, dynamic> json) => _$PaymentOrderModelFromJson(json);

@override final  String paymentId;
@override final  String paymentType;
@override final  int sellerId;
@override final  int buyerId;
@override final  double amount;
@override final  bool isRequest;
@override final  String status;
@override final  bool isCompleted;
@override final  PaymentDetailsModel paymentDetails;
@override final  UserInfoModel buyer;
@override final  UserInfoModel seller;

/// Create a copy of PaymentOrderModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaymentOrderModelCopyWith<_PaymentOrderModel> get copyWith => __$PaymentOrderModelCopyWithImpl<_PaymentOrderModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaymentOrderModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaymentOrderModel&&(identical(other.paymentId, paymentId) || other.paymentId == paymentId)&&(identical(other.paymentType, paymentType) || other.paymentType == paymentType)&&(identical(other.sellerId, sellerId) || other.sellerId == sellerId)&&(identical(other.buyerId, buyerId) || other.buyerId == buyerId)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.isRequest, isRequest) || other.isRequest == isRequest)&&(identical(other.status, status) || other.status == status)&&(identical(other.isCompleted, isCompleted) || other.isCompleted == isCompleted)&&(identical(other.paymentDetails, paymentDetails) || other.paymentDetails == paymentDetails)&&(identical(other.buyer, buyer) || other.buyer == buyer)&&(identical(other.seller, seller) || other.seller == seller));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,paymentId,paymentType,sellerId,buyerId,amount,isRequest,status,isCompleted,paymentDetails,buyer,seller);

@override
String toString() {
  return 'PaymentOrderModel(paymentId: $paymentId, paymentType: $paymentType, sellerId: $sellerId, buyerId: $buyerId, amount: $amount, isRequest: $isRequest, status: $status, isCompleted: $isCompleted, paymentDetails: $paymentDetails, buyer: $buyer, seller: $seller)';
}


}

/// @nodoc
abstract mixin class _$PaymentOrderModelCopyWith<$Res> implements $PaymentOrderModelCopyWith<$Res> {
  factory _$PaymentOrderModelCopyWith(_PaymentOrderModel value, $Res Function(_PaymentOrderModel) _then) = __$PaymentOrderModelCopyWithImpl;
@override @useResult
$Res call({
 String paymentId, String paymentType, int sellerId, int buyerId, double amount, bool isRequest, String status, bool isCompleted, PaymentDetailsModel paymentDetails, UserInfoModel buyer, UserInfoModel seller
});


@override $PaymentDetailsModelCopyWith<$Res> get paymentDetails;@override $UserInfoModelCopyWith<$Res> get buyer;@override $UserInfoModelCopyWith<$Res> get seller;

}
/// @nodoc
class __$PaymentOrderModelCopyWithImpl<$Res>
    implements _$PaymentOrderModelCopyWith<$Res> {
  __$PaymentOrderModelCopyWithImpl(this._self, this._then);

  final _PaymentOrderModel _self;
  final $Res Function(_PaymentOrderModel) _then;

/// Create a copy of PaymentOrderModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? paymentId = null,Object? paymentType = null,Object? sellerId = null,Object? buyerId = null,Object? amount = null,Object? isRequest = null,Object? status = null,Object? isCompleted = null,Object? paymentDetails = null,Object? buyer = null,Object? seller = null,}) {
  return _then(_PaymentOrderModel(
paymentId: null == paymentId ? _self.paymentId : paymentId // ignore: cast_nullable_to_non_nullable
as String,paymentType: null == paymentType ? _self.paymentType : paymentType // ignore: cast_nullable_to_non_nullable
as String,sellerId: null == sellerId ? _self.sellerId : sellerId // ignore: cast_nullable_to_non_nullable
as int,buyerId: null == buyerId ? _self.buyerId : buyerId // ignore: cast_nullable_to_non_nullable
as int,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,isRequest: null == isRequest ? _self.isRequest : isRequest // ignore: cast_nullable_to_non_nullable
as bool,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,isCompleted: null == isCompleted ? _self.isCompleted : isCompleted // ignore: cast_nullable_to_non_nullable
as bool,paymentDetails: null == paymentDetails ? _self.paymentDetails : paymentDetails // ignore: cast_nullable_to_non_nullable
as PaymentDetailsModel,buyer: null == buyer ? _self.buyer : buyer // ignore: cast_nullable_to_non_nullable
as UserInfoModel,seller: null == seller ? _self.seller : seller // ignore: cast_nullable_to_non_nullable
as UserInfoModel,
  ));
}

/// Create a copy of PaymentOrderModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaymentDetailsModelCopyWith<$Res> get paymentDetails {
  
  return $PaymentDetailsModelCopyWith<$Res>(_self.paymentDetails, (value) {
    return _then(_self.copyWith(paymentDetails: value));
  });
}/// Create a copy of PaymentOrderModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserInfoModelCopyWith<$Res> get buyer {
  
  return $UserInfoModelCopyWith<$Res>(_self.buyer, (value) {
    return _then(_self.copyWith(buyer: value));
  });
}/// Create a copy of PaymentOrderModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserInfoModelCopyWith<$Res> get seller {
  
  return $UserInfoModelCopyWith<$Res>(_self.seller, (value) {
    return _then(_self.copyWith(seller: value));
  });
}
}

// dart format on
