// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PaymentOrderModel _$PaymentOrderModelFromJson(Map<String, dynamic> json) =>
    _PaymentOrderModel(
      paymentId: json['paymentId'] as String,
      paymentType: json['paymentType'] as String,
      sellerId: (json['sellerId'] as num).toInt(),
      buyerId: (json['buyerId'] as num).toInt(),
      amount: (json['amount'] as num).toDouble(),
      isRequest: json['isRequest'] as bool,
      status: json['status'] as String,
      isCompleted: json['isCompleted'] as bool,
      paymentDetails: PaymentDetailsModel.fromJson(
        json['paymentDetails'] as Map<String, dynamic>,
      ),
      buyer: UserInfoModel.fromJson(json['buyer'] as Map<String, dynamic>),
      seller: UserInfoModel.fromJson(json['seller'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PaymentOrderModelToJson(_PaymentOrderModel instance) =>
    <String, dynamic>{
      'paymentId': instance.paymentId,
      'paymentType': instance.paymentType,
      'sellerId': instance.sellerId,
      'buyerId': instance.buyerId,
      'amount': instance.amount,
      'isRequest': instance.isRequest,
      'status': instance.status,
      'isCompleted': instance.isCompleted,
      'paymentDetails': instance.paymentDetails,
      'buyer': instance.buyer,
      'seller': instance.seller,
    };
